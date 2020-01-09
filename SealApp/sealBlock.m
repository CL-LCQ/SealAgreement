//
//  sealBlock.m
//  sealBlock
//
//  Created by Charles Leclercq on 21/05/2016.
//  Copyright © 2016 Charles Leclercq. All rights reserved.
//
//TODO : FIX the display bool is selected /expanded etc...maybe a single value.
//add all type of blocs (datepicker, switch etc...)
//this should be enough to implement with the sealobject...

#import "sealBlock.h"
#import "sealCellTableViewCell.h"

@class sealCellTableViewCell;

@interface sealBlock () <UITableViewDelegate, UITableViewDataSource>
@end

@implementation sealBlock

@synthesize subtypes,cell;
@synthesize sharedSealObject;
@synthesize templateView, showTemplateView, templateScroller,uILib,colors;
@synthesize libIcon;

-(id) initWithFrame:(CGRect)frame style:(UITableViewStyle)style type:(NSString*)type
{
    if(self = [super initWithFrame:frame style:style])
    {
        self.frame=frame;
        self.dataSource = self;
        self.delegate = self;
        self.autoresizingMask = UIViewAutoresizingFlexibleHeight;

        sharedSealObject = [SealObject sharedManager];
        self.type = type;
  
        self.data = [[NSMutableArray alloc]init];
        
        _templateLib = [[templateLibrary alloc]init];
        colors = [[Colors alloc]init];

       
    }
    return self;
}




-(void)configureBlocsInView:(UIView*)view{

    self.rowNumber = [self.data count];
    self.screenHeight = view.frame.size.height;
    self.averageHeight= view.frame.size.height / self.rowNumber;
    self.currentSelection = -1;
    
    self.layer.contents = (id)[UIImage imageNamed:@"background_pattern"].CGImage;
    self.opaque = NO;
    self.separatorColor = [UIColor clearColor];
    //self.isExpanded = false;
    
    [view addSubview:self];
    
    UIViewController *vc = [[UIViewController alloc]init];
    vc.view.frame = view.frame;
    uILib = [[UILib alloc]initWithViewC:vc];
    [self setTemplateViewerInView:view];
    

}



-(void)setTemplateViewerInView:(UIView*)view{
    
    templateView = [[UIView alloc]initWithFrame:[uILib bottomRectangle]];
    [templateView setBackgroundColor:colors.sealblue];
    [view addSubview:templateView];

    showTemplateView = [[UIButton alloc]initWithFrame:[uILib bottomRectangleAtTop]];
    [showTemplateView setTitle:@"Library" forState:UIControlStateNormal];
    showTemplateView.titleLabel.font =[UIFont fontWithName:@"Gill Sans" size:18];
    libIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"add_from_library_normal.png"]];
    CGFloat height = templateView.frame.size.height/1.4;
    libIcon.frame = CGRectMake(templateView.frame.size.width/2 - templateView.frame.size.width/4, (templateView.frame.size.height - height)/2, height, height);
    
    [showTemplateView addSubview:libIcon];
    
    [templateView addSubview: showTemplateView];
    
    [showTemplateView addTarget:self action:@selector(displayTemplateView) forControlEvents:UIControlEventTouchUpInside];
    
    templateScroller = [[UIScrollView alloc]initWithFrame:[uILib scrollViewFrameCollapsed]];
    
    
    NSArray *buttonDataArray = [[NSArray alloc]init];
    
         if ([self.type isEqualToString:@"TERM"]) {
       buttonDataArray= _templateLib.termsLibrary ;
    }
    else if([self.type isEqualToString:@"SCOPE"]) {
        buttonDataArray= _templateLib.scopesLibrary;
    }
    else if([self.type isEqualToString:@"TIME"]) {
        buttonDataArray= _templateLib.timeLibrary;
    }
    else if([self.type isEqualToString:@"VALUE"]) {
        buttonDataArray= _templateLib.valueLibrary;
    }
    
    
    
    CGFloat btnX = 0;
    int numberOfButton = [buttonDataArray count];//count of the array
    
   
    NSDictionary *info = [[NSDictionary alloc]init];


    for (int i = 0 ; i < numberOfButton; i++)
    {
        info = [buttonDataArray objectAtIndex:i];
      
        NSString *title = [info objectForKey:@"templateName"];
        // UIImage *img = [UIImage imageNamed:[montageName objectAtIndex:i]];
        //[button setBackgroundImage:img forState:UIControlStateNormal];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(btnX, 2 , 125, 65);
        button.titleLabel.numberOfLines = 2;
        button.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        [button setBackgroundColor:colors.themewhite];
        [button setTitle:title forState:UIControlStateNormal];
        

       [button addTarget:self action:@selector(addRowWithDataIndex:) forControlEvents:UIControlEventTouchDown];
        button.tag = i;
        [button setTitleColor:colors.themeblack forState:UIControlStateNormal];
        button.titleLabel.textAlignment = UIBaselineAdjustmentAlignBaselines ;
        
        button.showsTouchWhenHighlighted = YES;
        
        button.titleLabel.font = [UIFont fontWithName:@"Gill Sans" size:12];
        //button.titleLabel.textColor = [UIColor whiteColor];
        [templateScroller addSubview:button];
        
        btnX = btnX + 140;

    }
    btnX = btnX -80;
    templateScroller.contentSize = CGSizeMake(btnX + 50, 80);
    
    [templateView addSubview:templateScroller];
    

    
}

