//
//  ShowAVIToastViewController.m
//  AVIToastExampleApp
//
//  Created by Avinash Kumar Gautam on 02/01/17.
//  Copyright © 2017 Avinash Kumar Gautam. All rights reserved.
//

#import "ShowAVIToastViewController.h"
#define sampleString @"This is a Sample Toast String"

@interface ShowAVIToastViewController () <UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic)NSInteger location; //top=1,center=2,bottom=3
@property (nonatomic)NSInteger animation; //1=1,2=2, etc

@end

@implementation ShowAVIToastViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //data
    _locationPickerData = @[@"Screen Bottom",@"Screen Center",@"Screen Top"];
    _animationPickerData = @[@"FadeAnimation",@"SlideLeftAnimation",@"SlideRightAnimation",@"SimpleAppearAnimation",@"SlideDown",@"SlideTop",@"SlideThroughAnimation",@"PopUpAnimation",@"ReversePopUpAnimation",@"PopUpThroughAnimation"];
    
    //delegates
    _durationPickerView.delegate = self;
    _durationPickerView.dataSource = self;
    
    if (_rowNumber == 1) {
        _durationPickerView.hidden = NO;
    }
}
- (IBAction)showToat:(id)sender {
    if (_rowNumber == 0) {
        [AVIToastViewController showToastOnView:self.view withString:sampleString];
    } else if (_rowNumber == 1) {
        switch (_animation) {
            case 1:
                if (_location == 1) {
                    [AVIToastViewController showAVToastOnView:self.view withString:sampleString forDuration:AVToastDurationNormal withFontSize:11 withAVToastPosition:AVToastLocationScreenTop withAVToastAnimation:AVToastAnimationFade withAlpha:0.8 withAVBackGroundColor:[UIColor blackColor] withAVFontColor:[UIColor whiteColor]];
                } else if (_location == 2) {
                    [AVIToastViewController showAVToastOnView:self.view withString:sampleString forDuration:AVToastDurationNormal withFontSize:11 withAVToastPosition:AVToastLocationScreenCenter withAVToastAnimation:AVToastAnimationFade withAlpha:0.8 withAVBackGroundColor:[UIColor blackColor] withAVFontColor:[UIColor whiteColor]];
                } else {
                    [AVIToastViewController showAVToastOnView:self.view withString:sampleString forDuration:AVToastDurationNormal withFontSize:11 withAVToastPosition:AVToastLocationScreenBottom withAVToastAnimation:AVToastAnimationFade withAlpha:0.8 withAVBackGroundColor:[UIColor blackColor] withAVFontColor:[UIColor whiteColor]];
                }
                break;
            case 2:
                if (_location == 1) {
                    [AVIToastViewController showAVToastOnView:self.view withString:sampleString forDuration:AVToastDurationNormal withFontSize:11 withAVToastPosition:AVToastLocationScreenTop withAVToastAnimation:AVToastAnimationSlideFromLeft withAlpha:0.8 withAVBackGroundColor:[UIColor blackColor] withAVFontColor:[UIColor whiteColor]];
                } else if (_location == 2) {
                    [AVIToastViewController showAVToastOnView:self.view withString:sampleString forDuration:AVToastDurationNormal withFontSize:11 withAVToastPosition:AVToastLocationScreenCenter withAVToastAnimation:AVToastAnimationSlideFromLeft withAlpha:0.8 withAVBackGroundColor:[UIColor blackColor] withAVFontColor:[UIColor whiteColor]];
                } else {
                    [AVIToastViewController showAVToastOnView:self.view withString:sampleString forDuration:AVToastDurationNormal withFontSize:11 withAVToastPosition:AVToastLocationScreenBottom withAVToastAnimation:AVToastAnimationSlideFromLeft withAlpha:0.8 withAVBackGroundColor:[UIColor blackColor] withAVFontColor:[UIColor whiteColor]];
                }
                break;
            case 3:
                if (_location == 1) {
                    [AVIToastViewController showAVToastOnView:self.view withString:sampleString forDuration:AVToastDurationNormal withFontSize:11 withAVToastPosition:AVToastLocationScreenTop withAVToastAnimation:AVToastAnimationSlideFromRight withAlpha:0.8 withAVBackGroundColor:[UIColor blackColor] withAVFontColor:[UIColor whiteColor]];
                } else if (_location == 2) {
                    [AVIToastViewController showAVToastOnView:self.view withString:sampleString forDuration:AVToastDurationNormal withFontSize:11 withAVToastPosition:AVToastLocationScreenCenter withAVToastAnimation:AVToastAnimationSlideFromRight withAlpha:0.8 withAVBackGroundColor:[UIColor blackColor] withAVFontColor:[UIColor whiteColor]];
                } else {
                    [AVIToastViewController showAVToastOnView:self.view withString:sampleString forDuration:AVToastDurationNormal withFontSize:11 withAVToastPosition:AVToastLocationScreenBottom withAVToastAnimation:AVToastAnimationSlideFromRight withAlpha:0.8 withAVBackGroundColor:[UIColor blackColor] withAVFontColor:[UIColor whiteColor]];
                }
                break;
            case 4:
                if (_location == 1) {
                    [AVIToastViewController showAVToastOnView:self.view withString:sampleString forDuration:AVToastDurationNormal withFontSize:11 withAVToastPosition:AVToastLocationScreenTop withAVToastAnimation:AVToastAnimationSimpleAppear withAlpha:0.8 withAVBackGroundColor:[UIColor blackColor] withAVFontColor:[UIColor whiteColor]];
                } else if (_location == 2) {
                    [AVIToastViewController showAVToastOnView:self.view withString:sampleString forDuration:AVToastDurationNormal withFontSize:11 withAVToastPosition:AVToastLocationScreenCenter withAVToastAnimation:AVToastAnimationSimpleAppear withAlpha:0.8 withAVBackGroundColor:[UIColor blackColor] withAVFontColor:[UIColor whiteColor]];
                } else {
                    [AVIToastViewController showAVToastOnView:self.view withString:sampleString forDuration:AVToastDurationNormal withFontSize:11 withAVToastPosition:AVToastLocationScreenBottom withAVToastAnimation:AVToastAnimationSimpleAppear withAlpha:0.8 withAVBackGroundColor:[UIColor blackColor] withAVFontColor:[UIColor whiteColor]];
                }
                break;
            case 5:
                if (_location == 1) {
                    [AVIToastViewController showAVToastOnView:self.view withString:sampleString forDuration:AVToastDurationNormal withFontSize:11 withAVToastPosition:AVToastLocationScreenTop withAVToastAnimation:AVToastAnimationSlideFromDown withAlpha:0.8 withAVBackGroundColor:[UIColor blackColor] withAVFontColor:[UIColor whiteColor]];
                } else if (_location == 2) {
                    [AVIToastViewController showAVToastOnView:self.view withString:sampleString forDuration:AVToastDurationNormal withFontSize:11 withAVToastPosition:AVToastLocationScreenCenter withAVToastAnimation:AVToastAnimationSlideFromDown withAlpha:0.8 withAVBackGroundColor:[UIColor blackColor] withAVFontColor:[UIColor whiteColor]];
                } else {
                    [AVIToastViewController showAVToastOnView:self.view withString:sampleString forDuration:AVToastDurationNormal withFontSize:11 withAVToastPosition:AVToastLocationScreenBottom withAVToastAnimation:AVToastAnimationSlideFromDown withAlpha:0.8 withAVBackGroundColor:[UIColor blackColor] withAVFontColor:[UIColor whiteColor]];
                }
                break;
            case 6:
                if (_location == 1) {
                    [AVIToastViewController showAVToastOnView:self.view withString:sampleString forDuration:AVToastDurationNormal withFontSize:11 withAVToastPosition:AVToastLocationScreenTop withAVToastAnimation:AVToastAnimationSlideFromTop withAlpha:0.8 withAVBackGroundColor:[UIColor blackColor] withAVFontColor:[UIColor whiteColor]];
                } else if (_location == 2) {
                    [AVIToastViewController showAVToastOnView:self.view withString:sampleString forDuration:AVToastDurationNormal withFontSize:11 withAVToastPosition:AVToastLocationScreenCenter withAVToastAnimation:AVToastAnimationSlideFromTop withAlpha:0.8 withAVBackGroundColor:[UIColor blackColor] withAVFontColor:[UIColor whiteColor]];
                } else {
                    [AVIToastViewController showAVToastOnView:self.view withString:sampleString forDuration:AVToastDurationNormal withFontSize:11 withAVToastPosition:AVToastLocationScreenBottom withAVToastAnimation:AVToastAnimationSlideFromTop withAlpha:0.8 withAVBackGroundColor:[UIColor blackColor] withAVFontColor:[UIColor whiteColor]];
                }
                break;
            case 7:
                if (_location == 1) {
                    [AVIToastViewController showAVToastOnView:self.view withString:sampleString forDuration:AVToastDurationNormal withFontSize:11 withAVToastPosition:AVToastLocationScreenTop withAVToastAnimation:AVToastAnimationThrough withAlpha:0.8 withAVBackGroundColor:[UIColor blackColor] withAVFontColor:[UIColor whiteColor]];
                } else if (_location == 2) {
                    [AVIToastViewController showAVToastOnView:self.view withString:sampleString forDuration:AVToastDurationNormal withFontSize:11 withAVToastPosition:AVToastLocationScreenCenter withAVToastAnimation:AVToastAnimationThrough withAlpha:0.8 withAVBackGroundColor:[UIColor blackColor] withAVFontColor:[UIColor whiteColor]];
                } else {
                    [AVIToastViewController showAVToastOnView:self.view withString:sampleString forDuration:AVToastDurationNormal withFontSize:11 withAVToastPosition:AVToastLocationScreenBottom withAVToastAnimation:AVToastAnimationThrough withAlpha:0.8 withAVBackGroundColor:[UIColor blackColor] withAVFontColor:[UIColor whiteColor]];
                }
                break;
            case 8:
                if (_location == 1) {
                    [AVIToastViewController showAVToastOnView:self.view withString:sampleString forDuration:AVToastDurationNormal withFontSize:11 withAVToastPosition:AVToastLocationScreenTop withAVToastAnimation:AVToastAnimationPopUpAppear withAlpha:0.8 withAVBackGroundColor:[UIColor blackColor] withAVFontColor:[UIColor whiteColor]];
                } else if (_location == 2) {
                    [AVIToastViewController showAVToastOnView:self.view withString:sampleString forDuration:AVToastDurationNormal withFontSize:11 withAVToastPosition:AVToastLocationScreenCenter withAVToastAnimation:AVToastAnimationPopUpAppear withAlpha:0.8 withAVBackGroundColor:[UIColor blackColor] withAVFontColor:[UIColor whiteColor]];
                } else {
                    [AVIToastViewController showAVToastOnView:self.view withString:sampleString forDuration:AVToastDurationNormal withFontSize:11 withAVToastPosition:AVToastLocationScreenBottom withAVToastAnimation:AVToastAnimationPopUpAppear withAlpha:0.8 withAVBackGroundColor:[UIColor blackColor] withAVFontColor:[UIColor whiteColor]];
                }
                break;
            case 9:
                if (_location == 1) {
                    [AVIToastViewController showAVToastOnView:self.view withString:sampleString forDuration:AVToastDurationNormal withFontSize:11 withAVToastPosition:AVToastLocationScreenTop withAVToastAnimation:AVToastAnimationReversePopUpAppear withAlpha:0.8 withAVBackGroundColor:[UIColor blackColor] withAVFontColor:[UIColor whiteColor]];
                } else if (_location == 2) {
                    [AVIToastViewController showAVToastOnView:self.view withString:sampleString forDuration:AVToastDurationNormal withFontSize:11 withAVToastPosition:AVToastLocationScreenCenter withAVToastAnimation:AVToastAnimationReversePopUpAppear withAlpha:0.8 withAVBackGroundColor:[UIColor blackColor] withAVFontColor:[UIColor whiteColor]];
                } else {
                    [AVIToastViewController showAVToastOnView:self.view withString:sampleString forDuration:AVToastDurationNormal withFontSize:11 withAVToastPosition:AVToastLocationScreenBottom withAVToastAnimation:AVToastAnimationReversePopUpAppear withAlpha:0.8 withAVBackGroundColor:[UIColor blackColor] withAVFontColor:[UIColor whiteColor]];
                }
                break;
            case 10:
                if (_location == 1) {
                    [AVIToastViewController showAVToastOnView:self.view withString:sampleString forDuration:AVToastDurationNormal withFontSize:11 withAVToastPosition:AVToastLocationScreenTop withAVToastAnimation:AVToastAnimationThroughPopUpAnimation withAlpha:0.8 withAVBackGroundColor:[UIColor blackColor] withAVFontColor:[UIColor whiteColor]];
                } else if (_location == 2) {
                     [AVIToastViewController showAVToastOnView:self.view withString:sampleString forDuration:AVToastDurationNormal withFontSize:11 withAVToastPosition:AVToastLocationScreenCenter withAVToastAnimation:AVToastAnimationThroughPopUpAnimation withAlpha:0.8 withAVBackGroundColor:[UIColor blackColor] withAVFontColor:[UIColor whiteColor]];
                } else {
                     [AVIToastViewController showAVToastOnView:self.view withString:sampleString forDuration:AVToastDurationNormal withFontSize:11 withAVToastPosition:AVToastLocationScreenBottom withAVToastAnimation:AVToastAnimationThroughPopUpAnimation withAlpha:0.8 withAVBackGroundColor:[UIColor blackColor] withAVFontColor:[UIColor whiteColor]];
                }
                break;
            default:
                [AVIToastViewController showAVToastOnView:self.view withString:sampleString forDuration:AVToastDurationNormal withFontSize:11 withAVToastPosition:AVToastLocationScreenBottom withAVToastAnimation:AVToastAnimationFade withAlpha:0.8 withAVBackGroundColor:[UIColor blackColor] withAVFontColor:[UIColor whiteColor]];
                break;
        }
    }
}

