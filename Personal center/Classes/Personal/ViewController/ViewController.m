//
//  ViewController.m
//  Personal center
//
//  Created by mac1 on 16/9/14.
//  Copyright © 2016年 Tucici. All rights reserved.
//
#import "Header.h"
#import "ViewController.h"
//#import "DynamicViewModel.h"
#import "SWCollectionView.h"
#import "PersonalDetails.h"
#import "FocusOnViewController.h"
#import "PopularityViewController.h"
#import "FansViewController.h"
#import "SettingViewController.h"
#import "NSMutableArray+avoidDuplication.h"
#import "DynamicViewModel.h"
#import "CellModel.h"
@interface ViewController ()<PersonalDetailsDelegate,SWCollectionViewDelegate>
{
    //    DynamicViewModel *_dynamicViewModel;     /*个人中心动态ViewModel*/
    SWCollectionView *_dynamicView;         /*个人中心动态*/
    PersonalDetails *_personalDetails;         /*个人中心第一个页面的个人详细资料*/
    UIView *_toolbar;                       /**/
    NSMutableArray *_selectArray;
    DynamicViewModel *_sourceModel;
}
@end


@implementation ViewController

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = backViewColor;
    _selectArray = [NSMutableArray array];
    self.automaticallyAdjustsScrollViewInsets = NO;/*去掉tableView滚动时候最顶部的空白处*/
    
    [self initializeSourceModel];
    
    /*initializePerDetails*/
    [self initializePersonalDetails];
    
    /*initializeTableView*/
    [self initializeCollectionView];
    
    /*initializeToolBar*/
    [self initializeToolBar];
    // Do any additional setup after loading the view.
}

- (void)initializeSourceModel{
    _sourceModel = [[DynamicViewModel alloc] init];
}

- (void)initializePersonalDetails{
    _personalDetails = [[PersonalDetails alloc]initWithFrame:CGRectMake(0.0, 0.0, view_width, 220)];
    _personalDetails.delegate = self;
    _personalDetails.EventType = PersonalEventPublic;
    [self.view addSubview:_personalDetails];
    
}

-(void)initializeCollectionView{
    _dynamicView = [[SWCollectionView alloc]initWithFrame:CGRectMake(0.0, CGRectGetMaxY(_personalDetails.frame), view_width, view_height - CGRectGetMaxY(_personalDetails.frame))];
    _dynamicView.delegate = self;
    _dynamicView.dataModel = _sourceModel;
    [self.view addSubview:_dynamicView];
    
}



- (void)initializeToolBar{
    
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
        [self hiddenToolView];
        for (CellModel *model in _selectArray) {
            
            if (_dynamicView.type == publicCoverPhoto) {
                
                [_sourceModel.publicData removeObject:model];
            }else if (_dynamicView.type == privateCoverPhoto){
                
                [_sourceModel.privateData removeObject:model];
            }
            
        }
        _dynamicView.state = NormalState;
        [_selectArray removeAllObjects];
        
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
        [self hiddenToolView];
        _dynamicView.type = privateCoverPhoto;
        NSLog(@"响应个人中心私密信息事件");
        return;
    }else if (type == 7){
        [self hiddenToolView];
        _dynamicView.type = publicCoverPhoto;
        NSLog(@"响应个人中心公开信息事件");
        return;
    }else if (type == 8){
        NSLog(@"响应个人中心二维码事件");
        return;
    }
    
}

#pragma mark SWCollectionViewDelegate

- (void)didSelectItem:(NSInteger)item with:(CoverPhotoType)type {
    CellModel *selectModel;
    if (type == publicCoverPhoto) {
        selectModel = [_sourceModel.publicData objectAtIndex:item];
    }else if (type == privateCoverPhoto){
        selectModel = [_sourceModel.privateData objectAtIndex:item];
    }
    
    selectModel.isPicked = !selectModel.isPicked;
    _dynamicView.state = SelectState;
    
    
    if (selectModel.isPicked) {
        [_selectArray addObject:selectModel];
        
    }else if (!selectModel.isPicked){
        [_selectArray removeObject:selectModel];
    }
}
- (void)popToolView{
    if (_dynamicView.state == NormalState) {
        [self hiddenToolView];
        return;
    }else if (_dynamicView.state == SelectState || _dynamicView.state == SelectedState){
        [UIView animateWithDuration:0.5 animations:^{
            _toolbar.transform = CGAffineTransformMakeTranslation(0.0, - buttonHeight - 10.0);
        }];
    }
    
}

- (void)hiddenToolView{
    [UIView animateWithDuration:0.5 animations:^{
        _toolbar.transform = CGAffineTransformIdentity;
    }];
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
