//
//  BaseService.m
//  ApproveNotification
//
//  Created by Artur Mirrov on 18.08.2018.
//  Copyright © 2018 Artur Mirrov. All rights reserved.
//

#import "BaseService.h"
#import "OperationScheduler.h"
#import "NetworkClient.h"
#import "RequestConfigurator.h"
#import "MappingProvider.h"
#import "RequestData.h"

#import "BaseServiceRequest.h"

@interface BaseService ()

@property (nonatomic) OperationScheduler *operationScheduler;

@end

@implementation BaseService

- (instancetype)init {
    self = [super init];
    if (self) {
        _operationScheduler = [OperationScheduler new];
    }
    return self;
}


- (void)networkRequestState:(NetworkRequestState)state
            withMessageInfo:(id)message
                       type:(NSUInteger)type {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self serviceRequestStateChanged:state];
        
        if (state == NetworkRequestStateSuccess) {
            [self didGetMessageInfo:message forType:type];
        }
    });
}

- (void)cancelOperationScheduler {
    [_operationScheduler cancel];
}

- (void)serviceRequestStateChanged:(NetworkRequestState)state {
    NSAssert(false, @"Subclasses must implement this method");
}

- (void)didGetMessageInfo:(id)message forType:(NSUInteger)type {
    NSAssert(false, @"Subclasses must implement this method");
}



- (CompoundOperation *)getItemsForRequest:(BaseServiceRequest *) request {
    
    NetworkClient *client = [NetworkClient new];
    RequestConfigurator *configurator = [[RequestConfigurator alloc] initWithHTTPMethod:request.httpMethod
                                                                               endPoint:request.endPoint
                                                                             parameters:request.params
                                                                            requestData:request.data];
    MappingProvider *provider;
    if (request.mapClass) {
        provider = [[MappingProvider alloc] initWithManagedObjectClass:request.mapClass];
    }
    
    NetworkCompoundOperation *networkCompoundOperation = [[NetworkCompoundOperation alloc] initWithNetworkClient:client
                                                                                             requestConfigurator:configurator
                                                                                                 mappingProvider:provider];
    
    return [self compoundNetworkOperation:networkCompoundOperation type:request.responseType];
}




- (CompoundOperation *)compoundNetworkOperation:(NetworkCompoundOperation *)networkCompoundOperation type:(NSUInteger)type {
    
    [self networkRequestState:NetworkRequestStateProcess
              withMessageInfo:nil
                         type:type];
    
    __weak typeof(self) weakSelf = self;
    
    CompoundOperation *compoundOperation = [networkCompoundOperation getNetworkCompoundOperationWithResultBlock:^(id  _Nullable data, NSError * _Nullable error) {
                                                if (error) {
                                                    
                                                    [weakSelf networkRequestState:NetworkRequestStateFailure
                                                                  withMessageInfo:error.localizedDescription
                                                                             type:type];
                                                    
                                                } else if (![data isKindOfClass:[NSNull class]]) {
                                                    
                                                    // данные пришли
                                                    [weakSelf networkRequestState:NetworkRequestStateSuccess
                                                                  withMessageInfo:data
                                                                             type:type];
                                                } else {
                                                    // если ошибка с сервера
                                                    [weakSelf networkRequestState:NetworkRequestStateError
                                                                  withMessageInfo:error.localizedDescription
                                                                             type:type];
                                                }
                                            }];
    
    [_operationScheduler addOperation:compoundOperation];
    
    return compoundOperation;
}

@end
