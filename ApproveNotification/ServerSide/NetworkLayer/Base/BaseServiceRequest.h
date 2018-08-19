//
//  BaseServiceRequest.h
//  ApproveNotification
//
//  Created by Artur Mirrov on 18.08.2018.
//  Copyright © 2018 Artur Mirrov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestData.h"

typedef NS_ENUM(NSUInteger, NetworkRequestState)
{
    NetworkRequestStateFailure,
    NetworkRequestStateSuccess,
    NetworkRequestStateSuspend,
    NetworkRequestStateProcess,
    NetworkRequestStateError,
    NetworkRequestStateNotInternet
};

@interface BaseServiceRequest : NSObject

@property (strong, nonatomic) NSString *httpMethod;
@property (strong, nonatomic) NSString *endPoint;

@property (strong, nonatomic) NSDictionary *params;
@property (strong, nonatomic) RequestData *data;

@property (assign, nonatomic) Class mapClass;
@property (assign, nonatomic) NSUInteger responseType;

@end
