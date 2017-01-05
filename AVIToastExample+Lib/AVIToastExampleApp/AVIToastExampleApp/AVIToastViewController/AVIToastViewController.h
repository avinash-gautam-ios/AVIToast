//
//  AVIToastViewController.h
//  AVIToast
//
//  Created by Avinash Kumar Gautam on 30/12/16.
//  Copyright © 2016 Avinash Kumar Gautam. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kAVDefaultToastLocation aToastLocationScreenBottom
#define kAVDefalultToastAnimation aToastAnimationFade
#define kAVDefaultFontSizeForLabel 11
#define kDefaultAnimationDuration 0.4 //does not apply to fade and appear animation
#define kAVDefaultDownSideUpFromScreenValue 50
#define kAVDefaultUpSideDownScreenValue 50
#define kAVDefaultToastString @"This is Sample Toast"
#define kAVDefaultToastAlpha 0.8
#define kMaxAVToastLabelWidth [UIScreen mainScreen].bounds.size.width-50
#define kAVDefaultBackGroundColor [UIColor blackColor]
#define kAVDefaultFontColor [UIColor whiteColor]

#define switchToMainThreadForDelegate  dispatch_async(dispatch_get_main_queue(), ^{ [[AVIToastViewController singleton].delegate AVToastDidFinshDisplayingToast]; });
//to change duration of toast, simply change the below value
#define kDefaultToastDuration 2.1

/*!
 * @typedef AVToastLocationStatus
 * @brief A list of Positions/Locations on screen for AVToast.
 * @constant AVToastLocationScreenTop Screen TOP.
 * @constant AVToastLocationScreenBottom Screen BOTTOM.
 * @constant AVToastLocationScreenCenter Screen CENTER.
 */
typedef enum AVToastLocation {
    AVToastLocationScreenTop = 1,
    AVToastLocationScreenBottom, //default
    AVToastLocationScreenCenter
}AVToastLocationStatus;

/*!
 * @typedef AVToastAnimationStatus
 * @brief A list of Animations for AVToast.
 * @constant AVToastAnimationFade Fade Animation.
 * @constant AVToastAnimationSlideFromLeft Slide From Left Animation.
 * @constant AVToastAnimationSlideFromRight Slide From Right Animation.
 * @constant AVToastAnimationSimpleAppear Simply Appear Animation.
 * @constant AVToastAnimationSlideFromDown Slide From Down to Up Animation.
 * @constant AVToastAnimationSlideFromTop Slide From Top to Down Animation.
 * @constant AVToastAnimationThrough Slide from Left to Right Through Animation.
 * @constant AVToastAnimationPopUpAppear Pop Up Animation.
 * @constant AVToastAnimationReversePopUpAppear Reverse Pop Up Animation.
 * @constant AVToastAnimationThroughPopUpAnimation Through Pop Animation.
 */
typedef enum AVToasatAnimation {
    AVToastAnimationFade = 1, //default
    AVToastAnimationSlideFromLeft,
    AVToastAnimationSlideFromRight,
    AVToastAnimationSimpleAppear,
    AVToastAnimationSlideFromDown,
    AVToastAnimationSlideFromTop,
    AVToastAnimationThrough,
    AVToastAnimationPopUpAppear,
    AVToastAnimationReversePopUpAppear,
    AVToastAnimationThroughPopUpAnimation
}AVToastAnimationStatus;

/*!
 * @typedef AVToastDurationStatus
 * @brief A list of Duration for AVToast.
 * @constant AVToastDurationLong Long Duration.
 * @constant AVToastDurationShort Short Duration.
 * @constant AVToatDurationNormal Normal Duration.
 */
typedef enum AVToastDurationStatus {
    AVToastDurationLong = 1,
    AVToastDurationShort,
    AVToastDurationNormal
}AVToastDurationStatus;

@protocol AVToastDisplayEndDelegate <NSObject>
@optional
-(void)AVToastDidFinshDisplayingToast;

@end

@interface AVIToastViewController : UIViewController

@property (nonatomic,weak)_Nullable id<AVToastDisplayEndDelegate> delegate;

#pragma mark - Properties
@property (nonatomic) BOOL isShowing;
@property (nonatomic,strong) UIColor *_Nonnull AVToastBackgroundColor; //defalut is black
@property (nonatomic,strong) UIColor *_Nonnull AVToastLabelColor; //default is white
//@property (nonatomic,strong) NSString *_Nonnull AVToastLabelFont; //default is system font
@property (nonatomic) CGFloat AVToastAlpha;
@property (nonatomic,strong) UILabel *_Nonnull AVToastLabel;
@property (nonatomic,strong) UIView *_Nonnull backGroundView;
@property (nonatomic) CGFloat AVToastFontSize;
@property (nonatomic) CGFloat AVToastDuration;

#pragma mark - User Methods

/*!
 * @brief This will show toast on a view with default values ,passed string and with font size for toast label
 * @param view to show toast on, string for toast, font size for the toast in CGFloat
 * @param string String for toast
 * @param duration Duration to Display AVToast
 * @param fontSize Font size for the toast(in CGFloat)
 * @param AVToastLocationStatus Toast Location
 * @param AVToastAnimationStatus Toast Animation Type
 * @param alpha Toast Alpha (in CGFloat)
 * @param backgroundColor Background color for AVToast
 * @param fontColor Font color for Label of AVToast
 * @return nil
 */
