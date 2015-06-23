//
//  ViewController.m
//  DESencrypt
//
//  Created by Nick on 15/6/23.
//  Copyright (c) 2015年 guibi.td. All rights reserved.
//

#import "ViewController.h"

#import "NSString+DES.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *strLab;
@property (weak, nonatomic) IBOutlet UILabel *desLab;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)tostr:(id)sender {
    if (![self.textField.text isEqualToString:@""]) {
        self.strLab.text = [self.textField.text stringWithStrToDES];
    }
}
- (IBAction)todes:(id)sender {
    if (![self.strLab.text isEqualToString:@""]) {
        self.desLab.text = [self.strLab.text stringWithDESToStr];
    }
}

@end
