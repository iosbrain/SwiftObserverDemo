# SwiftObserverDemo
An Xcode 9 project using Swift 4 to demonstrate property observers. This is a fully-functional temperature conversion app (Fahrenheit to Celsius and Celsius to Fahrenheit).

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
