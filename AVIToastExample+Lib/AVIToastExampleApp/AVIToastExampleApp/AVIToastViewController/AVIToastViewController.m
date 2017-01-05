//
//  AVIToastViewController.m
//  AVIToast
//
//  Created by Avinash Kumar Gautam on 30/12/16.
//  Copyright © 2016 Avinash Kumar Gautam. All rights reserved.
//

#import "AVIToastViewController.h"

static AVIToastViewController *sharedObject;
@interface AVIToastViewController ()

@end

@implementation AVIToastViewController
@synthesize AVToastLabelColor,AVToastBackgroundColor,AVToastAlpha,isShowing,AVToastFontSize,AVToastLabel,backGroundView,AVToastDuration,delegate;

+(AVIToastViewController *)singleton {
    @synchronized (self) {
        if (sharedObject == nil) {
            sharedObject = [[AVIToastViewController alloc]init];
            [AVIToastViewController singleton].AVToastDuration = 0.0f;
            return sharedObject;
        }
    }
    return sharedObject;
}

#pragma mark - Non User Methods

#pragma mark - All Setters and Getters
-(void)setAVToastBackgroundColor:(UIColor*)color {
    AVToastBackgroundColor = color;
}
-(UIColor *)AVToastBackgroundColor {
    return AVToastBackgroundColor;
}
-(void)setAVToastLabelColor:(UIColor *)color {
    AVToastLabelColor = color;
}
-(UIColor *)AVToastLabelColor {
    return AVToastLabelColor;
}
-(void)setAVToastDuration:(CGFloat)duration {
    AVToastDuration = duration;
}
-(CGFloat)AVToastDuration {
    return AVToastDuration;
}

#pragma mark - Preapare Label Size
+ (CGSize)prepareLabelForAVToastWithString:(NSString *)yourString withFontSize:(CGFloat)fontSize {
    
    UILabel * yourLabel= [[UILabel alloc]init];
    yourLabel.textColor = [UIColor whiteColor];
    yourLabel.font = [UIFont systemFontOfSize:fontSize];
    yourLabel.numberOfLines = 0;
    yourLabel.textAlignment = NSTextAlignmentCenter;
    yourLabel.text = yourString;
    [yourLabel sizeToFit];
    yourLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    CGSize maximumLabelSize = CGSizeMake(kMaxAVToastLabelWidth, FLT_MAX);
    CGSize expectedLabelSize = [yourString sizeWithFont:yourLabel.font constrainedToSize:maximumLabelSize lineBreakMode:yourLabel.lineBreakMode];
    return expectedLabelSize;
}

#pragma mark - AVToast Location Frames
+(CGRect)setFrameForAVToastLocationScreenTopforLabelSize:(CGSize)labelSize {
    return CGRectMake(kScreenWidth/2-(labelSize.width/2), kAVDefaultUpSideDownScreenValue, labelSize.width, labelSize.height);
}

+(CGRect)setFrameForAVToastLocationScreenBottomforLabelSize:(CGSize)labelSize {
     return CGRectMake(kScreenWidth/2-(labelSize.width/2), kScreenHeight-(labelSize.height+kAVDefaultDownSideUpFromScreenValue), labelSize.width, labelSize.height);
}

+(CGRect)setFrameForAVToastLocationScreenCenterforLabelSize:(CGSize)labelSize {
    return CGRectMake(kScreenWidth/2-(labelSize.width/2), (kScreenHeight/2)-(labelSize.height), labelSize.width, labelSize.height);
}

#pragma mark - AVToast Animations
+(void)setFadeAnimationForToastForView {
    if ([AVIToastViewController singleton].isShowing == NO) {
        
        [AVIToastViewController singleton].isShowing = YES;
        
        [AVIToastViewController singleton].AVToastLabel.alpha = 0.0f;
        [AVIToastViewController singleton].backGroundView.alpha = 0.0f;
        [UIView animateWithDuration:0.7 animations:^{
            [AVIToastViewController singleton].AVToastLabel.alpha = 1.0f;
            [AVIToastViewController singleton].backGroundView.alpha = [AVIToastViewController singleton].AVToastAlpha;
        }completion:^(BOOL done) {
            [UIView animateWithDuration:0.5 delay:[AVIToastViewController getAVToastDurationValue] options:UIViewAnimationOptionCurveLinear animations:^{
                [AVIToastViewController singleton].AVToastLabel.alpha = 0.0f;
                [AVIToastViewController singleton].backGroundView.alpha = 0.0f;
            }completion:^(BOOL done) {
                [AVIToastViewController singleton].isShowing = NO;
                [[AVIToastViewController singleton].AVToastLabel removeFromSuperview];
                [[AVIToastViewController singleton].backGroundView removeFromSuperview];
                switchToMainThreadForDelegate
            }];
        }];
        
    } else {
        //do not show
    }
}

+(void)setAppearAnimationForToastForView {
    if ([AVIToastViewController singleton].isShowing == NO) {
        
        [AVIToastViewController singleton].isShowing = YES;
        
        [AVIToastViewController singleton].AVToastLabel.alpha = 0.0f;
        [AVIToastViewController singleton].backGroundView.alpha = 0.0f;
        [UIView animateWithDuration:0.1 animations:^{
            [AVIToastViewController singleton].AVToastLabel.alpha = 1.0f;
            [AVIToastViewController singleton].backGroundView.alpha = [AVIToastViewController singleton].AVToastAlpha;
        }completion:^(BOOL done) {
            [UIView animateWithDuration:0.2 delay:[AVIToastViewController getAVToastDurationValue] options:UIViewAnimationOptionCurveLinear animations:^{
                [AVIToastViewController singleton].AVToastLabel.alpha = 0.0f;
                [AVIToastViewController singleton].backGroundView.alpha = 0.0f;
            }completion:^(BOOL done) {
                [AVIToastViewController singleton].isShowing = NO;
                [[AVIToastViewController singleton].AVToastLabel removeFromSuperview];
                [[AVIToastViewController singleton].backGroundView removeFromSuperview];
                switchToMainThreadForDelegate
            }];
        }];
        
    } else {
        //do not show
    }
}

