//
//  DatePickerView.h
//  YTDatePickerDemo
//
//  Created by 杨通 on 2018/7/26.
//  Copyright © 2018年 TonyAng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DatePickerView;
@protocol DatePickerViewDelegate <NSObject>

- (void)DatePickerView:(NSString *)year withMonth:(NSString *)month withDay:(NSString *)day withDate:(NSString *)date withTag:(NSInteger) tag;

@end
typedef NS_ENUM(NSInteger,TimeShowMode){
    /**
     * 只显示今天之前的时间
     */
    ShowTimeBeforeToday = 1,
    /**
     * 显示今天之后的时间
     */
    ShowTimeAfterToday,
    /**
     * 不限制时间
     */
    ShowAllTime,
    
};
@interface DatePickerView : UIView
- (instancetype)initWithFrame:(CGRect)frame withTimeShowMode:(TimeShowMode)timeMode withIsShowTodayDate:(BOOL)isShowToday;
@property (nonatomic, assign) id<DatePickerViewDelegate> delegate;

@end
