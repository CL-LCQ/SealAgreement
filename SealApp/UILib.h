//
//  UILib.h
//  SealApp
//
//  Created by Charles Leclercq on 15/08/2016.
//  Copyright © 2016 Seal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Colors.h"

@class Colors;

@interface UILib : NSObject

@property Colors *colors;


//-(instancetype)initWithView:(UIView*)view;
-(instancetype)initWithViewC:(UIViewController*)viewC;
-(instancetype)initWithView:(UIView*)viewC;

-(void)insertTopBackbar;
-(void)insertTopOptionbar;
-(void)insertSealToolbar;

-(void)setCreateView;

-(CGRect)RectangleAtPos:(int)pos;
-(CGRect)bottomRectangle;
-(CGRect)templateViewFrame;
-(CGRect)bottomRectangleAtTop;
-(CGRect)scrollViewFrame;
-(CGRect)longRectangleAtPos:(int)pos;
-(CGRect)bigLongRectangleAtPos:(int)pos;
-(void)setFrameOnTouch:(id)sender;
-(CGRect)templateBottomRectangle;
-(CGRect)scrollViewFrameCollapsed;
-(CGRect)topTracker;
-(void)bottomViewButton;
-(UIButton*)bottomViewButtonInView:(UIView*)thisView;
-(CGRect)profilePictureFrame;
-(UIImage*)ProfilePicture;

@property UIViewController *viewController;
@property UIView *myView;

@property (nonatomic)CGFloat sizex;
@property (nonatomic)CGFloat sizey;
@property (nonatomic)CGFloat topBarHeight;
@property (nonatomic)CGFloat toolBarHeight;

@property UIView *topBackbar;
@property UIView *topOptionbar;
@property UIView *topSealToolbar;
@property UIView *bottomView;

@property (nonatomic)CGRect frameMinusTopBar;
@property (nonatomic)CGRect frameMinusTopBarHidden;
@property (nonatomic)CGRect frameMinusToolBar;

@property (nonatomic)CGRect sealbarFrameShow;
@property (nonatomic)CGRect sealbarFrameHide;
@property (nonatomic)CGRect createViewContainer;
@property (nonatomic)CGRect createViewContainerHidden;

@property (nonatomic,strong) UIView *CreateContainerView;
@property (nonatomic,strong) UIView *whatView;
@property (nonatomic,strong) UIView *termView;
@property (nonatomic,strong) UIView *valueView;
@property (nonatomic,strong) UIView *deadlineView;

@property (nonatomic,strong) UIButton *validateButton;


@end
