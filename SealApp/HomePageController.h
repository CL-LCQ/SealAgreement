//
//  HomePageController.h
//  SealApp
//
//  Created by Charles Leclercq on 15/08/2016.
//  Copyright © 2016 Seal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserLogic.h"
#import "UILib.h"
#import "sealBlock.h"
#import "SealObject.h"
#import <Parse/Parse.h>
#import "sealCellTableViewCell.h"
#import "Colors.h"


@class Colors;
@class  SealObject;
@class sealBlock;
@class UILib;
@class  UserLogic;
@class sealCellTableViewCell;



@interface HomePageController : UIViewController

@property UserLogic *userLogic;
@property UILib *uILib;
@property Colors *colors;
@property sealBlock *sealBloc;
@property sealBlock *sealBlocWhat;
@property sealBlock *sealBlocTime;
@property sealBlock *sealBlocValue;

@property sealCellTableViewCell *sealCell;



@property SealObject *sharedSealObject;

//scroll for create view
@property UIView *createView;


//template viewer and interaction
@property UIView *templateView;
@property UIButton *showTemplateView;
@property UIScrollView *templateScroller;
@property bool *isTemplateShown;

    
    
@property    UIButton *settingsButton;
@property    UIButton *profileButton;
@property    UIButton *createButton;
@property    UIButton *libraryButton;

//profile
@property UITableView* profileList;
@property UIView *profileView;
@property NSArray *tableDataSection01;

//Library(this is the list of older seals)
@property UIView *libraryView;
@property UITableView* libraryList;
@property (nonatomic, strong) NSArray *messages;
@property (nonatomic, strong) PFObject *selectedMessage;

@end
