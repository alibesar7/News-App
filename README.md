 # Flutter News App

A Flutter application that fetches and displays the latest news headlines from various categories using the [NewsAPI](https://newsapi.org/).

## Features

- Displays top headlines from categories like Business, Entertainment, General, Health, Science, and Sports.
- Fetches news articles with images, descriptions, and titles.
- Smooth category switching with a bottom navigation bar.
- User-friendly and responsive design.

## Screenshots

*(Add screenshots of the app here for better presentation)*

## Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/flutter-news-app.git
   ```

2. **Navigate to the project directory**:
   ```bash
   cd flutter-news-app
   ```

3. **Install dependencies**:
   ```bash
   flutter pub get
   ```

4. **Set up the API key**:
   - Go to [NewsAPI](https://newsapi.org/) and get your API key.
   - Replace `your_api_key_here` in the `Networkclient` class in `main.dart` with your API key.

5. **Run the app**:
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── main.dart         # Main entry point of the app
├── models/           # Contains data models like Articles and Source
├── services/         # Handles API requests
├── screens/          # Contains UI screens
├── widgets/          # Reusable widgets
```

## Requirements

- Flutter SDK
- A valid [NewsAPI key](https://newsapi.org/)
- Dart version compatible with Flutter

## Contribution

Contributions are welcome!  
Feel free to fork the project, create a feature branch, and submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [NewsAPI](https://newsapi.org/) for providing the news data.
- Flutter for an excellent UI framework.

---

### Let's Build Together!

If you encounter any issues or want to add new features, feel free to open an issue or create a pull request.
