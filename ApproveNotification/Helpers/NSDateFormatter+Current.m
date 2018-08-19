//
//  NSDateFormatter+Current.m
//  ApproveNotification
//
//  Created by Artur Mirrov on 19.08.2018.
//  Copyright © 2018 Artur Mirrov. All rights reserved.
//

#import "NSDateFormatter+Current.h"

@implementation NSDateFormatter (Current)

+ (NSDateFormatter *)currentDate {
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    return formatter;
}

@end
