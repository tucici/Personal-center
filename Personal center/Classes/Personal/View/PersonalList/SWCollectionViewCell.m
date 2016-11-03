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
@interface SWCollectionViewCell ()
@property (nonatomic, strong) CustomBtn *delete;                 /*删除按钮*/
@property (strong, nonatomic) UIImageView *imageView;
//@property (assign, nonatomic) CGRect cellFrame;

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
    [self addSubview:self.imageView];
}

- (void)initializeDeleteBtn{
    
    _delete = [[CustomBtn alloc]initWithFrame:CGRectMake(self.frame.size.width - 15, 5, 10, 10) withTitle:nil];
    _delete.layer.masksToBounds = YES;
    _delete.layer.cornerRadius = 5;
    [_delete setBackgroundImage:[UIImage imageNamed:@"04"] forState:UIControlStateNormal];
    [_delete setBackgroundImage:[UIImage imageNamed:@"06"] forState:UIControlStateSelected];
    [_delete addTarget:self action:@selector(delete:) forControlEvents:UIControlEventTouchUpInside];
    _delete.hidden = YES;
    [self addSubview:_delete];
}

-(void)setImageName:(NSString *)image
{
    UIImage *img = [UIImage imageNamed:image];
    self.imageView.image = img;
    self.imageView.frame = [img sizefromImage:img scaledToRect:self.frame];
    self.imageView.backgroundColor = [UIColor lightGrayColor];
    
    
    
    /*>>>>>>>>>>>>>>>>>>>>>>>添加Label<<<<<<<<<<<<<<<<<<<<<<<*/
    /* UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0.0, frame.size.height / 2, (frame.size.width - 20) / 2 , frame.size.height / 2)];
     label.text = [NSString stringWithFormat:@"颜色: %@\n价格: %@", color, price];
     label.font = [UIFont fontWithName:@"Arial" size:13];
     [label setNumberOfLines:0];
     label.textAlignment = NSTextAlignmentCenter;
     label.center = CGPointMake(self.imageView.center.x, label.center.y);
     [self addSubview:label];
     */
    
    
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
            [self.delegate longprogressCollectionViewCell];
        }];
    }else if (sender.state == UIGestureRecognizerStateEnded) {
        
        [UIView animateWithDuration:0.5 animations:^{
            /**/
            self.imageView.transform = CGAffineTransformIdentity;
        }];
        
        _delete.hidden = !_delete.hidden?YES:NO;
    }
    
}
- (void)showDeleBtnAtCollectionCell{
    _delete.hidden = NO;
    
}
- (void)delete:(CustomBtn *)sender{
    sender.selected = !sender.selected;
    NSLog(@"click delete");
    
    
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
