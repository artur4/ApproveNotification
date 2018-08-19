//
//  OperationScheduler.h
//  ApproveNotification
//
//  Created by Artur Mirrov on 18.08.2018.
//  Copyright © 2018 Artur Mirrov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OperationScheduler : NSObject

@property (nonatomic) NSOperationQueue *queue;

- (void)addOperation:(NSOperation *)operation;
- (void)addOperations:(NSArray <NSOperation *> *)operations;
- (void)cancel;

@end
