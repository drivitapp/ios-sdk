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

#### 2. Login/signup your user into the SDK
You have to login the user into the SDK before it starts recording trips. To do so, create an instance of the ```DIAuth``` object and provide it with the info of your user

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
```

#### 3. Push Notifications
```swift
func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
    // Validate if the push notification received
    // is supposed to be handle by the SDK
    Drivit.shared.didReceiveRemoteNotification(userInfo: userInfo, completionHandler: completionHandler)
}
```

And that is it! Safe trips!