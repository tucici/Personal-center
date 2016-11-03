//
//  ViewController.m
//  Personal center
//
//  Created by mac1 on 16/9/14.
//  Copyright © 2016年 Tucici. All rights reserved.
//
#import "Header.h"
#import "ViewController.h"
//#import "SWTableViewCell.h"
#import "SWCollectionView.h"
#import "PersonalDetails.h"
#import "FocusOnViewController.h"
#import "PopularityViewController.h"
#import "FansViewController.h"
#import "SettingViewController.h"
@interface ViewController ()<PersonalDetailsDelegate,SWCollectionViewDelegate>
{
    SWCollectionView *_dynamicView;         /*个人中心第一个页面的瀑布流*/
    PersonalDetails *_personalDetails;         /*个人中心第一个页面的个人详细资料*/
    UIView *_toolbar;                       /**/
    NSMutableArray *_coverPhotos_public;    /*公开封面数组*/
    NSMutableArray *_coverPhotos_private;   /*私密封面数组*/
}
@end


@implementation ViewController

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = backViewColor;

    self.automaticallyAdjustsScrollViewInsets = NO;/*去掉tableView滚动时候最顶部的空白处*/
    
    /*initializeCoverphotos*/
    [self initializeCoverphotos];
    
    /*initializePerDetails*/
    [self initializePersonalDetails];
    
    /*initializeTableView*/
    [self initializeCollectionView];
    
    /*initializeToolBar*/
    [self initializeToolBar];
    // Do any additional setup after loading the view.
}

/*======================================================initializePerDetails====================================*/
-(void)initializePersonalDetails{
    _personalDetails = [[PersonalDetails alloc]initWithFrame:CGRectMake(0.0, 0.0, view_width, 220)];
    _personalDetails.delegate = self;
    _personalDetails.EventType = PersonalEventPublic;
    [self.view addSubview:_personalDetails];
    
}

/*======================================================initializeTableView====================================*/
-(void)initializeCollectionView{
    _dynamicView = [[SWCollectionView alloc]initWithFrame:CGRectMake(0.0, CGRectGetMaxY(_personalDetails.frame), view_width, view_height - CGRectGetMaxY(_personalDetails.frame))];
    _dynamicView.delegate = self;
    [_dynamicView.coverPhotos setObject:_coverPhotos_public forKey:@"public"];
    [_dynamicView.coverPhotos setObject:_coverPhotos_private forKey:@"private"];
    [self.view addSubview:_dynamicView];
    
    //    [ self addgesture];
}

/*======================================================initializeCoverphotos====================================*/
-(void)initializeCoverphotos{
    _coverPhotos_public = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"5",@"3",@"1",@"2",@"3",@"4",@"5",@"6",@"5",@"3",@"6",@"5",@"3",@"1",@"2",@"3",@"4",@"5",@"6",@"5",@"3",@"6",@"5",@"3",@"1",@"2",@"3",@"4",@"5",@"6",@"5",@"3",nil];
    _coverPhotos_private= [NSMutableArray arrayWithObjects:@"01",@"02",@"03",@"04",@"05",@"06",@"06",@"01",@"02",@"03",@"04",@"05",@"06",@"06",@"03",@"04",@"05",@"06",@"06",@"01",@"02",@"03",@"04",@"05",@"06",@"06",@"03",@"04",@"05",@"06",@"06",@"01",@"02",@"03",@"04",@"05",@"06",@"06", nil];
    
    
}

- (void)initializeToolBar{
    //    CGFloat spacing = (view_width - buttonHeight * 3)
    _toolbar  = [[UIView alloc]initWithFrame:CGRectMake(0.0, view_height + 10.0, view_width, buttonHeight + 10.0)];
    _toolbar.backgroundColor = [UIColor blackColor];
    _toolbar.alpha = 0.8;
    
    UIButton *public_privateBtn = [[UIButton alloc]initWithFrame:CGRectMake(buttonHeight * 0.5, 5, buttonHeight, buttonHeight)];
    [public_privateBtn setBackgroundImage:[UIImage imageNamed:@"04"] forState:UIControlStateNormal];
    [public_privateBtn addTarget:self action:@selector(changeVideoRights) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *shareBtn = [[UIButton alloc]initWithFrame:CGRectMake((view_width - buttonHeight) * 0.5, 5, buttonHeight, buttonHeight)];
    [shareBtn setBackgroundImage:[UIImage imageNamed:@"02"] forState:UIControlStateNormal];
    [shareBtn addTarget:self action:@selector(share:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *deleteBtn = [[UIButton alloc]initWithFrame:CGRectMake(view_width - buttonHeight * 1.5, 5, buttonHeight, buttonHeight)];
    [deleteBtn setBackgroundImage:[UIImage imageNamed:@"06"] forState:UIControlStateNormal];
    [deleteBtn addTarget:self action:@selector(delete:) forControlEvents:UIControlEventTouchUpInside];
    
    [_toolbar addSubview:public_privateBtn];
    [_toolbar addSubview:shareBtn];
    [_toolbar addSubview:deleteBtn];
    [self.view addSubview:_toolbar];
}

- (void)longPress:(UILongPressGestureRecognizer *)sender{
    
    
}

- (void)changeVideoRights{
    [self addAlertWithType:0];
}

- (void)share:(UIButton *)sender{
    
}

- (void)delete:(UIButton *)sender{
    [self addAlertWithType:1];
}

- (void)addAlertWithType:(int)type{
    NSString *message;
    if (type == 0) {
        message = @"是否改变视频权限";
    }else if (type == 1){
        message = @"是否删除本视频";
    }
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击取消");
    }];
    [cancelAction setValue:mainColor forKey:@"titleTextColor"];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击确认");
    }];
    [confirmAction setValue:mainColor forKey:@"titleTextColor"];
    [alert addAction:cancelAction];
    [alert addAction:confirmAction];
    [self presentViewController:alert animated:NO completion:nil];
    
}
/**
 *获取一张照片或Gif,
 */
