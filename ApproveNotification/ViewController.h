//
//  ViewController.h
//  ApproveNotification
//
//  Created by Artur Mirrov on 18.08.2018.
//  Copyright © 2018 Artur Mirrov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataService.h"
#import "LocalNotification.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) DataService *dataService;

@property (strong, nonatomic) LocalNotification *localNotification;

@end