+(void)setSlideFromLeftAnimationForToastForView {
    if ([AVIToastViewController singleton].isShowing == NO) {
        
        [AVIToastViewController singleton].isShowing = YES;
        
        [AVIToastViewController singleton].AVToastLabel.alpha = 0.0f;
        [AVIToastViewController singleton].backGroundView.alpha = 0.0f;
        
        CGRect oriFrame = [AVIToastViewController singleton].backGroundView.frame;
        CGRect oriFrameLbl = [AVIToastViewController singleton].AVToastLabel.frame;
        
        [AVIToastViewController singleton].backGroundView.frame = CGRectMake(-(oriFrame.origin.x+oriFrame.size.width), oriFrame.origin.y, oriFrame.size.width, oriFrame.size.height);
        [AVIToastViewController singleton].AVToastLabel.frame = CGRectMake(-(oriFrameLbl.origin.x+oriFrameLbl.size.width), oriFrameLbl.origin.y, oriFrameLbl.size.width, oriFrameLbl.size.height);
        
        [UIView animateWithDuration:kDefaultAnimationDuration animations:^{
            [AVIToastViewController singleton].AVToastLabel.alpha = 1.0f;
            [AVIToastViewController singleton].backGroundView.alpha = [AVIToastViewController singleton].AVToastAlpha;
            
            [AVIToastViewController singleton].backGroundView.frame = oriFrame;
            [AVIToastViewController singleton].AVToastLabel.frame = oriFrameLbl;
            
        }completion:^(BOOL done) {
            [UIView animateWithDuration:kDefaultAnimationDuration-0.1 delay:[AVIToastViewController getAVToastDurationValue] options:UIViewAnimationOptionCurveLinear animations:^{
                [AVIToastViewController singleton].AVToastLabel.alpha = 0.0f;
                [AVIToastViewController singleton].backGroundView.alpha = 0.0f;
                
                [AVIToastViewController singleton].backGroundView.frame = CGRectMake(-(oriFrame.origin.x+oriFrame.size.width), oriFrame.origin.y, oriFrame.size.width, [AVIToastViewController singleton].backGroundView.frame.size.height);
                [AVIToastViewController singleton].AVToastLabel.frame = CGRectMake(-(oriFrameLbl.origin.x+oriFrameLbl.size.width), oriFrameLbl.origin.y, oriFrameLbl.size.width, oriFrameLbl.size.height);
                
            }completion:^(BOOL done) {
                [AVIToastViewController singleton].isShowing = NO;
                [[AVIToastViewController singleton].AVToastLabel removeFromSuperview];
                [[AVIToastViewController singleton].backGroundView removeFromSuperview];
                switchToMainThreadForDelegate
            }];
        }];
        
    } else {
        //do not show
    }
}

+(void)setThroughAnimationForToastForView {
    if ([AVIToastViewController singleton].isShowing == NO) {
        
        [AVIToastViewController singleton].isShowing = YES;
        
        [AVIToastViewController singleton].AVToastLabel.alpha = 0.0f;
        [AVIToastViewController singleton].backGroundView.alpha = 0.0f;
        
        CGRect oriFrame = [AVIToastViewController singleton].backGroundView.frame;
        
        [AVIToastViewController singleton].backGroundView.frame = CGRectMake(kScreenHeight+10,[AVIToastViewController singleton].backGroundView.frame.origin.y, [AVIToastViewController singleton].backGroundView.frame.size.width, [AVIToastViewController singleton].backGroundView.frame.size.height);
        [UIView animateWithDuration:kDefaultAnimationDuration animations:^{
            [AVIToastViewController singleton].AVToastLabel.alpha = 1.0f;
            [AVIToastViewController singleton].backGroundView.alpha = [AVIToastViewController singleton].AVToastAlpha;
            [AVIToastViewController singleton].backGroundView.frame = oriFrame;
        }completion:^(BOOL done) {
            [UIView animateWithDuration:kDefaultAnimationDuration-0.1 delay:[AVIToastViewController getAVToastDurationValue] options:UIViewAnimationOptionCurveLinear animations:^{
                [AVIToastViewController singleton].AVToastLabel.alpha = 0.0f;
                [AVIToastViewController singleton].backGroundView.alpha = 0.0f;
                [AVIToastViewController singleton].backGroundView.frame = CGRectMake(-([AVIToastViewController singleton].backGroundView.frame.origin.x+[AVIToastViewController singleton].backGroundView.frame.size.width), [AVIToastViewController singleton].backGroundView.frame.origin.y, [AVIToastViewController singleton].backGroundView.frame.size.width, [AVIToastViewController singleton].backGroundView.frame.size.height);
            }completion:^(BOOL done) {
                [AVIToastViewController singleton].isShowing = NO;
                [[AVIToastViewController singleton].AVToastLabel removeFromSuperview];
                [[AVIToastViewController singleton].backGroundView removeFromSuperview];
                switchToMainThreadForDelegate
            }];
        }];
        
    } else {
        //do not show
    }
}

+(void)setSlideFromRightAnimationForToastForView {
    if ([AVIToastViewController singleton].isShowing == NO) {
        
        [AVIToastViewController singleton].isShowing = YES;
        
        [AVIToastViewController singleton].AVToastLabel.alpha = 0.0f;
        [AVIToastViewController singleton].backGroundView.alpha = 0.0f;
        
        CGRect oriFrame = [AVIToastViewController singleton].backGroundView.frame;
        CGRect oriFrameLbl = [AVIToastViewController singleton].AVToastLabel.frame;

        [AVIToastViewController singleton].backGroundView.frame = CGRectMake(kScreenHeight+10,oriFrame.origin.y, oriFrame.size.width, oriFrame.size.height);
        [AVIToastViewController singleton].AVToastLabel.frame = CGRectMake(kScreenHeight+10,oriFrameLbl.origin.y, oriFrameLbl.size.width, oriFrameLbl.size.height);
        
        [UIView animateWithDuration:kDefaultAnimationDuration animations:^{
            [AVIToastViewController singleton].AVToastLabel.alpha = 1.0f;
            [AVIToastViewController singleton].backGroundView.alpha = [AVIToastViewController singleton].AVToastAlpha;
            
            [AVIToastViewController singleton].backGroundView.frame = oriFrame;
            [AVIToastViewController singleton].AVToastLabel.frame = oriFrameLbl;
            
        }completion:^(BOOL done) {
            [UIView animateWithDuration:kDefaultAnimationDuration-0.1 delay:[AVIToastViewController getAVToastDurationValue] options:UIViewAnimationOptionCurveLinear animations:^{
                [AVIToastViewController singleton].AVToastLabel.alpha = 0.0f;
                [AVIToastViewController singleton].backGroundView.alpha = 0.0f;
                
                [AVIToastViewController singleton].backGroundView.frame = CGRectMake(kScreenHeight+10, oriFrame.origin.y, oriFrame.size.width, oriFrame.size.height);
                [AVIToastViewController singleton].AVToastLabel.frame = CGRectMake(kScreenHeight+10,oriFrameLbl.origin.y, oriFrameLbl.size.width, oriFrameLbl.size.height);
                
            }completion:^(BOOL done) {
                [AVIToastViewController singleton].isShowing = NO;
                [[AVIToastViewController singleton].AVToastLabel removeFromSuperview];
                [[AVIToastViewController singleton].backGroundView removeFromSuperview];
                switchToMainThreadForDelegate
            }];
        }];
    } else {
        //do not show
    }
}

