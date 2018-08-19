//
//  DataService.m
//  ApproveNotification
//
//  Created by Artur Mirrov on 18.08.2018.
//  Copyright © 2018 Artur Mirrov. All rights reserved.
//

#import "DataService.h"
#import "DataServiceRequest.h"
#import <OHHTTPStubs/OHHTTPStubs.h>
#import <OHHTTPStubs/OHPathHelpers.h>

@implementation DataService

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        
        static id<OHHTTPStubsDescriptor> textStub = nil; // Note: no need to retain this value, it is retained by the OHHTTPStubs itself already

        // Install
        textStub = [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
            // This stub will only configure stub requests for "*.txt" files
            return [request.URL.pathExtension isEqualToString:@"data"];
        } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
            // Stub txt files with this
            return [[OHHTTPStubsResponse responseWithFileAtPath:OHPathForFile(@"stub.json", self.class)
                                                     statusCode:200
                                                        headers:@{@"Content-Type":@"application/json"}]
                    requestTime:2.f
                    responseTime:OHHTTPStubsDownloadSpeedWifi];
        }];
        textStub.name = @"Text stub";

    
        [OHHTTPStubs onStubActivation:^(NSURLRequest * _Nonnull request, id<OHHTTPStubsDescriptor>  _Nonnull stub, OHHTTPStubsResponse * _Nonnull responseStub) {
            NSLog(@"[OHHTTPStubs] Request to %@ has been stubbed with %@", request.URL, stub.name);
        }];
        
        [OHHTTPStubs setEnabled:true];
    }
    return self;
}
- (void)getData {
    
    RequestData *data = [[RequestData alloc] initWithHttpHeaderFields:nil
                                                             bodyData:nil];
    
    [self invokeRequestForType:DataRequestGetData
                        params:nil
                          data:data];
}


#pragma mark private method

- (void)invokeRequestForType:(DataRequestType)type params:(NSDictionary *)params data:(RequestData *)data {
    DataServiceRequest *request = [[DataServiceRequest alloc] initWithType:type
                                                                    params:params
                                                                      data:data];
    [self getItemsForRequest:request];
}

#pragma mark required methods

- (void)serviceRequestStateChanged:(NetworkRequestState)state {
    [self.delegate serviceRequestStateChanged:state];
}

- (void)didGetMessageInfo:(id)message forType:(NSUInteger)type {
    switch (type) {
        case DataRequestGetData:
            [self.delegate dataService:self answerForGetData:message];
            break;
    }
}

@end
