//
//  SettingsViewController.m
//  SealApp
//
//  Created by Charles Leclercq on 15/08/2016.
//  Copyright © 2016 Seal. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

@synthesize  uILib,termsOfService;
@synthesize settingList,tableDataSection01;

- (void)viewDidLoad {
    [super viewDidLoad];
    
      //customUI = [[CustomUI alloc]initWithFrame:self.view.frame];
    termsOfService = [[PrivacySettingsViewController alloc]init];
    
    uILib = [[UILib alloc]initWithViewC:self];
    [uILib insertTopBackbar];
    
    //table data
   settingList = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
   settingList.frame = [uILib frameMinusTopBar];
    tableDataSection01 = [[NSArray alloc]initWithObjects:@"Terms of Service",@"Privacy Policy", nil];
    settingList.delegate = self;
    settingList.dataSource = self;
    [self.view addSubview:settingList];
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger count = 0;
    if ( section == 0) {
        count = [tableDataSection01 count];
    }
    
    
    return count;
}

//format cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"newCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    if (indexPath.section ==0) {
        cell.textLabel.text= [tableDataSection01 objectAtIndex:(indexPath.row)];
        
    }
    
    cell.textLabel.font = [UIFont fontWithName:@"Gill Sans" size:20];
    
    return cell;
}



-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
      
    if (indexPath.section == 0 ) {
        
        if ( indexPath.row == 0) {
            NSLog(@"terms of");
            termsOfService.isTerms = true;
        }
        else if(indexPath.row == 1){
            termsOfService.isTerms = false;

        }
        [self performSegueWithIdentifier:@"goToPrivacy" sender:self];
        
       

    }
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    switch (section)
    {
        case 0:
            sectionName = @"Section 01";
            break;
        case 1:
            sectionName = @"Section 02";
            break;
            // ...
        default:
            sectionName = @"";
            break;
    }
    return sectionName;
}





@end