+(void)setSlideFromBottomAnimationForToastForView {
    if ([AVIToastViewController singleton].isShowing == NO) {
        
        [AVIToastViewController singleton].isShowing = YES;
        
        [AVIToastViewController singleton].AVToastLabel.alpha = 0.0f;
        [AVIToastViewController singleton].backGroundView.alpha = 0.0f;
        
        CGRect oriFrameBack = [AVIToastViewController singleton].backGroundView.frame;
        CGRect oriFrameLbl = [AVIToastViewController singleton].AVToastLabel.frame;
        
        [AVIToastViewController singleton].backGroundView.frame = CGRectMake(oriFrameBack.origin.x,oriFrameBack.origin.y+20, oriFrameBack.size.width, oriFrameBack.size.height);
        [AVIToastViewController singleton].AVToastLabel.frame = CGRectMake(oriFrameLbl.origin.x, oriFrameLbl.origin.y+20, oriFrameLbl.size.width, oriFrameLbl.size.height);
        
        [UIView animateWithDuration:kDefaultAnimationDuration animations:^{
            [AVIToastViewController singleton].AVToastLabel.alpha = 1.0f;
            [AVIToastViewController singleton].backGroundView.alpha = [AVIToastViewController singleton].AVToastAlpha;
            
            [AVIToastViewController singleton].backGroundView.frame = oriFrameBack;
            [AVIToastViewController singleton].AVToastLabel.frame = oriFrameLbl;
            
        }completion:^(BOOL done) {
            [UIView animateWithDuration:kDefaultAnimationDuration-0.1 delay:[AVIToastViewController getAVToastDurationValue] options:UIViewAnimationOptionCurveLinear animations:^{
                [AVIToastViewController singleton].AVToastLabel.alpha = 0.0f;
                [AVIToastViewController singleton].backGroundView.alpha = 0.0f;
                
                [AVIToastViewController singleton].backGroundView.frame = CGRectMake(oriFrameBack.origin.x, oriFrameBack.origin.y+20, oriFrameBack.size.width, oriFrameBack.size.height);
                [AVIToastViewController singleton].AVToastLabel.frame = CGRectMake(oriFrameLbl.origin.x, oriFrameLbl.origin.y+20, oriFrameLbl.size.width, oriFrameLbl.size.height);
                
            }completion:^(BOOL done) {
                [AVIToastViewController singleton].isShowing = NO;
                [[AVIToastViewController singleton].AVToastLabel removeFromSuperview];
                [[AVIToastViewController singleton].backGroundView removeFromSuperview];
                switchToMainThreadForDelegate
            }];
        }];
    } else {
        //do not show
    }
}

+(void)setSlideFromTopAnimationForToastForView {
    if ([AVIToastViewController singleton].isShowing == NO) {
        
        [AVIToastViewController singleton].isShowing = YES;
        
        [AVIToastViewController singleton].AVToastLabel.alpha = 0.0f;
        [AVIToastViewController singleton].backGroundView.alpha = 0.0f;
        
        CGRect oriFrameBack = [AVIToastViewController singleton].backGroundView.frame;
        CGRect oriFrameLbl = [AVIToastViewController singleton].AVToastLabel.frame;
        
        [AVIToastViewController singleton].backGroundView.frame = CGRectMake(oriFrameBack.origin.x,oriFrameBack.origin.y-20, oriFrameBack.size.width, oriFrameBack.size.height);
        [AVIToastViewController singleton].AVToastLabel.frame = CGRectMake(oriFrameLbl.origin.x, oriFrameLbl.origin.y-20, oriFrameLbl.size.width, oriFrameLbl.size.height);
        
        [UIView animateWithDuration:kDefaultAnimationDuration animations:^{
            [AVIToastViewController singleton].AVToastLabel.alpha = 1.0f;
            [AVIToastViewController singleton].backGroundView.alpha = [AVIToastViewController singleton].AVToastAlpha;
            
            [AVIToastViewController singleton].backGroundView.frame = oriFrameBack;
            [AVIToastViewController singleton].AVToastLabel.frame = oriFrameLbl;
            
        }completion:^(BOOL done) {
            [UIView animateWithDuration:kDefaultAnimationDuration-0.1 delay:[AVIToastViewController getAVToastDurationValue] options:UIViewAnimationOptionCurveLinear animations:^{
                [AVIToastViewController singleton].AVToastLabel.alpha = 0.0f;
                [AVIToastViewController singleton].backGroundView.alpha = 0.0f;
                
                [AVIToastViewController singleton].backGroundView.frame = CGRectMake(oriFrameBack.origin.x, oriFrameBack.origin.y-20, oriFrameBack.size.width, oriFrameBack.size.height);
                [AVIToastViewController singleton].AVToastLabel.frame = CGRectMake(oriFrameLbl.origin.x, oriFrameLbl.origin.y-20, oriFrameLbl.size.width, oriFrameLbl.size.height);
                
            }completion:^(BOOL done) {
                [AVIToastViewController singleton].isShowing = NO;
                [[AVIToastViewController singleton].AVToastLabel removeFromSuperview];
                [[AVIToastViewController singleton].backGroundView removeFromSuperview];
                switchToMainThreadForDelegate
            }];
        }];
        
    } else {
        //do not show
    }
}

