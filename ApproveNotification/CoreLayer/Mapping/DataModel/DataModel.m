//
//  DataModel.m
//  ApproveNotification
//
//  Created by Artur Mirrov on 19.08.2018.
//  Copyright © 2018 Artur Mirrov. All rights reserved.
//

#import "DataModel.h"
#import "NSDateFormatter+Current.h"

@implementation DataModel

+ (EKObjectMapping *)objectMapping {
    return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
                mapping.ignoreMissingFields = YES;
                [mapping mapPropertiesFromDictionary:@{@"id" : @"dataId",
                                                       @"subject" : @"subject",
                                                       @"text" : @"text"
                                                       }];
                [mapping mapKeyPath:@"startDateTime" toProperty:@"startDateTime" withDateFormatter:[NSDateFormatter currentDate]];
                [mapping mapKeyPath:@"endDateTime" toProperty:@"endDateTime" withDateFormatter:[NSDateFormatter currentDate]];
            }];
}

@end


@implementation DatasModel

+ (EKObjectMapping *)objectMapping {
    return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
                mapping.ignoreMissingFields = YES;
                [mapping hasMany:[DataModel class] forKeyPath:@"data"];
            }];
}

@end