-(void)displayTemplateView{
    

  

    
    //hide
    if(_isTemplateShown == true){
          libIcon.image = [UIImage imageNamed:@"add_from_library_normal.png"];
        [UIView animateWithDuration:0.3f delay:0.0f options: UIViewAnimationCurveEaseIn animations:^{
            [ templateView  setFrame:[uILib bottomRectangle]];} completion:nil];
        
        [UIView animateWithDuration:0.3f delay:0.0f options: UIViewAnimationCurveEaseIn animations:^{
            [ templateScroller setFrame:[uILib scrollViewFrameCollapsed]];} completion:nil];
        _isTemplateShown = true;

        _isTemplateShown = false;
    }
    //show
    else if(_isTemplateShown == false){
          libIcon.image = [UIImage imageNamed:@"add_from_library_selected.png"];
        [UIView animateWithDuration:0.3f delay:0.0f options: UIViewAnimationCurveEaseIn animations:^{
            [templateView setFrame:[uILib templateViewFrame]];} completion:nil];
        //_isTemplateShown = true;
        
        [UIView animateWithDuration:0.3f delay:0.0f options: UIViewAnimationCurveEaseIn animations:^{
            [ templateScroller setFrame:[uILib scrollViewFrame]];} completion:nil];
        _isTemplateShown = true;
        
        //templateScroller = [[UIScrollView alloc]initWithFrame:[uILib scrollViewFrame]];

    }
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.data count];
}



- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    static NSString* staticCellIdentifier = @"customIdentifier";
    cell  = [tableView dequeueReusableCellWithIdentifier:staticCellIdentifier];
 
    
    if (cell == nil) {
        cell = [[sealCellTableViewCell alloc]initWithFrame:CGRectZero reuseIdentifier:staticCellIdentifier];
                     [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    else{
        
        cell.type = self.type;
        
    //get the data back - may crash
        itemStructure *item;
        if ([self.type isEqualToString:@"TERM"]) {
          item = [sharedSealObject.terms objectAtIndex:(indexPath.row)];
        }
        else if([self.type isEqualToString:@"SCOPE"]) {
            item = [sharedSealObject.what objectAtIndex:(indexPath.row)];
        }
        else if([self.type isEqualToString:@"TIME"]) {
             item = [sharedSealObject.time objectAtIndex:(indexPath.row)];
        }
        else if([self.type isEqualToString:@"VALUE"]) {
             item = [sharedSealObject.value objectAtIndex:(indexPath.row)];
        }
    
       //reassign each value contained in item to the cell
        cell.inputField1.text = item.Title;
        cell.inputField2.text = item.Description;
        cell.inputField3.text = item.Rate;

    }
    
    int identity = indexPath.row;
//    cell.primaryLabel.text =  [@(identity) stringValue];
//    cell.secondaryLabel.text = [@([self.data count]) stringValue];
    cell.type = self.type;

    cell.inputField1.tag = indexPath.row;
    cell.inputField2.tag = indexPath.row;
    cell.inputField3.tag = indexPath.row;
    cell.datePicker1.tag = indexPath.row;
    cell.deleteCellButton.tag = indexPath.row;
    
    [cell.inputField1 addTarget:self action:@selector(saveTextField:) forControlEvents:UIControlEventEditingDidEnd];
    [cell.inputField2 addTarget:self action:@selector(saveTextField:) forControlEvents:UIControlEventEditingDidEnd];
    [cell.inputField3 addTarget:self action:@selector(saveTextField:) forControlEvents:UIControlEventEditingDidEnd];
    [cell.datePicker1 addTarget:self action:@selector(saveTextField:) forControlEvents:UIControlEventValueChanged];




    [cell.deleteCellButton addTarget:self action:@selector(removeRow:) forControlEvents:UIControlEventTouchUpInside];


    return cell;
}

-(void)saveTextField:(id)sender{
    
    itemStructure *newItem  =[[itemStructure alloc]init];
    NSDictionary *dico;
    
    int index = [sender tag];
    NSIndexPath *indexPath =[NSIndexPath indexPathForRow: index inSection:0];
    sealCellTableViewCell *cell = [self cellForRowAtIndexPath:indexPath];
    
    if([self.type isEqualToString:@"TERM"]){
      
        
        newItem.Title = cell.inputField1.text;
        newItem.Description = cell.inputField2.text;
        
        newItem.Rate = @"";
        //need to check if the idnex will correspond or not
        [sharedSealObject.terms replaceObjectAtIndex:index withObject:newItem];
    }
    
    else if ([self.type isEqualToString:@"SCOPE"]){
        
        newItem.Title = cell.inputField1.text;
        newItem.Description = cell.inputField2.text;
        newItem.Rate = cell.inputField3.text;
        newItem.Currency = cell.currencylabel.text;
        
        [sharedSealObject.what replaceObjectAtIndex:index withObject:newItem];
    }
    
    else if ([self.type isEqualToString:@"TIME"]){
        
        newItem.Title = cell.inputField1.text;
       
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterShortStyle];
        NSDate *dt = cell.datePicker1.date ;
        NSString *dateAsString = [formatter stringFromDate:dt];
        
        newItem.Description = dateAsString;

        
   
          newItem.Rate = @"";
        [sharedSealObject.time replaceObjectAtIndex:index withObject:newItem];
    }
    
    else if ([self.type isEqualToString:@"VALUE"]){
        
        newItem.Title = cell.inputField1.text;
        //newItem.Description = cell.inputField2.text;
        newItem.Rate = cell.inputField2.text;
        newItem.Currency = cell.currencylabel.text;

        [sharedSealObject.value replaceObjectAtIndex:index withObject:newItem];
    }

    




}
-(void)addDataToSealWithIndex:(int)index{
    
    
        itemStructure *newItem  =[[itemStructure alloc]init];
        NSDictionary *dico;
    
    if([self.type isEqualToString:@"TERM"]){
        dico =[self.templateLib.termsLibrary objectAtIndex:index];
        
        newItem.Title = [dico objectForKey:@"Title"];
        newItem.Description = [dico objectForKey:@"Description"];
        newItem.Rate = [dico objectForKey:@"Variable"];
       
        
        [sharedSealObject.terms addObject:newItem];
    }
    
    else if ([self.type isEqualToString:@"SCOPE"]){
        
        dico =[self.templateLib.scopesLibrary objectAtIndex:index];
        
        newItem.Title = [dico objectForKey:@"Title"];
        newItem.Description = [dico objectForKey:@"Description"];
        
        newItem.Rate =[dico objectForKey:@"Variable"];
        [sharedSealObject.what addObject:newItem];
    }
    else if ([self.type isEqualToString:@"TIME"]){
        
        dico =[self.templateLib.timeLibrary objectAtIndex:index];
        
        newItem.Title = [dico objectForKey:@"Title"];
        //newItem.Description = [dico objectForKey:@"Variable"];
        
        //this only works if its by default
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterShortStyle];
        NSDate *dt = [NSDate date];
        NSString *dateAsString = [formatter stringFromDate:dt];
        
        newItem.Description = dateAsString;
        
//        newItem.Description = [NSDateFormatter localizedStringFromDate:[NSDate date] dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
        newItem.Rate = [dico objectForKey:@"Variable"];

        
        [sharedSealObject.time addObject:newItem];
    }
    else if ([self.type isEqualToString:@"VALUE"]){
        
        dico =[self.templateLib.valueLibrary objectAtIndex:index];
        
        newItem.Title = [dico objectForKey:@"Title"];
        newItem.Description = [dico objectForKey:@"Description"];
        newItem.Rate = [dico objectForKey:@"Variable"];
        
        [sharedSealObject.value addObject:newItem];
    }
    

}

