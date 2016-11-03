//
//  SWCollectionView.h
//
//
//  Created by ssiwo02 on 15/8/31.
//
//

#import <UIKit/UIKit.h>

@class SWCollectionView;
typedef enum {
    publicCoverPhoto,
    privateCoverPhoto
    
}CoverPhotoType;
@protocol SWCollectionViewDelegate <NSObject>
/**
 *点击单元cell
 */
- (void)didSelectImageItemAtIndexPath:(NSInteger)section;

/**
 *长按单元cell
 */
- (void)longprogressCollectionView;
@end


@interface SWCollectionView : UIView

@property (weak, nonatomic) id<SWCollectionViewDelegate> delegate;
@property (nonatomic, assign) CoverPhotoType type;
@property (nonatomic, strong) NSMutableDictionary *coverPhotos;

- (void) setCollectionImageArray:(NSMutableArray *)collectionImageArray;
- (void) showDeleteBtnAtCollectionView;
/**
 *重新加载数据
 */
- (void)reloadAddCoverPhotos;
@end