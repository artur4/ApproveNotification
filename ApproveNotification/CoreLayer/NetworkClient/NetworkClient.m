//
//  NetworkClient.m
//  ApproveNotification
//
//  Created by Artur Mirrov on 18.08.2018.
//  Copyright © 2018 Artur Mirrov. All rights reserved.
//

#import "NetworkClient.h"
#import "RequestConfigurator.h"
#import "ServerResponse.h"

@interface NetworkClient ()

@property (nonatomic) NSURLSession *session;

@end

@implementation NetworkClient

- (instancetype)init {
    self = [super init];
    if (self) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.timeoutIntervalForRequest = 10.0;
        _session = [NSURLSession sessionWithConfiguration:config];
    }
    return self;
}

- (void)sendRequest:(NSURLRequest *)request completionBlock:(NetworkClientCompletion)block {
    
    [[self.session dataTaskWithRequest:request
                     completionHandler:^(NSData * _Nullable data,
                                         NSURLResponse * _Nullable response,
                                         NSError * _Nullable error) {
          NSHTTPURLResponse *HTTPURLResponse = nil;
          
          if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
              HTTPURLResponse = (NSHTTPURLResponse *)response;
          }
          
          ServerResponse *model = [[ServerResponse alloc] initWithData:data
                                                              response:HTTPURLResponse
                                                                 error:error];
          
          dispatch_async(dispatch_get_main_queue(), ^{
              block(model);
          });
          
      }] resume];
}

@end
