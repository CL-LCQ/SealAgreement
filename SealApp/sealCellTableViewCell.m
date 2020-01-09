//
//  sealCellTableViewCell.m
//  sealBlock
//
//  Created by Charles Leclercq on 21/05/2016.
//  Copyright © 2016 Charles Leclercq. All rights reserved.
// stylesheet of the cell

#import "sealCellTableViewCell.h"

@implementation sealCellTableViewCell

@synthesize primaryLabel,secondaryLabel, currencyPicker;
@synthesize inputField1, inputField2, inputField3, datePicker1, pickerView, dateLabel1, dateLabel2, startDate, endDate;
@synthesize confirmButton,checkBox;
@synthesize isUnfolded, cellBkg;
@synthesize sharedSealObject;
@synthesize deleteCellButton, addBlockButton;
@synthesize templateDictionary,pickerData,currencylabel,colors;

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
        // Initialization code
        sharedSealObject = [SealObject sharedManager];

        
        isUnfolded = false;
        colors = [[Colors alloc]init];
        
        datePicker1 = [[UIDatePicker alloc]init];
        datePicker1.datePickerMode = UIDatePickerModeDate;
        
        
        currencylabel = [[UILabel alloc]init];
        currencylabel.font =  [UIFont fontWithName:@"Gill Sans" size:16];
        
        primaryLabel = [[UILabel alloc]init];
        primaryLabel.textAlignment = UITextAlignmentLeft;
        primaryLabel.font = [UIFont systemFontOfSize:20];
        
       
        secondaryLabel = [[UILabel alloc]init];
        secondaryLabel.textAlignment = UITextAlignmentLeft;
        secondaryLabel.font = [UIFont systemFontOfSize:14];
        
//        primaryLabel.text = @"1st label";
//        secondaryLabel.text = @"2nd label";
        
        inputField1 = [[UITextField alloc]init];
        [inputField1 setBorderStyle:UITextBorderStyleRoundedRect];
        [inputField1 setPlaceholder:@"Placeholder 1"];
        inputField1.font =[UIFont fontWithName:@"Gill Sans" size:16];

        inputField2 = [[UITextField alloc]init];
  //      [inputField2 setEditable:YES];
        [inputField2 setBorderStyle:UITextBorderStyleRoundedRect];
        [inputField2 setPlaceholder:@"Placeholder 2"];
        inputField2.font =[UIFont fontWithName:@"Gill Sans" size:16];

        
        inputField3 = [[UITextField alloc]init];
        [inputField3 setBorderStyle:UITextBorderStyleRoundedRect];
        [inputField3 setPlaceholder:@"Placeholder 3"];
        inputField3.font =[UIFont fontWithName:@"Gill Sans" size:16];




        deleteCellButton = [[UIButton alloc]init];
        //[deleteCellButton setTitle:@"X" forState:UIControlStateNormal] ;
        [deleteCellButton setImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
       // [deleteCellButton setBackgroundColor:colors.sealblue];
        

        [self.contentView addSubview:deleteCellButton];
        [self.contentView addSubview:primaryLabel];
        [self.contentView addSubview:secondaryLabel];
        [self.contentView addSubview:inputField1];
        [self.contentView addSubview:inputField2];
        [self.contentView addSubview:inputField3];
        [self.contentView addSubview:currencylabel];

        
        self.backgroundColor =  colors.themewhite;
        self.opaque = YES;
        
//        if([self.type isEqualToString:@"TIME"]){
//       
//        }

        inputField1.inputAccessoryView = [self configureKeyboard];

        inputField2.inputAccessoryView = [self configureKeyboard];
        
        inputField3.inputAccessoryView = [self configureKeyboard];
        
        
        
        _templateLib= [[templateLibrary alloc]init];
        
        templateDictionary = [[NSArray alloc]init];


        
            
    }
    return self;
}
-(UIToolbar*)configureKeyboard{
    
    UIToolbar *keyboardToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 50)];
    keyboardToolbar.barStyle = UIBarStyleDefault;
    keyboardToolbar.items = [NSArray arrayWithObjects:
                   
                             
                             
                
                             
                             
                             [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                             
                             [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(dismissKeyboard)],
                             nil];
    
    [keyboardToolbar sizeToFit];
    
    return  keyboardToolbar;
    
}

