# SwiftObserverDemo
An Xcode 9 project using Swift 4 to demonstrate property observers. This is a fully-functional temperature conversion app (Fahrenheit to Celsius and Celsius to Fahrenheit).

In the companion article to this repo, ["Swift 4 property observers: responding to changes in property values and managing state"](http://iosbrain.com/blog/2018/02/20/swift-4-property-observers-responding-to-changes-in-property-values-and-managing-state/), we learn about a feature of Swift called "property observers" that help developers manage app state. You can easily add code to monitor changes to Swift native type property values as well as your own custom type property values. Remember that you can gain insight into an application by looking at its state: the data values stored in all properties of the app at a specific point in time. Getting a grip on app state, therefore managing complexity, is one of the biggest challenges in computer science. Property observers are one technology that help you get a grip. In the companion article, I explain this Swift feature, demonstrate its usage with runnable examples of Swift code, show you how I built an app which relies on property observers, and provide you a list of other Swift technologies that help you manage app state and complexity.

Here's the app in action:

![alt text][logo1]

[logo1]: http://iosbrain.com/wp-content/uploads/2018/02/TempConverter-1.gif "Temperature conversion app"

## Xcode 9 project settings
**To get this project running on the Simulator or a physical device (iPhone, iPad)**, go to the following locations in Xcode and make the suggested changes:

1. Project Navigator -> [Project Name] -> Targets List -> TARGETS -> [Target Name] -> General -> Signing
- [ ] Tick the "Automatically manage signing" box
- [ ] Select a valid name from the "Team" dropdown
  
2. Project Navigator -> [Project Name] -> Targets List -> TARGETS -> [Target Name] -> General -> Identity
- [ ] Change the "com.yourDomainNameHere" portion of the value in the "Bundle Identifier" text field to your real reverse domain name (i.e., "com.yourRealDomainName.Project-Name").
