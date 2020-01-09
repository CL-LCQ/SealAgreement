//
//  UserLogic.h
//  SealApp
//
//  Created by Charles Leclercq on 15/08/2016.
//  Copyright © 2016 Seal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface UserLogic : NSObject

@property NSUserDefaults *standardUserDefaults;
@property (strong, nonatomic) NSString *username;


-(void)RegisteruserNamed:(UITextField*)usernameField Password:(UITextField*)passwordField email:(UITextField*)emailField ToNavigation:(UINavigationController*)navigation;

-(void)LoginWithUsername:(UITextField*)usernameField  andPassword:(UITextField*)passwordField withNav:(UINavigationController*)navigation;

-(BOOL)isUserConnected;

-(PFUser*)currentUser;

-(void)userLogout;



@end
