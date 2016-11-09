//
//  SWCollectionView.m
//
//
//  Created by ssiwo02 on 15/8/31.
//
//

#import "SWCollectionView.h"
#import "SWCollectionViewCell.h"
#import "DynamicViewModel.h"
@interface  SWCollectionView () <UICollectionViewDataSource, UICollectionViewDelegate,SWCollectionViewCellDelegate>{
    NSMutableDictionary *_cellCoverInfo;
}
@property (strong, nonatomic) SWCollectionViewCell *myCollectionViewCell;
@property (strong, nonatomic) UICollectionView *myCollectionView;




@end

@implementation SWCollectionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        // Initialization code
        self.type = publicCoverPhoto;
    
        [self initializeCollectionView];
    }
    return self;
}

- (void)initializeCollectionView{
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake((self.frame.size.width -3) / 3.0, (self.frame.size.width - 3) / 3.0);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;/*滑动方向*/
    flowLayout.minimumLineSpacing = 1.5;
    flowLayout.minimumInteritemSpacing = 1.5;
    
    self.myCollectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
    _myCollectionView.backgroundColor = [UIColor whiteColor];
    _myCollectionView.delegate = self;
    _myCollectionView.dataSource = self;
    _myCollectionView.showsVerticalScrollIndicator = NO;
    _myCollectionView.backgroundColor = [UIColor yellowColor];
    [_myCollectionView registerClass:[SWCollectionViewCell class] forCellWithReuseIdentifier:@"SWCollectionCell"];
    [self addSubview:_myCollectionView];
    
}

- (void)setType:(CoverPhotoType)type{
    if (_type != type) {
        self.state = NormalState;
        _type = type;
        
    }
}

- (void)setState:(CoverPhotoState)state{
    if (_state != state) {
        _state = state;
    }
    [_myCollectionView reloadData];
}

//- (void)reloadAddCoverPhotos{
//  
//    self.state = (_state == NormalState)?SelectState:NormalState;
//    [_myCollectionView reloadData];
//}


#pragma mark - UICollectionViewDataSource methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return  1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return  (_type == publicCoverPhoto) ? _dataModel.publicData.count:_dataModel.privateData.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SWCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SWCollectionCell" forIndexPath:indexPath];
    cell.delegate = self;
    [cell showSelBtnAtCollectionCell:_state];
    if (_type == publicCoverPhoto) {
        [cell configureData:[_dataModel.publicData objectAtIndex:indexPath.item]];
        
    }else if (_type == privateCoverPhoto){
        [cell configureData:[_dataModel.privateData objectAtIndex:indexPath.item]];
        
    }
    
    return cell;
}

#pragma mark   定义每个UICollectionView 的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark 点击CollectionView的cell的时候，响应事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (_type == publicCoverPhoto) {
        
   [self.delegate didSelectItem:indexPath.item with:_type];
        
    } else {
        [self.delegate didSelectItem:indexPath.item with:_type];
        
    }
    
    // [self.delegate didSelectImageItemAtIndexPath:indexPath.item with:_state];
    
}

#pragma mark SWCollectionViewCellDelegate
- (void)longprogressCell{
    
    self.state = SelectState;
//    [self reloadAddCoverPhotos];
    
    [self.delegate popToolView];
    
    
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end