-(NSDictionary*)returnInfoAtIndex:(int)index{
    NSDictionary *dict;
    if ([self.type isEqualToString:@"TERM"]) {
        dict= [_templateLib.termsLibrary objectAtIndex:index];
    }
    else if([self.type isEqualToString:@"SCOPE"]) {
        dict= [_templateLib.scopesLibrary objectAtIndex:index];
    }
    
    return dict;

}
-(void)addTemplateAtIndex:(int)index{
 

     NSLog(@"add template with id: %d",index);
    
    if ([self.type isEqualToString:@"TERM"]) {
        NSDictionary *dict= [_templateLib.termsLibrary objectAtIndex:index];
        inputField1.text =[dict objectForKey:@"Title"];
        inputField2.text =[dict objectForKey:@"Description"];
       

    }
    else if([self.type isEqualToString:@"SCOPE"]) {
        NSDictionary *dict= [_templateLib.scopesLibrary objectAtIndex:index];
        inputField1.text =[dict objectForKey:@"Title"];
        inputField2.text =[dict objectForKey:@"Description"];
        currencylabel.text  =[dict objectForKey:@"Currency"];
    }
    
    else if([self.type isEqualToString:@"VALUE"]) {
        NSDictionary *dict= [_templateLib.valueLibrary objectAtIndex:index];
        inputField1.text =[dict objectForKey:@"Title"];
        inputField2.text =[dict objectForKey:@"Description"];
        currencylabel.text  =[dict objectForKey:@"Currency"];
    }
    
    else if([self.type isEqualToString:@"TIME"]) {
        NSDictionary *dict= [_templateLib.timeLibrary objectAtIndex:index];
        inputField1.text =[dict objectForKey:@"Title"];
        inputField2.text =[dict objectForKey:@"Description"];
        
    }




}

-(void)dismissKeyboard{

  [self endEditing:YES];

}

- (void)layoutSubviews {
    [super layoutSubviews];
    //use UIlabel and proportions
    
    CGRect contentRect = self.contentView.bounds;
    CGFloat boundsX = contentRect.origin.x;
    CGFloat boundsY = contentRect.size.width;
    CGRect frame;
    CGFloat sizeX = contentRect.size.width;
    cellBkg.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height/2 );

    [cellBkg removeFromSuperview];
    
    frame= CGRectMake(boundsX+70 ,5, 200, 25);
    primaryLabel.frame = frame;
    
    frame= CGRectMake(boundsX+70 ,30, boundsY- 70 , 15);
    secondaryLabel.frame = frame;
    
    frame= CGRectMake(boundsX+20, 50, sizeX - 40, 40);
    inputField1.frame = frame;
  

    
    
    frame= CGRectMake(boundsX+20, 100, sizeX - 40, 80);
    inputField2.frame = frame;
    datePicker1.frame= frame;
    


    deleteCellButton.frame = CGRectMake(sizeX-45, 10, 35, 35);
   // addBlockButton.frame = CGRectMake(contentRect.size.width  - 30, contentRect.size.height -30, 35, 35);
    
    [self.contentView insertSubview:cellBkg belowSubview:primaryLabel];
    
    
    if ([self.type isEqualToString:@"TIME"]){
        [self.contentView addSubview:datePicker1];
        [inputField2 removeFromSuperview];
        
    
    }
    
   else if ([self.type isEqualToString:@"VALUE"]){
     
       frame= CGRectMake(boundsX+20, 100, sizeX - 160, 40);
       inputField2.frame = frame;
        frame= CGRectMake(sizeX-(boundsX+80), 100, 80, 40);
       currencylabel.frame= frame;
       //should display variable key
       //currencylabel.text = @"$";
       [self.contentView addSubview:currencylabel];

        
        
    }
    
   else if ([self.type isEqualToString:@"SCOPE"]){
       
       frame= CGRectMake(boundsX+20, 100, sizeX - 40, 40);
       inputField2.frame = frame;
       frame= CGRectMake(boundsX+20, 150, sizeX - 160, 40);

       inputField3.frame = frame;
       frame= CGRectMake(sizeX-(boundsX+80), 150, 80, 40);
       currencylabel.frame= frame;
      // currencylabel.text = @"Hours";
       
       [self.contentView addSubview:currencylabel];
       [self.contentView addSubview:inputField3];
       
       
       
   }

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}



@end
