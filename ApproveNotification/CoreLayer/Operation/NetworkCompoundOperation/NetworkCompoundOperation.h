//
//  NetworkCompoundOperation.h
//  ApproveNotification
//
//  Created by Artur Mirrov on 18.08.2018.
//  Copyright © 2018 Artur Mirrov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <COOperation/CompoundOperation.h>

@class NetworkClient, RequestConfigurator, MappingProvider;
@interface NetworkCompoundOperation : NSObject

@property (nonatomic) NetworkClient *client;
@property (nonatomic) RequestConfigurator *configurator;
@property (nonatomic) MappingProvider *provider;

- (instancetype)initWithNetworkClient:(NetworkClient *)client
                  requestConfigurator:(RequestConfigurator *)configurator
                      mappingProvider:(MappingProvider *)provider;

- (CompoundOperation *)getNetworkCompoundOperationWithResultBlock:(CompoundOperationResultBlock)resultBlock;


@end
