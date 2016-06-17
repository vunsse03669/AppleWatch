//
//  ComplicationController.m
//  WatchApp Extension
//
//  Created by Mr.Vu on 6/16/16.
//  Copyright © 2016 Mr.Vu. All rights reserved.
//

#import "ComplicationController.h"
@import ClockKit;

@interface ComplicationController ()

@end

@implementation ComplicationController

#pragma mark - Timeline Configuration

- (void)getSupportedTimeTravelDirectionsForComplication:(CLKComplication *)complication withHandler:(void(^)(CLKComplicationTimeTravelDirections directions))handler {
    handler(CLKComplicationTimeTravelDirectionForward|CLKComplicationTimeTravelDirectionBackward);
}

- (void)getTimelineStartDateForComplication:(CLKComplication *)complication withHandler:(void(^)(NSDate * __nullable date))handler {
    handler(nil);
}

- (void)getTimelineEndDateForComplication:(CLKComplication *)complication withHandler:(void(^)(NSDate * __nullable date))handler {
    handler(nil);
}

- (void)getPrivacyBehaviorForComplication:(CLKComplication *)complication withHandler:(void(^)(CLKComplicationPrivacyBehavior privacyBehavior))handler {
    handler(CLKComplicationPrivacyBehaviorShowOnLockScreen);
}

#pragma mark - Timeline Population

- (void)getCurrentTimelineEntryForComplication:(CLKComplication *)complication withHandler:(void(^)(CLKComplicationTimelineEntry * __nullable))handler {
    // Call the handler with the current timeline entry
    if(complication.family == CLKComplicationFamilyCircularSmall) {
        CLKComplicationTemplateCircularSmallRingText *template = [[CLKComplicationTemplateCircularSmallRingText alloc]init];
        template.textProvider = [CLKSimpleTextProvider textProviderWithText:@"Title Text"];
        template.fillFraction = 0.07f;
        template.ringStyle = CLKComplicationRingStyleClosed;
        CLKComplicationTimelineEntry *timelineEntry = [CLKComplicationTimelineEntry entryWithDate:[NSDate date] complicationTemplate:template];
        handler(timelineEntry);
    }
    
    handler(nil);
}

- (void)getTimelineEntriesForComplication:(CLKComplication *)complication beforeDate:(NSDate *)date limit:(NSUInteger)limit withHandler:(void(^)(NSArray<CLKComplicationTimelineEntry *> * __nullable entries))handler {
    // Call the handler with the timeline entries prior to the given date
    handler(nil);
}

- (void)getTimelineEntriesForComplication:(CLKComplication *)complication afterDate:(NSDate *)date limit:(NSUInteger)limit withHandler:(void(^)(NSArray<CLKComplicationTimelineEntry *> * __nullable entries))handler {
    // Call the handler with the timeline entries after to the given date
    handler(nil);
}

#pragma mark Update Scheduling

- (void)getNextRequestedUpdateDateWithHandler:(void(^)(NSDate * __nullable updateDate))handler {
    // Call the handler with the date when you would next like to be given the opportunity to update your complication content
    handler(nil);
}

#pragma mark - Placeholder Templates

- (void)getPlaceholderTemplateForComplication:(CLKComplication *)complication withHandler:(void(^)(CLKComplicationTemplate * __nullable complicationTemplate))handler {
    // This method will be called once per supported complication, and the results will be cached
    CLKComplicationTemplate *template = nil;
    switch(complication.family) {
        case CLKComplicationFamilyModularSmall:
            template = nil;
            break;
        case CLKComplicationFamilyModularLarge:
            template = nil;
            break;
        case CLKComplicationFamilyUtilitarianSmall:
            template = nil;
            break;
        case CLKComplicationFamilyUtilitarianLarge:
            template = nil;
            break;
        case CLKComplicationFamilyCircularSmall:
            
            break;
    }
    handler(template);
}

@end
