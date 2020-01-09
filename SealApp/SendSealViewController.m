//
//  SendSealViewController.m
//  SealApp
//
//  Created by Charles Leclercq on 17/08/2016.
//  Copyright © 2016 Seal. All rights reserved.
//

#import "SendSealViewController.h"

@interface SendSealViewController ()

@end

@implementation SendSealViewController

@synthesize sharedSealObject;
@synthesize emailLayout;
@synthesize addUserField;
@synthesize uILib;
@synthesize clientNameTextField,clientEmailTextField,addressTextField,colors;
@synthesize selfSend;
    
@synthesize sizex,sizey,validateButton;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    emailLayout = [[LayoutEmail alloc]init];
    self.userLogic = [[UserLogic alloc]init];
    self.recipients = [[NSMutableArray alloc]init];
    self.recipientsEmail = [[NSMutableArray alloc]init];
    uILib = [[UILib alloc]initWithViewC:self];
    [uILib insertTopBackbar];
    colors = [[Colors alloc]init];
    
    UILabel *infoLabel = [[UILabel alloc]initWithFrame:[uILib bigLongRectangleAtPos:3]];
    infoLabel.text = @"This agreement is made effective for all purposes in all respects between you and your Client.";
    infoLabel.textColor = colors.themewhite;
    infoLabel.textAlignment = NSTextAlignmentCenter;
    infoLabel.font = [UIFont fontWithName:@"Gill Sans" size:18];
    infoLabel.lineBreakMode = NSLineBreakByWordWrapping;
    infoLabel.numberOfLines = 0;
    
    clientNameTextField = [[UITextField alloc]initWithFrame:[uILib longRectangleAtPos:1]];
    clientNameTextField.delegate = self;
    [clientNameTextField setPlaceholder:@"Client's Name"];
    clientNameTextField.font = [UIFont fontWithName:@"Gill Sans" size:16];
    [clientNameTextField setBorderStyle:UITextBorderStyleRoundedRect];
    
    clientEmailTextField = [[UITextField alloc]initWithFrame:[uILib longRectangleAtPos:2]];
    [clientEmailTextField setPlaceholder:@"Client's Email"];
    clientEmailTextField.font = [UIFont fontWithName:@"Gill Sans" size:18];
    [clientEmailTextField setBorderStyle:UITextBorderStyleRoundedRect];


    addressTextField = [[UITextField alloc]initWithFrame:[uILib longRectangleAtPos:3]];
    [addressTextField setPlaceholder:@"Client's address"];
    addressTextField.font = [UIFont fontWithName:@"Gill Sans" size:18];
    [addressTextField setBorderStyle:UITextBorderStyleRoundedRect];
    
   clientNameTextField.inputAccessoryView = [self configureKeyboard];
   clientEmailTextField.inputAccessoryView = [self configureKeyboard];
    addressTextField.inputAccessoryView = [self configureKeyboard];
 
    [clientNameTextField addTarget:self action:@selector(saveTextField:) forControlEvents:UIControlEventEditingDidEnd];
    [clientEmailTextField addTarget:self action:@selector(saveTextField:) forControlEvents:UIControlEventEditingDidEnd];
    [addressTextField addTarget:self action:@selector(saveTextField:) forControlEvents:UIControlEventEditingDidEnd];

    
    

    [self.view addSubview:clientNameTextField];
    [self.view addSubview:clientEmailTextField];
    [self.view addSubview:addressTextField];
    [self.view addSubview:infoLabel];
    
    [self.view setBackgroundColor:colors.sealblue];
    

    
    validateButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [validateButton addTarget:self
                       action:@selector(validateAgreement)
             forControlEvents:UIControlEventTouchUpInside];
    [validateButton setTitle:@"Confirm and Send" forState:UIControlStateNormal];
    validateButton.titleLabel.font = [UIFont fontWithName:@"Gill Sans" size:20];
    validateButton.frame = [uILib bottomRectangle];
    [validateButton setTitleColor:colors.themeblack forState:UIControlStateNormal];
    validateButton.backgroundColor = colors.menubkggrey;
    
    selfSend =  [UIButton buttonWithType:UIButtonTypeCustom];

    [selfSend setTitle:@"Send as draft to yourself" forState:UIControlStateNormal];
    [selfSend addTarget:self
                       action:@selector(selfSendSeal)
             forControlEvents:UIControlEventTouchUpInside];

    selfSend.titleLabel.font = [UIFont fontWithName:@"Gill Sans" size:20];
    //selfSend.frame = [uILib bottomRectangle];
    selfSend.frame = CGRectMake(0, validateButton.frame.origin.y - validateButton.frame.size.height, validateButton.frame.size.width, validateButton.frame.size.height);
    
    
    
    
    [selfSend setTitleColor:colors.themeblack forState:UIControlStateNormal];
    selfSend.backgroundColor = colors.icongrey;

    
  
    
    [self.view addSubview:validateButton];
    [self.view addSubview:selfSend];
    

    
    
}


