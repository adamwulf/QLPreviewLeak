//
//  PreviewViewController.m
//  QLPreviewLeak
//
//  Created by Adam Wulf on 1/7/18.
//  Copyright © 2018 Adam Wulf. All rights reserved.
//

#import "PreviewViewController.h"
#import <Quartz/Quartz.h>

@interface PreviewViewController () <QLPreviewingController>

@property (nonatomic, weak) IBOutlet NSTextField* lbl;

@end

@implementation PreviewViewController

- (NSString *)nibName {
    return @"PreviewViewController";
}

- (void)loadView {
    [super loadView];
    // Do any additional setup after loading the view from its nib.
}

- (void)preparePreviewOfSearchableItemWithIdentifier:(NSString *)identifier queryString:(NSString*)queryString  completionHandler:(QLPreviewItemLoadingBlock)handler {
    
    // Perform any setup necessary in order to prepare the view.
    
    [_lbl setStringValue:identifier];
    
    // Call the completion handler so Quick Look knows that the preview is fully loaded.
    // Quick Look will display a loading spinner while the completion handler is not called.

    handler(nil);
}

@end

