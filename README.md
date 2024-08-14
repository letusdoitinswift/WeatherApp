# WeatherApp

Here are the notes on the design of the app:

1. App is completely in SwiftUI.
2. The Xcode Version used was 15.4 and minimum iOS Support is iOS 15.0
3. Async / Await has been used extensively throughout the app.
4. App uses Core Location and prompts user for providing access to use the location.
5. MVVM Arch pattern has been used to handle the views, models and business logic with the separation of concerns.
6. ViewModels used: **WeatherViewModel** and **HourlyViewModel** are the viewmodels that govern or directs the WeatherView page.
7. Views: **WeatherView** is the first view which consists of other subviews in it. There is WeatherListView which handles the search part and presents the searched zipCode or City.
8. Models: There is a **WeatherModel**, **HourlyModel**
9. There are other util classes for supporting the UI of the app. For example there is a Request struct which handles all the network requests.
10. Wherever possible the objects have been injected into the intializers.
11. API Error has been handled and an ErrorView is presented whenever an error happens.
12. A few test cases have been added.
