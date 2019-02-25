<p align="center">
  <img height="250" src="logo.jpg" />
</p>

# Drivit

[![CocoaPods Compatible](https://img.shields.io/badge/Pod-1.9.0-blue.svg)](https://img.shields.io/badge/Pod-1.9.0-blue.svg) [![Platform](https://img.shields.io/badge/Platform-iOS-lightgrey.svg)](https://img.shields.io/badge/Platform-iOS-lightgrey.svg)

This is a sample project that outlines the key steps to integrate the Drivit iOS SDK into your application and put it to work. Should you have any doubt, feel free to contact us at support@drivit.com.

**Getting Started:**

- [Requirements](#requirements)
- [Installation](#installation)
- [Documentation](#documentation)

**Using the SDK:**

- [Xcode Capabilities](#capabilities)
- [Usage](#usage)


## Requirements

- iOS 10.0+
- Xcode 10.0+

Below is a table that shows which version of Drivit you should use for your Swift version.

Swift | Drivit   
:---- | --------
4.X   | >= 1.0.0


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
use_frameworks!

target '<Your Target Name>' do
    pod 'Drivit', '~> 1.9.0'
end
```

Then, run the following command:

```bash
$ pod install
```

### Manually

To get the Drivit SDK framework contact us at support@drivit.com.


## Capabilities

Add the following capabilities to your Xcode project:

- Background Modes
	- Location Updates - Allows us to run locations update in the background
	- Background Fetch - Allows us to run periodically in the background so that we can update its content
	- Remote Notifications - Allows us to process background update notifications

- Push Notifications

## Usage

#### 1. Let's prepare your app delegate
Let's start by adding the following code to your App Delegate so Drivit is able to know the reason why the app was launched (if any), such as notifications and locations update:
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
	Drivit.shared.register(withOptions: launchOptions)

	return true
}
```


#### 2. Update the SDK with Background App Refresh
After that, we need to setup the Background App Refresh. This allow the SDK to run periodically in the background so that it can update its content. To do so, let's include the following code in your App Delegate:
```swift
func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
	Drivit.shared.performFetchWithCompletionHandler { (result) in
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


#### 3. Push Notifications

To keep your content up to date, it is important to subscribe to push notifications. This way, every time we have some new content/data ready to improve user experience, we can let the app know:

```swift
func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
    // Validate if the push notification received
    // is supposed to be handle by the SDK
	Drivit.shared.didReceiveRemoteNotification(userInfo: userInfo, completionHandler: completionHandler)
}
```


#### 4. Login/signup your user

Now we have everything ready, we have to login the user into the SDK before it starts recording trips.
To do so, create an instance of the ```DIAuth``` object and provide it with the info of your user:

```swift
let simple = DILogin.regular(email: "email", password: "password")
// OR
let advanced = DILogin.advance(secret: "secret")

let type = DIAuth.login(type: simple)

Drivit.shared.auth(type: type) { result in                
	switch(result) {
		case let .success(user): 
			print("Welcome " + user.firstName)
		case let .error(error): 
			print("An error ocurred: " + error.localizedDescription)
	}
}
```


#### 5. Add relevant Google Maps API Keys

To provide an improved user experience, Drivit uses Google APIs. Feel free to set this key where it better suits your architecture:

```swift
// Setup Google API Key
Drivit.shared.googleAPIKey = "YOU_API_KEY"
```


And that is it! Safe trips!

The Drivit Team

## Documentation

You can see the complete reference documentation [here](https://drivitapp.github.io/ios-sdk-sample/).

## License

Copyright (c) 2018 Bahub Business Analysis Systems, Lda. [See LICENSE](https://github.com/drivitapp/iOS-core/blob/master/LICENSE) for details.
