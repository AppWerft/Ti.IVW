/**
 * infonline
 *
 * Created by Stefan Gross
 * Copyright (c) 2017 Stefan Gross. All rights reserved.
 */

#import <INFOnlineLibrary/INFOnlineLibrary.h>

#import "TiInfonlineEventProxy.h"
#import "TiInfonlineModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

static NSString* offerId = @"iamtest";
static NSString* customerData = @"";

static bool sessionStarted = NO;

@implementation TiInfonlineModule

#pragma mark Internal

- (id)moduleGUID
{
	return @"a98f00c4-5edc-4f73-aa1b-27232e9fcdf7";
}

- (NSString *)moduleId
{
	return @"ti.infonline";
}

#pragma constants

// Map Event Types to JS accessible constants
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED(EVENT_VIEW, 0, @"EVENT_VIEW", @"2.0.0", "createViewEvent(...)");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED(EVENT_IAP, 0, @"EVENT_IAP", @"2.0.0", "createIAPEvent(...)");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED(EVENT_DATA, 0, @"EVENT_DATA", @"2.0.0", "createDataEvent(...)");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED(EVENT_GAME, 0, @"EVENT_GAME", @"2.0.0", "createGameEvent(...)");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED(EVENT_AUDIO, 0, @"EVENT_AUDIO", @"2.0.0", "createAudioEvent(...)");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED(EVENT_VIDEO, 0, @"EVENT_VIDEO", @"2.0.0", "createVideoEvent(...)");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED(EVENT_AD, 0, @"EVENT_AD", @"2.0.0", "createAdEvent(...)");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED(EVENT_PUSH, 0, @"EVENT_PUSH", @"2.0.0", "createPushEvent(...)");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED(EVENT_LOGIN, 0, @"EVENT_LOGIN", @"2.0.0", "createLoginEvent(...)");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED(EVENT_DEVICE_ORIENTATION, 0, @"EVENT_DEVICE_ORIENTATION", @"2.0.0", "createDeviceOrientationEvent(...)");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED(EVENT_DOWNLOAD, 0, @"EVENT_DOWNLOAD", @"2.0.0", "createDownloadEvent(...)");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED(EVENT_UPLOAD, 0, @"EVENT_UPLOAD", @"2.0.0", "createUploadEvent(...)");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED(EVENT_DOCUMENT, 0, @"EVENT_DOCUMENT", @"2.0.0", "createDocumentEvent(...)");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED(EVENT_HARDWARE_BUTTON, 0, @"EVENT_HARDWARE_BUTTON", @"2.0.0", "createHardwareButtonEvent(...)");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED(EVENT_GESTURE, 0, @"EVENT_GESTURE", @"2.0.0", "createGestureEvent(...)");

MAKE_SYSTEM_PROP(STATE_VIEW_APPEARED, IOLViewEventTypeAppeared)
MAKE_SYSTEM_PROP(STATE_VIEW_REFRESHED, IOLViewEventTypeRefreshed)
MAKE_SYSTEM_PROP(STATE_VIEW_DISAPPEARED, IOLViewEventTypeDisappeared)

MAKE_SYSTEM_PROP(STATE_DATA_CANCELLED, IOLDataEventTypeCancelled)
MAKE_SYSTEM_PROP(STATE_DATA_REFRESH, IOLDataEventTypeRefresh)
MAKE_SYSTEM_PROP(STATE_DATA_SUCCEEDED, IOLDataEventTypeSucceeded)
MAKE_SYSTEM_PROP(STATE_DATA_FAILED, IOLDataEventTypeFailed)

MAKE_SYSTEM_PROP(STATE_DOCUMENT_OPEN, IOLDocumentEventTypeOpen)
MAKE_SYSTEM_PROP(STATE_DOCUMENT_CLOSE, IOLDocumentEventTypeClose)
MAKE_SYSTEM_PROP(STATE_DOCUMENT_EDIT, IOLDocumentEventTypeEdit)

