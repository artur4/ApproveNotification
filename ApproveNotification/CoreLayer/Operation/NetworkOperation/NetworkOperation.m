//
//  NetworkOperation.m
//  ApproveNotification
//
//  Created by Artur Mirrov on 18.08.2018.
//  Copyright © 2018 Artur Mirrov. All rights reserved.
//

#import "NetworkOperation.h"
#import "NetworkClient.h"

@interface NetworkOperation ()

@property(nonatomic) NetworkClient *networkClient;
@property(nonatomic) NSURLRequest *request;

@end

@implementation NetworkOperation

- (instancetype)initWithRequest:(NSURLRequest *)request
                  networkClient:(NetworkClient *)networkClient {
    self = [super init];
    if (self) {
        _networkClient = networkClient;
        _request = request;
    }
    return self;
}

- (Class)inputDataClass {
    return Nil;
}

- (void)processInputData:(id)inputData
         completionBlock:(ChainableOperationBaseOutputDataBlock)completionBlock {
    
    [self.networkClient sendRequest:self.request
                    completionBlock:^(ServerResponse *serverResponse) {
                        completionBlock(serverResponse.data, serverResponse.error);
                    }];
}

@end
