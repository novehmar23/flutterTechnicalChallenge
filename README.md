# Flutter Technical Challenge - Public API Data Display

## Prerequisites
To run this project, make sure you have the following installed:
- [Flutter](https://flutter.dev/docs/get-started/install)
- A code editor (e.g., [Visual Studio Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio))
- Git (to clone the repository)

## How to Run the Project
1. Clone the repository:
   ```bash
   git clone https://github.com/novehmar23/flutterTechnicalChallenge.git
   cd flutterTechnicalChallenge

2. Install dependencies:
   ```bash
   flutter pub get
   
3. Run the app:
- To run on a physical device or emulator:
   ```bash
   flutter run
or
- To run specifically in Chrome (web version):
   ```bash
   flutter run -d chrome

## Project Decisions
### State Management:
I decided to use Provider as the state management solution because it is simple, effective, and works well with Flutter's reactive model. It allows easy management of app-wide states such as loading indicators, error messages, and pagination data. I used Provider in the PostViewModel class to manage the list of posts, the loading state, and pagination logic.
