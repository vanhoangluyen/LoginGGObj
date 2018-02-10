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
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(receiveToggleAuthUINotification:)
     name:@"ToggleAuthUINotification"
     object:nil];
    
    [self toggleAuthUI];
    self.statusLabelText.text = @"Google Sign in\niOS Demo";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signOut:(id)sender {
    [[GIDSignIn sharedInstance] signOut];
    self.statusLabelText.text = @"Google  Not Sign In";
}
- (IBAction)disconnect:(id)sender {
    [[GIDSignIn sharedInstance] disconnect];
}

- (void)toggleAuthUI {
    if ([GIDSignIn sharedInstance].currentUser.authentication == nil) {
        // Not signed in
        self.statusLabelText.text = @"Google Sign in\niOS Demo";
        self.signInButton.hidden = NO;
        self.signOut.hidden = YES;
        self.disconnect.hidden = YES;
    } else {
        // Signed in
        self.signInButton.hidden = YES;
        self.signOut.hidden = NO;
        self.disconnect.hidden = NO;
    }
}
- (void)signIn:(GIDSignIn *)signIn didSignInForUser:(GIDGoogleUser *)user withError:(NSError *)error {
    // Perform any operations on signed in user here.
    NSString *userId = user.userID;                  // For client-side use only!
    NSString *idToken = user.authentication.idToken; // Safe to send to the server
    NSString *name = user.profile.name;
    NSString *email = user.profile.email;
    NSLog(@"Customer details: %@ %@ %@ %@", userId, idToken, name, email);
    // ...
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:@"ToggleAuthUINotification"
     object:nil];
    
}

- (void) receiveToggleAuthUINotification:(NSNotification *) notification {
    if ([notification.name isEqualToString:@"ToggleAuthUINotification"]) {
        [self toggleAuthUI];
        self.statusLabelText.text = notification.userInfo[@"statusText"];
    }
}

@end
