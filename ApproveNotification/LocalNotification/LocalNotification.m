//
//  LocalNotification.m
//  ApproveNotification
//
//  Created by Artur Mirrov on 19.08.2018.
//  Copyright © 2018 Artur Mirrov. All rights reserved.
//

#import "LocalNotification.h"

@implementation LocalNotification

- (void)createNowLocalNotificationWithId:(NSString *)identifier
                                   title:(NSString *)title
                                subTitle:(NSString *)subTitle {
    
    NSDateComponents *triggerDate = [[NSCalendar currentCalendar] components:NSCalendarUnitYear +
                                     NSCalendarUnitMonth +
                                     NSCalendarUnitDay +
                                     NSCalendarUnitHour +
                                     NSCalendarUnitMinute +
                                     NSCalendarUnitSecond
                                                                    fromDate:[NSDate date]];
    triggerDate.second = triggerDate.second + 10;
    
    [self createNotification:identifier
                       title:title
                    subtitle:subTitle
              dateComponents:triggerDate];
}


- (void)createNotification:(NSString *)identifier
                     title:(NSString *)title
                  subtitle:(NSString *)subtitle
            dateComponents:(NSDateComponents *)dateComponents {
    
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    UNMutableNotificationContent *content = [UNMutableNotificationContent new];
    
    content.title = title;
    content.subtitle = subtitle;
    content.categoryIdentifier = @"GENEGAL";
    content.badge = @(1);
    UNCalendarNotificationTrigger *trigger = [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:dateComponents
                                                                                                      repeats:NO];
    
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:identifier
                                                                          content:content
                                                                          trigger:trigger];
    
    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"Something went wrong: %@",error);
        }
    }];
}



@end