+(void)setPopUpAnimationForToastView {
    if ([AVIToastViewController singleton].isShowing == NO) {
        
        [AVIToastViewController singleton].isShowing = YES;
        
        [AVIToastViewController singleton].AVToastLabel.alpha = 0.0f;
        [AVIToastViewController singleton].backGroundView.alpha = 0.0f;
    
        [AVIToastViewController singleton].AVToastLabel.layer.transform = CATransform3DMakeScale(0.1,0.1,0.1);
        [AVIToastViewController singleton].backGroundView.layer.transform = CATransform3DMakeScale(0.1,0.1,0.1);
    
        [UIView animateWithDuration:kDefaultAnimationDuration animations:^{
            [AVIToastViewController singleton].AVToastLabel.layer.transform = CATransform3DMakeScale(1,1,1);
            [AVIToastViewController singleton].backGroundView.layer.transform = CATransform3DMakeScale(1,1,1);
            [AVIToastViewController singleton].AVToastLabel.alpha = 1.0f;
            [AVIToastViewController singleton].backGroundView.alpha = [AVIToastViewController singleton].AVToastAlpha;
        }completion:^(BOOL done) {
            [UIView animateWithDuration:kDefaultAnimationDuration-0.1 delay:[AVIToastViewController getAVToastDurationValue] options:UIViewAnimationOptionCurveEaseIn animations:^{
                [AVIToastViewController singleton].AVToastLabel.alpha = 0.0f;
                [AVIToastViewController singleton].backGroundView.alpha = 0.0f;
                [AVIToastViewController singleton].AVToastLabel.layer.transform = CATransform3DMakeScale(0.1,0.1,0.1);
                [AVIToastViewController singleton].backGroundView.layer.transform = CATransform3DMakeScale(0.1,0.1,0.1);
            }completion:^(BOOL fin) {
                [AVIToastViewController singleton].isShowing = NO;
                [[AVIToastViewController singleton].AVToastLabel removeFromSuperview];
                [[AVIToastViewController singleton].backGroundView removeFromSuperview];
                switchToMainThreadForDelegate
            }];
        }];
    } else {
        //do not show
    }
}

+(void)setReversePopUpAnimationForToastView {
    if ([AVIToastViewController singleton].isShowing == NO) {
        
        [AVIToastViewController singleton].isShowing = YES;
        
        [AVIToastViewController singleton].AVToastLabel.alpha = 0.0f;
        [AVIToastViewController singleton].backGroundView.alpha = 0.0f;
        
        [AVIToastViewController singleton].AVToastLabel.layer.transform = CATransform3DMakeScale(2,2,2);
        [AVIToastViewController singleton].backGroundView.layer.transform = CATransform3DMakeScale(2,2,2);
        
        [UIView animateWithDuration:kDefaultAnimationDuration animations:^{
            [AVIToastViewController singleton].AVToastLabel.layer.transform = CATransform3DMakeScale(1,1,1);
            [AVIToastViewController singleton].backGroundView.layer.transform = CATransform3DMakeScale(1,1,1);
            [AVIToastViewController singleton].AVToastLabel.alpha = 1.0f;
            [AVIToastViewController singleton].backGroundView.alpha = [AVIToastViewController singleton].AVToastAlpha;
        }completion:^(BOOL done) {
            [UIView animateWithDuration:kDefaultAnimationDuration-0.1 delay:[AVIToastViewController getAVToastDurationValue] options:UIViewAnimationOptionCurveEaseIn animations:^{
                [AVIToastViewController singleton].AVToastLabel.alpha = 0.0f;
                [AVIToastViewController singleton].backGroundView.alpha = 0.0f;
                [AVIToastViewController singleton].AVToastLabel.layer.transform = CATransform3DMakeScale(2,2,2);
                [AVIToastViewController singleton].backGroundView.layer.transform = CATransform3DMakeScale(2,2,2);
            }completion:^(BOOL fin) {
                [AVIToastViewController singleton].isShowing = NO;
                [[AVIToastViewController singleton].AVToastLabel removeFromSuperview];
                [[AVIToastViewController singleton].backGroundView removeFromSuperview];
                switchToMainThreadForDelegate
            }];
        }];
    } else {
        //do not show
    }
}

+(void)setThroughPopUpAnimationForToastView {
    if ([AVIToastViewController singleton].isShowing == NO) {
        
        [AVIToastViewController singleton].isShowing = YES;
        
        [AVIToastViewController singleton].AVToastLabel.alpha = 0.0f;
        [AVIToastViewController singleton].backGroundView.alpha = 0.0f;
        
        [AVIToastViewController singleton].AVToastLabel.layer.transform = CATransform3DMakeScale(0.1,0.1,0.1);
        [AVIToastViewController singleton].backGroundView.layer.transform = CATransform3DMakeScale(0.1,0.1,0.1);
        
        [UIView animateWithDuration:kDefaultAnimationDuration animations:^{
            [AVIToastViewController singleton].AVToastLabel.layer.transform = CATransform3DMakeScale(1,1,1);
            [AVIToastViewController singleton].backGroundView.layer.transform = CATransform3DMakeScale(1,1,1);
            [AVIToastViewController singleton].AVToastLabel.alpha = 1.0f;
            [AVIToastViewController singleton].backGroundView.alpha = [AVIToastViewController singleton].AVToastAlpha;
        }completion:^(BOOL done) {
            [UIView animateWithDuration:kDefaultAnimationDuration-0.1 delay:[AVIToastViewController getAVToastDurationValue] options:UIViewAnimationOptionCurveEaseIn animations:^{
                [AVIToastViewController singleton].AVToastLabel.alpha = 0.0f;
                [AVIToastViewController singleton].backGroundView.alpha = 0.0f;
                [AVIToastViewController singleton].AVToastLabel.layer.transform = CATransform3DMakeScale(2,2,2);
                [AVIToastViewController singleton].backGroundView.layer.transform = CATransform3DMakeScale(2,2,2);
            }completion:^(BOOL fin) {
                [AVIToastViewController singleton].isShowing = NO;
                [[AVIToastViewController singleton].AVToastLabel removeFromSuperview];
                [[AVIToastViewController singleton].backGroundView removeFromSuperview];
                switchToMainThreadForDelegate
            }];
        }];
    } else {
        //do not show
    }
}

#pragma mark - Get AVToastDuration
+(CGFloat)getAVToastDurationValue {
    if ([AVIToastViewController singleton].AVToastDuration == 0.0f) {
        [AVIToastViewController singleton].AVToastDuration = kDefaultToastDuration;
    }
    return [AVIToastViewController singleton].AVToastDuration;
}

