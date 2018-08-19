//
//  MainAssembly.m
//  ApproveNotification
//
//  Created by Artur Mirrov on 19.08.2018.
//  Copyright © 2018 Artur Mirrov. All rights reserved.
//

#import "MainAssembly.h"
#import "ViewController.h"
#import "DataService.h"
#import "LocalNotification.h"

@implementation MainAssembly

- (ViewController *)viewController {
    return [TyphoonDefinition withClass:[ViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(dataService) with:[self dataService]];
        [definition injectProperty:@selector(localNotification) with:[self localNotification]];
    }];
}

- (DataService *)dataService {
    return [TyphoonDefinition withClass:[DataService class]];
}

- (LocalNotification *)localNotification {
    return [TyphoonDefinition withClass:[LocalNotification class]];
}



@end
