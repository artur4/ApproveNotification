//
//  ServerResponse.m
//  ApproveNotification
//
//  Created by Artur Mirrov on 18.08.2018.
//  Copyright © 2018 Artur Mirrov. All rights reserved.
//

#import "ServerResponse.h"

@implementation ServerResponse

- (instancetype)initWithData:(NSData *)data
                    response:(NSHTTPURLResponse *)response
                       error:(NSError *)error {
    self = [super init];
    if (self) {
        _data = data;
        _response = response;
        _error = error;
    }
    return self;
}

@end
