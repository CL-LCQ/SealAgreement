//
//  LayoutEmail.m
//  Seal
//
//  Created by Charles Leclercq on 06/07/2016.
//  Copyright © 2016 Charles Leclercq. All rights reserved.
//

#import "LayoutEmail.h"


@implementation LayoutEmail
@synthesize  sharedSealObject;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(NSString*)HTMLBody{

    NSString *body;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"emailLayout" ofType:@"html"];
    NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    body= content;
    
    //replace placeholders in html file

    return body;
}

- (NSURL *)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory
                                                   inDomains:NSUserDomainMask] lastObject];
}

-(NSString*)HTMLSeal{
    sharedSealObject = [SealObject sharedManager];

//    
    NSError *anError;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"emailLayout" ofType:@"html"];
//create an editable copy
    NSString *newPath = [[self applicationDocumentsDirectory].path stringByAppendingPathComponent:@"emailLayout01.html"];

    NSString *aString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&anError];

    //Header
    //aString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&anError];
    
//use the proxy and replace the tag
    path = newPath;
    if (!aString) {
        NSLog(@"%@", [anError localizedDescription]);
    } else {
        NSString *replacedString = [aString stringByReplacingOccurrencesOfString:@"%Header" withString:sharedSealObject.emailTextHeader];
        [replacedString writeToFile:path atomically:YES encoding:NSWindowsCP1250StringEncoding error:nil];
    }
    
//intro
   //get the whole proxy file again and replace the tag
    aString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&anError];
    
    if (!aString) {
        NSLog(@"%@", [anError localizedDescription]);
    } else {
        NSString *replacedString = [aString stringByReplacingOccurrencesOfString:@"%Intro" withString:sharedSealObject.emailTextIntro];
        [replacedString writeToFile:path atomically:YES encoding:NSWindowsCP1250StringEncoding error:nil];
    }


    
    

    [self replacePlaceholder:@"<!-- S%d -->" inFileNamed:@"scopeLayout" withData:sharedSealObject.what intoPath:path];
    [self replacePlaceholder:@"<!-- W%d -->" inFileNamed:@"timeLayout" withData:sharedSealObject.time intoPath:path];
    [self replacePlaceholder:@"<!-- T%d -->" inFileNamed:@"termLayout" withData:sharedSealObject.terms intoPath:path];
    [self replacePlaceholder:@"<!-- V%d -->" inFileNamed:@"valueLayout" withData:sharedSealObject.value intoPath:path];
    

    
    
    /////////////////////// RECIPIENTS >> need to build the way to add contacts
    
  //   [self replacePlaceholder:@"<!-- R%d -->" inFileNamed:@"recipientsLayout" withData:sharedSealObject.recipients intoPath:path];
    
    NSString *pathForRecipient;
    NSString *recipientString;
    
