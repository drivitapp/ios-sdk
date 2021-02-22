# Change log

In this section you can find what has changed from version to version.

## 4.5.1

- Fixes some background crashes;

## 4.5.0

- Allows you to enable Background Processing capability by setting the following background task identifiers:
  - `com.drivit.core.task.sync`
  - `com.drivit.core.task.refresh` 
- Updates `Firebase` dependency version to `7.4.0`;
- Logout action now returns a boolean to handle unsuccessful scenario;
- DIPermission changes:
  - New `reason()` method to check which permissions the app has defined and behave accordingly;
  - `.background` identifier has been renamed to `.backgroundRefresh` to better represent its cause;
  - `state()` method inside the DIPermission object has been renamed to `status()`;
- Improves background sync execution;

## 4.4.0

- Includes new iOS14 location precision detection in the `Permissions Manager` (we are treating the lack of precise location the same as missing location permission);
- `DIPermission` protocol changes:
  - Removes `recheck` method;
  - Updates `resolve` method replacing `view` parameter by the `request` parameter. This new enum parameter allows you to request multiple dialogs in a row for a specific permission (e.g In case of not determined yet, `Location` is now able to request multiple dialogs in a row when using `.complete` case. Tapping `When In Use` button will trigger `Always` permission dialog right after);
- `DIUsage` object changes:
  - Time pattern update property has been renamed to  `timePatternLastUpdated`;
- Updates `Firebase` dependency version to `7.1.0`;
- Improves overall performance;
- Fixes minor issues;

## 4.3.1

- Improves logic to better detect trip's origin;
- Improves overall performance;
- Fixes minor issues;

## 4.2.0

- Improves internal logic when detecting events;
- Improves trip recording;
- Fixes minor issues;

## 4.1.0-beta1

- Compiles over Xcode 12 beta;

## 4.0.0

- Updates SDK environments;

## 4.0.0-beta4

- Fixes battery levels report when the user finishes a trip;

## 4.0.0-beta3

- Fixes logout call;

## 4.0.0-beta2

- Fixes framework string version value;

## 4.0.0-beta1

- Adds WLTP properties on the `Vehicle Details` object;
- Adds new WLTP properties on the `DIReport` object;
- New fuel type ID `DIFuel.Ethanol` that can be used to get ethanol-based vehicles;
- The SDK now returns different defaults depending on the region of the user, namely the fuel price for the base vehicle, the electricity price associated with each charging rule, and the default electric vehicle;
- Fixes minor issues;

## 4.0.0-alpha5

- The SDK now returns different results as a function of the region of the user as set by Drivit Authentication Login & Signup. In particular, in the APIs related to vehicle setup;
- Fixes minor issues;

## 4.0.0-alpha4

- Improves current vehicle update;
- Fixes charging rules update;
- Fixes minor issues;

## 4.0.0-alpha3

- Fixes trips target vehicle consumption data update;
- Fixes trips report;
- Fixes target vehicle details update;
- Creates DIRegion public init;

## 4.0.0-alpha2

- Fixes electricity price value on target vehicle consumption data;
- Fixes some minor issues;

## 4.0.0-alpha1

- Drivit public API is now splitted into 5 main classes:
  - `.authentication` (allows you to check if user is logged in and call methods such as login & signup);
  - `.settings` (allows you to set app optional properties like googleAPIKey);
  - `.default` (allows you to setup app methods like push notifications and enable debug mode;
  - `.cloud` (allows you to perform API requests such as carModels, carMakes & carVersions);
  - `.user` (allows you to request user info such as trips, current vehicle and update user preferences);
- User preferences can be accessed through `.user.preferences` and it allows you to set well known properties such as `charging rules` and `data plan`. A new property called `isBeaconAssistedTripRecordingEnabled` is available to enable trip's recording using beacons;
- `.authentication` class allows you to delete you account by calling `.removeAccount` method;
- `Signup` and `Login` methods are now called independently (`Drivit.shared.auth(type: )` was removed).
- `.signup` method gives you the possibility to set the user's region when signing up using a DIRegion object. E.g. `DIRegion(countryCode: "code1", countrySubclass: ["region1", "region2"]))`
- All PT references in the vehicle details object have been replaced by an EN reference;
- Trip methods are now called directly in the objects. If you want to update rejected reason or fuel consumption, you can now set those properties directly. E.g. `trip.rejectedReason = ...` instead of calling `Drivit.shared.rejection(reason: Int, guid: String)`.
- `Origin` and `Destination` do not require a class editor anymore. Feel free to set those properties directly in the object as well without having to call a save button;
- Trip changes are now released to the app through a notification (and not through a delegate anymore). This way you can listen for trip changes in any part of your app. Changes are propagated directly to the objects you may have in memory. No update is required;
  - `.didStartTripNotification`
  - `.didFinishTripNotification`
  - `.didRestartTripNotification`
  - `.didChangeTripNotification`
  - `.didUpdateReportNotification`
  - `.didChangeTripsWaitingForSyncNotification`
- `DIPermissions` object to listen system settings changes is now better than before. Use `.start` and `.stop` calls based on your app needs;
- Improves overall communication with Drivit SDK;
- Improves overall performance;

## 2.0.4

- The purpose of this release is to allow clients which still use the Drivit SDK version 2.x to start migrating their apps to xcode 11.2.1 without having to deal with changes to the Drivit SDK

## 3.4.0

- Improves trip recording;
- Updates documentation;
- Compiles over Xcode 11;
- Fixes some minor issues;

## 3.3.1

- Fixes some minor issues;

## 3.3.0

- Improves trip recording;
- Improves trip's origin and destination;
- Fixes some minor issues;

## 3.2.0

- Improves setting changes listener;
- Improves sdk logging and performance;
- Improves files synchronization;
- Fully tested against the last available version of iOS 13 (iOS 13.1, Beta 2);

## 3.1.3

- Fixes push notification setup;
- Fixes risk score request;
- Improves permissions object listener;

## 3.1.0

- Improves recording performance;
- Implements new pinning validation;
- Creates new DIPermissions object to listen system settings changes;
- Fixes some minor issues;

## 3.0.0

- Improves pinning mechanism;
- Improves push notification configuration;
- Improves recording efficiency;
- Improves database access;
- Updates authentication error cases;
- Fixes authentication process where in some situation user's car might disappeared;
- Fixes some minor issues;

## 2.0.3

- Fixes some memory leaks during trip;

## 2.0.2

- Compiles over Xcode 10.2.1
- Fixes trips' data base access call;

## 2.0.1

- Compiles over Xcode 10.1;

## 2.0.0

- Improves trip recording efficiency;
- Internal improvements;
  
## 1.9.1

- Avoids user's flights recording;
- Detects if the device is connected to a vehicle for better recording;
- Provides public method to enable debug mode;
- Includes three additional methods:
  - fuel consumption;
  - fuel cost;
  - is waiting for consumption;
  - Internal improvements;
- Minor bug fixes;
  
## 1.9.0

- Improves location tracking battery consumption;
- Internal improvements;
- Minor bug fixes;
  
## 1.8.0

- Improves snap to road request;
- Internal improvements;
- Minor bug fixes;
  
## 1.7.1

- Improves trips history loading performance;
  
## 1.7.0

- Automatic trip classification (whether they belong to the user or not);
- `syncAccelAndTrips` method now receives a boolean to force sync relevant info for classification. This property is only required if your app is using classification. The default value for this property is `false`;
- Internal improvements;
- Minor bug fixes;
  
## 1.6.0-beta

- Internal improvements;
  
## 1.5.3

- Includes a new method to edit trip origin and destination;
- Internal improvements;
