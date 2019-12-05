# Change log

In this section you can find what has changed from version to version.

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
