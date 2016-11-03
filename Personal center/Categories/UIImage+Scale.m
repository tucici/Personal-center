//
//  UIImage+Scale.m
//  CustomImage
//
//  Created by mac1 on 16/9/28.
//  Copyright © 2016年 Tucici. All rights reserved.
//

#import "UIImage+Scale.h"

@implementation UIImage (Scale)
/*此方法为图片自适应等比例缩小，参数1为需要缩小展示的任意图片，参数2为显示的父类View，返回值为imageview的frame
 *原理：三层结构，显示的imageView的父类view-->显示图片的imageView-->image ，
 *     1> 根据image与父类view的高宽比，算出scale(系数)，再等比例缩小，所得的size就是imageview的size
 *     2> 根据父类view的frame，计算出中心点，让imageview永远处在父类view中间位置
 *     3> 以不同颜色填充父类view除imageview以外的区域
 *注意：涉及到图片质量保真问题，这里不做图片等比例放大处理，所以比图片等比例缩小，少了一步处理。
 *     1> 根据放大系数，算出imageview的size
 *     2> 根据父类view的frame，计算出中心点，让imageview永远处在父类view中间位置
 *     3> 以不同颜色填充父类view除imageview以外的区域
 */
-(CGRect)sizefromImage:(UIImage *)image scaledToRect:(CGRect)frame{
    CGImageRef imageRef = image.CGImage;
    CGFloat RefWidth = CGImageGetWidth(imageRef);                  /*获取image的宽度*/
    CGFloat RefHeight = CGImageGetHeight(imageRef);                /*获取image的高度*/
    CGFloat viewWidth = frame.size.width;                          /*获取父层view的宽度*/
    CGFloat viewHeight = frame.size.height;                        /*获取父层view的高度*/
    CGFloat width = 0.0;                                           /*初始化imageview等比例放大或缩小后的宽度*/
    CGFloat height = 0.0;                                          /*初始化imageview等比例放大或缩小后的高度*/
    CGFloat scaleWith = 1.0;                                       /*初始化image与父层view的宽度比*/
    CGFloat scaleHeight = 1.0;                                     /*初始化image与父层view的高度比*/
    CGFloat scale = 1.0;                                           /*初始化等比例放大或缩小的系数*/
    if ((RefWidth >= viewWidth)||(RefHeight >= viewHeight))        /*若image的宽度或高度大于父层view的宽度或高度，进行缩小处理*/
    {
        scaleWith = RefWidth / viewWidth;                          /*等比例缩小，获取image与父层view的宽度比*/
        scaleHeight = RefHeight / viewHeight;                      /*等比例缩小，获取image与父层view的高度比*/
        scale = (scaleWith >= scaleHeight)?scaleWith:scaleHeight;  /*等比例缩小，获取缩小系数*/
        width = RefWidth / scale;                                  /*等比例缩小，获取imge缩小后的imageviw的宽度*/
        height = RefHeight / scale;                                /*等比例缩小，获取image缩小后的imageview的高度*/
        
    }
    else{
        /*scaleWith = viewWidth / RefWidth;
         scaleHeight = viewHeight / RefHeight;
         scale = (scaleWith <= scaleHeight)?scaleWith:scaleHeight;
         width = RefWidth * scale;
         height = RefHeight *scale;图片等比例放大*/  
        width = RefWidth;/**/
        height = RefHeight;
    }
    
    CGFloat originX = viewWidth * 0.5 - width * 0.5;
    CGFloat originY = viewHeight * 0.5 - height * 0.5;
    CGRect rect = CGRectMake(originX, originY, width, height);
    return rect;
}

@end
