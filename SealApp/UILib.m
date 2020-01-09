//
//  UILib.m
//  SealApp
//
//  Created by Charles Leclercq on 15/08/2016.
//  Copyright © 2016 Seal. All rights reserved.
//

#import "UILib.h"

@implementation UILib

@synthesize viewController, myView, topSealToolbar, topBackbar, topOptionbar;
@synthesize sizex,sizey,frameMinusTopBar,frameMinusToolBar,frameMinusTopBarHidden, topBarHeight,toolBarHeight, createViewContainer;
@synthesize whatView,deadlineView,termView,valueView,CreateContainerView,createViewContainerHidden;
@synthesize validateButton,colors;

-(instancetype)initWithViewC:(UIViewController*)viewC{
    self = [super init];
    if(self)
    {
        viewController = viewC;
        myView = viewC.view;
        sizex = myView.frame.size.width;
        sizey = myView.frame.size.height;
        topBarHeight = sizey/15;
        toolBarHeight = sizey/7;
        
        colors= [[Colors alloc]init];
        
         [self setFrames];
        
    }
    return self;
}

-(instancetype)initWithView:(UIView*)viewC{
    self = [super init];
    if(self)
    {
       
        myView = viewC;
        sizex = myView.frame.size.width;
        sizey = myView.frame.size.height;
        topBarHeight = sizey/15;
        toolBarHeight = sizey/7;
        [self setFrames];
        
    }
    return self;
}


#pragma Mark - external functions

-(void)insertTopBackbar{
    
    topBackbar =[self simpleTopBar];
    [self insertButtonns:1 inView:topBackbar];
    UIButton *backB =[topBackbar viewWithTag:1];
    [backB setTitle:@"<Back" forState:UIControlStateNormal];
    [backB addTarget:self action:@selector(previousPage) forControlEvents:UIControlEventTouchUpInside];
    [myView addSubview: topBackbar];
    
    

}

-(void)insertTopOptionbar{
    
   topOptionbar =[self simpleTopBar];
    [self insertButtonns:4 inView:topOptionbar];
    [myView addSubview: topOptionbar];
    
}

-(UIButton*)bottomViewButtonInView:(UIView*)thisView{
    
    //need to create a bottom view and put that in?
    
    
    CGFloat buttonSize = sizey/10;
    validateButton = [[UIButton alloc]initWithFrame:CGRectMake(sizex-(buttonSize ) , 0, buttonSize, buttonSize)];
    validateButton.tag = 11;
    [validateButton setBackgroundColor: colors.sealblue];

    [thisView addSubview:validateButton];
    return validateButton;
}
   

-(void)insertSealToolbar{
    
    topSealToolbar =[self SealTopBar];
    [self insertButtonns:5 inView:topSealToolbar];
    [myView addSubview: topSealToolbar];
    
}


-(void)setCreateView{
    
    
    CGRect frame1  = CGRectMake(0+(0*sizex), 0, sizex, sizey-(topBarHeight+toolBarHeight));
    CGRect frame2  = CGRectMake(0+(1*sizex), 0, sizex, sizey-(topBarHeight+toolBarHeight));
    CGRect frame3  = CGRectMake(0+(2*sizex), 0, sizex, sizey-(topBarHeight+toolBarHeight));
    CGRect frame4  = CGRectMake(0+(3*sizex), 0, sizex, sizey-(topBarHeight+toolBarHeight));
    
    
//        CGRect frame1  = CGRectMake(0+(0*sizex), topBarHeight, sizex, sizey-(topBarHeight+toolBarHeight));
//        CGRect frame2  = CGRectMake(0+(1*sizex), topBarHeight, sizex, sizey-(topBarHeight+toolBarHeight));
//        CGRect frame3  = CGRectMake(0+(2*sizex), topBarHeight, sizex, sizey-(topBarHeight+toolBarHeight));
//        CGRect frame4  = CGRectMake(0+(3*sizex), topBarHeight, sizex, sizey-(topBarHeight+toolBarHeight));
////
    whatView = [[UIView alloc]initWithFrame:frame1];
    whatView.tag = 1;
    valueView = [[UIView alloc]initWithFrame:frame2];
    valueView.tag = 2;
    termView = [[UIView alloc]initWithFrame:frame3];
    valueView.tag = 3;
    deadlineView = [[UIView alloc]initWithFrame:frame4];
    valueView.tag = 4;
//
//    //colors
    [whatView setBackgroundColor:colors.tracker1];
    [valueView setBackgroundColor:colors.tracker2];
    [termView setBackgroundColor:colors.tracker3];
    [deadlineView setBackgroundColor:colors.tracker4];

    
    CreateContainerView = [[UIView alloc]initWithFrame:createViewContainerHidden];
    //[CreateContainerView setBackgroundColor:[UIColor purpleColor]];
    
    [CreateContainerView addSubview:whatView];
    [CreateContainerView addSubview:valueView];
    [CreateContainerView addSubview:termView];
    [CreateContainerView addSubview:deadlineView];
    
    [myView addSubview:CreateContainerView];
    
    
    
}

