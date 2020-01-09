//
//  sealBlock.h
//  sealBlock
//
//  Created by Charles Leclercq on 21/05/2016.
//  Copyright © 2016 Charles Leclercq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sealCellTableViewCell.h"
#import "SealObject.h"
#import "itemStructure.h"
#import "UILib.h"
#import "templateLibrary.h"
#import "Colors.h"

@class itemStructure;
@class sealCellTableViewCell;
@class  SealObject;
@class UILib;
@class templateLibrary;
@class Colors;


@interface sealBlock : UITableView

@property sealCellTableViewCell *sealCell;
@property sealCellTableViewCell *cell;
@property SealObject *sharedSealObject;
@property UILib *uILib;
@property templateLibrary* templateLib;
@property Colors *colors;


@property(nonatomic,retain)UIToolbar* keyboardToolbar;

@property(nonatomic,retain)NSString *type;

@property(nonatomic, retain) NSMutableArray *data;
@property(nonatomic, retain) NSArray *subtypes;

@property(nonatomic, retain) NSMutableDictionary *cellLiveData;
@property(nonatomic, retain)sealCellTableViewCell *previousCell;
@property int rowNumber;
@property CGFloat averageHeight;
@property (nonatomic) int currentSelection;
@property (nonatomic) int previousSelection;
@property (nonatomic) int smallHeight;
@property (nonatomic) int screenHeight;

@property UIImageView *libIcon;

@property (nonatomic) bool isExpanded;
@property (nonatomic) bool isTerm;



//template viewer and interaction
@property UIView *templateView;
@property UIButton *showTemplateView;
@property UIScrollView *templateScroller;
@property bool *isTemplateShown;



-(id) initWithFrame:(CGRect)frame style:(UITableViewStyle)style type:(NSString*)type;


-(void)configureBlocsInView:(UIView*)view;


@end
