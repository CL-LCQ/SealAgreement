//
//  HomePageController.m
//  SealApp
//
//  Created by Charles Leclercq on 15/08/2016.
//  Copyright © 2016 Seal. All rights reserved.
//

#import "HomePageController.h"

@interface HomePageController ()

@end

@implementation HomePageController

@synthesize  userLogic,uILib,sealCell;
@synthesize sharedSealObject,sealBloc,sealBlocWhat, sealBlocTime, sealBlocValue;

@synthesize  createView;
@synthesize profileList,profileView,tableDataSection01;
@synthesize libraryView,libraryList,templateScroller,colors;
    @synthesize createButton,libraryButton,profileButton,settingsButton;


@synthesize templateView, showTemplateView;

- (void)viewDidLoad {
    [super viewDidLoad];
   

    //inititalizing
    sharedSealObject = [SealObject sharedManager];

    userLogic = [[UserLogic alloc]init];
    uILib = [[UILib alloc]initWithViewC:self];
    
    sealCell = [[sealCellTableViewCell alloc]init];
    colors = [[Colors alloc]init];
    
    
    //lib
    [self initializeLibraryView];
    //profile
    [self initializeProfileView];
  
    
    //create sealTool bar

    //initialize the views
    [uILib setCreateView];
    



    
    
    //initialize the subviews
    [self initializeWhatBLocks];

    [self initializeTermBLocks];
//    
    [self initializeTimeBLocks];
//    
    [self initializeValueBLocks];
    
    [uILib insertSealToolbar];
    [self initializeTopSealBar];
    
    //create top optionbar
    [uILib insertTopOptionbar];
    [self initializeTopOptionBar];
  
    
    UIView *topTracker = [[UIView alloc]initWithFrame:[uILib topTracker]];
    [topTracker setBackgroundColor:colors.menured];
    
    [self.view addSubview:topTracker];
    
    profileList.separatorColor = [UIColor clearColor];


    
    }


-(void)viewWillAppear:(BOOL)animated{

  //  [sharedSealObject resetObject];


}
#pragma Mark -  UI init