MAKE_SYSTEM_PROP(STATE_DOWNLOAD_CANCELLED, IOLDownloadEventTypeCancelled)
MAKE_SYSTEM_PROP(STATE_DOWNLOAD_START, IOLDownloadEventTypeStart)
MAKE_SYSTEM_PROP(STATE_DOWNLOAD_SUCCEEDED, IOLDownloadEventTypeSucceeded)
MAKE_SYSTEM_PROP(STATE_DOWNLOAD_FAILED, IOLDownloadEventTypeFailed)

MAKE_SYSTEM_PROP(STATE_GAME_ACTION, IOLGameEventTypeAction)
MAKE_SYSTEM_PROP(STATE_GAME_STARTED, IOLGameEventTypeStarted)
MAKE_SYSTEM_PROP(STATE_GAME_FINISHED, IOLGameEventTypeFinished)
MAKE_SYSTEM_PROP(STATE_GAME_WON, IOLGameEventTypeWon)
MAKE_SYSTEM_PROP(STATE_GAME_LOST, IOLGameEventTypeLost)
MAKE_SYSTEM_PROP(STATE_GAME_NEW_HIGHSCORE, IOLGameEventTypeNewHighscore)
MAKE_SYSTEM_PROP(STATE_GAME_NEW_ACHIEVEMENT, IOLGameEventTypeNewAchievement)

MAKE_SYSTEM_PROP_DEPRECATED_REPLACED(STATE_GESTURE_SHAKE, 0, @"STATE_GESTURE_SHAKE", @"2.0.0", "createGestureEvent(...)");
MAKE_SYSTEM_PROP_DEPRECATED_REPLACED(STATE_HARDWARE_BUTTON_PUSHED, 0, @"STATE_HARDWARE_BUTTON_PUSHED", @"2.0.0", "createHardwareButtonEvent(...)");

MAKE_SYSTEM_PROP(STATE_IAP_STARTED, IOLIAPEventTypeStarted)
MAKE_SYSTEM_PROP(STATE_IAP_FINISHED, IOLIAPEventTypeFinished)
MAKE_SYSTEM_PROP(STATE_IAP_CANCELLED, IOLIAPEventTypeCancelled)

MAKE_SYSTEM_PROP(STATE_LOGIN_SUCCEEDED, IOLLoginEventTypeSucceeded)
MAKE_SYSTEM_PROP(STATE_LOGIN_FAILED, IOLLoginEventTypeFailed)
MAKE_SYSTEM_PROP(STATE_LOGIN_LOGOUT, IOLLoginEventTypeLogout)

MAKE_SYSTEM_PROP(STATE_AUDIO_PLAY, IOLAudioEventTypePlay)
MAKE_SYSTEM_PROP(STATE_AUDIO_PAUSE, IOLAudioEventTypePause)
MAKE_SYSTEM_PROP(STATE_AUDIO_STOP, IOLAudioEventTypeStop)
MAKE_SYSTEM_PROP(STATE_AUDIO_NEXT, IOLAudioEventTypeNext)
MAKE_SYSTEM_PROP(STATE_AUDIO_PREVIOUS, IOLAudioEventTypePrevious)
MAKE_SYSTEM_PROP(STATE_AUDIO_REPLAY, IOLAudioEventTypeReplay)
MAKE_SYSTEM_PROP(STATE_AUDIO_SEEK_BACK, IOLAudioEventTypeSeekBack)
MAKE_SYSTEM_PROP(STATE_AUDIO_SEEK_FORWARD, IOLAudioEventTypeSeekForward)

MAKE_SYSTEM_PROP(STATE_VIDEO_PLAY, IOLVideoEventTypePlay)
MAKE_SYSTEM_PROP(STATE_VIDEO_PAUSE, IOLVideoEventTypePause)
MAKE_SYSTEM_PROP(STATE_VIDEO_STOP, IOLVideoEventTypeStop)
MAKE_SYSTEM_PROP(STATE_VIDEO_NEXT, IOLVideoEventTypeNext)
MAKE_SYSTEM_PROP(STATE_VIDEO_PREVIOUS, IOLVideoEventTypePrevious)
MAKE_SYSTEM_PROP(STATE_VIDEO_REPLAY, IOLVideoEventTypeReplay)
MAKE_SYSTEM_PROP(STATE_VIDEO_SEEK_BACK, IOLVideoEventTypeSeekBack)
MAKE_SYSTEM_PROP(STATE_VIDEO_SEEK_FORWARD, IOLVideoEventTypeSeekForward)

