# Country_List

This is a Flutter project that displays a list of countries using the rest api. It's developed with clean architecture, using the BLoC pattern for state management and Retrofit for network communication.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- Flutter SDK 
- Android Studio or Visual Studio Code
- Git

### Installing

1. Clone this repository to your local machine:

```
git clone https://github.com/<your_username>/country-list.git
```

2. Open the cloned directory in Android Studio or Visual Studio Code.
3. Install the required packages by running the following command in the terminal:

```
flutter pub get
```

4. Run the app by pressing the Play button in your IDE or by running the following command in the terminal:

```
flutter run
```

## Running the tests

This project includes unit tests that can be run via the following command:

```
flutter test
```

## Built With

- [Flutter](https://flutter.dev/) - The framework used
- [BLoC Pattern](https://bloclibrary.dev/#/) - State management
- [Retrofit](https://pub.dev/packages/retrofit) - HTTP client library


## Architecture

The project is built using clean architecture principles, separating the code into three main layers:

- Presentation: Contains the user interface and the BLoCs responsible for managing the state of the screens.
- Domain: Defines the business logic of the application, including the use cases and the repositories interfaces.
- Data: Provides the implementation of the repositories, communicating with external services and databases.
