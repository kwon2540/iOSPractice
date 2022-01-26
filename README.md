# iOSPractice

[![Xcode](https://img.shields.io/badge/Xcode-13.2-blue)](https://developer.apple.com/documentation/xcode-release-notes/xcode-13_2-release-notes)
[![Swift](https://img.shields.io/badge/Swift-5.5-red)](https://docs.swift.org/swift-book/)


## UI
- Storyboard
- Programmatically
- SwiftUI

## Architectural pattern
- Clean Architectrture + MVVM

<img src="https://user-images.githubusercontent.com/52350456/151110623-d29bd49c-db05-41da-add2-a44e3c5f0c23.jpeg" width="600">

- View: User Interface displayed to user.
- Presenter(ViewModel): Contains the data used by view to display it on the screen. 
- UseCase: A layer where all the bussiness logic are implemented.
- Model: Data or struct which is used by Usecases(Substantial data for the app).
- Translator: A Mapper to convert Entity to Model.
- Repository: Provides functions (such as saving / modifying data) which is required by UseCase.
- Data Source: A layer to access Databases and make api calls.
- Entity: Raw data directly recieved from server or databases.

## Additional task
- Modular architecture
- Unit test 

## Libraries
- RxSwift : Storyboard, Programmatically (SwiftUI uses Combine)
- Realm
- DIKit

## Rules
- Libraries are managed by Swift Package Manager
