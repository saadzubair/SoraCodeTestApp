//
//  WebServicesManager.h
//  spin
//
 // 29/09/2014.
//  Copyright (c) 2014 Mobile Media Partners. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>



/*string response/erro message , parsed response , error if any*/
typedef void (^WebServicesManagerCallback)(NSString *raw,id parsed,NSError *error);


@interface WebServicesManager : AFHTTPRequestOperationManager


+ (id)sharedManager;


/*shared*/


- (void)updateUserProfile:(id)user
                callback:(WebServicesManagerCallback)callback;




@end
