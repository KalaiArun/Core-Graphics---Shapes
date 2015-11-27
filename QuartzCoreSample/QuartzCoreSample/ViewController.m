//
//  ViewController.m
//  QuartzCoreSample
//
//  Created by dev11 on 11/12/15.
//  Copyright (c) 2015 fsp. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CustomView *customView = [[CustomView alloc] initWithFrame:CGRectMake(0, 44, 320, 480)];
    customView.backgroundColor = [UIColor lightGrayColor];
    [self.baseView addSubview:customView];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self.baseView setNeedsDisplay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