-(void)sendSeal{
    [self performSegueWithIdentifier:@"goToSend" sender:self];
}
-(void)initializeTopOptionBar{

   settingsButton = [uILib.topOptionbar viewWithTag:1];
  profileButton = [uILib.topOptionbar viewWithTag:2];
  createButton = [uILib.topOptionbar viewWithTag:3];
  libraryButton = [uILib.topOptionbar viewWithTag:4];
    
    
    UIImage *normalImage=[UIImage imageNamed:@"profile_normal"];
    UIImage *selectedImage =[UIImage imageNamed:@"profile_selected"];
    UIEdgeInsets imageInset =  UIEdgeInsetsMake(5,5,5,5);

    [profileButton setImage:normalImage forState:UIControlStateNormal];
    [profileButton setImage:selectedImage forState:UIControlStateSelected];
    profileButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    profileButton.imageEdgeInsets = imageInset;
    
    normalImage=[UIImage imageNamed:@"create_normal"];
    selectedImage =[UIImage imageNamed:@"create_selected"];
    [createButton setImage:normalImage forState:UIControlStateNormal];
    [createButton setImage:selectedImage forState:UIControlStateSelected];
    createButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    createButton.imageEdgeInsets = imageInset;
    
    normalImage=[UIImage imageNamed:@"library_normal"];
    selectedImage =[UIImage imageNamed:@"library_selected"];
    [libraryButton setImage:normalImage forState:UIControlStateNormal];
    [libraryButton setImage:selectedImage forState:UIControlStateSelected];
    libraryButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    libraryButton.imageEdgeInsets = imageInset;
    
    normalImage=[UIImage imageNamed:@"settings_normal"];
    selectedImage =[UIImage imageNamed:@"settings_selected"];
    [settingsButton setImage:normalImage forState:UIControlStateNormal];
    [settingsButton setImage:selectedImage forState:UIControlStateSelected];
    settingsButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    settingsButton.imageEdgeInsets = imageInset;
    
    [settingsButton setTitle:@"Settings" forState:UIControlStateNormal];
    [settingsButton addTarget:self action:@selector(topBarActions:) forControlEvents:UIControlEventTouchUpInside];
    [profileButton setTitle:@"Profile" forState:UIControlStateNormal];
    [profileButton addTarget:self action:@selector(topBarActions:) forControlEvents:UIControlEventTouchUpInside];
    [createButton setTitle:@"New" forState:UIControlStateNormal];
    [createButton addTarget:self action:@selector(topBarActions:) forControlEvents:UIControlEventTouchUpInside];
    [libraryButton setTitle:@"Library" forState:UIControlStateNormal];
    [libraryButton addTarget:self action:@selector(topBarActions:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [createButton setSelected:YES];
    [self showNew];
    
    

}

-(void)topBarActions:(id)sender{
    
    
    for (UIView *button in uILib.topOptionbar.subviews) {
        if ([button isKindOfClass:[UIButton class]]) {
            [(UIButton *)button setSelected:NO];
        }
    }
    
    [sender setSelected:YES];


    
    if ([sender tag] == 1) {
        [self goToSettings];
    }
    else if([sender tag] == 2){
        [self goToProfile];
    
    }
    else if([sender tag] == 3){
        [self showNew];
        
    }
    else if([sender tag] == 4){
        [self showLibrary];
        
    }



}




-(void)initializeTopSealBar{

    UIButton *whatButton =  [uILib.topSealToolbar viewWithTag:1];
    UIButton *valueButton =  [uILib.topSealToolbar viewWithTag:2];
    UIButton *termButton =  [uILib.topSealToolbar viewWithTag:3];
    UIButton *deadlineButton =  [uILib.topSealToolbar viewWithTag:4];
    UIButton *validButton =  [uILib.topSealToolbar viewWithTag:5];
    
    UIImage *normalImage=[UIImage imageNamed:@"what_normal"];
    UIImage *selectedImage =[UIImage imageNamed:@"what_selected"];
    UIEdgeInsets imageInset =  UIEdgeInsetsMake(5 , 10, whatButton.frame.size.height - (whatButton.frame.size.width), 10);
    CGRect labelFrame = CGRectMake(0, whatButton.frame.size.height-whatButton.frame.size.height/3, whatButton.frame.size.width, whatButton.frame.size.height/3);
    UILabel *buttonTitle = [[UILabel alloc]initWithFrame:labelFrame];
    buttonTitle.textAlignment = NSTextAlignmentCenter;
    buttonTitle.font = [UIFont fontWithName:@"Gill Sans" size:12];
    buttonTitle.textColor = colors.themeblack;
    NSData *archivedData = [NSKeyedArchiver archivedDataWithRootObject: buttonTitle];
   // UIButton *buttonCopy = [NSKeyedUnarchiver unarchiveObjectWithData: archivedData];

    
    [whatButton setImage:normalImage forState:UIControlStateNormal];
    [whatButton setImage:selectedImage forState:UIControlStateSelected];
    whatButton.imageEdgeInsets = imageInset;
    whatButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    buttonTitle.text = @"What";
    [whatButton addSubview:buttonTitle];
    [whatButton setSelected:YES];
    
    normalImage=[UIImage imageNamed:@"value_normal"];
    selectedImage =[UIImage imageNamed:@"value_selected"];
    [valueButton setImage:normalImage forState:UIControlStateNormal];
    [valueButton setImage:selectedImage forState:UIControlStateSelected];
   valueButton.imageEdgeInsets = imageInset;
    valueButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    UILabel *newLabel = [NSKeyedUnarchiver unarchiveObjectWithData: archivedData];
    newLabel.text = @"Value";
    [valueButton addSubview:newLabel];
    
    normalImage=[UIImage imageNamed:@"terms_normal"];
    selectedImage =[UIImage imageNamed:@"terms_selected"];
    [termButton setImage:normalImage forState:UIControlStateNormal];
    [termButton setImage:selectedImage forState:UIControlStateSelected];
    termButton.imageEdgeInsets = imageInset;
    termButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    UILabel *newLabel01 = [NSKeyedUnarchiver unarchiveObjectWithData: archivedData];
    newLabel01.text = @"Terms";
    [termButton addSubview:newLabel01];
    
    normalImage=[UIImage imageNamed:@"time_normal"];
    selectedImage =[UIImage imageNamed:@"time_selected"];
    [deadlineButton setImage:normalImage forState:UIControlStateNormal];
    [deadlineButton setImage:selectedImage forState:UIControlStateSelected];
    deadlineButton.imageEdgeInsets = imageInset;
    deadlineButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    UILabel *newLabel02 = [NSKeyedUnarchiver unarchiveObjectWithData: archivedData];
    newLabel02.text = @"Time";
    [deadlineButton addSubview:newLabel02];
    
    normalImage=[UIImage imageNamed:@"confirm_normal"];
    selectedImage =[UIImage imageNamed:@"confirm_selected"];
    [validButton setImage:normalImage forState:UIControlStateNormal];
    [validButton setImage:selectedImage forState:UIControlStateSelected];
    validButton.imageEdgeInsets = imageInset;
    validButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    UILabel *newLabel03 = [NSKeyedUnarchiver unarchiveObjectWithData: archivedData];
    newLabel03.text = @"Confirm";
    [validButton addSubview:newLabel03];


    [whatButton addTarget:self action:@selector(sealToolbarTouched:) forControlEvents:UIControlEventTouchUpInside];
    [valueButton addTarget:self action:@selector(sealToolbarTouched:) forControlEvents:UIControlEventTouchUpInside];
    [termButton addTarget:self action:@selector(sealToolbarTouched:) forControlEvents:UIControlEventTouchUpInside];
    [deadlineButton addTarget:self action:@selector(sealToolbarTouched:) forControlEvents:UIControlEventTouchUpInside];
    [validButton addTarget:self action:@selector(sendSeal) forControlEvents:UIControlEventTouchUpInside];
    
    
//    [whatButton setTitle:@"What" forState:UIControlStateNormal];
//    [valueButton setTitle:@"Value" forState:UIControlStateNormal];
//    [termButton setTitle:@"Terms" forState:UIControlStateNormal];
//    [deadlineButton setTitle:@"Time" forState:UIControlStateNormal];
//    [validButton setTitle:@"Confirm" forState:UIControlStateNormal];
    


}

-(void)sealToolbarTouched:(id)sender{
    
    for (UIView *button in uILib.topSealToolbar.subviews) {
        if ([button isKindOfClass:[UIButton class]]) {
            [(UIButton *)button setSelected:NO];
        }
    }

    
    [uILib setFrameOnTouch:sender];
    [sender setSelected:YES];
}


-(void)initializeProfileView{

    profileView = [[UIView alloc]initWithFrame:[uILib  frameMinusTopBar]];
    [profileView setBackgroundColor:colors.sealblue];
    profileList= [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
   
    tableDataSection01 = [[NSArray alloc]initWithObjects:@"Username",@"Photo",@"",@"", nil];
    profileList.delegate = self;
    profileList.dataSource = self;
    [profileView addSubview:profileList];

    [self.view addSubview:profileView];
}

-(void)initializeLibraryView{
    
    libraryView = [[UIView alloc]initWithFrame:[uILib  frameMinusTopBar]];
    [libraryView setBackgroundColor:colors.sealblue];

    [self.view addSubview:libraryView];

    libraryList= [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    libraryList.frame = self.view.frame;
    
    libraryList.delegate = self;
    libraryList.dataSource = self;
    
    PFQuery *query = [PFQuery queryWithClassName:@"Agreement"];
    if ([[PFUser currentUser] objectId] == nil) {
        NSLog(@"No objectID");}
    else {
        [query whereKey:@"recipients" equalTo:[[PFUser currentUser]objectId]];
        
        [query orderByDescending:@"createdAt"];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (error) {
                NSLog(@"Error: %@ %@", error, [error userInfo]);
            }
            else {
                // We found messages
                self.messages = objects;
                [self.libraryList reloadData];
                NSLog(@"Retrieved %lu Agreements", (unsigned long)[self.messages count]);
                
            }
        }];
    }
    
    [libraryView addSubview:libraryList];

}



#pragma mark - BLOCKS createView setup
//this is the setup for creating agreements with seal blocks and auto feed
//should be subclassed later


-(void)initializeWhatBLocks{
    CGRect frame = uILib.whatView.frame;
    sealBlocWhat= [[sealBlock alloc]initWithFrame:frame style:UITableViewStylePlain type:@"SCOPE"];
    [sealBlocWhat configureBlocsInView:[uILib whatView]];
}

-(void)initializeTermBLocks{
    CGRect frame = uILib.whatView.frame;
    sealBloc = [[sealBlock alloc]initWithFrame:frame style:UITableViewStylePlain type:@"TERM"];
    [sealBloc configureBlocsInView:[uILib termView]];
}
-(void)initializeTimeBLocks{
    CGRect frame = uILib.whatView.frame;
    sealBlocTime = [[sealBlock alloc]initWithFrame:frame style:UITableViewStylePlain type:@"TIME"];
    [sealBlocTime configureBlocsInView:[uILib deadlineView]];
}
-(void)initializeValueBLocks{
    CGRect frame = uILib.whatView.frame;
    sealBlocValue = [[sealBlock alloc]initWithFrame:frame style:UITableViewStylePlain type:@"VALUE"];
    [sealBlocValue configureBlocsInView:[uILib valueView]];
}

-(void)addTemplate:(id)sender{
  
    int i=  [sender tag];
    [sealCell addTemplateAtIndex:i];

}


-(void)displayTemplateView{

    if(_isTemplateShown == true){
        templateView.frame =[uILib bottomRectangle];
        _isTemplateShown = false;
    }

    else if(_isTemplateShown == false){
    
        templateView.frame = [uILib templateViewFrame];
        _isTemplateShown = true;
    }
}






















/////////////////////



#pragma mark - LibrarySetup
-(void)setupLibData{



}

#pragma mark - Navigation

//showup
-(void)goToSettings{
    [self hideNew];
    [self performSegueWithIdentifier:@"goToSettings" sender:self];
}



-(void)goToProfile{
    [self hideNew];
    [self.view insertSubview:profileView aboveSubview:libraryView];


}





-(void)showNew{
    //on top of everything
    
    [UIView animateWithDuration:0.3f delay:0.0f options: UIViewAnimationCurveEaseIn animations:^{
                         [uILib.topSealToolbar  setFrame:[uILib sealbarFrameShow]];} completion:nil];
    
    [UIView animateWithDuration:0.3f delay:0.0f options: UIViewAnimationCurveEaseIn animations:^{
        [uILib.CreateContainerView setFrame:[uILib createViewContainer]];} completion:nil];
    



}



-(void)showLibrary{
    
    [self hideNew];
    
    [self.view insertSubview:libraryView aboveSubview:profileView];
    
   
}


//Hiding

-(void)hideNew{
    [UIView animateWithDuration:0.3f delay:0.0f options: UIViewAnimationCurveEaseIn animations:^{
        [uILib.topSealToolbar  setFrame:[uILib sealbarFrameHide]]; }completion:nil];
    
    [UIView animateWithDuration:0.3f delay:0.0f options: UIViewAnimationCurveEaseIn animations:^{
        [uILib.CreateContainerView setFrame:[uILib createViewContainerHidden]];} completion:nil];
    
}


#pragma Mark- TableView
//2 tableview one for profile, and one for list

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == profileList) {
        return 2;
    }
    
    
    if(tableView == libraryList){
        return 1;}
    
    
    else {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger count = 0;
    if (tableView == profileList) {
        if ( section == 0) {
            count = [tableDataSection01 count]-1;
        }
        if ( section == 1) {
            count = 1;
        }
       
     }
    
    
    if(tableView == libraryList){
        count = [self.messages count];

    }
    
    

 return count;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    if (tableView == profileList) {

        if (indexPath.section == 0) {
            if (indexPath.row == 1) {
                
                
                
                
                return [uILib profilePictureFrame].size.height;
            }
        }
    }
    return 44;
}



//format cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"newCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (tableView == profileList) {

        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        }

        if (indexPath.section ==0) {
            cell.textLabel.text= [tableDataSection01 objectAtIndex:indexPath.row];
           

        
        }
        else if(indexPath.section ==1){
            cell.textLabel.text= @"LOGOUT";
        }
        
        
        if ([cell.textLabel.text isEqualToString:@"Photo"]) {
            
                    
            UIView *profilePic = [[UIView alloc]initWithFrame:[uILib profilePictureFrame]];
            UIImageView *profilePicture = [[UIImageView alloc]initWithImage:[uILib ProfilePicture]];
            profilePicture.frame = profilePic.frame;
            
            UIImageView *profilePictureFrame = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"profile_round_border"]];
            profilePictureFrame.frame = profilePic.frame;
            
            [profilePic addSubview:profilePicture];
            [profilePic addSubview:profilePictureFrame];
            
            [cell addSubview:profilePic];
        
            
            
        }

        
    }
  
    if(tableView == libraryList){
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        }
        
        
        
        PFObject *message = [self.messages objectAtIndex:indexPath.row];
        cell.textLabel.text = [message objectForKey:@"agreementWhat"];

    
    
    }

    
    
    
    cell.textLabel.font = [UIFont fontWithName:@"Gill Sans" size:20];
    
    return cell;
}



