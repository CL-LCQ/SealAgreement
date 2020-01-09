//
//  ViewController.m
//  SealApp
//
//  Created by Charles Leclercq on 15/08/2016.
//  Copyright © 2016 Seal. All rights reserved.
//

#import "StartViewController.h"

@interface StartViewController ()

@end

@implementation StartViewController
@synthesize userLogic;

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.hidden = YES;

    
     NSLog(@"Startup manager..");

}


-(void)viewWillAppear:(BOOL)animated{
    
    //here sho the warning and skip
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Welcome"
                                                    message:@"Seal does not provide legal advice and is not a law firm or a substitute of a lawyer. By using Seal, you agree to our terms of use."
                                                   delegate:self
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles: nil];
    [alert show];

    
    
  //  userLogic = [[UserLogic alloc]init];
   // [self isUserLoggedin];
     [self performSegueWithIdentifier:@"goToHome" sender:self];

}


#pragma mark - User checkin
-(void)isUserLoggedin{
    
    bool userChecker;

    userChecker = userLogic.isUserConnected;
    
    if (userChecker == TRUE) {
        
        NSLog(@"user is connected");
        [self performSegueWithIdentifier:@"goToHome" sender:self];

    }
    else{
    
        
        NSLog(@"user isn't recognized");
        [self performSegueWithIdentifier:@"goToIntro" sender:self];


    }

}

@end
