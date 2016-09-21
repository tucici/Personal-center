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

@interface  SWCollectionView () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) SWCollectionViewCell *myCollectionViewCell;
@property (strong, nonatomic) UICollectionView *myCollectionView;
@property (strong, nonatomic) NSArray *collectionImageArray;
@property (strong, nonatomic) NSString *collectionImage;
@property (nonatomic) CGFloat imagetitleWidth;
@property (nonatomic) CGFloat imagetitleHeight;
//@property (strong, nonatomic) UIColor *imageTilteBackgroundColor;
//@property (strong, nonatomic) UIColor *imageTilteTextColor;


@end

@implementation SWCollectionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        /* Set flowLayout for CollectionView*/
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;/*滑动方向*/
        flowLayout.itemSize = CGSizeMake((self.frame.size.width - 3)/ 3, self.frame.size.height - 1.5 );
        flowLayout.sectionInset = UIEdgeInsetsMake(0.0, 0.0, 1.5, 0.0);
        flowLayout.minimumLineSpacing = 1.5;
        
        /* Init and Set CollectionView */
        self.myCollectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
        
        self.myCollectionView.delegate = self;
        self.myCollectionView.dataSource = self;
        self.myCollectionView.showsHorizontalScrollIndicator = NO;
        self.myCollectionView.scrollEnabled=NO;
        [self.myCollectionView registerClass:[SWCollectionViewCell class] forCellWithReuseIdentifier:@"SWCollectionCell"];
        [self addSubview:_myCollectionView];
    }
    return self;
}


/*接受到时一组图片的数组时候，调用此方法*/
- (void) setImageArray:(NSArray *)collectionImageArray{
    
    _collectionImageArray = collectionImageArray;
    [_myCollectionView reloadData];/*视图重新加载数据*/
    
}
/*接收到时图片的命名时候，调用此方法*/
- (void) setCollectionImage:(NSString *)collectionImageName{
    
    _collectionImage = collectionImageName;
    [_myCollectionView reloadData];
}
- (void) setBackgroundColor:(UIColor*)color{
    
    self.myCollectionView.backgroundColor = color;
    [_myCollectionView reloadData];
}




#pragma mark - UICollectionViewDataSource methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 3;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SWCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SWCollectionCell" forIndexPath:indexPath];
    //    NSString *imageName = [self.collectionImageArray objectAtIndex:indexPath.row];
    
    //    [cell setImageName:imageName withFrame:self.frame];
    [cell setImageName:_collectionImage withFrame:self.frame];
    
    return cell;
}

#pragma mark 点击CollectionView的cell的时候，响应事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.delegate collectionView:self didSelectImageItemAtIndexPath:indexPath.row];
    
    NSDictionary *imageDic  = [self.collectionImageArray objectAtIndex:indexPath.row];
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center postNotificationName:@"chooseGlasses" object:nil userInfo:imageDic];
    
    
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

