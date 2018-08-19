//
//  RequestConfigurator.h
//  ApproveNotification
//
//  Created by Artur Mirrov on 18.08.2018.
//  Copyright © 2018 Artur Mirrov. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RequestData;

@interface RequestConfigurator : NSObject

@property (nonatomic) NSString *HTTPMethod;
@property (nonatomic) NSString *endPoint;
@property (nonatomic) NSDictionary *params;
@property (nonatomic) RequestData *requestData;

@property (readonly, nonatomic) NSURLRequest *request;

- (instancetype)initWithHTTPMethod:(NSString *)method
                          endPoint:(NSString *)endPoint
                        parameters:(NSDictionary *)parameters
                       requestData:(RequestData *)requestData;

@end
