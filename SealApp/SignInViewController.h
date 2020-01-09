//
//  SignInViewController.h
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
@class  UILib;


@interface SignInViewController : UIViewController

@property UserLogic *userLogic;
@property UILib *customUI;
@property Colors *colors;


@property UITextField* emailField;
@property UITextField* usernameField;
@property UITextField* passwordField;
@property UILabel *orLabel;

@property UIButton *SignUpButton;
@property UIButton *FBSignUpButton;
@property UIButton *GGSignUpButton;
@property UIButton *LoginButton;

@end
