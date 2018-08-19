//
//  MappingProvider.m
//  ApproveNotification
//
//  Created by Artur Mirrov on 18.08.2018.
//  Copyright © 2018 Artur Mirrov. All rights reserved.
//

#import "MappingProvider.h"
#import "DataModel.h"

@implementation MappingProvider

- (instancetype)initWithManagedObjectClass:(Class)objectClass {
    self = [super init];
    if (self) {
        _objectClass = objectClass;
    }
    return self;
}

- (EKManagedObjectMapping *)mappingForManagedObjectClass:(Class)managedClass {
    _objectClass = managedClass;
    
    return [self mappingManagedObject];
}

- (EKManagedObjectMapping <EKManagedMappingProtocol>*)mappingManagedObject {
    
    NSString *objectName = NSStringFromClass(_objectClass);
    NSString *mappingName = [NSString stringWithFormat:@"%@Mapping", objectName];
    
    EKManagedObjectMapping <EKManagedMappingProtocol> *selectedMapping = nil;
    SEL mappingSelector = NSSelectorFromString(mappingName);
    if ([self respondsToSelector:mappingSelector]) {
        selectedMapping = ((EKManagedObjectMapping <EKManagedMappingProtocol>* (*)(id, SEL))[self methodForSelector:mappingSelector])(self, mappingSelector);
    }
    return selectedMapping;
}

- (EKObjectMapping *)DatasModelMapping {
    return [DatasModel objectMapping];
}

@end
