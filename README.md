# AVIToast
Toast is just a simple and an elegant way to show small and intutive messages to user about the things they should do and things they show not. These messages are non interactive and are displayed on a specific position on the screen. These messages can appear on screen with a different types of animation, being Fade-In is the most common (as in Android).

## Demo
![AviToastDemo](https://raw.githubusercontent.com/avistyles/AVIToast/master/AVIToastExampleGif.gif)

## Requirements
Xcode 7.3+, 
iOS 7+, 
ARC   

## Installation
Just Drag and Drop <b>AVIToastViewController.h</b> and <b>AVIToastViewController.m</b> files into your Project and then you are good to go.

## Usage
1. <b>Show a Simple Toast on screen</b>(default position is Screen Bottom, default Animation is Fade-In Animation, with default duration)
```
[AVIToastViewController showToastOnView:self.view withString:sampleString];
```
  
