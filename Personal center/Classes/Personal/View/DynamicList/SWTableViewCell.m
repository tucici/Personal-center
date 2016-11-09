//
//  SWTableViewCell.m
//
//
//  Created by ssiwo02 on 15/8/31.
//
//
#import "Header.h"
#import "SWTableViewCell.h"
#import "SWCollectionView.h"

#define kScrollingViewHieght
#define kCategoryLabelWidth 200
#define kCategoryLabelHieght 30
#define kStartPointY 30

@interface SWTableViewCell()<SWCollectionViewDelegate>
@property(strong, nonatomic) SWCollectionView *imageCollectionView;


@end

@implementation SWTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
            self.backgroundColor = [UIColor redColor];
        NSLog(@"self.frame.size  2:  %f",self.frame.size.width);
        [self initialize];
    }
    return self;
}

//- (void)awakeFromNib
//{
//
//    [self setCollectionViewBackgroundColor:[UIColor whiteColor]];
//    [super awakeFromNib];
//    [self initialize];
//
//    [self setCollectionViewBackgroundColor:[UIColor redColor]];
//}

- (void)initialize
{
    
    // Set ScrollImageTableCellView
    _imageCollectionView = [[SWCollectionView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, view_width,view_width / 3)];
   self.imageCollectionView.backgroundColor = [UIColor whiteColor];
    _imageCollectionView.delegate = self;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}
/*当传过来是数组调用此方法*/
- (void)setSWTableViewCellImageArray:(NSMutableArray *)ImageArray
{
    
    [_imageCollectionView setCollectionImageArray:ImageArray];
    UIImage *image = [UIImage imageNamed:@"backimage.jpg"];
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:self.imageCollectionView.frame];
    [imageview setImage:image];
    [self.contentView addSubview:imageview];
    [self.contentView addSubview:_imageCollectionView];
    
}
/*当传过来的值是图片的命名，调用此方法*/
-(void)setSWTableViewCellImage:(NSString *)tableViewCellImageName{
    [_imageCollectionView setCollectionImage:tableViewCellImageName];
    //    UIImage *image = [UIImage imageNamed:@"backimage.jpg"];
    //    UIImageView *imageview = [[UIImageView alloc]initWithFrame:self.imageCollectionView.frame];
    //    [imageview setImage:image];
    //    [self.contentView addSubview:imageview];
    [self.contentView addSubview:_imageCollectionView];
}

- (void)setCollectionViewBackgroundColor:(UIColor *)color{
    
    _imageCollectionView.backgroundColor = color;
    [self.contentView addSubview:_imageCollectionView];
}

#pragma mark - SWCollectionViewDelegate

- (void)collectionView:(SWCollectionView *)collectionView didSelectImageItemAtIndexPath:(NSInteger)section {
    
    [self.delegate scrollingTableViewCell:self didSelectImageAtIndexPath:section atCategoryRowIndex:self.tag];
}

@end
