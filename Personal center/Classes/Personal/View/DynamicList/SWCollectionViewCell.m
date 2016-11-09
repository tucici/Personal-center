//
//  SWCollectionViewCell.m
//
//
//  Created by ssiwo02 on 15/8/31.
//
//
#import "Header.h"
#import "SWCollectionViewCell.h"
#import "UIImage+Scale.h"
#import "CustomBtn.h"
#import "CellModel.h"
@interface SWCollectionViewCell ()
@property (nonatomic, strong) CustomBtn *delete;                 /*删除按钮*/
@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation SWCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = collectionCellItemColor;
        
        [self initializeImageView];
        
        [self initializeDeleteBtn];
        
        [ self addgesture];
    }
    return self;
}
- (void)initializeImageView{
    
    self.imageView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.imageView];
}

- (void)initializeDeleteBtn{
    
    _delete = [[CustomBtn alloc]initWithFrame:CGRectMake(self.frame.size.width - 15, 5, 10, 10) withTitle:nil];
    _delete.layer.masksToBounds = YES;
    _delete.layer.cornerRadius = 5;
    [_delete setBackgroundImage:[UIImage imageNamed:@"04"] forState:UIControlStateNormal];
    [_delete setBackgroundImage:[UIImage imageNamed:@"06"] forState:UIControlStateSelected];
    [_delete addTarget:self action:@selector(delete:) forControlEvents:UIControlEventTouchUpInside];
    _delete.hidden = YES;
    [self.contentView addSubview:_delete];
}

- (void)setImageName:(NSMutableDictionary *)dict
{
    UIImage *img = [UIImage imageNamed:[dict objectForKey:@"image"]];
    self.imageView.image = img;
    self.imageView.frame = [img sizefromImage:img scaledToRect:self.frame];
    self.imageView.backgroundColor = [UIColor lightGrayColor];
    BOOL selected = [[dict objectForKey:@"selected"] isEqualToString:@"NO"]?NO:YES;
    _delete.selected = selected;
    //    _delete.hidden = !hidden;
    
    
    /*>>>>>>>>>>>>>>>>>>>>>>>添加Label<<<<<<<<<<<<<<<<<<<<<<<*/
    /* UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0.0, frame.size.height / 2, (frame.size.width - 20) / 2 , frame.size.height / 2)];
     label.text = [NSString stringWithFormat:@"颜色: %@\n价格: %@", color, price];
     label.font = [UIFont fontWithName:@"Arial" size:13];
     [label setNumberOfLines:0];
     label.textAlignment = NSTextAlignmentCenter;
     label.center = CGPointMake(self.imageView.center.x, label.center.y);
     [self.contentView addSubview:label];
     */
    
    
}
- (void)configureData:(CellModel *)model {
    UIImage *img = [UIImage imageNamed:model.imageName];
    self.imageView.image = img;
    self.imageView.frame = [img sizefromImage:img scaledToRect:self.frame];
    self.imageView.backgroundColor = [UIColor lightGrayColor];
    _delete.selected = model.isPicked;
}
- (void)addgesture{
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPress:)];
    [self addGestureRecognizer:longPress];
    
}

- (void)longPress:(UILongPressGestureRecognizer *)sender{
    _delete.selected = NO;
    if (sender.state == UIGestureRecognizerStateBegan) {
        
        [UIView animateWithDuration:0.5 animations:^{
            self.imageView.transform = CGAffineTransformMakeScale(1.1, 1.1);
        } completion:^(BOOL finished) {
            self.imageView.transform = CGAffineTransformIdentity;
            [self.delegate longprogressCell];
        
        }];
    }
    
}

- (void)showSelBtnAtCollectionCell:(NSInteger)state{
   _delete.hidden = (state == 1 || state == 2)?NO:YES;
    
}

- (void)delete:(CustomBtn *)sender{

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
