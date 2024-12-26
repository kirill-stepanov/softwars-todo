# Softwars To-Do

Softwars To-Do is a task management application built with Flutter. The app allows users to manage their to-do tasks, change status, mark them as urgent, attach image, and set due dates. It supports offline functionality, so tasks are accessible even without an internet connection.

## Disclaimer!!!!

The app was tested <u>ONLY</u> on Android platform

<div>
  <img src="assets\images\login_screen.png" alt="Home screen image" width="200"/>
    &emsp;&emsp;
  <img src="assets\images\home_screen.png" alt="Home screen image" width="200"/>
</div>
<br />
<div>
  <img src="assets\images\todo_create_screen.png" alt="Home screen image" width="200"/>
    &emsp;&emsp;
  <img src="assets\images\todo_update_screen.png" alt="Home screen image" width="200"/>
</div>

## Features

- Create and manage tasks.
- Mark tasks as urgent.
- Attach image to task.
- Set due dates for tasks.
- Filter tasks by type.
- Offline support with automatic syncing when the internet is restored.
- Snackbar when performing actions with a task

## Installation

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) installed on your system.
- [Dart](https://dart.dev/get-dart) installed.

#### My versions:

- Flutter 3.27.1
- Dart 3.6.0

### Steps

1. Clone this repository:

   ```bash
   git clone https://github.com/kirill-stepanov/softwars-todo.git
   ```

2. Navigate into the project directory:

   ```bash
   cd softwars_todo
   ```

3. Install the dependencies:

   ```bash
   flutter pub get
   ```

4. Run the app on your device or emulator:
   ```bash
   flutter run
   ```

## Environments

In the root directory of your project, create a file named `.env`.<br/>
In `.env.example` you can see what you need to add to `.env`

## Project Structure

```bash
lib/
 ├── logic/          # Application logic and data models
 │   ├── models/     # Data models used in the application
 │   ├── provider/   # Providers for state management
 │   ├── services/   # Services for various tasks
 │   └── utils/      # Utility classes or helper functions
 ├── ui/             # UI components and user interface
 │   ├── components/ # Reusable components
 │   ├── constants/  # Constant values such as colors, routes, etc.
 │   └── screens/    # App screens and components related to them
 └── main.dart       # Entry point for the application
```

## Dependencies

This project uses several dependencies to handle various tasks. Below is a list of the key dependencies and their purpose:

- [cupertino_icons](https://pub.dev/packages/cupertino_icons): Provides iOS-style icons for the application.
- [provider](https://pub.dev/packages/provider): A state management package to handle and share state across the app.
- [http](https://pub.dev/packages/http): A package to make network requests, such as fetching data from APIs.
- [flutter_dotenv](https://pub.dev/packages/flutter_dotenv): A package to load environment variables from .env files, useful for managing configuration settings.
- [image_picker](https://pub.dev/packages/image_picker): A package to pick images from the device’s gallery or camera.
- [date_picker_plus](https://pub.dev/packages/date_picker_plus): A date picker widget for selecting dates in the app.
- [intl](https://pub.dev/packages/intl): Provides internationalization support, such as formatting dates, numbers, and currencies.
- [uuid](https://pub.dev/packages/uuid): A package to generate universally unique identifiers (UUIDs) for creating unique task IDs.
- [shared_preferences](https://pub.dev/packages/shared_preferences): A package to store simple data like settings and preferences locally on the device.
- [connectivity_plus](https://pub.dev/packages/connectivity_plus): A package to check network connectivity status.

These dependencies are defined in the `pubspec.yaml` file, and they help enhance the functionality, performance, and development workflow of the app.

## Possible Improvements

- Login by email
- Push notification when the task reaches its end date
- Deleting a task by swiping it from the general list