-(void)setFrameOnTouch:(id)sender{
    
        UIButton *button = (UIButton*)sender;
        int i = button.tag;
        UIView *currentView = [CreateContainerView viewWithTag:1];
        CGRect frame= CGRectMake(-sizex*(i-1), topBarHeight, sizex*4, sizey-(topBarHeight+toolBarHeight));
       // CreateContainerView.frame = frame;
    [UIView animateWithDuration:0.3f
                          delay:0.0f
                        options: UIViewAnimationCurveEaseIn
                     animations:^{
                         [ CreateContainerView setFrame:frame];
                     }
                     completion:nil];
    

}


#pragma Mark - Sub functions
-(void)setFrames{

    frameMinusTopBar = CGRectMake(0, topBarHeight , sizex, sizey-topBarHeight);
    frameMinusTopBarHidden = CGRectMake(0, sizey+ (sizey-topBarHeight) , sizex, sizey-topBarHeight);
    frameMinusToolBar = CGRectMake(0, topBarHeight +toolBarHeight, sizex, sizey-(topBarHeight+toolBarHeight));
//    createViewContainer = CGRectMake(0, topBarHeight +toolBarHeight, sizex*4, sizey-(topBarHeight+toolBarHeight));
//    createViewContainerHidden = CGRectMake(0, sizey +(sizey-(topBarHeight+toolBarHeight)) , sizex*4, sizey-(topBarHeight+toolBarHeight));
    createViewContainer = CGRectMake(0, topBarHeight, sizex*4, sizey-(topBarHeight+toolBarHeight));
    createViewContainerHidden = CGRectMake(0, 0-(sizey-(topBarHeight+toolBarHeight)) , sizex*4, sizey-(topBarHeight+toolBarHeight));
}



-(void)previousPage{
    [viewController.navigationController popViewControllerAnimated:YES];
}


-(UIView*)simpleTopBar{
    CGRect rectangle;
    rectangle = CGRectMake(0, 0, sizex, topBarHeight);
    UIView *topbar = [[UIView alloc]initWithFrame:rectangle];
    topbar.backgroundColor = colors.menubkggrey;

    return topbar;
}

-(UIView*)SealTopBar{
    CGRect rectangle;
      rectangle = CGRectMake(0, sizey-toolBarHeight, sizex, toolBarHeight);
    UIView *topbar = [[UIView alloc]initWithFrame:rectangle];
    topbar.backgroundColor = colors.menubkggrey;
    self.sealbarFrameShow = rectangle;
    self.sealbarFrameHide = CGRectMake(0, sizey, sizex, toolBarHeight);
    topbar.frame =  self.sealbarFrameHide;
    return topbar;
}

-(CGRect)topTracker{
    
    CGRect rectangle;
    rectangle = CGRectMake(0, sizey/15  , sizex, sizey/180);
    
    return rectangle;


}

-(UIImage*)ProfilePicture{



    UIImage *inputImage = [UIImage imageNamed:@"profile_pic"];
    CGImageRef maskRef = [UIImage imageNamed:@"profile_pic_mask"].CGImage;
    
    CGImageRef mask = CGImageMaskCreate(CGImageGetWidth(maskRef),
                                        CGImageGetHeight(maskRef),
                                        CGImageGetBitsPerComponent(maskRef),
                                        CGImageGetBitsPerPixel(maskRef),
                                        CGImageGetBytesPerRow(maskRef),
                                        CGImageGetDataProvider(maskRef), NULL, false);
    
    CGImageRef masked = CGImageCreateWithMask([inputImage CGImage], mask);
    CGImageRelease(mask);
    
    UIImage *maskedImage = [UIImage imageWithCGImage:masked];
    
    
    return maskedImage;
}

-(CGRect)HorizontalRectangleAtPos:(int)pos inFrame:(CGRect)theFrame for:(int*)n{
    CGRect rectangle;
    int d=n;
    rectangle = CGRectMake(0, 0, sizex/d, theFrame.size.height);
    
    CGFloat positionX = (rectangle.size.width);
    
    
    rectangle.origin.x = positionX*(pos-1);
    
    
    return rectangle;
}

