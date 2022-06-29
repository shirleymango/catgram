//
//  homeFeedViewController.m
//  Catgram
//
//  Created by Shirley Zhu on 6/27/22.
//

#import "homeFeedViewController.h"
#import "AppDelegate.h"
#import "LoginController.h"
#import <Parse/Parse.h>
#import "SceneDelegate.h"
#import "CatCell.h"
#import "Post.h"
//#import "UIImageView+AFNetworking.h"


@interface homeFeedViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *arrayOfPosts;

@end

@implementation homeFeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.dataSource = self;
    // construct query
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    query.limit = 20;

    // fetch data asynchronously
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            // do something with the array of object returned by the call
            self.arrayOfPosts = posts;
            [self.tableView reloadData];
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}
- (IBAction)didTapLogout:(id)sender {
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        // PFUser.current() will now be nil
    }];
    SceneDelegate *sceneDelegate = (SceneDelegate *)UIApplication.sharedApplication.connectedScenes.allObjects.firstObject.delegate;


    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    sceneDelegate.window.rootViewController = loginViewController;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CatCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"catCell"];
    Post *post = self.arrayOfPosts[indexPath.row];
    PFFileObject *imageFileObject = post[@"image"];
    
    [imageFileObject getDataInBackgroundWithBlock: ^(NSData *result, NSError *error) {
        if(!error){
//            UIImage * image= [UIImage imageWithData:result];
            cell.imagePosted.image = [UIImage imageWithData:result];
        }
    }];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayOfPosts.count;
}

@end
