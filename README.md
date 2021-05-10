<p align="center">
  <img src="https://github.com/drivitapp/ios-sdk-sample/blob/master/logo.jpg?raw=true" />
</p>

# Drivit

[![Version](https://img.shields.io/badge/Pod-4.9.0-blue.svg?style=flat)](https://github.com/drivitapp/ios-sdk-sample/releases/latest) [![CocoaPods](https://img.shields.io/badge/CocoaPods-compatible-success?style=flat)](https://github.com/CocoaPods/CocoaPods) [![Swift 5](https://img.shields.io/badge/Swift-5-orange?style=flat)](https://developer.apple.com/swift/) [![Platform](https://img.shields.io/badge/Platform-iOS-lightgrey.svg?style=flat)](https://img.shields.io/badge/Platform-iOS-lightgrey.svg)

This is a sample project that outlines the key steps to integrate the Drivit iOS SDK into your application and put it to work. Should you have any doubt, feel free to contact us at support@drivit.com.

**Getting Started:**

- [Requirements](#requirements)
- [Installation](#installation)
- [Documentation](#documentation)

**Using the SDK:**

- [Usage](#usage)

## Requirements

- iOS 10.0+

Below is a table that shows which version of Drivit you should use for your Swift version.

Xcode | Swift | Drivit 
:---: | :------:|:---: 
12 | 5 | 4.3.1 - 4.9.0
11 | 5 | 3.3.0 - 4.2.0 
10   | 4 | 1.0.0 - 3.2.0 

### Xcode Capabilities

Add the following capabilities to your Xcode project:

- Background Modes
  - <u>Location Updates</u> - Allows us to run locations update in the background
  - <u>Remote Notifications</u> - Allows us to process background update notifications
  - <u>Background Fetch</u> - Allows us to run periodically in the background so we can update its content
  - <u>Background Processing</u> - Allows us to run periodically in the background so we can execute some operations
- Push Notifications

## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate Drivit into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'

target '<Your Target Name>' do
    pod 'Drivit', '~> 4.9.0'
end
```

Then, run the following command:

```bash
$ pod install
```

## Usage

#### 1. Add the Drivit API Key to the Plist source code

Add the following piece of code to your app's plist file:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
...
<key>DRIVIT_API_KEY</key>
<string>YOUR_API_KEY</string>
...
</dict>
</plist>
```


#### 2. Let's prepare your app delegate
Let's start by adding the following code to your App Delegate so Drivit is able to know the reason why the app was launched (if any), such as notifications and locations update:
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
	Drivit.default.register(withOptions: launchOptions)

	return true
}
```

#### 3. Allow the SDK to execute operations in the background

After that, we need to setup the Background App Refresh. This allow the SDK to run periodically in the background so that it can update its content. 

#####  3.1. iOS13 and above: Enable Background Task

To enable background task, let's include the following code in your App plist file:

```xml
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
...
	<key>BGTaskSchedulerPermittedIdentifiers</key>
	<array>
		<string>com.drivit.core.task.sync</string>
		<string>com.drivit.core.task.refresh</string>
	</array>
...
</dict>
</plist>
```

*Have in mind that adding a [`BGTaskSchedulerPermittedIdentifiers`](https://developer.apple.com/documentation/bundleresources/information_property_list/bgtaskschedulerpermittedidentifiers) key to the `Info.plist` disables [`application(_:performFetchWithCompletionHandler:)`](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1623125-application) and [`setMinimumBackgroundFetchInterval(_:)`](https://developer.apple.com/documentation/uikit/uiapplication/1623100-setminimumbackgroundfetchinterva) in iOS 13 and later.*

##### 3.2. iOS12 and below: Enable Background Fetch (Deprecated)

To enable background fetch, let's include the following code in your App Delegate:

```swift
func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
	Drivit.default.performFetch { (result) in
		switch result {
			case .newData:
				completionHandler(.newData)
			case .noData:
				completionHandler(.noData)
			case .failed:
				completionHandler(.failed)
		}
	}
}
```

**3.3. Enable Background Transfer Service**

To enable background transfer service, let's include the following code in your App Delegate:

```swift
func application(_ application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: @escaping () -> Void) {
        Drivit.default.handleEventsForBackgroundURLSession(withIdentifier: identifier, completionHandler: completionHandler)
    }
```

#### 4. Push Notifications

To keep your content up to date, it is important to register the device token and subscribe to push notifications. This way, every time we have some new content/data ready to improve user experience, we can let the app know:

```swift
func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
	Drivit.default.registerForRemoteNotifications(withDeviceToken: deviceToken)
}

func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
	Drivit.default.didReceiveRemoteNotification(userInfo: userInfo, completionHandler: completionHandler)
}
```


#### 5. Login/signup your user

Now we have everything ready, we have to login the user into the SDK before it starts recording trips.
To do so, create an instance of the ```DILogin``` or ```DISignup``` objects and provide it with the info of your user:

```swift
let regular = DISignup.regular(email: "email", password: "password",
															 firstName: "first", lastName: "last")
// OR
let advance = DISignup.advance(secret: "secret")

Drivit.authentication.signup(type: regular) { result in                
	switch(result) {
		case let .success(user): 
			print("Welcome " + user.firstName)
		case let .failure(error): 
			print("An error ocurred: " + error.localizedDescription)
	}
}
```
```swift
let regular = DILogin.regular(email: "email", password: "password")
// OR
let advance = DILogin.advance(secret: "secret")

Drivit.authentication.login(type: advance) { result in                
	switch(result) {
		case let .success(user): 
			print("Welcome " + user.firstName)
		case let .failure(error): 
			print("An error ocurred: " + error.localizedDescription)
	}
}
```

#### 6. Add relevant Google Maps API Keys

To provide an improved user experience, Drivit uses Google APIs. Feel free to set this key where it better suits your architecture:

```swift
Drivit.settings.googleAPIKey = "YOU_API_KEY"
```

#### 7. Add a vehicle to the user

All the users need to have an associated vehicle to have trips. You need to provide this vehicle to the SDK so that trips are recorded:

```swift
let vehicle = Drivit.user.createVehicle(guid: "195258", year: 2020)

Drivit.user.add(vehicleDetails: vehicle) { (result) in
	switch result {
		case .success:
			print("Vehicle added successfully")
		case .failure:
			print("Add vehicle request has failed!")
	}
}
```

And that is it! Safe trips!

The Drivit Team

## Documentation

You can see the complete reference documentation [here](https://drivitapp.github.io/ios-sdk-sample/).