-(void)saveTextField:(id)sender{
    
    itemStructure *newItem  =[[itemStructure alloc]init];
    newItem.Title = clientNameTextField.text;
    newItem.Description = clientEmailTextField.text;
    newItem.Rate= addressTextField.text;
    
    if (([sharedSealObject.recipients count]<1)) {
        [sharedSealObject.recipients addObject:newItem.Title];
        [sharedSealObject.emailAddresses addObject:newItem.Description];
        NSLog(@ "added %@", sharedSealObject.emailAddresses);

    }
    
    else{
        [sharedSealObject.recipients replaceObjectAtIndex:0 withObject:newItem.Title];
        [sharedSealObject.emailAddresses replaceObjectAtIndex:0 withObject:newItem.Description];
        NSLog(@ "replaced %@", sharedSealObject.emailAddresses);

    }
    


    
    NSLog(@" %@", sharedSealObject.recipients);
     }

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    sharedSealObject = [SealObject sharedManager];
    
 
    
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

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}




- (void) uploadMessage{
    //sharedSealObject = [SealObject sharedManager];
    [sharedSealObject verifyObject];
    
   
   
    
    [sharedSealObject.recipients addObject:[PFUser currentUser].username];
    [sharedSealObject.emailAddresses addObject:[PFUser currentUser].email];
    NSLog(@"count is %lu", (unsigned long)[sharedSealObject.emailAddresses count]);
    
    self.recipients = sharedSealObject.recipients;
    self.recipientsEmail = sharedSealObject.emailAddresses;
   NSString *what = @"You have received a new agreement";

    PFObject *message = [PFObject objectWithClassName:@"Agreement"];
    
 
     NSLog( @"the name is: %@", self.recipientsEmail);
    
    [message setObject:sharedSealObject.recipients forKey:@"recipientsUsername"];
    
    [message setObject:self.recipients forKey:@"recipients"];
    
    [message setObject:[[PFUser currentUser] objectId] forKey:@"senderId"];
    [message setObject:[[PFUser currentUser] username] forKey:@"senderName"];
    
    [message saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
        if (error){
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Error" message:@"please try sending again" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
        }
        else{
            
            //  [self reset];
        }
    }];
    

    bool *error = true;
    int counter = [self.recipientsEmail count];
    NSString *name;
    for(int i  = 0; i < counter; i++){
        
        NSString *emails = [self.recipientsEmail objectAtIndex:i];
        if (i<(counter-1)) {
            //name = [self.currentSealObject.recipients objectAtIndex:i];
            name = [self.recipients objectAtIndex:i];
            
            NSLog( @"the name is: %@", name);
            
            
        }
        else{
            name = [self.recipientsEmail objectAtIndex:i];
             NSLog( @"the name is: %@", name);
        }
        
        NSString *emailTextHeader= @"Hello ";
        emailTextHeader = [emailTextHeader stringByAppendingString:name];
        emailTextHeader = [emailTextHeader stringByAppendingString:@","];
        
        NSString *emailTextIntro = @"You have received a new Seal agreement from ";
        emailTextIntro = [emailTextIntro stringByAppendingString:[[PFUser currentUser] username]];
        emailTextIntro = [emailTextIntro stringByAppendingString:@". Review the agreement below and use the links at the bottom to confirm or edit the agreement.<br /><br />Best, Seal Agreements Ltd.</p>"];
  
        
        NSString *emailText = @"";
        
        NSLog( @"crash");

       
        NSString *emailBody = [emailLayout HTMLSeal];
        
        
    
        
        
        [PFCloud callFunctionInBackground:@"sendMail" withParameters:@{@"toEmail":emails,@"toName":name,@"fromEmail":@"info@sealagreements.com",@"fromName":@"Seal Agreement",@"text":emailText,@"subject":what,@"html":emailBody}
         
                                    block:^(NSString *result, NSError *error) {
                                        if (!error) {
                                            error = false;
                                            NSLog(@"YO");
                                        }
                                        else{NSLog(@"%@",error);}
                                    }
         
         
         
         
         
         ];
        if(error == false){
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Agreement shared!"
                                                           delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];}
        
        
        
    }
    
    
    
    
}


-(void)validateAgreement{
    
    if (([clientEmailTextField.text length]<1)) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Email address"
                                                        message:@"Please provide at least an email address for the other party."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles: nil];
        [alert show];
    }
    else{
    

    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Confirmation"
                                                    message:@"Are you sure you want to confirm and send this agreement for the other party?"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"OK", nil];
    [alert show];
    }

}

-(void)selfSendSeal{
    [self uploadMessage];
    [sharedSealObject resetObject];
    
    [self.navigationController popToRootViewControllerAnimated:YES];



}
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    // the user clicked OK
    if (buttonIndex == 1) {
        
        [self uploadMessage];
        [sharedSealObject resetObject];

        [self.navigationController popToRootViewControllerAnimated:YES];
        //reset sealobject only if the previous one went through
        
    }
}



@end
