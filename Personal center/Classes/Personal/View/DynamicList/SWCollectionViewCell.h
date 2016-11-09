//
//  SWCollectionViewCell.h
//  
//
//  Created by ssiwo02 on 15/8/31.
//
//

#import <UIKit/UIKit.h>

@class CellModel;

@protocol SWCollectionViewCellDelegate<NSObject>
@optional
/**
 *长按单元cell
 */
- (void)longprogressCell;
@end
@interface SWCollectionViewCell : UICollectionViewCell
@property (nonatomic, weak) id <SWCollectionViewCellDelegate>delegate;

- (void)setImageName:(NSMutableDictionary *)dict;


/**
 *显示所有视频未勾选状态
 */
- (void)showSelBtnAtCollectionCell:(NSInteger) state;


- (void)configureData:(CellModel *)model;
@end
