//
//  SettingsViewController.m
//  tipCalculator
//
//  Created by Stephani Alves on 6/4/14.
//  Copyright (c) 2014 stephanimoroni. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipControl;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    
    //load saved defaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int percentageControlIndex = [defaults integerForKey:@"percentage_control_index"];
    if (!percentageControlIndex) {
        self.defaultTipControl.selectedSegmentIndex = 0;
    }else{
        //get default amount
        self.defaultTipControl.selectedSegmentIndex=percentageControlIndex;
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    //saving tip default
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.defaultTipControl.selectedSegmentIndex forKey:@"percentage_control_index"];
    [defaults synchronize];
}

@end
