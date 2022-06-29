//
//  ComposeViewController.h
//  Catgram
//
//  Created by Shirley Zhu on 6/28/22.
//

#import <UIKit/UIKit.h>
#import "Parse/Parse.h"
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ComposeViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *captionToBePosted;

@property (strong, nonatomic) IBOutlet UIImageView *imageToBePosted;

@end

NS_ASSUME_NONNULL_END
