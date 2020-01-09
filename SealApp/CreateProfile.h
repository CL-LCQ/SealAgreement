//
//  CreateProfile.h
//  SealApp
//
//  Created by Charles Leclercq on 15/08/2016.
//  Copyright © 2016 Seal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserLogic.h"
#import "UILib.h"
#import "Colors.h"

@class Colors;
@class UserLogic;
@class UILib;




@interface CreateProfile : UIViewController

@property UserLogic *userLogic;
@property UIButton *nextButton;
@property UILib *uILib;
@property Colors *colors;



@property UITextField* emailField;
@property UITextField* usernameField;
@property UITextField* passwordField;

@end
