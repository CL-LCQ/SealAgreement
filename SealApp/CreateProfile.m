//
//  CreateProfile.m
//  SealApp
//
//  Created by Charles Leclercq on 15/08/2016.
//  Copyright © 2016 Seal. All rights reserved.
//

#import "CreateProfile.h"

@interface CreateProfile ()

@end

@implementation CreateProfile

@synthesize nextButton, uILib, colors;
@synthesize usernameField,emailField,passwordField, userLogic;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.userLogic = [[UserLogic alloc]init];
    uILib = [[UILib alloc]initWithViewC:self];
    [uILib insertTopBackbar];
    colors = [[Colors alloc]init];
    
    nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [nextButton addTarget:self action:@selector(createProfile) forControlEvents:UIControlEventTouchUpInside];
    [nextButton setTitle:@"Create profile" forState:UIControlStateNormal];
    nextButton.frame = [uILib bottomRectangle];
    [nextButton setTitleColor:colors.themeblack forState:UIControlStateNormal];
    nextButton.backgroundColor = colors.menubkggrey;
  
    [self.view setBackgroundColor:colors.sealblue];
   
    
    
  
    
    
    usernameField = [[UITextField alloc]initWithFrame:[uILib RectangleAtPos:2]];
    [usernameField setBorderStyle:UITextBorderStyleRoundedRect];
    [usernameField setPlaceholder:@"Username"];
    
    
    passwordField = [[UITextField alloc]initWithFrame:[uILib RectangleAtPos:3]];
    [passwordField setBorderStyle:UITextBorderStyleRoundedRect];
    [passwordField setPlaceholder:@"Password"];
    passwordField.secureTextEntry = YES;
    
    emailField = [[UITextField alloc]initWithFrame:[uILib RectangleAtPos:4]];
    [emailField setBorderStyle:UITextBorderStyleRoundedRect];
    [emailField setPlaceholder:@"Email"];
    
    
    [self.view addSubview:usernameField];
    [self.view addSubview: passwordField];
    [self.view addSubview:emailField];
    
    usernameField.inputAccessoryView = [self configureKeyboard];
    passwordField.inputAccessoryView = [self configureKeyboard];
    emailField.inputAccessoryView = [self configureKeyboard];
    
    
    [self.view addSubview:nextButton];


}


- (void)createProfile{

    [userLogic RegisteruserNamed:usernameField Password:passwordField email:emailField ToNavigation:self.navigationController];


}

-(UIToolbar*)configureKeyboard{
    
    UIToolbar *keyboardToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    keyboardToolbar.barStyle = UIBarStyleDefault;
    keyboardToolbar.items = [NSArray arrayWithObjects:
                             
                             
                             [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                             
                             [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(dismissKeyboard)],
                             nil];
    
    [keyboardToolbar sizeToFit];
    
    return  keyboardToolbar;
    
}

-(void)dismissKeyboard{
    
    [self.view endEditing:YES];
    
}



@end
