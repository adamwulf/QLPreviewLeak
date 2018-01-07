//
//  AppDelegate.m
//  PreviewLeak
//
//  Created by Adam Wulf on 1/7/18.
//  Copyright © 2018 Adam Wulf. All rights reserved.
//

#import "AppDelegate.h"
@import CoreSpotlight;

@interface AppDelegate ()

@end

@implementation AppDelegate

-(CSSearchableItem*)makeItem{
    CSSearchableItemAttributeSet *attributes = [[CSSearchableItemAttributeSet alloc] initWithItemContentType:(NSString *)kUTTypeCalendarEvent];
    
    [attributes setIdentifier:[[NSUUID UUID] UUIDString]];
    [attributes setDisplayName:[attributes identifier]];
    [attributes setTitle:[attributes identifier]];
    [attributes setStartDate:[NSDate date]];
    [attributes setEndDate:[[NSDate date] dateByAddingTimeInterval:60*60]];
    [attributes setAllDay:@(NO)];
    [attributes setContainerTitle:@"Any Calendar"];
    [attributes setContainerIdentifier:[attributes identifier]];
    
    return [[CSSearchableItem alloc] initWithUniqueIdentifier:[[NSUUID UUID] UUIDString] domainIdentifier:[[NSUUID UUID] UUIDString] attributeSet:attributes];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [[CSSearchableIndex defaultSearchableIndex] deleteAllSearchableItemsWithCompletionHandler:^(NSError *_Nullable error) {
        NSArray* items = @[[self makeItem], [self makeItem], [self makeItem]];
        [[CSSearchableIndex defaultSearchableIndex] indexSearchableItems:items completionHandler:^(NSError *_Nullable error) {
            if (error) {
                NSLog(@"Error indexing searchable items (populate): %@", error);
            }
        }];
    }];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
