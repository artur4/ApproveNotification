//
//  DataService.h
//  ApproveNotification
//
//  Created by Artur Mirrov on 18.08.2018.
//  Copyright © 2018 Artur Mirrov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseService.h"
#import "DataServiceProtocol.h"

@interface DataService : BaseService

@property (weak, nonatomic) id <DataServiceProtocol> delegate;

- (void)getData;

@end
