//
//  SWCollectionViewCell.m
//
//
//  Created by ssiwo02 on 15/8/31.
//
//

#import "SWCollectionViewCell.h"
#import "SWGlassesImages.h"
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
        
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 5.0, frame.size.width, frame.size.height - 5)];
        
    }
    return self;
}

-(void)setImageName:(NSString *)image withFrame:(CGRect)frame
{
    self.cellFrame = frame;
    self.imageView.image = [UIImage imageNamed:image];
    self.imageView.backgroundColor = [UIColor lightGrayColor];
    
    NSString *color = [[[SWGlassesImages GetInformationForGlasses] valueForKey:image] valueForKey:@"color"];
    NSString *price = [[[SWGlassesImages GetInformationForGlasses] valueForKey:image] valueForKey:@"price"];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0.0, frame.size.height / 2, (frame.size.width - 20) / 2 , frame.size.height / 2)];
    label.text = [NSString stringWithFormat:@"颜色: %@\n价格: %@", color, price];
    label.font = [UIFont fontWithName:@"Arial" size:13];
    [label setNumberOfLines:0];
    label.textAlignment = NSTextAlignmentCenter;
    label.center = CGPointMake(self.imageView.center.x, label.center.y);
    [self addSubview:self.imageView];
    [self addSubview:label];
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
