//
//  WebServicesManager.m
//  spin
//
 // 29/09/2014.
//  Copyright (c) 2014 Mobile Media Partners. All rights reserved.
//

#import "WebServicesManager.h"
#import <AFAmazonS3Client/AFAmazonS3Manager.h>


#define BASE_URL @"http://45.55.224.199:3000"


@interface WebServicesManager ()


- (NSError *)getProperError:(NSError *)error;
@end


@implementation WebServicesManager


static WebServicesManager *sharedInstance;


+ (WebServicesManager *) sharedManager{
    
    if(sharedInstance==nil){
        sharedInstance= [[WebServicesManager alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL]];
        [sharedInstance setRequestSerializer:[AFJSONRequestSerializer serializer]];
        [sharedInstance setResponseSerializer:[AFJSONResponseSerializer serializer]];
        sharedInstance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects: @"application/json", nil];
    }
    
    
    
    return sharedInstance;
}

- (NSError *)getProperError:(NSError *)error{
    
    @try {
        NSData *date = [error.userInfo objectForKey:@"com.alamofire.serialization.response.error.data"];
        NSString *dataStr = [[NSString alloc] initWithData:date encoding:NSUTF8StringEncoding];
        NSDictionary *jsonObject=[NSJSONSerialization
                                  JSONObjectWithData:date
                                  options:NSJSONReadingMutableLeaves
                                  error:nil];
        
        
        NSString *anyError = [jsonObject objectForKey:@"error"];
        
        NSError *err = [NSError errorWithDomain:NSStringFromClass([self class])
                                           code:200
                                       userInfo:@{
                                                  NSLocalizedDescriptionKey:anyError
                                                  }];
        
        return err;
    }
    @catch (NSException *exception) {
        //DDLogDebug(@"Webcall failed: %@", [exception description]);
        NSError *err = [NSError errorWithDomain:NSStringFromClass([self class])
                                           code:200
                                       userInfo:@{
                                                  NSLocalizedDescriptionKey:@"Something went wrong"
                                                  }];
        return err;
    }
   
    
}




#pragma mark - SAHRED API




- (void)updateUserProfile:(id)user
                 callback:(WebServicesManagerCallback)callback{
    
    
    
}



#pragma mark -


@end