-(void)getMedia{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alertController addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"点击拍照");
        
    }]];
    
    
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"移除当前头像" style: UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"点击移除当前头像");
        
    }]];
    
    
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Gif动画" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"点击Gif动画");
        
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"从相册中选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击从相册中选择");
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击取消");
    }]];
    
    // 由于它是一个控制器 直接modal出来就好了
    
    [self presentViewController:alertController animated:NO completion:nil];
    
}

#pragma mark PersonalDetailsDelegate
-(void)personalDetailsAcitonWith:(PersonalEventType)type{
    if (type == 0) {
        
        NSLog(@"响应个人中心返回事件");
        return;
    }else if (type == 1){
        SettingViewController *settingVC = [[SettingViewController alloc]init];
        [self presentViewController:settingVC animated:NO completion:nil];
        NSLog(@"响应个人中心设置事件");
        return;
    }else if (type == 2){
        [self getMedia];
        NSLog(@"响应个人中心更换个人头像事件");
        return;
    }else if (type == 3){
        FocusOnViewController *focusOnVC = [[FocusOnViewController alloc]init];
        [self presentViewController:focusOnVC animated:NO completion:nil];
        NSLog(@"响应个人中心关注事件");
        return;
    }else if (type == 4){
        FansViewController *fansVC = [[FansViewController alloc]init];
        [self presentViewController:fansVC animated:NO completion:nil];
        NSLog(@"响应个人中心粉丝事件");
        return;
    }else if (type == 5){
        PopularityViewController *popularityVC = [[PopularityViewController alloc]init];
        [self presentViewController:popularityVC animated:NO completion:nil];
        NSLog(@"响应个人中心人气事件");
        return;
    }else if (type == 6){
        _dynamicView.type = privateCoverPhoto;
        [_dynamicView reloadAddCoverPhotos];
        NSLog(@"响应个人中心私密信息事件");
        return;
    }else if (type == 7){
        _dynamicView.type = publicCoverPhoto;
        [_dynamicView reloadAddCoverPhotos];
        NSLog(@"响应个人中心公开信息事件");
        return;
    }else if (type == 8){
        NSLog(@"响应个人中心二维码事件");
        return;
    }
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    NSInteger number = ([[_dynamicView.coverPhotos objectForKey:@"public"]count] % 3 == 0)?([[_dynamicView.coverPhotos objectForKey:@"public"] count]/3):([[_dynamicView.coverPhotos objectForKey:@"public"]count]/3 + 1);
    return (number)?number:1;
}
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    //定义一个静态变量，用于标识cell
//    static NSString *customCellIdentifier = @"SWTableViewCell";
//    //首先根据标识  去缓存池取
//    SWTableViewCell *cell = [_tableview dequeueReusableCellWithIdentifier:customCellIdentifier];
//    //如果缓存池没有，则重新创建并放入缓存池中
//    if (!cell) {
//        cell  = [[SWTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:customCellIdentifier];
//    }
//
//    /*NSString *img = (_personalDetails.EventType == PersonalEventPublic)?([[_coverPhotos objectForKey:@"public"] objectAtIndex:indexPath.section]):([[_coverPhotos objectForKey:@"private"] objectAtIndex:indexPath.section]);
//     [cell setSWTableViewCellImage:img];*/ /*传入单个图片*/
//
//    NSMutableArray *imgArray = (_personalDetails.EventType == PersonalEventPublic)?([_coverPhotos objectForKey:@"public"]):([_coverPhotos objectForKey:@"private"]);
//    [cell setSWTableViewCellImageArray:[self splitArray:imgArray With:3][indexPath.section]];/*传入数组*/
//    [cell setDelegate:self];
//    [cell setTag: [indexPath section]];
//    return cell;
//}
//#pragma mark UITableViewDelegate
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 0.0;
//}
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return view_width / 3;
//}
//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return 0.0;
//}
#pragma mark SWCollectionViewDelegate
-(void)didSelectImageItemAtIndexPath:(NSInteger)section{
    NSLog(@" section  :%ld  ",(long)section);
#pragma mark 点击封面列表，跳转页面反应
}

- (void)longprogressCollectionView{
    [UIView animateWithDuration:0.5 animations:^{
        _toolbar.transform = CGAffineTransformMakeTranslation(0.0, - buttonHeight - 10.0);
    }];
    //   NSInteger cellCount = ([[_coverPhotos objectForKey:@"public"]count] % 3 == 0)?([[_coverPhotos objectForKey:@"public"] count]/3):([[_coverPhotos objectForKey:@"public"]count]/3 + 1);
    //    for (int i = 0; i < cellCount; i++) {
    //     SWTableViewCell *cell = [_tableview cellForRowAtIndexPath:[NSIndexPath indexPathWithIndex:(NSUInteger)i]];
    //        [cell showDeleteBtnAtTableViewCell];
    //    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
