//
//  SWCollectionViewCell.m
//
//
//  Created by ssiwo02 on 15/8/31.
//
//
#import "Header.h"
#import "SWCollectionViewCell.h"
//#import "SWGlassesImages.h"
@interface SWCollectionViewCell ()

@property (strong, nonatomic) UIImageView *imageView;
@property (assign, nonatomic) CGRect cellFrame;

@end

@implementation SWCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = collectionCellItemColor;
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10.0, 0.0, frame.size.width - 20.0, frame.size.height)];
    }
    return self;
}

-(void)setImageName:(NSString *)image withFrame:(CGRect)frame
{
    self.cellFrame = frame;
    self.imageView.image = [UIImage imageNamed:image];
    self.imageView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:self.imageView];
    
    
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







/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
