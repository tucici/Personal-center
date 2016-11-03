//
//  SWCollectionView.m
//
//
//  Created by ssiwo02 on 15/8/31.
//
//

//#import "SWViewController.h"
#import "SWCollectionView.h"
#import "SWCollectionViewCell.h"

@interface  SWCollectionView () <UICollectionViewDataSource, UICollectionViewDelegate,SWCollectionViewCellDelegate>{
    NSString *_coverImageName;
}
@property (strong, nonatomic) SWCollectionViewCell *myCollectionViewCell;
@property (strong, nonatomic) UICollectionView *myCollectionView;
@property (strong, nonatomic) NSMutableArray *collectionImageArray;
@property (nonatomic) CGFloat imagetitleWidth;
@property (nonatomic) CGFloat imagetitleHeight;



@end

@implementation SWCollectionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.type = publicCoverPhoto;
        
        [self initializeCoverPhotos];
        
        [self initializeCollectionView];
    }
    return self;
}
- (void)initializeCoverPhotos{
    
    _coverPhotos = [[NSMutableDictionary alloc]initWithCapacity:2];
    
}

- (void)initializeCollectionView{
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake((self.frame.size.width - 4.5)/ 3, (self.frame.size.width - 4.5)/ 3);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;/*滑动方向*/
    NSLog(@"flowLayout.itemSize -->%f %f",flowLayout.itemSize.width, flowLayout.itemSize.height);
    flowLayout.sectionInset = UIEdgeInsetsMake(0.0, 0.0, 1.5, 0.0);
    
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
        _type = type;
    }
}

- (void) setBackgroundColor:(UIColor*)color{
    
    self.myCollectionView.backgroundColor = color;
    [_myCollectionView reloadData];
}


- (void)reloadAddCoverPhotos{
    [_myCollectionView reloadData];
}
- (void)showDeleteBtnAtCollectionView{
    for (int i = 0; i < _collectionImageArray.count; i++) {
        SWCollectionViewCell *cell  =  [_myCollectionView cellForItemAtIndexPath:[NSIndexPath indexPathWithIndex:i]];
        [cell showDeleBtnAtCollectionCell];
    }
}


#pragma mark - UICollectionViewDataSource methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    //    NSInteger totalNumber = (_type == publicCoverPhoto) ? [[_coverPhotos objectForKey:@"public"] count]:[[_coverPhotos objectForKey:@"private"] count];
    //    NSInteger number = (totalNumber%3 == 0)?(totalNumber / 3) :(totalNumber / 3 + 1);
    //    NSLog(@"number  ---->  %d    ---- > %d",(int)totalNumber,(int)number);
    //    return number;
    return  1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return  (_type == publicCoverPhoto) ? [[_coverPhotos objectForKey:@"public"] count]:[[_coverPhotos objectForKey:@"private"] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SWCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SWCollectionCell" forIndexPath:indexPath];
    cell.delegate = self;
    if (_type == publicCoverPhoto) {
        _coverImageName = [[_coverPhotos objectForKey:@"public"] objectAtIndex:indexPath.item];
    }else if (_type == privateCoverPhoto){
        _coverImageName = [[_coverPhotos objectForKey:@"private"] objectAtIndex:indexPath.item];
    }
    [cell setImageName:_coverImageName];
    return cell;
}

#pragma mark   定义每个UICollectionView 的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark 点击CollectionView的cell的时候，响应事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.delegate didSelectImageItemAtIndexPath:indexPath.row];
}

#pragma mark SWCollectionViewCellDelegate
- (void)longprogressCollectionViewCell{
    [self.delegate longprogressCollectionView];
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

