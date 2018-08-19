//
//  DataServiceRequest.m
//  ApproveNotification
//
//  Created by Artur Mirrov on 18.08.2018.
//  Copyright © 2018 Artur Mirrov. All rights reserved.
//

#import "DataServiceRequest.h"
#import "DataModel.h"

@implementation DataServiceRequest

- (instancetype)initWithType:(DataRequestType)type params:(NSDictionary *)params data:(RequestData *)data {
    
    self = [super init];
    if (self) {
        self.params = params;
        self.data = data;
        
        [self setupRequest:type];
    }
    return self;
}

- (void)setupRequest:(DataRequestType)type {
    
    self.responseType = type;
    
    switch (type) {
        case DataRequestGetData:
            self.endPoint = kEndPointGetData;
            self.httpMethod = kHTTPMethodGET;
            self.mapClass = [DatasModel class];
            break;
        default:
            break;
    }
}

@end
