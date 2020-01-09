//
//  SignInViewController.m
//  SealApp
//
//  Created by Charles Leclercq on 15/08/2016.
//  Copyright © 2016 Seal. All rights reserved.
//

#import "SignInViewController.h"

@interface SignInViewController ()

@end

@implementation SignInViewController
@synthesize usernameField,emailField,passwordField, customUI, userLogic,orLabel;
@synthesize SignUpButton,LoginButton,FBSignUpButton,GGSignUpButton, colors;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    
    //classes
    self.userLogic = [[UserLogic alloc]init];
    customUI = [[UILib alloc]initWithViewC:self];
    colors = [[Colors alloc]init];
    
    usernameField = [[UITextField alloc]initWithFrame:[customUI RectangleAtPos:2]];
    [usernameField setBorderStyle:UITextBorderStyleRoundedRect];
    [usernameField setPlaceholder:@"Username"];
    
    
    passwordField = [[UITextField alloc]initWithFrame:[customUI RectangleAtPos:3]];
    [passwordField setBorderStyle:UITextBorderStyleRoundedRect];
    [passwordField setPlaceholder:@"Password"];
    passwordField.secureTextEntry = YES;
    
    emailField = [[UITextField alloc]initWithFrame:[customUI RectangleAtPos:4]];
    [emailField setBorderStyle:UITextBorderStyleRoundedRect];
    [emailField setPlaceholder:@"Email"];

    LoginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [LoginButton addTarget:self
                    action:@selector(userLogin)
          forControlEvents:UIControlEventTouchUpInside];
    [LoginButton setTitle:@"LOGIN" forState:UIControlStateNormal];
    LoginButton.frame = [customUI RectangleAtPos:4];
    [LoginButton setTitleColor:colors.themeblack forState:UIControlStateNormal];
    LoginButton.backgroundColor = colors.menubkggrey;
    
    
    orLabel = [[UILabel alloc]initWithFrame: [customUI RectangleAtPos:5]];
    orLabel.text = @"Or";
    orLabel.textAlignment = NSTextAlignmentCenter;
    
    
    FBSignUpButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [FBSignUpButton addTarget:self
                     action:@selector(userFBSignUp)
           forControlEvents:UIControlEventTouchUpInside];
    [FBSignUpButton setTitle:@"FACEBOOK" forState:UIControlStateNormal];
    FBSignUpButton.frame = [customUI RectangleAtPos:6];
    [FBSignUpButton setTitleColor:colors.themeblack forState:UIControlStateNormal];
    FBSignUpButton.backgroundColor = colors.menubkggrey;
    
    GGSignUpButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [GGSignUpButton addTarget:self
                       action:@selector(userFBSignUp)
             forControlEvents:UIControlEventTouchUpInside];
    [GGSignUpButton setTitle:@"GOOGLE" forState:UIControlStateNormal];
    GGSignUpButton.frame = [customUI RectangleAtPos:7];
    [GGSignUpButton setTitleColor:colors.themeblack forState:UIControlStateNormal];
    GGSignUpButton.backgroundColor = colors.menubkggrey;

    
    SignUpButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [SignUpButton addTarget:self
                     action:@selector(userSignUp)
           forControlEvents:UIControlEventTouchUpInside];
    [SignUpButton setTitle:@"SIGNUP" forState:UIControlStateNormal];
    SignUpButton.frame = [customUI RectangleAtPos:8];
    [SignUpButton setTitleColor:colors.themeblack forState:UIControlStateNormal];
    SignUpButton.backgroundColor = colors.menubkggrey;


    

    
    
    
    
    SignUpButton.titleLabel.font = [UIFont fontWithName:@"Gill Sans" size:20];
    LoginButton.titleLabel.font = [UIFont fontWithName:@"Gill Sans" size:20];
    usernameField.font =[UIFont fontWithName:@"Gill Sans" size:20];
    passwordField.font = [UIFont fontWithName:@"Gill Sans" size:20];
    emailField.font = [UIFont fontWithName:@"Gill Sans" size:20];
    

    
    [self.view addSubview:passwordField];
    [self.view addSubview:usernameField];

    [self.view addSubview:LoginButton];
    [self.view addSubview:orLabel];
    [self.view addSubview:SignUpButton];
    [self.view addSubview:FBSignUpButton];
    [self.view addSubview:GGSignUpButton];

    [self.view setBackgroundColor:colors.sealblue];
    
    //create UI for login
    //Create UI for signup
    
}

-(void)dismissKeyboard {
    [usernameField resignFirstResponder];
    [emailField resignFirstResponder];
    [passwordField resignFirstResponder];
    
}

- (void) userLogin{
    
    NSLog(@"login");
    [userLogic LoginWithUsername:usernameField andPassword:passwordField withNav:self.navigationController];
    
    
}




- (void)userSignUp{
    
    [self performSegueWithIdentifier:@"goToCreation" sender:self];
    
}



-(void)userFBSignUp{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Feature coming soon" message:@"3rd party Login will be implemented in the next version" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle: @"OK" style: UIAlertActionStyleCancel handler: nil];
    
    [alert addAction: defaultAction];

    [self presentViewController:alert animated:YES completion:nil];
}

@end
