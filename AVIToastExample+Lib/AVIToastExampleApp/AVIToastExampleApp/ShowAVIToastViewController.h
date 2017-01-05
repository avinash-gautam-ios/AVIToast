//
//  ShowAVIToastViewController.h
//  AVIToastExampleApp
//
//  Created by Avinash Kumar Gautam on 02/01/17.
//  Copyright © 2017 Avinash Kumar Gautam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVIToastViewController/AVIToastViewController.h"

@interface ShowAVIToastViewController : UIViewController

@property (nonatomic) NSInteger rowNumber;

@property (nonatomic,strong)NSArray *locationPickerData;
@property (nonatomic,strong)NSArray *animationPickerData;
@property (nonatomic,strong)NSArray *colorPickerData;
@property (strong, nonatomic) IBOutlet UIPickerView *durationPickerView;

@end
