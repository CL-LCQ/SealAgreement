//
//  SealObject.h
//  Seal
//
//  Created by Charles Leclercq on 24/04/2016.
//  Copyright © 2016 Charles Leclercq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface SealObject : NSData




@property (strong, nonatomic) NSMutableArray *what;
@property (strong, nonatomic) NSMutableArray *terms;
@property (strong, nonatomic) NSMutableArray *time;
@property (strong, nonatomic) NSMutableArray *value;



@property (strong, nonatomic) NSArray *facts;

@property (strong, nonatomic) NSString *where;
@property (strong, nonatomic) NSString *when;
@property (strong, nonatomic) NSString *whenStarts;
@property (strong, nonatomic) NSString *whenEnds;
@property (strong, nonatomic) NSMutableArray *whatDescription;
@property (strong, nonatomic) NSMutableArray *hourlyRate;
@property (strong, nonatomic) NSMutableArray *termsDescription;

@property (strong, nonatomic) NSMutableArray *recipients;
@property (strong, nonatomic) NSMutableArray *emailAddresses;

@property (strong, nonatomic) NSString *sender;
@property (strong, nonatomic) NSString *status;
@property (strong, nonatomic) NSString *currency;
@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *emailTextHeader;
@property (strong, nonatomic) NSString *emailTextIntro;

+ (id)sharedManager;

-(void)resetObject;
-(void)verifyObject;


@end