#pragma mark - UIPickerDelegate
- (void)pickerView:(UIPickerView *)pV didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 1) {
        if ([_animationPickerData[row] isEqualToString:@"FadeAnimation"]) {
            _animation = 1;
        } else if ([_animationPickerData[row] isEqualToString:@"SlideLeftAnimation"]) {
            _animation = 2;
        } else if ([_animationPickerData[row] isEqualToString:@"SlideRightAnimation"]) {
            _animation = 3;
        } else if ([_animationPickerData[row] isEqualToString:@"SimpleAppearAnimation"]) {
            _animation = 4;
        } else if ([_animationPickerData[row] isEqualToString:@"SlideDown"]) {
            _animation = 5;
        } else if ([_animationPickerData[row] isEqualToString:@"SlideTop"]) {
            _animation = 6;
        } else if ([_animationPickerData[row] isEqualToString:@"SlideThroughAnimation"]) {
            _animation = 7;
        } else if ([_animationPickerData[row] isEqualToString:@"PopUpAnimation"]) {
            _animation = 8;
        } else if ([_animationPickerData[row] isEqualToString:@"ReversePopUpAnimation"]) {
            _animation = 9;
        } else if ([_animationPickerData[row] isEqualToString:@"PopUpThroughAnimation"]) {
            _animation = 10;
        }
    } else {
        if ([_locationPickerData[row]isEqualToString:@"Screen Top"]) {
            _location = 1;
        } else if ([_locationPickerData[row]isEqualToString:@"Screen Center"]) {
            _location = 2;
        } else if ([_locationPickerData[row]isEqualToString:@"Screen Bottom"]) {
            _location = 3;
        }
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component == 1)
        return [_animationPickerData count];
    else
        return [_locationPickerData count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(component == 1)
        return [_animationPickerData objectAtIndex:row];
    else
        return [_locationPickerData objectAtIndex:row];
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel) {
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.font = [UIFont systemFontOfSize:15];
        pickerLabel.textAlignment=NSTextAlignmentCenter;
    }

    if(component == 1)
        pickerLabel.text =  [_animationPickerData objectAtIndex:row];
    else
        pickerLabel.text =  [_locationPickerData objectAtIndex:row];
    return pickerLabel;
}
@end
