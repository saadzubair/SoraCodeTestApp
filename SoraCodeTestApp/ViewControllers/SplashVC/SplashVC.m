//
//  SplashVC.m
//  SoraCodeTestApp
//
//  Created by Muhammad Abdullah on 16/08/2015.
//  Copyright (c) 2015 Self. All rights reserved.
//

#import "SplashVC.h"
#import "MainVC.h"


@interface SplashVC ()

@end

@implementation SplashVC

+(id)splashVC{
    return [[SplashVC alloc] initWithNibName:@"SplashVC" bundle:[NSBundle mainBundle]];
}

-(void)navigateToNextScreen{
    
    [self.navigationController pushViewController:[MainVC mainVC] animated:YES];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self performSelector:@selector(navigateToNextScreen) withObject:nil afterDelay:0];
}


@end
