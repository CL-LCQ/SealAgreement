//
//  SealObject.m
//  Seal
//
//  Created by Charles Leclercq on 24/04/2016.
//  Copyright © 2016 Charles Leclercq. All rights reserved.
//

#import "SealObject.h"

@implementation SealObject

@synthesize facts,what,whatDescription,when,where,whenStarts,whenEnds,termsDescription,terms,recipients,sender,status,value,currency;
@synthesize username, emailAddresses, emailTextIntro,emailTextHeader,time;


+ (id)sharedManager {
    static SealObject *sharedSealObject = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedSealObject = [[self alloc] init];
    });
    return sharedSealObject;
}

- (id)init {
    if (self = [super init]) {
        facts = [[NSArray alloc]init];
               termsDescription = [[NSMutableArray alloc]init];
        recipients =[[NSMutableArray alloc]init];
        emailAddresses = [[NSMutableArray alloc]init];
        
        terms = [[NSMutableArray alloc]init];
        what = [[NSMutableArray alloc]init];
        value = [[NSMutableArray alloc]init];
        time =  [[NSMutableArray alloc]init];
        
        
        whatDescription=[[NSMutableArray alloc]init];
        _hourlyRate=[[NSMutableArray alloc]init];


        when=@"";
        where=@"";
        whenStarts =@"";
        whenEnds=@"";
        sender = @"";
        status = @"";
        currency=@"";
        username= [PFUser currentUser].username;
        emailTextHeader = @"";
        emailTextIntro = @"";
        
    }
    return self;
}
-(void)resetObject{
    
      value = nil;
    value = [[NSMutableArray alloc]init];
    
   time = nil;
    time = [[NSMutableArray alloc]init];
    what = nil;
   what = [[NSMutableArray alloc]init];
    terms = nil;
    terms = [[NSMutableArray alloc]init];
    
    recipients = nil;
    recipients = [[NSMutableArray alloc]init];
    
    emailAddresses = nil;
    emailAddresses = [[NSMutableArray alloc]init];
    
    NSLog(@"Object reseted");


//    facts = [[NSArray alloc]init];
//    terms = [[NSMutableArray alloc]init];
//    termsDescription = [[NSMutableArray alloc]init];
//    recipients =[[NSMutableArray alloc]init];
//    emailAddresses = [[NSMutableArray alloc]init];
//    what = [[NSMutableArray alloc]init];
//    whatDescription=[[NSMutableArray alloc]init];
//    _hourlyRate=[[NSMutableArray alloc]init];
//
//    
//    
//    
//    when=@"";
//    where=@"";
//    whenStarts =@"";
//    whenEnds=@"";
//    sender = @"";
//    status = @"";
//    value=@"";
//    currency=@"";
    username= [PFUser currentUser].username;
}

-(void)verifyObject{
    
    
    
  //  int termsCount = [terms count];
    
    //arrays
//    if (termsCount==0) {
//        [terms addObject:@"no terms"];
//        NSLog(@"VERIFICATION term added");
//    }

    

    
    
//    //Strings
//    if (what.length <1)
//    {what = @"NO TITLE";}
//    
//    if (whatDescription.length<1)
//    {whatDescription=@"no description";}
//    

    
    if (when == NULL)
    {when=@"no date";}

    if (where.length<1)
    {where=@"no location";}

    if (whenStarts.length<1)
    {whenStarts =@"no date";}

    
    
    if (whenEnds.length<1)
    {whenEnds=@"no date";}
    
    if (sender.length<1)
    { sender = @"null";}
    
    if (status.length<1)
    {  status = @"null";}
    
//    if (value.length<1)
//    {  value=@"no value";}
    
    if (currency.length<1)
    {   currency=@"no currency";}
   


}
- (void)dealloc {
    // Should never be called, but just here for clarity really.
}


@end
