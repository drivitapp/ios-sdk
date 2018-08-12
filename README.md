<p align="center">
  <img height="280" src="web/logo.jpg" />
</p>

# Drivit

This document outlines the key steps to integrate Drivit SDK into your application and put it to work.

## Installation

### Swift version vs Drivit version.

Below is a table that shows which version of Drivit you should use for
your Swift version.

| Swift | Drivit          |
| ----- | --------------- |
| 4.X   | >= 1.0.0        |


### CocoaPods

Use the following entry in your Podfile:

```rb
pod 'Drivit', '1.0.0'
```

Then run `pod install`.

### Manually

#### 1. Add the Drivit SDK framework to your app bundle

To get the Drivit SDK framework contact us at support@drivit.com.

#### 2. Add the dependencys needed for the Drivit SDK

If you are using carthage/cocoapods add "MagicalRecord" to your dependency tree. The framework should be in the embeded frameworks of the app.

#### 3. Make sure your project is running swift 4.0 or higher.

With these three steps, your app should be already compiling the Drivit SDK. Now let's put it to work

### Usage

#### 1. Add the the following methods to your app delegate.
Add the following code to your application:
```swift
func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        Drivit.shared.register(withOptions: launchOptions)
        application.registerForRemoteNotifications()

        return true
}
```
Next add the following code to your application:
```swift
func application(_ application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: @escaping () -> Void) {
        Drivit.shared.handleEventsForBackgroundURLSession(withIdentifier: identifier, completion: completionHandler)
}
```

And finally add the following code when your app become active:
```swift
func applicationDidBecomeActive(_ application: UIApplication) {
        Drivit.shared.applicationDidWake(withOptions: nil)
}
```

#### 2. Login/signup your user into the SDK
You have to login the user into the SDK before it starts recording trips. To do so, create an instance of the ```DIAuth``` object and provide it with the info of your user

```swift
let simple = DIAuth.regular(email: "email", password: "password")
// OR
let advanced = DIAuth.advance(secret: "secret")
            
Drivit.shared.login(auth: simple)
// OR
Drivit.shared.signup(auth: simple) { result in                
        switch(result) {
        case .success(var user): 
            print("Welcome " + user.firstName)
        case .error(var error): 
        print("An error ocurred: " + error.localizedDescription)
}
```

#### 3. To start recording a trip
After you login you can start a trip by running the following code:

```swift
Drivit.shared.forceTripStart()
```


And that is it! Safe trips!

**The Drivit Team**



P.S. You can see the complete reference documentation [here](https://drivitapp.github.io/ios-sdk-sample/)