-(CGRect)HorizontalRectangleAtPos:(int)pos inFrame:(CGRect)theFrame {
    CGRect rectangle;
    int d=4;
    rectangle = CGRectMake(0, 0, sizex/d, theFrame.size.height);
    
    CGFloat positionX = (rectangle.size.width);
    
    
    rectangle.origin.x = positionX*(pos-1);
    
    
    return rectangle;
}

-(CGRect)profilePictureFrame{
    
    CGRect rectangle;
    rectangle = CGRectMake(0, 0  , sizex, sizex);
    
    return rectangle;
    
    
}

-(void)insertButtonns:(int*)n inView:(UIView*)myView{
    if (n == 1) {
        for(int i = 0; i < n; i++){
            
            //create a button with the tag
            UIButton *nButton = [[UIButton alloc]initWithFrame:[self HorizontalRectangleAtPos:i+1 inFrame:myView.frame]];
            //button height should be same as the bar
            nButton.tag = i+1;
            [nButton setTitle:@"TEST" forState:UIControlStateNormal];
            [nButton setTitleColor:colors.themeblack forState:UIControlStateNormal];
            nButton.titleLabel.font= [UIFont fontWithName:@"Gill Sans" size:12];
            [myView addSubview:nButton];

        }
    }
    else{

    for(int i = 0; i < n; i++){
        
        //create a button with the tag
        UIButton *nButton = [[UIButton alloc]initWithFrame:[self HorizontalRectangleAtPos:i+1 inFrame:myView.frame for:n]];
        //button height should be same as the bar
        nButton.tag = i+1;
        [nButton setTitle:@"TEST" forState:UIControlStateNormal];
        [nButton setTitleColor:colors.themeblack forState:UIControlStateNormal];

        nButton.titleLabel.font= [UIFont fontWithName:@"Gill Sans" size:12];
        [myView addSubview:nButton];

    }
}

}

-(CGRect)RectangleAtPos:(int)pos{
    CGRect rectangle;


    rectangle = CGRectMake(0, 0, sizex/2, sizey/15);

    CGFloat buttonYgap = 25;
    CGFloat positionY = ((rectangle.size.height+buttonYgap) * pos);


    rectangle.origin.y = positionY;
    rectangle.origin.x = sizex/2 - rectangle.size.width/2;

    return rectangle;
}

-(CGRect)longRectangleAtPos:(int)pos{
    CGRect rectangle;
    
    
    rectangle = CGRectMake(0, 0, sizex/1.2, sizey/13);
    
    CGFloat buttonYgap = 40;
    CGFloat positionY = ((rectangle.size.height+buttonYgap) * pos);
    
    
    rectangle.origin.y = positionY;
    rectangle.origin.x = sizex/2 - rectangle.size.width/2;
    
    return rectangle;
}

-(CGRect)bigLongRectangleAtPos:(int)pos{
    CGRect rectangle;
    
    
    rectangle = CGRectMake(0, 0, sizex/1.2, sizey/7);
    
    CGFloat buttonYgap = 40;
    CGFloat positionY = ((rectangle.size.height+buttonYgap) * pos);
    
    
    rectangle.origin.y = positionY;
    rectangle.origin.x = sizex/2 - rectangle.size.width/2;
    
    return rectangle;
}



-(CGRect)templateBottomRectangle{
    CGRect rectangle;
    
    rectangle = CGRectMake(0, sizey, sizex, sizey/10);
    rectangle.origin.y = sizey - (rectangle.size.height+toolBarHeight);
    
    
    return rectangle;
}

-(CGRect)bottomRectangle{
    CGRect rectangle;

    rectangle = CGRectMake(0, sizey, sizex, sizey/10);
    rectangle.origin.y = sizey - rectangle.size.height;


    return rectangle;
}

-(CGRect)bottomRectangleAtTop{
    CGRect rectangle;
    
    rectangle = CGRectMake(0, 0, sizex, sizey/10);
  //  rectangle.origin.y = sizey - rectangle.size.height;
    
    
    return rectangle;
}

-(CGRect)scrollViewFrame{
    CGRect rectangle;
    
    rectangle = CGRectMake(0, sizey/10, sizex, sizey/3- sizey/10);
    // rectangle.origin.y = sizey - rectangle.size.height;
    
    
    return rectangle;
}

-(CGRect)scrollViewFrameCollapsed{
    CGRect rectangle;
    
    rectangle = CGRectMake(0, sizey/10, sizex, 0);
    // rectangle.origin.y = sizey - rectangle.size.height;
    
    
    return rectangle;
}


-(CGRect)templateViewFrame{
    CGRect rectangle;
    
    rectangle = CGRectMake(0, sizey, sizex, sizey/3);
    rectangle.origin.y = sizey - rectangle.size.height;
    
    
    return rectangle;
}




@end
