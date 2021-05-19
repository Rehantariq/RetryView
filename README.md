

<p align="center">
<img src='https://github.com/Rehantariq/RetryView/blob/master/Example/RetryView/Images.xcassets/retryview-1.imageset/retryview-1.jpg' />
</p>

# RetryView IOS


[![Version](https://img.shields.io/cocoapods/v/RetryView.svg?style=flat)](https://cocoapods.org/pods/RetryView)
[![License](https://img.shields.io/cocoapods/l/RetryView.svg?style=flat)](https://cocoapods.org/pods/RetryView)
[![Platform](https://img.shields.io/cocoapods/p/RetryView.svg?style=flat)](https://cocoapods.org/pods/RetryView)


## Installation

To run the example project, clone the repo, and run `pod install` from the Example directory first.

RetryView is available through [CocoaPods](https://cocoapods.org/RetryView). To install
it, simply add the following line to your Podfile:

```ruby
pod 'RetryView'
```

## Usage

First things first `import RetryView`.

RetryView can be impelmented by two ways `Closure` or  `Delegate`

### By using Closure
```swift
RetryView(parentView: canBeAnyView, message: "No internet connection") {
        print("yourApiCall()")
   }.show()
   //
   // parentView can be self.view , tableView, collectionView or any other UIView
   //
```

Or 

###  By using Delegate
```swift
  RetryView(parentView: mainView, message: "No internet connection", delegate: self).show()
  //
  // But don't forget to implement RetryViewDelegate
  //
```


### RetryView Appearance ( Optional )

```swift
  let appearance = RetryViewAppearance(backgroundColor: .darkGray, messageTextColor: .red, buttonBackgroundColor: .red, buttonTextColor: .white, isRoundedButton: false)
  RetryView.setAppearance(appearance:appearance)
  
  //
  // you and set it in AppDelegate's didFinishLaunchingWithOptions method and can where you want
  //
  
  
```


## Author

rehantariq, rehaan.tariq@gmail.com

## License

RetryView is available under the MIT license. See the LICENSE file for more info.

