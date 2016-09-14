//
//  SWCollectionView.h
//  
//
//  Created by ssiwo02 on 15/8/31.
//
//

#import <UIKit/UIKit.h>

@class SWCollectionView;

@protocol SWCollectionViewDelegate <NSObject>

- (void)collectionView:(SWCollectionView *)collectionView didSelectImageItemAtIndexPath:(NSInteger)section;

@end


@interface SWCollectionView : UIView

@property (weak, nonatomic) id<SWCollectionViewDelegate> delegate;

- (void) setImageArray:(NSArray*)collectionImageArray;

@end