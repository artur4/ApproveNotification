//
//  LocalNotification.h
//  ApproveNotification
//
//  Created by Artur Mirrov on 19.08.2018.
//  Copyright © 2018 Artur Mirrov. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UserNotifications;

@interface LocalNotification : NSObject


- (void)createNowLocalNotificationWithId:(NSString *)identifier
                                   title:(NSString *)title
                                subTitle:(NSString *)subTitle;

@end
