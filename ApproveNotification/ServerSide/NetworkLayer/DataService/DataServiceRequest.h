//
//  DataServiceRequest.h
//  ApproveNotification
//
//  Created by Artur Mirrov on 18.08.2018.
//  Copyright © 2018 Artur Mirrov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseServiceRequest.h"

typedef NS_ENUM(NSUInteger, DataRequestType) {
    DataRequestGetData = 00001,
};

@interface DataServiceRequest : BaseServiceRequest

- (instancetype)initWithType:(DataRequestType)type
                      params:(NSDictionary *)params
                        data:(RequestData *)data;

@end
