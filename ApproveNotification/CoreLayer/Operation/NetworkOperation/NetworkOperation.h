//
//  NetworkOperation.h
//  ApproveNotification
//
//  Created by Artur Mirrov on 18.08.2018.
//  Copyright © 2018 Artur Mirrov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <COOperation/ChainableOperationBase.h>

@class NetworkClient;
@interface NetworkOperation : ChainableOperationBase

- (instancetype)initWithRequest:(NSURLRequest *)request
                  networkClient:(NetworkClient *)networkClient;

@end
