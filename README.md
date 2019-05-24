# DDTestApp

Supports: iOS 11.x and above, Xcode 10.2.1.

## Branches:

* master

## Language:
Swift 5.0.

## Dependencies:

The project is using cocoapods for managing external libraries.

Get Cocoa Pods

```
sudo gem install cocoapods
```

Then install the pods

```
pod install
```

### Core Dependencies

* Alamofire - Using for Networking.
* Kingfisher - Using for caching images.

## TODO(Because of a short time next things are not done):

* In this project UserDefaults are used as local storage. This should be changed with CoreData or Realm which is purpose exactly to store a big amount of data.

* Code should be refactored to use Coordinator pattern in order to have better flow how to show view controllers.
