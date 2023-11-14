# ebank - Flutter Banking Wallet App

Welcome to **ebank**, a sleek and efficient banking wallet app built with Flutter. This project incorporates a variety of features and follows a well-organized folder structure for seamless development.

## Getting Started

Follow these steps to quickly set up and run the project on your device or emulator.

**Step 1: Download the Project**

```bash
cd ebank
```

**Step 2: Install Dependencies**

```bash
flutter pub get
```

**Step 3: Run the App**

Launch the app on your device or emulator using the following command:

```bash
flutter run -v
```

**Step 4: Generate Files (Optional)**

Generate necessary files using:

```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

## Features

- **Splash Screen:** A visually appealing splash screen to welcome users.
- **Login:** Secure and intuitive login functionality.
- **Dashboard:** A feature-rich dashboard for seamless navigation.
- **Routing (GoRouter):** Efficient and easy-to-use routing mechanism.
- **Theming:** Customizable theme and dark theme support.
- **Database:** Integration with a database for data storage using sqlite.
- **Riverpod (State Management):** Effective state management using Riverpod.
- **Validation:** Input validation for data integrity.
- **Code Generation:** Utilizes code generation for improved performance.
- **Dependency Injection:** Structured dependency injection for cleaner code.

## Folder Structure

This project adheres to a well-organized folder structure, providing clarity and maintainability.

```plaintext
ebank/
|- android
|- build
|- ios
|- lib/
  |- src/
    |- core/
    |- features/
    |- ui/
    |- main.dart
|- test
```

Feel free to explore the functionality of each folder as needed.
I hope you find **ebank** a valuable resource! 🚀
