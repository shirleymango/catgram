//
//  DetailsController.m
//  Catgram
//
//  Created by Shirley Zhu on 6/29/22.
//

#import "DetailsController.h"
#import <Parse/Parse.h>
#import "Post.h"

@interface DetailsController ()

@end

@implementation DetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // display image
    PFFileObject *imageFileObject = self.detailsPost.image;
    
    [imageFileObject getDataInBackgroundWithBlock: ^(NSData *result, NSError *error) {
        if(!error){
            self.imageView.image = [UIImage imageWithData:result];
        }
    }];
    
    // display date
    NSDate *createdAt = self.detailsPost.createdAt;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd-yyyy • HH:mm"];
    NSString *newDate = [dateFormatter stringFromDate:createdAt];
    self.dateLabel.text = [NSString stringWithFormat:@"%@", newDate];
    
    // display the caption
    self.captionLabel.text = self.detailsPost.caption;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