-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSLog(@"touched %@", indexPath);
    if (tableView == profileList) {
        if (indexPath.section == 1 && indexPath.row == 0) {
            
            [userLogic userLogout];
            [self.navigationController popToRootViewControllerAnimated:YES];
        }

    }
    if(tableView == libraryList){
//        self.selectedMessage = [self.messages objectAtIndex:indexPath.row];
//        NSString *fileType = [self.selectedMessage objectForKey:@"fileType"];
//        NSLog(@"touched %@", indexPath);
        
        //NSalert
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Feature coming soon!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];




        
    }
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    
    if (tableView == profileList) {
        
        switch (section)
        {
            case 0:
                sectionName = @"";
                break;
            case 1:
                sectionName = @"";
                break;
                // ...
            default:
                sectionName = @"";
                break;
        }

       
    }
        
    
    if(tableView == libraryList){
        
        
    }

    
      return sectionName;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
   if(tableView == libraryList){
       if (indexPath.row%2 == 0) {
        
            UIColor *altCellColor = [UIColor colorWithWhite:0.7 alpha:0.1];
            cell.backgroundColor = altCellColor;
        }
    
        else{
            cell.backgroundColor = [UIColor whiteColor];
        }
   }
   else{
       cell.backgroundColor = [UIColor whiteColor];
   }
}






@end
