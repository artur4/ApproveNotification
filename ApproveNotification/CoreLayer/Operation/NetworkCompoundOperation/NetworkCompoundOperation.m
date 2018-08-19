//
//  NetworkCompoundOperation.m
//  ApproveNotification
//
//  Created by Artur Mirrov on 18.08.2018.
//  Copyright © 2018 Artur Mirrov. All rights reserved.
//

#import "NetworkCompoundOperation.h"
#import "NetworkOperation.h"
#import "MappingOperation.h"
#import "RequestConfigurator.h"
#import "NetworkClient.h"
#import "OperationScheduler.h"
#import "MappingProvider.h"

@implementation NetworkCompoundOperation

- (instancetype)initWithNetworkClient:(NetworkClient *)client
                  requestConfigurator:(RequestConfigurator *)configurator
                      mappingProvider:(MappingProvider *)provider {
    self = [super init];
    if (self) {
        _configurator = configurator;
        _client = client;
        _provider = provider;
    }
    return self;
}

- (CompoundOperation *)getNetworkCompoundOperationWithResultBlock:(CompoundOperationResultBlock)resultBlock {
    NetworkOperation *networkOperation = [self networkOperation];
    CompoundOperation *compoundOperation = [CompoundOperation defaultCompoundOperation];
    
    if ([self mappingOperation]) {
        MappingOperation *mappingOperation = [self mappingOperation];
        [compoundOperation configureWithChainableOperations:@[networkOperation, mappingOperation]
                                                resultBlock:resultBlock];
    } else {
        [compoundOperation configureWithChainableOperations:@[networkOperation]
                                                resultBlock:resultBlock];
    }
    
    return compoundOperation;
}

- (NetworkOperation *)networkOperation {
    NSURLRequest *request = [_configurator request];
    
    NetworkOperation *networkOperation = [[NetworkOperation alloc] initWithRequest:request
                                                                     networkClient:_client];
    
    return networkOperation;
}

- (MappingOperation *)mappingOperation {
    MappingOperation *mappingOperation;
    if (_provider) {
        mappingOperation = [[MappingOperation alloc] initWithMangedObjectMapping:[_provider mappingManagedObject]];
    }
    
    return mappingOperation;
}

@end
