//
//  ViewController.m
//  YTDatePickerDemo
//
//  Created by 杨通 on 2018/7/26.
//  Copyright © 2018年 TonyAng. All rights reserved.
//

#import "ViewController.h"
#import "DatePickerView.h"
// 屏幕高度
#define SCREENHEIGHT            CGRectGetHeight([UIScreen mainScreen].bounds)
// 屏幕宽度
#define SCREENWIDTH             CGRectGetWidth([UIScreen mainScreen].bounds)
@interface ViewController ()<DatePickerViewDelegate>
@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) DatePickerView *datePickerView;
@property (nonatomic, strong) UIView *lightGrayView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btn addTarget:self action:@selector(BtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.btn setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
    self.btn.titleLabel.font = [UIFont systemFontOfSize:13];
    self.btn.frame = CGRectMake(0, 0, 200, 60);
    [self.view addSubview:self.btn];
    self.btn.center = self.view.center;
    self.btn.backgroundColor = [UIColor colorWithRed:arc4random() % 256 /255.0 green:arc4random() % 256 /255.0 blue:arc4random() % 256 /255.0 alpha:1.0];
    
    self.datePickerView = [[DatePickerView alloc] initWithFrame:CGRectMake(0, SCREENHEIGHT + 235, SCREENWIDTH, 235) withTimeShowMode:ShowAllTime withIsShowTodayDate:YES];
    self.datePickerView.backgroundColor = [UIColor whiteColor];
    self.datePickerView.delegate = self;
    [self.view addSubview:self.datePickerView];
    self.datePickerView.hidden = YES;
    
    self.lightGrayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT - 235)];
    [self.view addSubview:self.lightGrayView];
    self.lightGrayView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    self.lightGrayView.hidden = YES;
    // 单击的 Recognizer(_typeBottomView添加手势)
    UITapGestureRecognizer* singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lightGrayViewSingleTapFromAction)];
    singleRecognizer.numberOfTapsRequired = 1; // 单击
    [self.lightGrayView addGestureRecognizer:singleRecognizer];
}

- (void)BtnAction {
    self.datePickerView.hidden = NO;
    __weak typeof (self) weakSelf = self;
    [UIView animateWithDuration:0.3 // 动画时长
                          delay:0.0 // 动画延迟
                        options:UIViewAnimationOptionCurveEaseIn // 动画过渡效果
                     animations:^{
                         __strong typeof (weakSelf) strongSelf = weakSelf;
                         strongSelf.datePickerView.frame = CGRectMake(0, SCREENHEIGHT - 235, SCREENWIDTH, 235);
                     }
                     completion:^(BOOL finished) {
                         // 动画完成后执行
                         __strong typeof (weakSelf) strongSelf = weakSelf;
                         strongSelf.lightGrayView.hidden = NO;
                     }];

}

- (void)lightGrayViewSingleTapFromAction {
    __weak typeof (self) weakSelf = self;
    [UIView animateWithDuration:0.3 // 动画时长
                          delay:0.0 // 动画延迟
                        options:UIViewAnimationOptionCurveEaseIn // 动画过渡效果
                     animations:^{
                         __strong typeof (weakSelf) strongSelf = weakSelf;
                         strongSelf.lightGrayView.hidden = YES;
                         strongSelf.datePickerView.frame = CGRectMake(0, SCREENHEIGHT + 235, SCREENWIDTH, 235);
                     }
                     completion:^(BOOL finished) {
                         // 动画完成后执行
                         __strong typeof (weakSelf) strongSelf = weakSelf;
                         strongSelf.datePickerView.hidden = YES;
                     }];

}

#pragma mark - DatePickerViewDelegate
- (void)DatePickerView:(NSString *)year withMonth:(NSString *)month withDay:(NSString *)day withDate:(NSString *)date withTag:(NSInteger)tag{
    //确定
    if (tag == 1001) {
        [self.btn setTitle:date forState:UIControlStateNormal];
        [self lightGrayViewSingleTapFromAction];
    }else{//1002：取消
        [self.btn setTitle:@"" forState:UIControlStateNormal];
        [self lightGrayViewSingleTapFromAction];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