//    pathForRecipient = [[NSBundle mainBundle] pathForResource:@"recipientsLayout" ofType:@"html"];
//    recipientString = [NSString stringWithContentsOfFile:pathForRecipient encoding:NSUTF8StringEncoding error:&anError];
//    NSString *newPathForRecipient = [[self applicationDocumentsDirectory].path stringByAppendingPathComponent:@"recipientLayout01.html"];
//    [recipientString writeToFile:newPathForRecipient atomically:YES encoding:NSUTF8StringEncoding error:nil];
//    
//    pathForRecipient = newPathForRecipient;
    
    int *recipientCount= [sharedSealObject.recipients count];
    
    for ( int i=0; i<recipientCount ; i++) {
        
        
        pathForRecipient = [[NSBundle mainBundle] pathForResource:@"recipientsLayout" ofType:@"html"];
        recipientString = [NSString stringWithContentsOfFile:pathForRecipient encoding:NSUTF8StringEncoding error:&anError];
        NSString *newPathForRecipient = [[self applicationDocumentsDirectory].path stringByAppendingPathComponent:@"recipientLayout01.html"];
        [recipientString writeToFile:newPathForRecipient atomically:YES encoding:NSUTF8StringEncoding error:nil];
        
        pathForRecipient = newPathForRecipient;
        
        NSLog(@"%d",i);
        NSString *name = [sharedSealObject.recipients objectAtIndex:i];
        NSLog(@"crash 01");
        NSString *email =  [sharedSealObject.emailAddresses objectAtIndex:i];
        NSLog(@"crash 01B");
        NSString *placeHolder = [NSString stringWithFormat:@"<!-- R%d -->",i];
        
        
        /// repeat this as many times as there are terms
        NSLog(@"%@",name);
        NSLog(@"%@",email);

        
        recipientString = [NSString stringWithContentsOfFile:pathForRecipient encoding:NSUTF8StringEncoding error:&anError];
        if (!recipientString) {
            NSLog(@"%@", [anError localizedDescription]);
        } else {
            
            NSString *replacedString = [recipientString stringByReplacingOccurrencesOfString:@"Name" withString:name];
            [replacedString writeToFile:pathForRecipient atomically:YES encoding:NSWindowsCP1250StringEncoding error:nil];
          
        }
        
         NSLog(@"crash 01C");
               //
        //pathForRecipient = [[NSBundle mainBundle] pathForResource:@"recipientsLayout" ofType:@"html"];
        recipientString = [NSString stringWithContentsOfFile:pathForRecipient encoding:NSUTF8StringEncoding error:&anError];
        if (!recipientString) {
            NSLog(@"%@", [anError localizedDescription]);
        } else {
            
            NSString *replacedString = [recipientString stringByReplacingOccurrencesOfString:@"email" withString:email];
            [replacedString writeToFile:pathForRecipient atomically:YES encoding:NSWindowsCP1250StringEncoding error:nil];
        }
 NSLog(@"crash 01D");
        
        //copy to the final one
        //path = [[NSBundle mainBundle] pathForResource:@"emailLayout" ofType:@"html"];
        aString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&anError];
        
        //pathForRecipient = [[NSBundle mainBundle] pathForResource:@"recipientsLayout" ofType:@"html"];
        recipientString = [NSString stringWithContentsOfFile:pathForRecipient encoding:NSUTF8StringEncoding error:&anError];
        
        if (!aString) {
            NSLog(@"%@", [anError localizedDescription]);
        } else {
            NSString *replacedString = [aString stringByReplacingOccurrencesOfString:placeHolder withString:recipientString];
            [replacedString writeToFile:path atomically:YES encoding:NSWindowsCP1250StringEncoding error:nil];
        }
        
        NSLog(@"crash 02");

        
        ////reinitialize the file
//        pathForRecipient = [[NSBundle mainBundle] pathForResource:@"recipientsLayout" ofType:@"html"];
//        recipientString = [NSString stringWithContentsOfFile:pathForRecipient encoding:NSUTF8StringEncoding error:&anError];
//        if (!recipientString) {
//            NSLog(@"%@", [anError localizedDescription]);
//        } else {
//            
//            NSString *replacedString = [recipientString stringByReplacingOccurrencesOfString:name withString:@"Name"];
//            [replacedString writeToFile:pathForRecipient atomically:YES encoding:NSWindowsCP1250StringEncoding error:nil];
//        }
//        //
//        NSLog(@"crash 03");
//
//        
//        //pathForRecipient = [[NSBundle mainBundle] pathForResource:@"recipientsLayout" ofType:@"html"];
//        recipientString = [NSString stringWithContentsOfFile:pathForRecipient encoding:NSUTF8StringEncoding error:&anError];
//        if (!recipientString) {
//            NSLog(@"%@", [anError localizedDescription]);
//        } else {
//            
//            NSString *replacedString = [recipientString stringByReplacingOccurrencesOfString:email withString:@"email"];
//            [replacedString writeToFile:pathForRecipient atomically:YES encoding:NSWindowsCP1250StringEncoding error:nil];
//        }
//        
//        NSLog(@"crash 04");

        
        }
    

    
    NSLog(@"crash 05");

    NSString *body;
    
    //path = [[NSBundle mainBundle] pathForResource:@"emailLayout" ofType:@"html"];
    NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    body= content;
    
    //replace placeholders in html file
   
    return body;
}


