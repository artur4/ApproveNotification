//
//  MappingOperation.m
//  ApproveNotification
//
//  Created by Artur Mirrov on 18.08.2018.
//  Copyright © 2018 Artur Mirrov. All rights reserved.
//

#import "MappingOperation.h"

@interface MappingOperation ()

@property (nonatomic) EKManagedObjectMapping *managedObjectMapping;

@end

@implementation MappingOperation

- (instancetype)initWithMangedObjectMapping:(EKManagedObjectMapping *)managedObjectMapping {
    self = [super init];
    if (self) {
        _managedObjectMapping = managedObjectMapping;
    }
    return self;
}

- (Class)inputDataClass {
    return [NSData class];
}

- (void)processInputData:(id)inputData
         completionBlock:(ChainableOperationBaseOutputDataBlock)completionBlock {
    
    id externalRepresentation = [NSJSONSerialization JSONObjectWithData:inputData options:kNilOptions error:nil];
    
    __block id object = [EKMapper objectFromExternalRepresentation:externalRepresentation withMapping:_managedObjectMapping];
    
    completionBlock(object, nil);
}

@end
