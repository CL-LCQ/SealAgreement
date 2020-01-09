//
//  IntroductionViewController.h
//  SealApp
//
//  Created by Charles Leclercq on 15/08/2016.
//  Copyright © 2016 Seal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UILib.h"
#import "Colors.h"

@class UILib;
@class Colors;

@interface IntroductionViewController : UIViewController


@property UILib *uiLib;
@property UIButton *nextButton;
@property Colors *colors;


//labels
@property UILabel *titleLabel;
@property UIImageView *imageTutorial;

//interaction
@property (nonatomic) int tapCount;

@end
