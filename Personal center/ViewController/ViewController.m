//
//  ViewController.m
//  Personal center
//
//  Created by mac1 on 16/9/14.
//  Copyright © 2016年 Tucici. All rights reserved.
//
#import "Header.h"
#import "ViewController.h"
#import "SWTableViewCell.h"
#import "PersonalDetails.h"
#import "FocusOnViewController.h"
#import "PopularityViewController.h"
#import "FansViewController.h"
#import "SettingViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,SWTableViewCellDelegate,PersonalDetailsDelegate>
{
    UITableView *_tableview;              /*个人中心第一个页面的瀑布流*/
    NSMutableArray *_coverPhotos;         /*个人中心第一个页面的瀑布流展示的封面图片*/
    PersonalDetails *_personalDetails;    /*个人中心第一个页面的个人详细资料*/
    
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
    [self initializeTableView];
    
    
    
    // Do any additional setup after loading the view.
}

/*======================================================initializePerDetails====================================*/
-(void)initializePersonalDetails{
    _personalDetails = [[PersonalDetails alloc]initWithFrame:CGRectMake(0.0, 0.0, view_width, 200)];
    _personalDetails.delegate = self;
    [self.view addSubview:_personalDetails];
    
}

/*======================================================initializeTableView====================================*/
-(void)initializeTableView{
    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0.0, 200, view_width, view_height - 200 ) style:UITableViewStylePlain];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableview.showsVerticalScrollIndicator = NO;
    _tableview.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    //    [_tableview registerClass:[SWTableViewCell class] forCellReuseIdentifier:@"SWTableViewCell"];
    [self.view addSubview:_tableview];
}

/*======================================================initializeCoverphotos====================================*/
-(void)initializeCoverphotos{
    _coverPhotos = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6", nil];
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
        NSLog(@"响应个人中心私密信息事件");
        return;
    }else if (type == 7){
        NSLog(@"响应个人中心公开信息事件");
        return;
    }else if (type == 8){
        NSLog(@"响应个人中心二维码事件");
        return;
    }
    
}

#pragma mark UITableViewDataSource
-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return (_coverPhotos.count)?_coverPhotos.count:1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *img = [_coverPhotos objectAtIndex:indexPath.section];
    //定义一个静态变量，用于标识cell
    static NSString *customCellIdentifier = @"SWTableViewCell";
    //首先根据标识  去缓存池取
    SWTableViewCell *cell = [_tableview dequeueReusableCellWithIdentifier:customCellIdentifier];
    //如果缓存池没有，则重新创建并放入缓存池中
    if (!cell) {
        cell  = [[SWTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:customCellIdentifier];
    }
    [cell setSWTableViewCellImage:img];
    [cell setDelegate:self];
    [cell setTag: [indexPath section]];
    return cell;
}
#pragma mark UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return view_width / 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0;
}
#pragma mark SWTableViewCellDalegate
-(void)scrollingTableViewCell:(SWTableViewCell *)scrollingTableViewCell didSelectImageAtIndexPath:(NSInteger)RowOfImage atCategoryRowIndex:(NSInteger)section{
    NSLog(@" section  :%ld     row :   %ld",(long)section, (long)RowOfImage);
    
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
