//
//  SWCollectionView.h
//
//
//  Created by ssiwo02 on 15/8/31.
//
//

#import <UIKit/UIKit.h>

@class DynamicViewModel;
@class CellModel;
typedef enum {
    publicCoverPhoto,
    privateCoverPhoto

}CoverPhotoType;

typedef enum {
    NormalState,
    SelectState,
    SelectedState
} CoverPhotoState;

@protocol SWCollectionViewDelegate <NSObject>
///**
// *点击单元cell
// */
//- (void)didSelectImageItemAtIndexPath:(NSInteger)section with:(CoverPhotoState)state;

/**
 *长按单元cell,弹出toolView
 */
- (void)popToolView;

- (void) didSelectItem:(NSInteger)item with:(CoverPhotoType)type;
@end


@interface SWCollectionView : UIView
@property (weak, nonatomic) id<SWCollectionViewDelegate> delegate;
@property (nonatomic, assign) CoverPhotoType type;
@property (nonatomic, assign) CoverPhotoState state;
@property (nonatomic, strong) DynamicViewModel *dataModel;


- (void) showDeleteBtnAtCollectionView;
/**
 *重新加载数据
 */
//- (void)reloadAddCoverPhotos;
@end