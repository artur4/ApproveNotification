//
//  ViewController.m
//  ApproveNotification
//
//  Created by Artur Mirrov on 18.08.2018.
//  Copyright © 2018 Artur Mirrov. All rights reserved.
//

#import "ViewController.h"
#import "DataModel.h"

@interface ViewController () <DataServiceProtocol>

@property (strong, nonatomic) NSTimer *loadDataTimer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataService.delegate = self;
    [self.dataService getData];
    
    self.loadDataTimer = [NSTimer scheduledTimerWithTimeInterval:60.0f * 2 target:self selector:@selector(loadData:) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.loadDataTimer forMode:NSRunLoopCommonModes];
}

- (void)loadData:(id)sender {
    [self.dataService getData];
}

#pragma mark - DataServiceProtocol

- (void)serviceRequestStateChanged:(NetworkRequestState)state {
    
    switch (state) {
        case NetworkRequestStateError:
            break;
        case NetworkRequestStateFailure:
            break;
        case NetworkRequestStateProcess:
            break;
        case NetworkRequestStateSuccess:
            break;
        case NetworkRequestStateSuspend:
            break;
        case NetworkRequestStateNotInternet:
            break;
    }
}

- (void)dataService:(DataService *)service answerForGetData:(DatasModel *)answer {
    
    for (DataModel *data in answer.data) {
     
        if ([data.startDateTime compare:[NSDate date]] == NSOrderedAscending &&
            [data.endDateTime compare:[NSDate date]] == NSOrderedDescending) {
            
            [self.localNotification createNowLocalNotificationWithId:data.dataId
                                                               title:data.subject
                                                            subTitle:data.text];
        }
    }
}





@end
