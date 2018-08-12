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