+(void)showAVToastOnView:(UIView *_Nonnull)view withString:(NSString *_Nonnull)text forDuration:(AVToastDurationStatus)duration withFontSize:(CGFloat)fontSize withAVToastPosition:(AVToastLocationStatus)toastLocation withAVToastAnimation:(AVToastAnimationStatus)toastAnimation withAlpha:(CGFloat)toastAlpha withAVBackGroundColor:( UIColor * _Nullable )backColor withAVFontColor:(UIColor * _Nullable)fontColor;

/*!
 * @brief This will show toast on a view with default values and a passed string.
 * @param view to show toast on
 * @param string for toast
 * @return nil
 */
+(void)showToastOnView:(UIView * _Nonnull)view withString:(NSString * _Nonnull)text;

/*!
 * @brief This will show toast on a view with default values and a passed string.
 * @param view to show toast on
 * @param string for toast
 * @param duration Duration to Display AVToast
 * @return nil
 */
+(void)showToastOnView:(UIView * _Nonnull)view withString:(NSString * _Nonnull)text forDuration:(AVToastDurationStatus)duration;

/*!
 * @brief This will show toast on a view with default values ,passed string and alpha level for toast.
 * @param view to show toast on
 * @param string for toast
 * @param alpha value for the toast in CGFloat
 * @return nil
 */
+(void)showToastOnView:(UIView *_Nonnull)view withString:(NSString *_Nonnull)text withAlpha:(CGFloat)toastAlpha forDuration:(AVToastDurationStatus)duration;

/*!
 * @brief This will show toast on a view with default values ,passed string and with font size for toast label.
 * @param view to show toast on
 * @param string for toast
 * @param font size for the toast in CGFloat
 * @return nil
 */
+(void)showToastOnView:(UIView *_Nonnull)view withString:(NSString *_Nonnull)text withFontSize:(CGFloat)fontSize forDuration:(AVToastDurationStatus)duration;

/*!
 * @brief This will show toast on a view with default values ,passed string and with font size for toast label.
 * @param view to show toast on, string for toast, font size for the toast in CGFloat
 * @param string for toast
 * @param font size for the toast in CGFloat
 * @param AVToastLocationStatus Location of AVToast on Screen
 * @return nil
 */
+(void)showAVToastOnView:(UIView *_Nonnull)view withString:(NSString *_Nonnull)text withFontSize:(CGFloat)fontSize withAVToastPosition:(AVToastLocationStatus)toastLocation forDuration:(AVToastDurationStatus)duration;

/*!
 * @brief This will show toast on a view with default values ,passed string and with font size for toast label.
 * @param view to show toast on, string for toast, font size for the toast in CGFloat
 * @param string for toast
 * @param font size for the toast in CGFloat
 * @param AVToastLocationStatus Location of AVToast on Screen
 * @return nil
 */
+(void)showAVToastOnView:(UIView *_Nonnull)view withString:(NSString *_Nonnull)text withFontSize:(CGFloat)fontSize withAVToastAnimation:(AVToastAnimationStatus)toastAnimation forDuration:(AVToastDurationStatus)duration;

/*!
 * @brief This will show toast on a view with default values ,passed string and with font size for toast label.
 * @param view to show toast on, string for toast, font size for the toast in CGFloat
 * @param string for toast
 * @param AVToastLocationStatus Location of AVToast on Screen
 * @param AVToastAnimationStatus Animation for AVToast
 * @return nil
 */
+(void)showAVToastOnView:(UIView *_Nonnull)view withString:(NSString *_Nonnull)text withAVToastPosition:(AVToastLocationStatus)toastLocation withAVToastAnimation:(AVToastAnimationStatus)toastAnimation forDuration:(AVToastDurationStatus)duration;

/*!
 * @brief This will show toast on a view with default values ,passed string and with font size for toast label.
 * @param view to show toast on, string for toast, font size for the toast in CGFloat
 * @param string for toast
 * @param backgroundColor Background color for AVToast
 * @param fontColor Font color for Label of AVToast
 * @return nil
 */
+(void)showToastOnView:(UIView *_Nonnull)view withString:(NSString *_Nonnull)text withBackgroundColor:(UIColor *_Nonnull)backColor withFontColor:(UIColor *_Nonnull)fontColor forDuration:(AVToastDurationStatus)duration;

/*!
 * @brief This will show toast on a view with default values ,passed string and with font size for toast label.
 * @param view to show toast on, string for toast, font size for the toast in CGFloat
 * @param string for toast
 * @param backgroundColor Background color for AVToast
 * @param fontColor Font color for Label of AVToast
 * @param AVToastLocationStatus Location of AVToast on Screen
 * @param AVToastAnimationStatus Animation for AVToast
 * @return nil
 */
+(void)showToastOnView:(UIView *_Nonnull)view withString:(NSString *_Nonnull)text withBackgroundColor:(UIColor *_Nonnull)backColor withFontColor:(UIColor *_Nonnull)fontColor withAVToastPosition:(AVToastLocationStatus)toastLocation withAVToastAnimation:(AVToastAnimationStatus)toastAnimation forDuration:(AVToastDurationStatus)duration;

@end
