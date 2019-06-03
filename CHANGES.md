- # Change log

In this section you can find what has changed from version to version.

## 2.0.3

  - Fixes some memory leaks during trip;

## 2.0.2

  - Compiles over Xcode 10.2.1;
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
    - fuel consumption
    - fuel cost
    - is waiting for consumption
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
