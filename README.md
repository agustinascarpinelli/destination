# Destination - Flutter Application

Destination is a Flutter application that utilizes the `api.npoint.io` API to fetch various destinations. The app provides a seamless user experience with a splash screen featuring Lottie animations while loading the necessary data before entering the home screen.

Upon launching the app, users are greeted with an animated splash screen that gracefully transitions to the home screen. The home screen showcases multiple destination cards, allowing users to explore different travel options. The list of destinations can be viewed in either a grid or a vertical column layout, providing flexibility and customization.

To enhance the user experience, a search functionality is implemented, enabling users to search for specific destinations. The application also offers a dark and light mode toggle, allowing users to switch between different visual themes based on their preferences.

Destination handles offline scenarios gracefully by providing an internet connection check. If the device is offline, a notification is displayed to inform the user of the lack of internet connectivity. Upon reconnection, the app automatically fetches the latest data. Otherwise, data loading occurs only during the splash screen phase.

By selecting each destination, users can access detailed information, including descriptions, photos, and more. The app provides the ability to view the destination photos with the option to zoom in for a closer look.

Dependencies used in this project:

- `animated_splash_screen: ^1.3.0`
- `bloc: ^8.1.2`
- `connectivity_plus: ^4.0.1`
- `cupertino_icons: ^1.0.2`
- `dartz: ^0.10.1`
- `flutter: sdk: flutter`
- `flutter_bloc: ^8.1.3`
- `google_fonts: ^5.0.0`
- `http: ^1.0.0`
- `lottie: ^2.4.0`
- `photo_view: ^0.14.0`

Note: The Destination application is intended for educational and personal use, and the `api.npoint.io` API is used solely for demonstration purposes.
