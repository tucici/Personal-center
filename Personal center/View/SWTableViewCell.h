//
//  SWTableViewCell.h
//  
//
//  Created by ssiwo02 on 15/8/31.
//
//

#import <UIKit/UIKit.h>
@class SWTableViewCell;

@protocol SWTableViewCellDelegate <NSObject>

// Notifies the delegate when user click image
- (void)scrollingTableViewCell:(SWTableViewCell *)scrollingTableViewCell didSelectImageAtIndexPath:(NSInteger)RowOfImage atCategoryRowIndex:(NSInteger)section;

@end

@interface SWTableViewCell : UITableViewCell

@property (weak, nonatomic) id<SWTableViewCellDelegate> delegate;
- (void) setImageArray:(NSArray *)ImageArray;



@end