//
//  ViewController.m
//  ZQAlertControllerDemo
//
//  Created by Victor Zhang on 8/29/16.
//  Copyright © 2016 XiaoRuiGeGe. All rights reserved.
//

#import "ViewController.h"
#import <ZQAlertController/ZQAlertController.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [[ZQAlertController defaultAlert] alertShowWithTitle:@"Test" message:@"This is a test message!" okayButton:@"Ok" completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