#pragma mark - Define Interface Variables
+(void)initializeWithLabelWithLabelColor:(UIColor *_Nullable)labelColor withBackGroundColor:(UIColor *_Nullable)backColor withFontSize:(CGFloat)fontSize withToastAlpha:(CGFloat)alpha {
    
    if (labelColor == nil) {
        if ([AVIToastViewController singleton].AVToastLabelColor != nil) {
        } else {
            [AVIToastViewController singleton].AVToastLabelColor = kAVDefaultFontColor;
        }
    } else {
         [AVIToastViewController singleton].AVToastLabelColor = labelColor;
    }
    
    if (backColor == nil) {
        if ([AVIToastViewController singleton].AVToastBackgroundColor != nil) {
        } else {
            [AVIToastViewController singleton].AVToastBackgroundColor = kAVDefaultBackGroundColor;
        }
    } else {
         [AVIToastViewController singleton].AVToastBackgroundColor = backColor;
    }
    
    if (!fontSize) {
        [AVIToastViewController singleton].AVToastFontSize = kAVDefaultFontSizeForLabel;
    } else {
        [AVIToastViewController singleton].AVToastFontSize = fontSize;
    }
    
    if (!alpha) {
        [AVIToastViewController singleton].AVToastAlpha = kAVDefaultToastAlpha;
    } else {
        [AVIToastViewController singleton].AVToastAlpha = alpha;
    }
 
}

#pragma mark - Make Toast
+(void)makeToastAndPlaceOnView:(UIView *)view withFrame:(CGRect)frame andText:(NSString *)text{

    UILabel *AVToastLabel = [[UILabel alloc]initWithFrame:frame];
    AVToastLabel.textColor = [AVIToastViewController singleton].AVToastLabelColor;
    AVToastLabel.font = [UIFont systemFontOfSize:[AVIToastViewController singleton].AVToastFontSize];
    AVToastLabel.numberOfLines = 0;
    AVToastLabel.alpha = 0.0f;
    AVToastLabel.textAlignment = NSTextAlignmentCenter;
    AVToastLabel.text = text;
    [AVToastLabel sizeToFit];
    AVToastLabel.lineBreakMode = NSLineBreakByWordWrapping;
        
    [AVIToastViewController singleton].AVToastLabel = AVToastLabel;
    
    UIView *backgroundView = [[UIView alloc]init];
    backgroundView.frame = CGRectMake(AVToastLabel.frame.origin.x-10, AVToastLabel.frame.origin.y-10, AVToastLabel.frame.size.width+20, AVToastLabel.frame.size.height+20);
    backgroundView.backgroundColor = [AVIToastViewController singleton].AVToastBackgroundColor;
    backgroundView.layer.cornerRadius = 15;
    backgroundView.alpha = 0.0f;
    backgroundView.layer.shadowColor = [UIColor blackColor].CGColor;
    backgroundView.layer.shadowRadius = 5;
    backgroundView.layer.shadowOpacity = 0.3f;
    backgroundView.layer.shadowOffset = CGSizeMake(-5, 5);
    
    [AVIToastViewController singleton].backGroundView = backgroundView;
        
    [view addSubview:[AVIToastViewController singleton].backGroundView];
    [view addSubview:[AVIToastViewController singleton].AVToastLabel];

}

#pragma mark - User Methods
+(void)showAVToastOnView:(UIView *_Nonnull)view withString:(NSString *_Nonnull)text forDuration:(AVToastDurationStatus)duration withFontSize:(CGFloat)fontSize withAVToastPosition:(AVToastLocationStatus)toastLocation withAVToastAnimation:(AVToastAnimationStatus)toastAnimation withAlpha:(CGFloat)toastAlpha withAVBackGroundColor:( UIColor * _Nullable )backColor withAVFontColor:(UIColor * _Nullable)fontColor {
    
    //prepare interface variables
    [AVIToastViewController initializeWithLabelWithLabelColor:fontColor withBackGroundColor:backColor withFontSize:fontSize withToastAlpha:toastAlpha];
    
    CGSize labelSize = [AVIToastViewController prepareLabelForAVToastWithString:text withFontSize: [AVIToastViewController singleton].AVToastFontSize];
    
    //create label frame
    CGRect frame = CGRectZero;
    if (!toastLocation) {
         frame = [AVIToastViewController setFrameForAVToastLocationScreenBottomforLabelSize:labelSize];
    } else {
        switch (toastLocation) {
            case AVToastLocationScreenTop:
                frame = [AVIToastViewController setFrameForAVToastLocationScreenTopforLabelSize:labelSize];
                break;
            case AVToastLocationScreenCenter:
                frame = [AVIToastViewController setFrameForAVToastLocationScreenCenterforLabelSize:labelSize];
                break;
            default: //AVToastLocationScreenBottom , default
                frame = [AVIToastViewController setFrameForAVToastLocationScreenBottomforLabelSize:labelSize];
                break;
        }
    }
    
    //make toast
    if ([AVIToastViewController singleton].isShowing == YES) {
        
    } else {
        [AVIToastViewController makeToastAndPlaceOnView:view withFrame:frame andText:text];
    }
    
    //switch duration
    switch (duration) {
        case AVToastDurationLong:
            [AVIToastViewController singleton].AVToastDuration = 4.5f;
            break;
        case AVToastDurationShort:
            [AVIToastViewController singleton].AVToastDuration = 1.2f;
            break;
        default:
            [AVIToastViewController singleton].AVToastDuration = kDefaultToastDuration;
            break;
    }
    
    //decide toast animation
    if (!toastAnimation) {
        [AVIToastViewController setFadeAnimationForToastForView];
    } else {
        switch (toastAnimation) {
            case AVToastAnimationSimpleAppear:
                [AVIToastViewController setAppearAnimationForToastForView];
                break;
            case AVToastAnimationSlideFromTop:
                [AVIToastViewController setSlideFromTopAnimationForToastForView];
                break;
            case AVToastAnimationSlideFromDown:
                [AVIToastViewController setSlideFromBottomAnimationForToastForView];
                break;
            case AVToastAnimationSlideFromLeft:
                [AVIToastViewController setSlideFromLeftAnimationForToastForView];
                break;
            case AVToastAnimationSlideFromRight:
                [AVIToastViewController setSlideFromRightAnimationForToastForView];
                break;
            case AVToastAnimationThrough:
                [AVIToastViewController setThroughAnimationForToastForView];
                break;
            case AVToastAnimationPopUpAppear:
                [AVIToastViewController setPopUpAnimationForToastView];
                break;
            case AVToastAnimationReversePopUpAppear:
                [AVIToastViewController setReversePopUpAnimationForToastView];
                break;
            case AVToastAnimationThroughPopUpAnimation:
                [AVIToastViewController setThroughPopUpAnimationForToastView];
                break;
            default: //AVToastAnimationFade , default
                [AVIToastViewController setFadeAnimationForToastForView];
                break;
        }
    }
}

