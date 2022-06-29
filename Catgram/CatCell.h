//
//  CatCell.h
//  Catgram
//
//  Created by Shirley Zhu on 6/29/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CatCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imagePosted;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;

@end

NS_ASSUME_NONNULL_END
