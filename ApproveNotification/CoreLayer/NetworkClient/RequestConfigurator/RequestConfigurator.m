//
//  RequestConfigurator.m
//  ApproveNotification
//
//  Created by Artur Mirrov on 18.08.2018.
//  Copyright © 2018 Artur Mirrov. All rights reserved.
//

#import "RequestConfigurator.h"
#import "RequestData.h"

@interface RequestConfigurator ()

@property (nonatomic) NSURL *baseURL;
@property (readwrite, nonatomic) NSURLRequest *request;

@end

@implementation RequestConfigurator

- (instancetype)initWithHTTPMethod:(NSString *)HTTPmethod
                          endPoint:(NSString *)endPoint
                        parameters:(NSDictionary *)parameters
                       requestData:(RequestData *)requestData {
    self = [super init];
    if (self) {
        _HTTPMethod = HTTPmethod;
        _endPoint = endPoint;
        _params = parameters;
        _requestData = requestData;
    }
    return self;
}


#pragma mark - RequestConfigurator


- (NSURLRequest *)request {
    return [self requestWithMethod:_HTTPMethod
                          endPoint:_endPoint
                        parameters:_params
                       requestData:_requestData];
}

- (NSURLRequest *)requestWithMethod:(NSString *)method
                           endPoint:(NSString *)endPoint
                         parameters:(NSDictionary *)parameters
                        requestData:(RequestData *)requestData {
    
    NSMutableURLRequest *mutableRequest = [NSMutableURLRequest requestWithURL:self.baseURL];
    mutableRequest.allHTTPHeaderFields = requestData.httpHeaderFields.copy;
    
    [mutableRequest setHTTPMethod:method];
    
    NSURLRequest *request;
    if (requestData.bodyData) {
        [mutableRequest setHTTPBody:requestData.bodyData];
    }
    
    return request = [mutableRequest copy];
}


#pragma mark - Helper Methods

- (NSURL *)generateURLWithEndPoint:(NSString *)endPoint
{
    NSArray *urlParts = @[endPoint];
    NSString *urlPath = [urlParts componentsJoinedByString:@"/"];
    NSURL *finalURL = [self.baseURL URLByAppendingPathComponent:urlPath];
    
    return finalURL;
}


- (NSURL *)baseURL {
    if (!_baseURL) {
        _baseURL = [NSURL URLWithString:kServerBaseURL];
    }
    return _baseURL;
}

@end