//simple toast with default values
+(void)showToastOnView:(UIView * _Nonnull)view withString:(NSString * _Nonnull)text {
    [AVIToastViewController initializeWithLabelWithLabelColor:kAVDefaultFontColor withBackGroundColor:kAVDefaultBackGroundColor withFontSize:kAVDefaultFontSizeForLabel withToastAlpha:kAVDefaultToastAlpha];
 
    CGSize labelSize = [AVIToastViewController prepareLabelForAVToastWithString:text withFontSize: [AVIToastViewController singleton].AVToastFontSize];
    
    //create label frame
    CGRect frame = CGRectZero;
    frame = [AVIToastViewController setFrameForAVToastLocationScreenBottomforLabelSize:labelSize];
    
    //make toast
    if ([AVIToastViewController singleton].isShowing == YES) {
        
    } else {
        [AVIToastViewController makeToastAndPlaceOnView:view withFrame:frame andText:text];
    }
    [AVIToastViewController setFadeAnimationForToastForView];
}

//simple toast with alpha
+(void)showToastOnView:(UIView *_Nonnull)view withString:(NSString *_Nonnull)text withAlpha:(CGFloat)toastAlpha forDuration:(AVToastDurationStatus)duration {
    [AVIToastViewController initializeWithLabelWithLabelColor:nil withBackGroundColor:nil withFontSize:kAVDefaultFontSizeForLabel withToastAlpha:toastAlpha];
    
    CGSize labelSize = [AVIToastViewController prepareLabelForAVToastWithString:text withFontSize: [AVIToastViewController singleton].AVToastFontSize];
    
    //create label frame
    CGRect frame = CGRectZero;
    frame = [AVIToastViewController setFrameForAVToastLocationScreenBottomforLabelSize:labelSize];
    
    //switch duration
    switch (duration) {
        case AVToastDurationLong:
            [AVIToastViewController singleton].AVToastDuration = 4.5f;
            break;
        case AVToastDurationShort:
            [AVIToastViewController singleton].AVToastDuration = 1.2f;
            break;
        default:
            [AVIToastViewController singleton].AVToastDuration = kDefaultToastDuration;
            break;
    }
    
    //make toast
    if ([AVIToastViewController singleton].isShowing == YES) {
        
    } else {
        [AVIToastViewController makeToastAndPlaceOnView:view withFrame:frame andText:text];
    }
    [AVIToastViewController setFadeAnimationForToastForView];
}

//toast with label size custom
+(void)showToastOnView:(UIView *_Nonnull)view withString:(NSString *_Nonnull)text withFontSize:(CGFloat)fontSize forDuration:(AVToastDurationStatus)duration {
    [AVIToastViewController initializeWithLabelWithLabelColor:nil withBackGroundColor:nil withFontSize:fontSize withToastAlpha:kAVDefaultToastAlpha];
    
    CGSize labelSize = [AVIToastViewController prepareLabelForAVToastWithString:text withFontSize: [AVIToastViewController singleton].AVToastFontSize];
    
    //create label frame
    CGRect frame = CGRectZero;
    frame = [AVIToastViewController setFrameForAVToastLocationScreenBottomforLabelSize:labelSize];
    
    //switch duration
    switch (duration) {
        case AVToastDurationLong:
            [AVIToastViewController singleton].AVToastDuration = 4.5f;
            break;
        case AVToastDurationShort:
            [AVIToastViewController singleton].AVToastDuration = 1.2f;
            break;
        default:
            [AVIToastViewController singleton].AVToastDuration = kDefaultToastDuration;
            break;
    }
    
    //make toast
    if ([AVIToastViewController singleton].isShowing == YES) {
        
    } else {
        [AVIToastViewController makeToastAndPlaceOnView:view withFrame:frame andText:text];
    }
    [AVIToastViewController setFadeAnimationForToastForView];
}

//toast with location status
+(void)showAVToastOnView:(UIView *_Nonnull)view withString:(NSString *_Nonnull)text withFontSize:(CGFloat)fontSize withAVToastPosition:(AVToastLocationStatus)toastLocation forDuration:(AVToastDurationStatus)duration {
    
    [AVIToastViewController initializeWithLabelWithLabelColor:nil withBackGroundColor:nil withFontSize:kAVDefaultFontSizeForLabel withToastAlpha:kAVDefaultToastAlpha];
    
    CGSize labelSize = [AVIToastViewController prepareLabelForAVToastWithString:text withFontSize: [AVIToastViewController singleton].AVToastFontSize];
    
    //create label frame
    CGRect frame = CGRectZero;
    if (!toastLocation) {
        frame = [AVIToastViewController setFrameForAVToastLocationScreenBottomforLabelSize:labelSize];
    } else {
        switch (toastLocation) {
            case AVToastLocationScreenTop:
                frame = [AVIToastViewController setFrameForAVToastLocationScreenTopforLabelSize:labelSize];
                break;
            case AVToastLocationScreenCenter:
                frame = [AVIToastViewController setFrameForAVToastLocationScreenCenterforLabelSize:labelSize];
                break;
            default: //AVToastLocationScreenBottom , default
                frame = [AVIToastViewController setFrameForAVToastLocationScreenBottomforLabelSize:labelSize];
                break;
        }
    }
    //switch duration
    switch (duration) {
        case AVToastDurationLong:
            [AVIToastViewController singleton].AVToastDuration = 4.5f;
            break;
        case AVToastDurationShort:
            [AVIToastViewController singleton].AVToastDuration = 1.2f;
            break;
        default:
            [AVIToastViewController singleton].AVToastDuration = kDefaultToastDuration;
            break;
    }

    //make toast
    if ([AVIToastViewController singleton].isShowing == YES) {
        
    } else {
        [AVIToastViewController makeToastAndPlaceOnView:view withFrame:frame andText:text];
    }
    [AVIToastViewController setFadeAnimationForToastForView];
    
}

