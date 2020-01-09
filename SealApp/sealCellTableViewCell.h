//
//  sealCellTableViewCell.h
//  sealBlock
//
//  Created by Charles Leclercq on 21/05/2016.
//  Copyright © 2016 Charles Leclercq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SealObject.h"
#import "templateLibrary.h"
#import "Colors.h"


@class  SealObject;
@class  templateLibrary;
@class Colors;

@interface sealCellTableViewCell : UITableViewCell

@property(nonatomic,retain)NSString *type;

@property(nonatomic,retain)UILabel *primaryLabel;
@property(nonatomic,retain)UILabel *secondaryLabel;
@property SealObject *sharedSealObject;
@property templateLibrary *templateLib;
@property Colors *colors;

@property NSArray *templateDictionary;

@property NSMutableArray *pickerData;

@property(nonatomic,retain)UITextField *inputField1;
@property(nonatomic,retain)UITextField *inputField2;
@property(nonatomic,retain)UITextField *inputField3;

//for multi lines
//@property(nonatomic,retain)UITextView *inputField1;
//@property(nonatomic,retain)UITextView *inputField2;
//@property(nonatomic,retain)UITextView *inputField3;


@property(nonatomic,retain)UIDatePicker *datePicker1;
@property(nonatomic,retain)UIPickerView *pickerView;
@property UILabel *currencylabel;




@property(nonatomic,retain)UIDatePicker *datePicker2;
@property(nonatomic,retain)UILabel *dateLabel1;
@property(nonatomic,retain)UILabel *dateLabel2;
@property(nonatomic,retain)NSString *startDate;
@property(nonatomic,retain)NSString *endDate;
@property(nonatomic,retain)UIImageView *cellBkg;

@property(nonatomic,retain)UIPickerView *currencyPicker;

@property(nonatomic,retain)UIButton *deleteCellButton;

@property(nonatomic,retain)UIButton *confirmButton;
@property(nonatomic,retain)UIButton *addBlockButton;


@property(nonatomic,retain)UISwitch *checkBox;

@property BOOL *isUnfolded;

-(void)hideCellContent;

-(NSDictionary*)returnInfoAtIndex:(int)index;
-(void)addTemplateAtIndex:(int)index;



@end
