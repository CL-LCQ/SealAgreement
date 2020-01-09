//
//  PrivacySettingsViewController.m
//  SealApp
//
//  Created by Charles Leclercq on 15/08/2016.
//  Copyright © 2016 Seal. All rights reserved.
//

#import "PrivacySettingsViewController.h"

@interface PrivacySettingsViewController ()

@end

@implementation PrivacySettingsViewController

@synthesize uilib;

- (void)viewDidLoad {
    [super viewDidLoad];
    
  //  customUI = [[CustomUI alloc]initWithFrame:self.view.frame];


    NSURL *rtfPath;
    
    if ( self.isTerms == true) {
        NSLog(@"showing terms");
        rtfPath = [[NSBundle mainBundle] URLForResource: @"termsOfService" withExtension:@"rtf"];
    }
    else {
        rtfPath = [[NSBundle mainBundle] URLForResource: @"privacyPolicy" withExtension:@"rtf"];
    }
    NSAttributedString *attributedStringWithRtf = [[NSAttributedString alloc]   initWithFileURL:rtfPath options:@{NSDocumentTypeDocumentAttribute:NSRTFTextDocumentType} documentAttributes:nil error:nil];
    
    UITextView * mainContent = [[UITextView alloc]initWithFrame:CGRectMake(60, 30, 200, 4000)];
    mainContent.attributedText=attributedStringWithRtf;
    mainContent.textColor = [UIColor blackColor];
    
    //  [mainContent setUserInteractionEnabled: NO];
    
    mainContent.editable = NO;
    
    UIScrollView *textContent = [[UIScrollView alloc]initWithFrame:self.view.frame];
    
    [self.view addSubview:textContent];
    
    [textContent addSubview:mainContent];
    
    uilib= [[UILib alloc]initWithViewC:self];
    [uilib insertTopBackbar];
    
}


@end
