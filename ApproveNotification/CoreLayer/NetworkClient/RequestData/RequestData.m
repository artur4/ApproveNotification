//
//  RequestData.m
//  ApproveNotification
//
//  Created by Artur Mirrov on 18.08.2018.
//  Copyright © 2018 Artur Mirrov. All rights reserved.
//

#import "RequestData.h"

@implementation RequestData

- (instancetype)initWithHttpHeaderFields:(NSDictionary *)httpHeaderFields
                                bodyData:(NSData *)bodyData {
    self = [super init];
    if (self) {
        _httpHeaderFields = httpHeaderFields;
        _bodyData = bodyData;
    }
    return self;
}

@end