-(void)replacePlaceholder:(NSString*)placeholder inFileNamed:(NSString*)fileName withData:(NSArray*)dataArray intoPath:(NSString*)path{


    
    int *dataCount= [dataArray count];
    
    for ( int i=0; i<dataCount; i++) {
        
        
        
        
        NSString *pathForOriginal;
        NSString *contentString;
        //first copy the template to document directory
        pathForOriginal = [[NSBundle mainBundle] pathForResource:fileName ofType:@"html"];
        //assign the content to a string
        contentString = [NSString stringWithContentsOfFile:pathForOriginal encoding:NSUTF8StringEncoding error:nil];
        
        //create a new path
        NSString *newPath = [fileName stringByAppendingString:@"01.html"];
        //save a copy at the new path
        NSString *newPathForOriginal = [[self applicationDocumentsDirectory].path stringByAppendingPathComponent:newPath];
        [contentString writeToFile:newPathForOriginal  atomically:YES encoding:NSUTF8StringEncoding error:nil];
        pathForOriginal=newPathForOriginal ;
        
        
        
        
        
        itemStructure *item = [[itemStructure alloc]init];
        item = [dataArray objectAtIndex:i];
       
       
        NSString *itemTitle = item.Title;
        NSString *itemDescription = item.Description;
        NSString *itemRate = item.Rate;
        NSString *itemCurrency = item.Currency;
        NSString *spaceString = @" ";
      
        
        if (itemCurrency) {
            spaceString = [spaceString stringByAppendingString:itemCurrency];
              itemRate = [itemRate stringByAppendingString:spaceString];
        }
        
        if ([itemDescription length]<1 && [itemTitle length]<1 && [itemRate length]<1) {
            //if there is no data here Do nothing
            
        }
        
        else{
            
            if([itemTitle length]<1){
                itemTitle = @" ";
            }
            
            if ([itemDescription length]<1) {
                itemDescription = @" ";
            }
            
            if ([itemRate length]<1) {
                itemRate = @" ";
            }
            
            
        
        
            //title
            NSString *placeHolder = [NSString stringWithFormat:placeholder,i];
            contentString = [NSString stringWithContentsOfFile:pathForOriginal encoding:NSUTF8StringEncoding error:nil];

            if (!contentString) {
               // NSLog(@"error:%@", [anError localizedDescription]);
            } else {
                NSString *replacedString = [contentString stringByReplacingOccurrencesOfString:@"Title" withString:itemTitle];
                [replacedString writeToFile:pathForOriginal atomically:YES encoding:NSUTF8StringEncoding error:nil];
            }
            
            //description
            contentString = [NSString stringWithContentsOfFile:pathForOriginal encoding:NSUTF8StringEncoding error:nil];
            if (!contentString) {
              //  NSLog(@"error: %@", [anError localizedDescription]);
            } else {
                NSString *replacedString = [contentString stringByReplacingOccurrencesOfString:@"Description" withString:itemDescription];
                [replacedString writeToFile:pathForOriginal atomically:YES encoding:NSUTF8StringEncoding error:nil];
            }
            
            //Variable
            contentString = [NSString stringWithContentsOfFile:pathForOriginal encoding:NSUTF8StringEncoding error:nil];
            if (!contentString) {
               // NSLog(@"error: %@", [anError localizedDescription]);
            } else {
                NSString *replacedString = [contentString stringByReplacingOccurrencesOfString:@"Variable" withString:itemRate];
                [replacedString writeToFile:pathForOriginal atomically:YES encoding:NSUTF8StringEncoding error:nil];
            }
            
           // NSLog(@"%@",contentString);
            //copy to the previewLayout.html
            NSString   *bString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
            contentString = [NSString stringWithContentsOfFile:pathForOriginal encoding:NSUTF8StringEncoding error:nil];
            
            if (!bString) {
              //  NSLog(@"%@", [anError localizedDescription]);
            }
            else {
                NSString *replacedString = [bString stringByReplacingOccurrencesOfString:placeHolder withString:contentString];
                [replacedString writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
            }
            

        }
    }
}







@end
