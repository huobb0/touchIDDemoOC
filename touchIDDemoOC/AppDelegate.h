//
//  AppDelegate.h
//  touchIDDemoOC
//
//  Created by Zsombor on 2021. 01. 31..
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

