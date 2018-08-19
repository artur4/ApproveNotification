//
//  NetworkClient.h
//  ApproveNotification
//
//  Created by Artur Mirrov on 18.08.2018.
//  Copyright © 2018 Artur Mirrov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServerResponse.h"

typedef void(^NetworkClientCompletion)(ServerResponse *serverResponse);

@class RequestConfigurator;

@interface NetworkClient : NSObject

- (void)sendRequest:(NSURLRequest *)request
    completionBlock:(NetworkClientCompletion)completion;

@end
