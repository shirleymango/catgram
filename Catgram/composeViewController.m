//
//  ComposeViewController.m
//  Catgram
//
//  Created by Shirley Zhu on 6/28/22.
//

#import "ComposeViewController.h"
#import "Post.h"

@interface ComposeViewController ()
@end

@implementation ComposeViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Get the image captured by the UIImagePickerController
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];

    // Set the imageToBePosted with selected image
    self.imageToBePosted.image = originalImage;
    
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)didTapCancel:(id)sender {
    [self performSegueWithIdentifier:@"backToHomeSegue" sender:nil];
}


- (IBAction)didTapSave:(id)sender {
    [Post postUserImage: self.imageToBePosted.image withCaption: self.captionToBePosted.text withCompletion:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"success in posting ^-^!");
        }
        else {
            NSLog(@"nooo cry %@", error.localizedDescription);
        }
    }];
    
    [self performSegueWithIdentifier:@"backToHomeSegue" sender:nil];
}

- (IBAction)getImage:(UITapGestureRecognizer *)sender {
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;

    // The Xcode simulator does not support taking pictures, so let's first check that the camera is indeed supported on the device before trying to present it.
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else {
        NSLog(@"Camera 🚫 available so we will use photo library instead");
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }

    [self presentViewController:imagePickerVC animated:YES completion:nil];
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