//toast with animation status
+(void)showAVToastOnView:(UIView *_Nonnull)view withString:(NSString *_Nonnull)text withFontSize:(CGFloat)fontSize withAVToastAnimation:(AVToastAnimationStatus)toastAnimation forDuration:(AVToastDurationStatus)duration {
    
    [AVIToastViewController initializeWithLabelWithLabelColor:nil withBackGroundColor:nil withFontSize:fontSize withToastAlpha:kAVDefaultToastAlpha];
    
    CGSize labelSize = [AVIToastViewController prepareLabelForAVToastWithString:text withFontSize: [AVIToastViewController singleton].AVToastFontSize];
    
    //create label frame
    CGRect frame = CGRectZero;
    frame = [AVIToastViewController setFrameForAVToastLocationScreenBottomforLabelSize:labelSize];
    
    //switch duration
    switch (duration) {
        case AVToastDurationLong:
            [AVIToastViewController singleton].AVToastDuration = 4.5f;
            break;
        case AVToastDurationShort:
            [AVIToastViewController singleton].AVToastDuration = 1.2f;
            break;
        default:
            [AVIToastViewController singleton].AVToastDuration = kDefaultToastDuration;
            break;
    }

    //make toast
    if ([AVIToastViewController singleton].isShowing == YES) {
        
    } else {
        [AVIToastViewController makeToastAndPlaceOnView:view withFrame:frame andText:text];
    }
    //decide toast animation
    if (!toastAnimation) {
        [AVIToastViewController setFadeAnimationForToastForView];
    } else {
        switch (toastAnimation) {
            case AVToastAnimationSimpleAppear:
                [AVIToastViewController setAppearAnimationForToastForView];
                break;
            case AVToastAnimationSlideFromTop:
                [AVIToastViewController setSlideFromTopAnimationForToastForView];
                break;
            case AVToastAnimationSlideFromDown:
                [AVIToastViewController setSlideFromBottomAnimationForToastForView];
                break;
            case AVToastAnimationSlideFromLeft:
                [AVIToastViewController setSlideFromLeftAnimationForToastForView];
                break;
            case AVToastAnimationSlideFromRight:
                [AVIToastViewController setSlideFromRightAnimationForToastForView];
                break;
            case AVToastAnimationThrough:
                [AVIToastViewController setThroughAnimationForToastForView];
                break;
            case AVToastAnimationPopUpAppear:
                [AVIToastViewController setPopUpAnimationForToastView];
                break;
            case AVToastAnimationReversePopUpAppear:
                [AVIToastViewController setReversePopUpAnimationForToastView];
                break;
            case AVToastAnimationThroughPopUpAnimation:
                [AVIToastViewController setThroughPopUpAnimationForToastView];
                break;
            default: //AVToastAnimationFade , default
                [AVIToastViewController setFadeAnimationForToastForView];
                break;
        }
    }
}

+(void)showAVToastOnView:(UIView *_Nonnull)view withString:(NSString *_Nonnull)text withAVToastPosition:(AVToastLocationStatus)toastLocation withAVToastAnimation:(AVToastAnimationStatus)toastAnimation forDuration:(AVToastDurationStatus)duration{
    
    [AVIToastViewController initializeWithLabelWithLabelColor:nil withBackGroundColor:nil withFontSize:kAVDefaultFontSizeForLabel withToastAlpha:kAVDefaultToastAlpha];
    
    CGSize labelSize = [AVIToastViewController prepareLabelForAVToastWithString:text withFontSize: [AVIToastViewController singleton].AVToastFontSize];
    
    //create label frame
    CGRect frame = CGRectZero;
    if (!toastLocation) {
        frame = [AVIToastViewController setFrameForAVToastLocationScreenBottomforLabelSize:labelSize];
    } else {
        switch (toastLocation) {
            case AVToastLocationScreenTop:
                frame = [AVIToastViewController setFrameForAVToastLocationScreenTopforLabelSize:labelSize];
                break;
            case AVToastLocationScreenCenter:
                frame = [AVIToastViewController setFrameForAVToastLocationScreenCenterforLabelSize:labelSize];
                break;
            default: //AVToastLocationScreenBottom , default
                frame = [AVIToastViewController setFrameForAVToastLocationScreenBottomforLabelSize:labelSize];
                break;
        }
    }
    
    //switch duration
    switch (duration) {
        case AVToastDurationLong:
            [AVIToastViewController singleton].AVToastDuration = 4.5f;
            break;
        case AVToastDurationShort:
            [AVIToastViewController singleton].AVToastDuration = 1.2f;
            break;
        default:
            [AVIToastViewController singleton].AVToastDuration = kDefaultToastDuration;
            break;
    }

    //make toast
    if ([AVIToastViewController singleton].isShowing == YES) {
        
    } else {
        [AVIToastViewController makeToastAndPlaceOnView:view withFrame:frame andText:text];
    }
    //decide toast animation
    if (!toastAnimation) {
        [AVIToastViewController setFadeAnimationForToastForView];
    } else {
        switch (toastAnimation) {
            case AVToastAnimationSimpleAppear:
                [AVIToastViewController setAppearAnimationForToastForView];
                break;
            case AVToastAnimationSlideFromTop:
                [AVIToastViewController setSlideFromTopAnimationForToastForView];
                break;
            case AVToastAnimationSlideFromDown:
                [AVIToastViewController setSlideFromBottomAnimationForToastForView];
                break;
            case AVToastAnimationSlideFromLeft:
                [AVIToastViewController setSlideFromLeftAnimationForToastForView];
                break;
            case AVToastAnimationSlideFromRight:
                [AVIToastViewController setSlideFromRightAnimationForToastForView];
                break;
            case AVToastAnimationThrough:
                [AVIToastViewController setThroughAnimationForToastForView];
                break;
            case AVToastAnimationPopUpAppear:
                [AVIToastViewController setPopUpAnimationForToastView];
                break;
            case AVToastAnimationReversePopUpAppear:
                [AVIToastViewController setReversePopUpAnimationForToastView];
                break;
            case AVToastAnimationThroughPopUpAnimation:
                [AVIToastViewController setThroughPopUpAnimationForToastView];
                break;
            default: //AVToastAnimationFade , default
                [AVIToastViewController setFadeAnimationForToastForView];
                break;
        }
    }
}

