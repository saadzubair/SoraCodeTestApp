//
//  BaseVCViewController.h
//  somabar
//
//  Created by Jameel on 09/03/2015.
//  Copyright (c) 2015 Void Labs. All rights reserved.
//


#import <UIKit/UIKit.h>
@interface BaseVC : UIViewController

@property (nonatomic, strong) NSMutableArray *_notificationsHandlers;


- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message;
- (IBAction)backBtnPressed:(id)sender;


-(void)setupGUI;
-(void)updateGUI;


@end
