//
//  OperationScheduler.m
//  ApproveNotification
//
//  Created by Artur Mirrov on 18.08.2018.
//  Copyright © 2018 Artur Mirrov. All rights reserved.
//

#import "OperationScheduler.h"

static NSString * const kOperationQueueName = @"ru.OperationQueue";

@implementation OperationScheduler

- (instancetype)init {
    self = [super init];
    if (self) {
        _queue = [NSOperationQueue new];
        _queue.name = [kOperationQueueName stringByAppendingString:[[NSUUID UUID] UUIDString]];
        _queue.maxConcurrentOperationCount = 1;
    }
    return self;
}


#pragma mark - OperationScheduler


- (void)addOperation:(NSOperation *)operation {
    [self.queue addOperation:operation];
}

- (void)addOperations:(NSArray <NSOperation *> *)operations {
    [self.queue addOperations:operations waitUntilFinished:YES];
}

- (void)cancel {
    [self.queue cancelAllOperations];
}

@end
