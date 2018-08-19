//
//  ServerResponse.h
//  ApproveNotification
//
//  Created by Artur Mirrov on 18.08.2018.
//  Copyright © 2018 Artur Mirrov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServerResponse : NSObject

@property (nonatomic) NSData *data;
@property (nonatomic) NSHTTPURLResponse *response;
@property (nonatomic) NSError *error;

- (instancetype)initWithData:(NSData *)data
                    response:(NSHTTPURLResponse *)response
                       error:(NSError *)error;

@end
