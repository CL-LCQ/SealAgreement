//
//  LayoutEmail.h
//  Seal
//
//  Created by Charles Leclercq on 06/07/2016.
//  Copyright © 2016 Charles Leclercq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SealObject.h"
#import "itemStructure.h"

@class SealObject;
@class itemStructure;

@interface LayoutEmail : UIView

@property SealObject *sharedSealObject;

-(NSString*)layoutSealObjectWithName:(NSString*)name;

-(NSString*)HTMLSeal;
-(NSURL*)previewSeal;
-(NSString*)HTMLBody;
@end
