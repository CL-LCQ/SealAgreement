//
//  customUI.h
//  SealApp
//
//  Created by Charles Leclercq on 15/08/2016.
//  Copyright © 2016 Seal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomUI : UIView


@property CGFloat sizex;
@property CGFloat sizey;

- (instancetype)initWithFrame:(CGRect)frame;

-(CGRect)bottomRectangle;
-(CGRect)RectangleAtPos:(int)pos;
-(CGRect)HorizontalRectangleAtPos:(int)pos;

@end
