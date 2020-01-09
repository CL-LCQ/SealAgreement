//
//  UserLogic.m
//  SealApp
//
//  Created by Charles Leclercq on 15/08/2016.
//  Copyright © 2016 Seal. All rights reserved.
//

#import "UserLogic.h"

@implementation UserLogic



-(PFUser*)currentUser{
    
    PFUser *currentUser = [PFUser currentUser];
    return currentUser;
    
}

//registeruser
-(void)RegisteruserNamed:(UITextField*)usernameField Password:(UITextField*)passwordField email:(UITextField*)emailField ToNavigation:(UINavigationController*)navigation{
    
    NSString *username = [usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *email = [emailField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    // NSString *phone = [phoneField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([username length] ==0 || [password length] == 0 || [email length] ==0) {
        
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:[NSString stringWithFormat:NSLocalizedString(@"sorry", nil)] message:[NSString stringWithFormat:NSLocalizedString(@"Please complete all the fields", nil)] delegate:nil cancelButtonTitle:[NSString stringWithFormat:NSLocalizedString(@"ok", nil)] otherButtonTitles: nil];
        
        [alertView show];
    }
    
    else {
        
        PFUser *user = [PFUser user];
        user.username = username;
        user.password = password;
        user.email = email;
        
        //user[@"phone"] = phone;
        //user[@"Achievements"] = @"000-000-000-000-000-000-000-000";
        
        //[user objectForKey::@"phone"];
        // [user setObject:phone forKey:@"phone"];
        
        
        
        
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (error) {
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:[NSString stringWithFormat:NSLocalizedString(@"Sorry", nil)] message:[NSString stringWithFormat:NSLocalizedString(@"An error occured, is your network avaialble?", nil)] delegate:nil cancelButtonTitle:[NSString stringWithFormat:NSLocalizedString(@"ok", nil)] otherButtonTitles:nil];
                [alertView show];
            }
            else {
                
                NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
                
                //writting
                [standardUserDefaults setObject:user.username forKey:@"username"];
                
                [standardUserDefaults synchronize];
                
                
                
                [navigation popToRootViewControllerAnimated:YES];
                
                
            }
        }];
        
    }
 
}



//loginUser
-(void)LoginWithUsername:(UITextField*)usernameField  andPassword:(UITextField*)passwordField withNav:(UINavigationController*)navigation{
    
     NSLog(@"login function called...");
    
    
    NSString *username = [usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([username length] ==0 || [password length] == 0) {
        
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:[NSString stringWithFormat:NSLocalizedString(@"sorry", nil)] message:[NSString stringWithFormat:NSLocalizedString(@"wrong_login", nil)] delegate:nil cancelButtonTitle:[NSString stringWithFormat:NSLocalizedString(@"ok", nil)] otherButtonTitles: nil];
        
        [alertView show];
    }
    
    else{
        [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser *user, NSError *error ){
            if (error) {
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Your Login or Password are wrong!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alertView show];
            }
            else {
                
                NSLog(@"Successfully logged in");
              
                NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
                [standardUserDefaults setObject:username forKey:@"username"];

                
                [standardUserDefaults synchronize];
                
                [navigation popToRootViewControllerAnimated:YES];
                
            }
            
        }];
    }
    
    
    
}


-(BOOL)isUserConnected{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    NSString *name = [standardUserDefaults stringForKey:@"username"];
    
    
    
    if (![self currentUser] || ![ standardUserDefaults objectForKey:@"username" ] || name  == nil) {
        return NO;
    }
    else return YES;
    
}


-(void)userLogout{
    
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    
    NSString *name = @"unknown user";
    [standardUserDefaults setObject:name forKey:@"username"];
    [standardUserDefaults synchronize];
    
    [PFUser logOut];
       
    
    
    
    
}


@end
