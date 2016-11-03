//
//  SWGlassesImages.h
//  
//
//  Created by ssiwo02 on 15/8/31.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface SWGlassesImages : NSObject
@property (nonatomic, strong) NSMutableArray *imagesArray;
@property (nonatomic, strong) UIImage *photo;
+(NSDictionary *)getDicOfImage;
+(NSDictionary *)GetInformationForGlasses;
@end
