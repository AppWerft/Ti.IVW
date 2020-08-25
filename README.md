# infonline Titanium Module
![](http://www.ivw.eu/profiles/ivw_website/themes/ivw_theme/logo.png)

## Description

Axway Titanium Module for INFOnline. InfOnline is the solution for [IVW-tracking](http://www.ivw.eu/digital/digital). The developmenbt was sponsored by [4D Media GmbH](https://4dmedia.de/) in Düsseldorf.

## About IVW

The German Audit Bureau of Circulation (IVW) has neutrally and objectively recorded and audited the distribution of advertising media since 1949. With the establishment of the IVW, media providers (publishers), advertisers and advertising agencies created an effective controlling system which is under their joint supervision.

Almost all relevant advertising media categories are covered under the umbrella of the IVW: newspapers, magazines and other periodically appearing press products, broadcast media (radio and TV), cinema advertising and digital media.

The underlying idea is simple and obvious. In order to function, the advertising market requires performance data regarding the advertising media that are offered on the market. However, if these data were collected by each provider of an advertising medium for its own advertising media with its own individual methods, on the one hand, no comparability with the data of other providers would be guaranteed, and on the other hand, there would also be no independent assurance of data quality. The advertising market players transferred these tasks to a common parent institution: the IVW.

The results of the IVW's work provide reliable data for the market, for professional advertisers and performance-based competition between the media. As an independent, non-commercial, and neutral auditing organization, the IVW provides the media and advertising industry, and interested public, with basic data for the marketing of media as advertising.

Behind the system of circulation certification, digital measurement applications and the corresponding audit procedures are complex rules and regulations which are negotiated and decided by the delegates of advertisers, agencies and media providers at the IVW "round table". The bodies are committed to the consensus principle and to the IVW´s duty to ensure transparency, i.e. a common denominator is reached in the IVW between the opposing interests of the provider and the customer. The resulting definitions and conventions form market standards and the data provided by the IVW have become the accepted currency for quantitative advertising media performance.  The consensus principle ensures the general acceptance of these currencies, and in this sense, the IVW is a classic Joint Industry Committee (JIC).

## Accessing the infonline Module

To access this module from JavaScript, you would do the following:

    var InfOnline = require("ti.infonline");

The infonline variable is a reference to the Module object.

## Reference

### Constants

#### Event States

Event Type specific states with the following naming convention

```
InfOnline.STATE_VIEW_APPEARED
InfOnline.STATE_VIEW_REFRESHED
InfOnline.STATE_VIEW_DISAPPEARED

InfOnline.STATE_DATA_CANCELLED
InfOnline.STATE_DATA_REFRESH
InfOnline.STATE_DATA_SUCCEEDED
InfOnline.STATE_DATA_FAILED

InfOnline.STATE_DOCUMENT_OPEN
InfOnline.STATE_DOCUMENT_CLOSE
InfOnline.STATE_DOCUMENT_EDIT

InfOnline.STATE_DOWNLOAD_CANCELLED
InfOnline.STATE_DOWNLOAD_START
InfOnline.STATE_DOWNLOAD_SUCCEEDED
InfOnline.STATE_DOWNLOAD_FAILED

InfOnline.STATE_GAME_ACTION
InfOnline.STATE_GAME_STARTED
InfOnline.STATE_GAME_FINISHED
InfOnline.STATE_GAME_WON
InfOnline.STATE_GAME_LOST
InfOnline.STATE_GAME_NEW_HIGHSCORE
InfOnline.STATE_GAME_NEW_ACHIEVEMENT

InfOnline.STATE_GESTURE_SHAKE

InfOnline.STATE_HARDWARE_BUTTON_PUSHED

InfOnline.STATE_IAP_STARTED
InfOnline.STATE_IAP_FINISHED
InfOnline.STATE_IAP_CANCELLED

InfOnline.STATE_LOGIN_SUCCEEDED
InfOnline.STATE_LOGIN_FAILED
InfOnline.STATE_LOGIN_LOGOUT

InfOnline.STATE_AUDIO_PLAY
InfOnline.STATE_AUDIO_PAUSE
InfOnline.STATE_AUDIO_STOP
InfOnline.STATE_AUDIO_NEXT
InfOnline.STATE_AUDIO_PREVIOUS
InfOnline.STATE_AUDIO_REPLAY
InfOnline.STATE_AUDIO_SEEK_BACK
InfOnline.STATE_AUDIO_SEEK_FORWARD

InfOnline.STATE_VIDEO_PLAY
InfOnline.STATE_VIDEO_PAUSE
InfOnline.STATE_VIDEO_STOP
InfOnline.STATE_VIDEO_NEXT
InfOnline.STATE_VIDEO_PREVIOUS
InfOnline.STATE_VIDEO_REPLAY
InfOnline.STATE_VIDEO_SEEK_BACK
InfOnline.STATE_VIDEO_SEEK_FORWARD

InfOnline.STATE_PUSH_RECEIVED

InfOnline.STATE_UPLOAD_START
InfOnline.STATE_UPLOAD_FAILED
InfOnline.STATE_UPLOAD_CANCELLED
InfOnline.STATE_UPLOAD_SUCCEEDED


InfOnline.STATE_AD_OPEN
InfOnline.STATE_AD_CLOSE

InfOnline.STATE_ORIENTATION_CHANGED
```
## offerIdentifier
The module needs an offerId, you will get this id from IVW.

## Functions

#### infonline.startSession()
Start a session. You have to set the offer identifier before calling this function!

#### infonline.stopSession()
Stops a previously initiated session.

#### infonline.logEvent(event)
Log a single event. Events will be queued until configured threshold is reached.

See documentation.md for details.

#### infonline.sendLoggedEvents()
Forced send of all queued events

#### infonline.optOut()
The user must have the option to opt out. If you don't want to handle the value in your own code,
just call the optOut() function and the logEvent / startSession functions will respect that

#### infonline.optIn()
Re enable event logging after having called optOut()

### Android only functions:
#### infonline.enableDebug()
#### infonline.disableDebug()
#### infonline.getVersion()
#### setDeviceIdEnabled()  
Needs runtime permission "PHONE_STATE"

### Properties

#### infonline.customerData
Customer data according INFOnline SDK documentation

## Authors

* (C) 2017 by Stefan Gross (st.gross@gmx.net) (iOS)
* (C) 2017 by Rainer Schleevoigt (rs@hamburger-appwerft.de) (Android)


## License

MIT License
