# TypicodePhotos

Simple example of an iOS app using Swift, SwiftUI, Combine, and generally following SOLID design principles and CLEAN Architecture using elements of the iOS SDK that support these.

Note that in an app this small it is difficult to make these divisions clear. For example, at this scale and simplicity it is difficult to use a lot of Protocol-oriented programming to demonstrate loose coupling and encapsulation without making the code difficult to read and to create Protocols that can be used more than once. Likewise, access control is more useful in encapsulating functionality in a a larger project, while in a small project wth simpler objects, it is less eivdent due to the simplicty of the functionality. Essentially I wanted to try to follow CLEAN principles but keep the Swift idionatic and easy to read, as these are skills and knowledge I want to demosnbtrate here as well.

I have not yet added unit tests to this project but intyend to, asnd therefore used a lot of dependency injection to invert control and provide for mocking dependencies when I do add unit tests. This does run the risk of reducing encapsulation, and I am intending to build functionality out further and add protocols to reduce this.

Modules of the app are intended to be Assertive about errors and I will be adding a custom `ViewModifier` to report these assertions to the user. 
