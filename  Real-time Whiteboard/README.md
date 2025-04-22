# Real-time Collaborative Whiteboard (Flutter Portfolio Project)

[![Flutter](https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-blue?logo=dart)](https://dart.dev)
[![Riverpod](https://img.shields.io/badge/State%20Management-Riverpod-blue)](https://riverpod.dev)

A Flutter-based collaborative whiteboard application designed as a portfolio piece to showcase skills in Flutter UI development, state management with Riverpod, and application architecture.

**Note:** This version simulates the real-time and multi-room collaboration features locally using Riverpod state management (`family` modifier and `StateProvider`). It does not require a backend like Firebase but effectively demonstrates the core concepts and potential for real-time interaction.

---

## Features

*   **Drawing Canvas:** A free-form canvas using `CustomPaint`.
*   **Basic Drawing Tools:**
    *   Pen tool with adjustable color and stroke width.
    *   Eraser tool.
*   **Color Picker:** Select custom drawing colors.
*   **Stroke Width Slider:** Adjust the thickness of the pen/eraser.
*   **Clear Canvas:** Button to erase all drawings.
*   **Room Simulation:**
    *   Create multiple drawing rooms.
    *   Each room maintains its independent drawing state.
    *   Navigate between different rooms.
    *   (Conceptual) Real-time updates are simulated locally when viewing the same state.

---

## Demo

*(Add a GIF or screenshots here to showcase the application)*

Example:
```
![App Demo GIF](link_to_your_gif_or_screenshot.gif)
```

---

## Technology Stack

*   **Flutter (v3.x):** Cross-platform UI toolkit.
*   **Dart (v3.x):** Programming language.
*   **Riverpod:** State management solution for Flutter.
*   **`freezed`:** Code generation for immutable classes and unions.
*   **`riverpod_generator`:** Code generation for Riverpod providers.
*   **`build_runner`:** Code generation tool.
*   **`flutter_colorpicker`:** UI component for color selection.
*   **`google_fonts`:** Custom fonts.

---

## Architecture

The project follows principles inspired by Clean Architecture, organizing code into layers within the `lib/features/drawing` directory:

*   **`domain`:** Contains core data models (`DrawingPoint`, `DrawingPath`, `DrawingTool`) and potentially repository interfaces (though not strictly needed in this simulation). Models use `freezed` for immutability and serialization support.
*   **`application`:** Holds the state management logic (`DrawingNotifier` using Riverpod, `roomListProvider`) and services that orchestrate the application's features.
*   **`presentation`:** Includes the UI components (Widgets and Screens) like `DrawingScreen`, `RoomListScreen`, `DrawingCanvas`, `DrawingToolbar`.

This structure promotes separation of concerns, testability, and maintainability.

---

## Getting Started

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/your_username/your_repository_name.git
    cd your_repository_name
    ```
2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```
3.  **Run code generation:** (Required after cloning or modifying models/providers)
    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```
4.  **Run the app:**
    ```bash
    flutter run
    ```

---

## Future Improvements (Conceptual)

*   **Backend Integration:** Replace the local simulation with a real backend (e.g., Firebase Realtime Database/Firestore or a custom WebSocket server) for true real-time collaboration across devices.
    *   Send completed paths (`DrawingPath`) to the backend.
    *   Listen for real-time updates from other users in the same room.
*   **Undo/Redo Functionality:** Implement undo/redo actions for drawing.
*   **More Drawing Tools:** Add shapes, text, etc.
*   **Authentication:** Allow users to sign in.
*   **Persistence:** Save room drawings even after the app closes.
*   **Enhanced UI/UX:** Improve visual design and user experience.

---

This project serves as a practical demonstration of building a Flutter application with robust state management and a clean structure, simulating complex features like real-time collaboration for portfolio purposes.