-(void)removeDataWithIndex:(int)index{
    if([self.type isEqualToString:@"TERM"]){
        [sharedSealObject.terms removeObjectAtIndex:index];
    }
    
    else if ([self.type isEqualToString:@"SCOPE"]){
         [sharedSealObject.what removeObjectAtIndex:index];
    }
    else if ([self.type isEqualToString:@"TIME"]){
        [sharedSealObject.time removeObjectAtIndex:index];
    }
    else if ([self.type isEqualToString:@"VALUE"]){
        [sharedSealObject.value removeObjectAtIndex:index];
    }



}

-(void)addRowWithDataIndex:(id)itemIndex{

    int dataIndex = [itemIndex tag];

  
    [self beginUpdates];
    
    NSIndexPath *indexPath =[NSIndexPath indexPathForRow:[self.data count] inSection:0];
    
    NSArray *indexP = [[NSArray alloc]initWithObjects:indexPath, nil];
    [self insertRowsAtIndexPaths:indexP withRowAnimation:UITableViewRowAnimationTop];
    
  
    [self.data addObject:@""];
    [self addDataToSealWithIndex:dataIndex];
    
    [self endUpdates];
    [self reloadData];
    
    sealCellTableViewCell *cell = [self cellForRowAtIndexPath:indexPath];
    [cell addTemplateAtIndex:dataIndex];

}

-(void)removeRow:(id)sender{
   

    int index = [sender tag];
     NSIndexPath *indexPath =[NSIndexPath indexPathForRow:index inSection:0];

    [self.data removeObjectAtIndex:index];
    [self removeDataWithIndex:index];


  [self beginUpdates];


    NSArray *indexSel = [[NSArray alloc]initWithObjects:indexPath, nil];
    [self deleteRowsAtIndexPaths:indexSel withRowAnimation:UITableViewRowAnimationTop];
    
  
    
    [self endUpdates];
    [self reloadData];

}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row%2 == 0) {
        
        UIColor *altCellColor = colors.menubkggrey;
        cell.backgroundColor = altCellColor;
    }
    
    else{
     cell.backgroundColor = colors.themewhite;
    }
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    
   
   
  //  NSString *type = cell.type;
    
    
    
   
    NSLog(@"touched row at index %lu",indexPath.row);
    
    NSLog(@"total number of row is %lu",(unsigned long)[self.data count]);
    
    

    [self dismissKeyboard];

    [tableView beginUpdates];
  
    
    [self scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];

    [tableView endUpdates];
   

}





- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{   //wrong

    int rowHeight = 200;

    
    return rowHeight;
}



-(void)dismissKeyboard {
   
    [self endEditing:YES];
    
}

@end
