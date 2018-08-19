//
//  ServiceAPIProtocol.h
//  ApproveNotification
//
//  Created by Artur Mirrov on 18.08.2018.
//  Copyright © 2018 Artur Mirrov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ServiceAPIProtocol <NSObject>

- (void)didGetMessageInfo:(id)message
                  forType:(NSUInteger)type;

- (void)serviceRequestStateChanged:(NetworkRequestState)state;


@end
