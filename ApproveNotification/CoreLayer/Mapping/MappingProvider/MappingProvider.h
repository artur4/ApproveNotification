//
//  MappingProvider.h
//  ApproveNotification
//
//  Created by Artur Mirrov on 18.08.2018.
//  Copyright © 2018 Artur Mirrov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <EasyMapping/EasyMapping.h>

@interface MappingProvider : NSObject

@property (nonatomic) Class objectClass;

- (instancetype)initWithManagedObjectClass:(Class)objectClass;

- (EKManagedObjectMapping *)mappingForManagedObjectClass:(Class)managedClass;
- (EKManagedObjectMapping *)mappingManagedObject;


@end
