//
//  IntroductionViewController.m
//  SealApp
//
//  Created by Charles Leclercq on 15/08/2016.
//  Copyright © 2016 Seal. All rights reserved.
//

#import "IntroductionViewController.h"

@interface IntroductionViewController ()

@end

@implementation IntroductionViewController

@synthesize nextButton, uiLib,tapCount;
@synthesize titleLabel, colors, imageTutorial;

- (void)viewDidLoad {
    [super viewDidLoad];
    imageTutorial = [[UIImageView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:imageTutorial];

       //Bottom bar
    uiLib = [[UILib alloc]initWithViewC:self];
    colors = [[Colors alloc]init];
    nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [nextButton addTarget:self action:@selector(goToSignUp) forControlEvents:UIControlEventTouchUpInside];
    [nextButton setTitle:@"Login" forState:UIControlStateNormal];
    nextButton.frame = [uiLib bottomRectangle];
    [nextButton setTitleColor:colors.themeblack forState:UIControlStateNormal];
    nextButton.backgroundColor = colors.menubkggrey;
    [self.view addSubview:nextButton];
    [self.view setBackgroundColor:colors.sealblue];
    nextButton.hidden = true;

   
    
    //mainview with slider
    UISwipeGestureRecognizer *gestureRecognizerRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight:)];
    [gestureRecognizerRight setDirection:(UISwipeGestureRecognizerDirectionRight)];
    UISwipeGestureRecognizer *gestureRecognizerLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft:)];
    [gestureRecognizerLeft setDirection:(UISwipeGestureRecognizerDirectionLeft)];

    //window behavior
    tapCount = 0;
    UIView *introSlide01View = [[UIView alloc ]init];
    titleLabel = [[UILabel alloc]init];
    //titleLabel.frame = [uiLib RectangleAtPos:2];
    //titleLabel.text = @"Intro Page 01";
    imageTutorial.image = [UIImage imageNamed:@"instructions_0.png"];

    [titleLabel setTextColor:colors.themewhite];
    [self.view addGestureRecognizer:gestureRecognizerRight];
    [self.view addGestureRecognizer:gestureRecognizerLeft];
   // [introSlide01View addSubview:titleLabel];
    
    [self.view insertSubview:introSlide01View belowSubview:nextButton];
    

    
}

-(void)goToSignUp{

    [self performSegueWithIdentifier:@"goToSignIn" sender:self];
}


#pragma Mark - sliding behavior
-(void)swipeRight:(UISwipeGestureRecognizer *)recognizer {
    
        self.tapCount = self.tapCount - 1;
    
        if (self.tapCount <=0) {
            [self Slide:1];
            self.tapCount =0;
        }
    
        if (self.tapCount == 1) {
            [self Slide:2];
        }
        if (self.tapCount ==2) {
            [self Slide:3];
        }
    if (self.tapCount == 3) {
        [self Slide:4];
        
    }
    if (self.tapCount == 4) {
        [self Slide:5];
        
    }
    if (self.tapCount == 5) {
        [self Slide:6];
        
        
        
        
    }
    if (self.tapCount == 6) {
        self.tapCount =5;
        
        
        
    }
}


-(void)swipeLeft:(UISwipeGestureRecognizer*)recognizer{

    self.tapCount = self.tapCount + 1;
    NSLog(@"%d",self.tapCount);
    
    if (self.tapCount ==0) {
        [self Slide:1];
        
    }
    
    if (self.tapCount == 1) {
        [self Slide:2];
        
    }
    if (self.tapCount == 2) {
        [self Slide:3];
        
    }
    
    if (self.tapCount == 3) {
        [self Slide:4];
        
    }
    if (self.tapCount == 4) {
        [self Slide:5];
        
    }
    if (self.tapCount == 5) {
        [self Slide:6];

        
        
        
    }
    if (self.tapCount == 6) {
        self.tapCount =5;
        
        
        
    }

}

-(void)Slide:(int)n{
    
    if (n==1) {
       titleLabel.text = @"Intro Page 01";
        imageTutorial.image = [UIImage imageNamed:@"instructions_0.png"];
    }
    if (n==2) {
        titleLabel.text = @"Intro Page 02";
          imageTutorial.image = [UIImage imageNamed:@"instructions_1.png"];
    }
    if (n==3) {
       titleLabel.text = @"Intro Page 03";
      imageTutorial.image = [UIImage imageNamed:@"instructions_2.png"];
    }
    if (n==4) {
          imageTutorial.image = [UIImage imageNamed:@"instructions_3.png"];
        titleLabel.text = @"Intro Page 04";  }
    if (n==5) {
        imageTutorial.image = [UIImage imageNamed:@"instructions_4.png"];
        titleLabel.text = @"Intro Page 05";
        
    }
    if (n==6) {
        imageTutorial.image = [UIImage imageNamed:@"instructions_5.png"];
        titleLabel.text = @"Intro Page 05";
        nextButton.hidden = false;
        
    }

    
    
}

@end
