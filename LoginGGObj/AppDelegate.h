//
//  AppDelegate.h
//  LoginGGObj
//
//  Created by LuyenBG on 2/9/18.
//  Copyright © 2018 LuyenBG. All rights reserved.
//

#import <UIKit/UIKit.h>
@import GoogleSignIn;
@interface AppDelegate : UIResponder <UIApplicationDelegate,GIDSignInDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

