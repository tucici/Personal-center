//
//  SWCollectionViewCell.h
//  
//
//  Created by ssiwo02 on 15/8/31.
//
//

#import <UIKit/UIKit.h>
typedef enum {
    clickType,
    longProgress
}gestureType;
@protocol SWCollectionViewCellDelegate<NSObject>
@optional
/**
 *长按单元cell
 */
- (void)longprogressCollectionViewCell;
@end
@interface SWCollectionViewCell : UICollectionViewCell
@property (nonatomic, weak) id <SWCollectionViewCellDelegate>delegate;


- (void)setImageName:(NSString *) image;
- (void)showDeleBtnAtCollectionCell;
@end
