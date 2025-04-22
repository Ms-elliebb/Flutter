# IoT Dashboard (Flutter Showcase)

A responsive IoT dashboard application built with Flutter to demonstrate real-time data visualization and modern app architecture.

This project serves as a portfolio piece showcasing skills in Flutter development, state management, UI/UX design, and clean architecture principles.

![image](https://github.com/user-attachments/assets/887208a8-491f-4ab4-a8f1-a8270c8b2881)

*Note: The data displayed is currently simulated.*

## Features

*   **Real-time Data:** Displays simulated sensor data (temperature, humidity) updating every second.
*   **Responsive UI:** Adapts layout for different screen sizes (phones and potentially tablets) using `LayoutBuilder` and `GridView`.
*   **Data Visualization:** Utilizes the `fl_chart` package to display historical temperature data in a line chart.
*   **State Management:** Implements `flutter_riverpod` for efficient and scalable state management.
*   **Clean Architecture:** Follows Clean Architecture principles, separating concerns into Data, Domain, and Presentation layers.
*   **Modern Dark Theme:** Features a custom dark theme inspired by modern UI designs, using `google_fonts` for typography.

## Tech Stack

*   **Framework:** Flutter
*   **Language:** Dart
*   **State Management:** `flutter_riverpod`
*   **Charting:** `fl_chart`
*   **Fonts:** `google_fonts` (`Poppins`)
*   **Date Formatting:** `intl`
*   **Icons:** Material Icons (potential for `flutter_svg` integration)

## Architecture

The project adheres to Clean Architecture principles:

*   **Domain:** Contains core business logic, entities (`SensorData`), repository interfaces (`SensorRepository`), and use cases (`GetSensorDataUseCase`). Independent of other layers.
*   **Data:** Implements the repository interfaces defined in the Domain layer. Contains data sources (`MockSensorDataSource`) and repository implementations (`SensorRepositoryImpl`). Handles data retrieval and storage.
*   **Presentation:** Contains the UI elements (Screens, Widgets), state management providers (`dashboard_providers.dart` using Riverpod), and theme definitions. Depends on the Domain layer.

```
lib/
├── core/           # Shared utilities, constants, theme
│   ├── constants/
│   └── theme/
├── data/           # Data layer
│   ├── datasources/
│   └── repositories/
├── domain/         # Domain layer
│   ├── entities/
│   ├── repositories/
│   └── usecases/
└── presentation/   # Presentation layer
    ├── providers/
    ├── screens/
    └── widgets/
```

## Getting Started

1.  **Clone the repository:**
    ```bash
    git clone <your-repository-url>
    cd iot_dashboard
    ```
2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```
3.  **Run the application:**
    ```bash
    flutter run
    ```

## Future Improvements (Ideas)

*   Integrate with a real IoT backend (e.g., MQTT, Firebase Realtime Database).
*   Add more sensor types and controls.
*   Implement user authentication.
*   Add unit and widget tests.
*   Implement SVG icons for a more unique look.
*   Add a settings screen for theme switching (Light/Dark).
*   Refine the chart interactions and appearance.

## Author

**Elif Beyza Belhan**

*Please replace `<your-repository-url>` with the actual URL after creating the repository on GitHub.*
