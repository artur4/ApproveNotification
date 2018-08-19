//
//  MappingOperation.h
//  ApproveNotification
//
//  Created by Artur Mirrov on 18.08.2018.
//  Copyright © 2018 Artur Mirrov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <COOperation/ChainableOperationBase.h>
#import <EasyMapping/EasyMapping.h>

@class MappingProvider;

@interface MappingOperation : ChainableOperationBase

- (instancetype)initWithMangedObjectMapping:(EKManagedObjectMapping *)managedObjectMapping;

@end
