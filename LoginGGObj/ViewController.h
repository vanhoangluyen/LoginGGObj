//
//  ViewController.h
//  LoginGGObj
//
//  Created by LuyenBG on 2/9/18.
//  Copyright © 2018 LuyenBG. All rights reserved.
//

#import <UIKit/UIKit.h>

@import GoogleSignIn;
@interface ViewController : UIViewController<GIDSignInUIDelegate>
@property (strong, nonatomic) IBOutlet UIButton *signOut;
@property (strong, nonatomic) IBOutlet GIDSignInButton *signInButton;
@property (strong, nonatomic) IBOutlet UILabel *statusLabelText;


@end

