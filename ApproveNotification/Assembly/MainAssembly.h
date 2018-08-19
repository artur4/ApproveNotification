//
//  MainAssembly.h
//  ApproveNotification
//
//  Created by Artur Mirrov on 19.08.2018.
//  Copyright © 2018 Artur Mirrov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Typhoon/Typhoon.h>

@class ViewController, DataService, LocalNotification;

@interface MainAssembly : TyphoonAssembly

- (ViewController *)viewController;

- (LocalNotification *)localNotification;

@end
