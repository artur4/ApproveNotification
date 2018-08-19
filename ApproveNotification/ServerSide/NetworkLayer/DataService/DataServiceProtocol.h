//
//  DataServiceProtocol.h
//  ApproveNotification
//
//  Created by Artur Mirrov on 18.08.2018.
//  Copyright © 2018 Artur Mirrov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseService.h"
@class DataService, DatasModel;

@protocol DataServiceProtocol <BaseServiceProtocol>
@optional

- (void)dataService:(DataService *)service answerForGetData:(DatasModel *)answer;

@end
