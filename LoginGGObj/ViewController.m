//
//  ViewController.m
//  LoginGGObj
//
//  Created by LuyenBG on 2/9/18.
//  Copyright © 2018 LuyenBG. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [GIDSignIn sharedInstance].uiDelegate = self;
    [[GIDSignIn sharedInstance] signInSilently];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signOut:(id)sender {
    [[GIDSignIn sharedInstance] signOut];
    self.statusLabelText.text = @"Google  Not Sign In";
}
- (IBAction)signIn:(id)sender {
    self.statusLabelText.text = @"Google Signed In";
}

@end
