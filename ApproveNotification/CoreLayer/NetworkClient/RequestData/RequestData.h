//
//  RequestData.h
//  ApproveNotification
//
//  Created by Artur Mirrov on 18.08.2018.
//  Copyright © 2018 Artur Mirrov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPMethodConstants.h"

@interface RequestData : NSObject

@property (nonatomic) NSDictionary *httpHeaderFields;
@property (nonatomic) NSData *bodyData;

- (instancetype)initWithHttpHeaderFields:(NSDictionary *)httpHeaderFields
                                bodyData:(NSData *)bodyData;

@end
