//
//  SettingsViewController.h
//  SealApp
//
//  Created by Charles Leclercq on 15/08/2016.
//  Copyright © 2016 Seal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UILib.h"
#import "UserLogic.h"
#import "PrivacySettingsViewController.h"

@class UserLogic;
@class UILib;
@class PrivacySettingsViewController;

@interface SettingsViewController : UIViewController

@property UILib *uILib;

@property UITableView* settingList;
@property NSArray *tableDataSection01;
@property PrivacySettingsViewController *termsOfService;
@end