MAKE_SYSTEM_PROP_DEPRECATED_REPLACED(STATE_PUSH_RECEIVED, 0, @"STATE_PUSH_RECEIVED", @"2.0.0", "createPushEvent(...)");

MAKE_SYSTEM_PROP(STATE_UPLOAD_START, IOLUploadEventTypeStart)
MAKE_SYSTEM_PROP(STATE_UPLOAD_FAILED, IOLUploadEventTypeFailed)
MAKE_SYSTEM_PROP(STATE_UPLOAD_CANCELLED, IOLUploadEventTypeCancelled)
MAKE_SYSTEM_PROP(STATE_UPLOAD_SUCCEEDED, IOLUploadEventTypeSucceeded)

MAKE_SYSTEM_PROP(STATE_AD_OPEN, IOLAdvertisementEventTypeOpen)
MAKE_SYSTEM_PROP(STATE_AD_CLOSE, IOLAdvertisementEventTypeClose)

MAKE_SYSTEM_PROP_DEPRECATED_REPLACED(STATE_ORIENTATION_CHANGED, 0, @"STATE_ORIENTATION_CHANGED", @"2.0.0", "createDeviceOrientationEvent(...)");

#pragma Public APIs

- (void)startSession:(id)args {
    BOOL isOptOut = [[NSUserDefaults standardUserDefaults] boolForKey:@"IOLOptOut"];
    if (!isOptOut) {
        // start only if not opted out
        [[IOLSession defaultSessionFor:IOLSessionTypeSZM] startSessionWithOfferIdentifier:offerId privacyType:IOLPrivacyTypeLIN];
        sessionStarted = YES;
    }
}

- (void)stopSession:(id)args {
    if (sessionStarted) {
        [[IOLSession defaultSessionFor:IOLSessionTypeSZM] terminateSession];
    }
}

- (void)sendLoggedEvents:(id)args {
    if (sessionStarted) {
        [[IOLSession defaultSessionFor:IOLSessionTypeSZM] sendLoggedEvents];
    }
}

- (void)optOut:(id)args {
    [self stopSession:@""];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"IOLOptOut"];
    
}

- (void)optIn:(id)args {
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"IOLOptOut"];
    [self startSession:@""];
    
}

// Example:
//
// const event = Infonline.createViewEvent({
//    type: Infonline.STATE_VIEW_APPEARED,
//    category: 'my_category',
//    comment: 'My Comment'
// });
//
// Infonline.logEvent(event);
//
- (void)logEvent:(id)event {
    ENSURE_SINGLE_ARG(event, TiInfonlineEventProxy);
    
    IOLEvent *nativeEvent = [(TiInfonlineEventProxy *)event event];
    [[IOLSession defaultSessionFor:IOLSessionTypeSZM] logEvent:nativeEvent];
}

- (id)customerData
{
    return [[IOLSession defaultSessionFor:IOLSessionTypeSZM] customerData];
}

- (NSString *)version
{
    return IOLSession.libraryVersion;
}

- (void)setCustomerData:(id)value
{
    ENSURE_STRING(value);
    customerData = value;
}

- (id)offerIdentifier
{
    return offerId;
}

- (void)setOfferIdentifier:(id)value
{
    ENSURE_STRING(value);
    offerId = value;
}

- (void) logTestEvent:(id)args {
    IOLEvent *event = [[IOLGameEvent alloc] initWithType:IOLGameEventTypeAction category:@"category?" comment:@"optionalComment"];
    [[IOLSession defaultSessionFor:IOLSessionTypeSZM] logEvent:event];
}

@end
