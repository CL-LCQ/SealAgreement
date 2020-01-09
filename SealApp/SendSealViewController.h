//
//  SendSealViewController.h
//  SealApp
//
//  Created by Charles Leclercq on 17/08/2016.
//  Copyright © 2016 Seal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "SealObject.h"
#import "UserLogic.h"
#import "LayoutEmail.h"
#import "UILib.h"
#import "itemStructure.h"
#import "Colors.h"

@class itemStructure;
@class Colors;
@class LayoutEmail;
@class  UILib;

@interface SendSealViewController : UIViewController

@property SealObject *sharedSealObject;
@property UserLogic *userLogic;
@property LayoutEmail *emailLayout;
@property UILib *uILib;
@property Colors *colors;



@property (nonatomic, strong) NSArray *allUsers;
@property (nonatomic,strong) PFUser *currentUser;

@property (nonatomic, strong) NSMutableArray *recipients;
@property (nonatomic, strong) NSMutableArray *recipientsEmail;
@property int *userCount;

@property (nonatomic, strong) UITextField *clientNameTextField ;
@property (nonatomic, strong) UITextField *clientEmailTextField;
@property (nonatomic, strong) UITextField *addressTextField;

- (BOOL)isFriend: (PFUser *)user;


@property UITextField*addUserField;

@property CGFloat sizex;
@property CGFloat sizey;

@property UIButton *validateButton;
@property UIButton *selfSend;


@end