//toast with fore and back ground colors
+(void)showToastOnView:(UIView *_Nonnull)view withString:(NSString *_Nonnull)text withBackgroundColor:(UIColor *_Nonnull)backColor withFontColor:(UIColor *_Nonnull)fontColor forDuration:(AVToastDurationStatus)duration {
    
    [AVIToastViewController initializeWithLabelWithLabelColor:fontColor withBackGroundColor:backColor withFontSize:kAVDefaultFontSizeForLabel withToastAlpha:kAVDefaultToastAlpha];
    
    CGSize labelSize = [AVIToastViewController prepareLabelForAVToastWithString:text withFontSize: [AVIToastViewController singleton].AVToastFontSize];
    
    //create label frame
    CGRect frame = CGRectZero;
    frame = [AVIToastViewController setFrameForAVToastLocationScreenBottomforLabelSize:labelSize];
    
    //switch duration
    switch (duration) {
        case AVToastDurationLong:
            [AVIToastViewController singleton].AVToastDuration = 4.5f;
            break;
        case AVToastDurationShort:
            [AVIToastViewController singleton].AVToastDuration = 1.2f;
            break;
        default:
            [AVIToastViewController singleton].AVToastDuration = kDefaultToastDuration;
            break;
    }
    
    //make toast
    if ([AVIToastViewController singleton].isShowing == YES) {
        
    } else {
        [AVIToastViewController makeToastAndPlaceOnView:view withFrame:frame andText:text];
    }
    [AVIToastViewController setFadeAnimationForToastForView];

}

+(void)showToastOnView:(UIView *_Nonnull)view withString:(NSString *_Nonnull)text withBackgroundColor:(UIColor *_Nonnull)backColor withFontColor:(UIColor *_Nonnull)fontColor withAVToastPosition:(AVToastLocationStatus)toastLocation withAVToastAnimation:(AVToastAnimationStatus)toastAnimation forDuration:(AVToastDurationStatus)duration {
    
    [AVIToastViewController initializeWithLabelWithLabelColor:fontColor withBackGroundColor:backColor withFontSize:kAVDefaultFontSizeForLabel withToastAlpha:kAVDefaultToastAlpha];
    
    CGSize labelSize = [AVIToastViewController prepareLabelForAVToastWithString:text withFontSize: [AVIToastViewController singleton].AVToastFontSize];
    
    //create label frame
    CGRect frame = CGRectZero;
    if (!toastLocation) {
        frame = [AVIToastViewController setFrameForAVToastLocationScreenBottomforLabelSize:labelSize];
    } else {
        switch (toastLocation) {
            case AVToastLocationScreenTop:
                frame = [AVIToastViewController setFrameForAVToastLocationScreenTopforLabelSize:labelSize];
                break;
            case AVToastLocationScreenCenter:
                frame = [AVIToastViewController setFrameForAVToastLocationScreenCenterforLabelSize:labelSize];
                break;
            default: //AVToastLocationScreenBottom , default
                frame = [AVIToastViewController setFrameForAVToastLocationScreenBottomforLabelSize:labelSize];
                break;
        }
    }
    
    //switch duration
    switch (duration) {
        case AVToastDurationLong:
            [AVIToastViewController singleton].AVToastDuration = 4.5f;
            break;
        case AVToastDurationShort:
            [AVIToastViewController singleton].AVToastDuration = 1.2f;
            break;
        default:
            [AVIToastViewController singleton].AVToastDuration = kDefaultToastDuration;
            break;
    }
    
    //make toast
    if ([AVIToastViewController singleton].isShowing == YES) {
        
    } else {
        [AVIToastViewController makeToastAndPlaceOnView:view withFrame:frame andText:text];
    }
    //decide toast animation
    if (!toastAnimation) {
        [AVIToastViewController setFadeAnimationForToastForView];
    } else {
        switch (toastAnimation) {
            case AVToastAnimationSimpleAppear:
                [AVIToastViewController setAppearAnimationForToastForView];
                break;
            case AVToastAnimationSlideFromTop:
                [AVIToastViewController setSlideFromTopAnimationForToastForView];
                break;
            case AVToastAnimationSlideFromDown:
                [AVIToastViewController setSlideFromBottomAnimationForToastForView];
                break;
            case AVToastAnimationSlideFromLeft:
                [AVIToastViewController setSlideFromLeftAnimationForToastForView];
                break;
            case AVToastAnimationSlideFromRight:
                [AVIToastViewController setSlideFromRightAnimationForToastForView];
                break;
            case AVToastAnimationThrough:
                [AVIToastViewController setThroughAnimationForToastForView];
                break;
            case AVToastAnimationPopUpAppear:
                [AVIToastViewController setPopUpAnimationForToastView];
                break;
            case AVToastAnimationReversePopUpAppear:
                [AVIToastViewController setReversePopUpAnimationForToastView];
                break;
            case AVToastAnimationThroughPopUpAnimation:
                [AVIToastViewController setThroughPopUpAnimationForToastView];
                break;
            default: //AVToastAnimationFade , default
                [AVIToastViewController setFadeAnimationForToastForView];
                break;
        }
    }
}

+(void)showToastOnView:(UIView * _Nonnull)view withString:(NSString * _Nonnull)text forDuration:(AVToastDurationStatus)duration {
    [AVIToastViewController initializeWithLabelWithLabelColor:kAVDefaultFontColor withBackGroundColor:kAVDefaultBackGroundColor withFontSize:kAVDefaultFontSizeForLabel withToastAlpha:kAVDefaultToastAlpha];
    
    CGSize labelSize = [AVIToastViewController prepareLabelForAVToastWithString:text withFontSize: [AVIToastViewController singleton].AVToastFontSize];
    
    //create label frame
    CGRect frame = CGRectZero;
    frame = [AVIToastViewController setFrameForAVToastLocationScreenBottomforLabelSize:labelSize];
    
    //switch duration
    switch (duration) {
        case AVToastDurationLong:
            [AVIToastViewController singleton].AVToastDuration = 3.5f;
            break;
        case AVToastDurationShort:
            [AVIToastViewController singleton].AVToastDuration = 0.4f;
            break;
        default:
            [AVIToastViewController singleton].AVToastDuration = kDefaultToastDuration;
            break;
    }
    
    //make toast
    if ([AVIToastViewController singleton].isShowing == YES) {
        
    } else {
        [AVIToastViewController makeToastAndPlaceOnView:view withFrame:frame andText:text];
    }
    [AVIToastViewController setFadeAnimationForToastForView];
}
@end
