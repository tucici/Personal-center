//
//  SWGlassesImages.m
//
//
//  Created by ssiwo02 on 15/8/31.
//
//

#import "SWGlassesImages.h"
static NSArray *imagesArray =nil;
//static UIImage *photo = nil;
@implementation SWGlassesImages
//+(id)imagesArrayOfMan{
//
//
//    NSLog(@"进入manarray");
//
//    imagesArray = [[NSArray alloc]init];
//    imagesArray = @[
//
//                    @[@{ @"name":@"ic_face_3" },@{ @"name":@"ic_face_4" }],
//                    @[@{ @"name":@"ic_face_5" },@{ @"name":@"ic_face_6" }],
//                    @[@{ @"name":@"ic_face_7" },@{ @"name":@"ic_face_8" }],
//                    @[@{ @"name":@"ic_face_9" },@{ @"name":@"ic_face_10" }],
//
//
//                    ];
//
//    return [imagesArray mutableCopy] ;
//}
//+(id)imagesArrayOfWoman{
//
//
//    NSLog(@"进入womanarray");
//    imagesArray = [[NSArray alloc]init];
//    imagesArray = @[
//
//                    @[@{ @"name":@"ic_face_10" },@{ @"name":@"ic_face_9" }],
//                    @[@{ @"name":@"ic_face_8" },@{ @"name":@"ic_face_7" }],
//                    @[@{ @"name":@"ic_face_6" },@{ @"name":@"ic_face_5" }],
//                    @[@{ @"name":@"ic_face_4" },@{ @"name":@"ic_face_3" }],
//
//                    ];
//
//
//    return [imagesArray mutableCopy];
//
//}
+(NSDictionary *)getDicOfImage{
    NSDictionary *dicOfImage = [[NSDictionary alloc]init];
    dicOfImage = @{
                   @"man":@{
                           @"fashion":@[
                                   @[@"glasses_1" ,@"glasses_2"],
                                   @[@"glasses_3" ,@"glasses_4"],
                                   @[@"glasses_5" ,@"glasses_6"],
                                   @[@"glasses_7" ,@"glasses_8"],
                                   @[@"glasses_9" ,@"glasses_10"],
                                   @[@"glasses_11" ,@"glasses_12"],
                                   @[@"glasses_13" ,@"glasses_14"],
                                   @[@"glasses_15" ,@"glasses_16"],
                                   @[@"glasses_17" ,@"glasses_18"],
                                   ],
                           @"ancient":@[
                                   @[@"glasses_2" ,@"glasses_4"],
                                   @[@"glasses_6" ,@"glasses_8"],
                                   @[@"glasses_10" ,@"glasses_12"],
                                   @[@"glasses_3" ,@"glasses_5"],
                                   @[@"glasses_7" ,@"glasses_9"],
                                   @[@"glasses_11" ,@"glasses_1"],
                                   @[@"glasses_13" ,@"glasses_14"],
                                   @[@"glasses_17" ,@"glasses_18"],
                                   @[@"glasses_15" ,@"glasses_16"],
                                   ],
                           @"business":@[
                                   @[@"glasses_4" ,@"glasses_7"],
                                   @[@"glasses_10" ,@"glasses_5"],
                                   @[@"glasses_8" ,@"glasses_11"],
                                   @[@"glasses_6" ,@"glasses_9"],
                                   @[@"glasses_12" ,@"glasses_1"],
                                   @[@"glasses_3" ,@"glasses_2"],
                                   @[@"glasses_17" ,@"glasses_18"],
                                   @[@"glasses_13" ,@"glasses_14"],
                                   @[@"glasses_15" ,@"glasses_16"],
                                   
                                   ],
                           @"classic":@[
                                   @[@"glasses_5" ,@"glasses_9"],
                                   @[@"glasses_6" ,@"glasses_10"],
                                   @[@"glasses_7" ,@"glasses_11"],
                                   @[@"glasses_8" ,@"glasses_12"],
                                   @[@"glasses_1" ,@"glasses_4"],
                                   @[@"glasses_2" ,@"glasses_3"],
                                   @[@"glasses_15" ,@"glasses_16"],
                                   @[@"glasses_17" ,@"glasses_18"],
                                   @[@"glasses_13" ,@"glasses_14"],]
                           },
                   @"woman":@{
                           @"fashion":@[
                                   @[@"glasses_12" ,@"glasses_11"],
                                   @[@"glasses_10" ,@"glasses_9"],
                                   @[@"glasses_8" ,@"glasses_7"],
                                   @[@"glasses_6" ,@"glasses_5"],
                                   @[@"glasses_4" ,@"glasses_3"],
                                   @[@"glasses_2" ,@"glasses_1"],
                                   @[@"glasses_13" ,@"glasses_18"],
                                   @[@"glasses_15" ,@"glasses_17"],
                                   @[@"glasses_17" ,@"glasses_14"],
                                   ],
                           @"ancient":@[
                                   @[@"glasses_11" ,@"glasses_9"],
                                   @[@"glasses_7" ,@"glasses_5"],
                                   @[@"glasses_3" ,@"glasses_1"],
                                   @[@"glasses_10" ,@"glasses_8"],
                                   @[@"glasses_6" ,@"glasses_4"],
                                   @[@"glasses_2" ,@"glasses_1"],
                                   @[@"glasses_15" ,@"glasses_18"],
                                   @[@"glasses_14" ,@"glasses_18"],
                                   @[@"glasses_17" ,@"glasses_16"],
                                   ],
                           @"business":@[
                                   @[@"glasses_10" ,@"glasses_7"],
                                   @[@"glasses_4" ,@"glasses_1"],
                                   @[@"glasses_9" ,@"glasses_6"],
                                   @[@"glasses_3" ,@"glasses_8"],
                                   @[@"glasses_5" ,@"glasses_12"],
                                   @[@"glasses_11" ,@"glasses_10"],
                                   @[@"glasses_18" ,@"glasses_14"],
                                   @[@"glasses_17" ,@"glasses_16"],
                                   @[@"glasses_17" ,@"glasses_15"],
                                   ],
                           @"classic":@[
                                   @[@"glasses_9" ,@"glasses_6"],
                                   @[@"glasses_3" ,@"glasses_8"],
                                   @[@"glasses_5" ,@"glasses_2"],
                                   @[@"glasses_7" ,@"glasses_4"],
                                   @[@"glasses_1" ,@"glasses_10"],
                                   @[@"glasses_11" ,@"glasses_12"],
                                   @[@"glasses_17" ,@"glasses_14"],
                                   @[@"glasses_13" ,@"glasses_18"],
                                   @[@"glasses_17" ,@"glasses_16"],
                                   ]
                           }
                   
                   };
    return dicOfImage;
}
+(NSDictionary *)GetInformationForGlasses{
    NSDictionary *dicOfInfor = [[NSDictionary alloc]init];
    dicOfInfor = @{
                   @"glasses_1":@{
                           @"attribute":@"男女通用",
                           @"size":@"适合大部分脸型",
                           @"color":@"褐黑相间",
                           @"price":@"300",
                           @"textured":@"高级树脂",
                           },
                   @"glasses_2":@{
                           @"attribute":@"女士镜架",
                           @"size":@"适合大部分脸型",
                           @"color":@"灰黑",
                           @"price":@"390",
                           @"textured":@"高级树脂",
                           },
                   @"glasses_3":@{
                           @"attribute":@"男女通用",
                           @"size":@"适合大部分脸型",
                           @"color":@"纯黑",
                           @"price":@"266",
                           @"textured":@"高级树脂",
                           },
                   @"glasses_4":@{
                           @"attribute":@"女士镜架",
                           @"size":@"适合大部分脸型",
                           @"color":@"褐色",
                           @"price":@"460",
                           @"textured":@"高级树脂",
                           },
                   @"glasses_5":@{
                           @"attribute":@"男女通用",
                           @"size":@"适合大部分脸型",
                           @"color":@"黑白相间",
                           @"price":@"200",
                           @"textured":@"高级树脂",
                           },
                   @"glasses_6":@{
                           @"attribute":@"男女通用",
                           @"size":@"适合大部分脸型",
                           @"color":@"褐色/黑色",
                           @"price":@"300",
                           @"textured":@"高级树脂",
                           },
                   @"glasses_7":@{
                           @"attribute":@"男女通用",
                           @"size":@"适合大部分脸型",
                           @"color":@"金黄/黑色",
                           @"price":@"255",
                           @"textured":@"高级树脂",
                           },
                   @"glasses_8":@{
                           @"attribute":@"男女通用",
                           @"size":@"适合大部分脸型",
                           @"color":@"灰色",
                           @"price":@"266",
                           @"textured":@"高级树脂",
                           },
                   @"glasses_9":@{
                           @"attribute":@"男女通用",
                           @"size":@"适合大部分脸型",
                           @"color":@"金色",
                           @"price":@"200",
                           @"textured":@"镀金架",
                           },
                   @"glasses_10":@{
                           @"attribute":@"男女通用",
                           @"size":@"适合大部分脸型",
                           @"color":@"深蓝",
                           @"price":@"300",
                           @"textured":@"镀漆",
                           },
                   @"glasses_11":@{
                           @"attribute":@"女士镜架",
                           @"size":@"适合大部分脸型",
                           @"color":@"纯黑",
                           @"price":@"400",
                           @"textured":@"高级树脂",
                           },
                   @"glasses_12":@{
                           @"attribute":@"男女通用",
                           @"size":@"适合大部分脸型",
                           @"color":@"青/黑",
                           @"price":@"366",
                           @"textured":@"高级树脂",
                           },
                   @"glasses_13":@{
                           @"attribute":@"男女通用",
                           @"size":@"适合大部分脸型",
                           @"color":@"金色/黑",
                           @"price":@"300",
                           @"textured":@"高级树脂",
                           },
                   @"glasses_14":@{
                           @"attribute":@"男女通用",
                           @"size":@"适合大部分脸型",
                           @"color":@"金色/褐",
                           @"price":@"300",
                           @"textured":@"高级树脂",
                           },
                   @"glasses_15":@{
                           @"attribute":@"男女通用",
                           @"size":@"适合大部分脸型",
                           @"color":@"棕/黑",
                           @"price":@"300",
                           @"textured":@"高级树脂",
                           },
                   @"glasses_16":@{
                           @"attribute":@"女士镜架",
                           @"size":@"适合大部分脸型",
                           @"color":@"亮灰",
                           @"price":@"300",
                           @"textured":@"高级树脂",
                           },
                   @"glasses_17":@{
                           @"attribute":@"女士镜架",
                           @"size":@"适合大部分脸型",
                           @"color":@"亮紫",
                           @"price":@"300",
                           @"textured":@"高级树脂",
                           },
                   @"glasses_18":@{
                           @"attribute":@"女士镜架",
                           @"size":@"适合大部分脸型",
                           @"color":@"黄黑花纹",
                           @"price":@"300",
                           @"textured":@"高级树脂",
                           },
                                     };
    
    
    
    
    return dicOfInfor;
}
//void pay(char *  photoname){
//    //获取照片的路径，并写入系统相册
//    
//    NSString *str = [NSString stringWithUTF8String:photoname];
//   NSLog(@"222222222222222222222222222222222222%@",str);
//    // NSArray *homepath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    //    NSString *documentPath = [homepath objectAtIndex:0];
//    //    NSString *photoPath=[NSString stringWithFormat:@"%@/%@",documentPath,str];
//    //     UIImage *image = [UIImage imageWithContentsOfFile:photoPath];
////    SWGlassesImages *instance = [SWGlassesImages alloc];
//    ////
//    //    instance.photo = image;
//    // UIImageWriteToSavedPhotosAlbum(image, instance, @selector(imageSaved:didFinishSavingWithError:contextInfo:), nil);
//    //
//    NSDictionary *message = @{@"content":str};
//    NSNotificationCenter*center = [NSNotificationCenter defaultCenter];
//    [center postNotificationName:@"photoName" object:nil userInfo:message];
//    NSLog(@"555555555555555555555555555555555555555555555555~%@",message);
//    
//}
//- (void) imageSaved: ( UIImage *) image didFinishSavingWithError:( NSError *)error contextInfo: ( void *) contextInfo{
//
//    NSLog(@"保存结束");
//    if (error != nil) {
//        NSLog(@"有错误");
//    }
//
//}
@end
