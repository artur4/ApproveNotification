//
//  BaseService.h
//  ApproveNotification
//
//  Created by Artur Mirrov on 18.08.2018.
//  Copyright © 2018 Artur Mirrov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkCompoundOperation.h"
#import "BaseServiceRequest.h"
#import "ServiceAPIProtocol.h"

@protocol BaseServiceProtocol <NSObject>

@required
- (void)serviceRequestStateChanged:(NetworkRequestState)state;

@end

@interface BaseService : NSObject <ServiceAPIProtocol>

- (void)cancelOperationScheduler;

- (CompoundOperation *)getItemsForRequest:(BaseServiceRequest *)request;

@end
