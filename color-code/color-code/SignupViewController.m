
//
//  SignupViewController.m
//  color-code
//
//  Created by Natalie Carstens on 4/28/16.
//  Copyright © 2016 CIS195. All rights reserved.
//

#import "SignupViewController.h"
#import <Parse/Parse.h>


@interface SignupViewController ()

@end

@implementation SignupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) signUpInfo {
    PFUser *user = [PFUser user];
    user.username = self.userNameTextField.text;
    user.password = self.passwordTextField.text;
    user.email = self.emailTextField.text;
    
}

- (void) loadUserInfo {
    //load user info from parse database
    PFQuery *query = [PFQuery queryWithClassName:@"user"];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (!error) {
            _user = objects;
            [self.tableView reloadData];
        }
    }];
}

@end
