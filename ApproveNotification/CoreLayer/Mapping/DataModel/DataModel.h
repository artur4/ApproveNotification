//
//  DataModel.h
//  ApproveNotification
//
//  Created by Artur Mirrov on 19.08.2018.
//  Copyright © 2018 Artur Mirrov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <EasyMapping/EasyMapping.h>

@interface DataModel : NSObject <EKMappingProtocol>

@property (strong, nonatomic, readonly) NSString *dataId;

@property (strong, nonatomic, readonly) NSString *subject;

@property (strong, nonatomic, readonly) NSString *text;

@property (strong, nonatomic, readonly) NSDate *startDateTime;

@property (strong, nonatomic, readonly) NSDate *endDateTime;

@end

@interface DatasModel : NSObject <EKMappingProtocol>

@property (strong, nonatomic, readonly) NSArray <DataModel *> *data;

@end

