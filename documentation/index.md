# infonline Module

## Description

Module for INFOnline 

## Accessing the infonline Module

To access this module from JavaScript, you would do the following:

```js
const IOL = require('ti.infonline');
```

The infonline variable is a reference to the Module object.

## Reference

### Constants

#### Event States
Event Type specific states with the following naming convention
- STATE_VIEW_APPEARED

## Functions

#### infonline.startSession()
Start a session. You have to set the offer identifier before calling this function!

#### infonline.stopSession()
Stops a previously initiated session.

#### infonline.logEvent(event)
Log a single event. Events will be queued until configured threshold is reached.

You have to create an "event" instance in order to log it with newer versions of the SDK.
For example, logging a view event can be done via:

```js
var event = IOL.createViewEvent({
	type: IOL.STATE_VIEW_APPEARED,
	category: 'My code',
	comment: 'My comment'
});

IOL.logEvent(event);
```

The parameters are:

| Parameter  | Meaning |
| ------------- | ------------- |
| type  | a state matching the event. See EvenState constants for supported values  |
| category  | code as assigned in/by INFOnline portal. Unassigned codes will lead to errors/warnings in the backend |
| comment  | a comment you (maybe) can define  |

#### infonline.sendLoggedEvents()
Forced send of all queued events

#### infonline.optOut()
The user must have the option to opt out. If you don't want to handle the value in your own code,
just call the optOut() function and the logEvent / startSession functions will respect that

#### infonline.optIn()
Re enable event logging after having called optOut()

###Properties
#### infonline.offerIdentifier
The INFOnline provided offer identifier. 
NOTE: You have to set it, before calling startSession()!

#### infonline.customerData
Customer data according INFOnline SDK documentation

## Usage

```js
const IOL = require('ti.infonline');
IOL.setOfferIdentifier('appXXX');
IOL.startSession();

var event = IOL.createViewEvent({
	type: IOL.STATE_VIEW_APPEARED,
	category: 'My code',
	comment: 'My comment'
});

IOL.logEvent(event);
```

## Author

(c) 2017 by Stefan Gross (st.gross@gmx.net)

## Maintainer

(c) 2020-present by Hans Knöchel (@hansemannn)

## License

MIT License