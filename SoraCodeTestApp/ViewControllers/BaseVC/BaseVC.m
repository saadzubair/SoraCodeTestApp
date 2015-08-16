//
//  BaseVCViewController.m
//  somabar
//
//  Created by Jameel on 09/03/2015.
//  Copyright (c) 2015 Void Labs. All rights reserved.
//

#import "BaseVC.h"
#import "WebServicesManager.h"


@interface BaseVC ()

@end

@implementation BaseVC

- (IBAction)backBtnPressed:(id)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message{
    
    UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"Ok", nil];
    
    [alertview show];
}




- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleLightContent;
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}


- (BOOL)automaticallyAdjustsScrollViewInsets{
    return NO;
}

-(void)setupGUI{
    self._notificationsHandlers= [NSMutableArray array];
    

    
    
}
-(void)updateGUI{
    
}


#pragma mark - ViewLifeCycle


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden=YES;
    
    [self setupGUI];
    [self updateGUI];
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    
}

#pragma mark -


#pragma mark - Memory Shit

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) dealloc {
    for (id _handler in self._notificationsHandlers)
        [[NSNotificationCenter defaultCenter] removeObserver:_handler];
    
    [self._notificationsHandlers removeAllObjects];
    
}

@end
