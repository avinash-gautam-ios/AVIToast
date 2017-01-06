# AVIToast
Toast is just a simple and an elegant way to show small and intutive messages to user about the things they should do and things they should not. These messages are non interactive and are displayed on a specific position on the screen. These messages can appear on screen with a different types of animation, being Fade-In is the most common (as in Android).

## Demo
![AviToastDemo](https://raw.githubusercontent.com/avistyles/AVIToast/master/AVIToastExampleGif.gif)

## Requirements
```
Xcode 7.3+, 
iOS 7+, 
ARC   
```
## Installation
Just Drag and Drop <b>AVIToastViewController.h</b> and <b>AVIToastViewController.m</b> files into your Project and then you are good to go.

## Simple Usage
<b>Show a Simple Toast on screen</b>(default position is Screen Bottom, default Animation is Fade-In Animation, with default duration)
```
[AVIToastViewController showToastOnView:self.view withString:@"Your String goes here"];
```
## Customized Usage
### Methods
```
+(void)showToastOnView:(UIView * _Nonnull)view withString:(NSString * _Nonnull)text forDuration:(AVToastDurationStatus)duration;

+(void)showToastOnView:(UIView *_Nonnull)view withString:(NSString *_Nonnull)text withAlpha:(CGFloat)toastAlpha forDuration:(AVToastDurationStatus)duration;

+(void)showToastOnView:(UIView *_Nonnull)view withString:(NSString *_Nonnull)text withFontSize:(CGFloat)fontSize forDuration:(AVToastDurationStatus)duration;

+(void)showAVToastOnView:(UIView *_Nonnull)view withString:(NSString *_Nonnull)text withFontSize:(CGFloat)fontSize withAVToastPosition:(AVToastLocationStatus)toastLocation forDuration:(AVToastDurationStatus)duration;

+(void)showAVToastOnView:(UIView *_Nonnull)view withString:(NSString *_Nonnull)text withFontSize:(CGFloat)fontSize withAVToastAnimation:(AVToastAnimationStatus)toastAnimation forDuration:(AVToastDurationStatus)duration;

+(void)showAVToastOnView:(UIView *_Nonnull)view withString:(NSString *_Nonnull)text withAVToastPosition:(AVToastLocationStatus)toastLocation withAVToastAnimation:(AVToastAnimationStatus)toastAnimation forDuration:(AVToastDurationStatus)duration;

+(void)showToastOnView:(UIView *_Nonnull)view withString:(NSString *_Nonnull)text withBackgroundColor:(UIColor *_Nonnull)backColor withFontColor:(UIColor *_Nonnull)fontColor forDuration:(AVToastDurationStatus)duration;

+(void)showToastOnView:(UIView *_Nonnull)view withString:(NSString *_Nonnull)text withBackgroundColor:(UIColor *_Nonnull)backColor withFontColor:(UIColor *_Nonnull)fontColor withAVToastPosition:(AVToastLocationStatus)toastLocation withAVToastAnimation:(AVToastAnimationStatus)toastAnimation forDuration:(AVToastDurationStatus)duration;

```
### Full Customization
```
+(void)showAVToastOnView:(UIView *_Nonnull)view withString:(NSString *_Nonnull)text forDuration:(AVToastDurationStatus)duration withFontSize:(CGFloat)fontSize withAVToastPosition:(AVToastLocationStatus)toastLocation withAVToastAnimation:(AVToastAnimationStatus)toastAnimation withAlpha:(CGFloat)toastAlpha withAVBackGroundColor:( UIColor * _Nullable )backColor withAVFontColor:(UIColor * _Nullable)fontColor;

```
<b>Example :</b>
```
[AVIToastViewController showAVToastOnView:self.view withString:@"Your String goes here" forDuration:AVToastDurationNormal withFontSize:11 withAVToastPosition:AVToastLocationScreenBottom withAVToastAnimation:AVToastAnimationFade withAlpha:0.8 withAVBackGroundColor:[UIColor orangeColor] withAVFontColor:[UIColor blackColor]];
```
### Deleagte
The Delegate will be called when Toast will Finish Displaying, just in order to perform the next action i.e after Toast.
```
<AVToastDisplayEndDelegate>
-(void)AVToastDidFinshDisplayingToast;

//usage
[AVIToastViewController singleton].delegate = self;

-(void)AVToastDidFinshDisplayingToast {
      NSLog (@"AVIToast Display Finished");
}
```
### Duration Parameters (AVToastDurationStatus)
```
AVToastDurationLong
AVToastDurationShort
AVToastDurationNormal  //default
```
### Animation Parameters (AVToastAnimationStatus)
```
AVToastAnimationFade            //default
AVToastAnimationSlideFromLeft
AVToastAnimationSlideFromRight
AVToastAnimationSimpleAppear
AVToastAnimationSlideFromDown
AVToastAnimationSlideFromTop
AVToastAnimationThrough
AVToastAnimationPopUpAppear
AVToastAnimationReversePopUpAppear
AVToastAnimationThroughPopUpAnimation
```
### Position Parameters (AVToastLocationStatus)
```
AVToastLocationScreenTop
AVToastLocationScreenBottom   //default
AVToastLocationScreenCenter
```
## Changes Using Properties
```
[AVIToastViewController singleton].AVToastBackgroundColor = [UIColor orangeColor];
[AVIToastViewController singleton].AVToastLabelColor = [UIColor blackColor];
[AVIToastViewController singleton].AVToastDuration = 5.0  //custom duration in float
[AVIToastViewController showToastOnView:self.view withString:@"Your String goes here"];
```
## Authors
* **Avinash Kumar Gautam** - *Start to Complete*

## License
This project is licensed under the MIT License - see the [LICENSE.md](https://github.com/avistyles/AVIToast/blob/master/LICENSE.md) file for details

## Acknowledgments
* Adeesh Jain
