# flutter_pexels

An app that lets you search and view photos and videos provided by [Pexels API](https://www.pexels.com/api/).

# Demo
![Pexels Photos](/demo/pexels_images_demo.gif) ![Pexels Videos](/demo/pexels_videos_demo.gif)

# How to use
## Step 1:
Clone this repository
```
git clone git@github.com:sharmashashi/flutter_pexels.git
```

## Step 2:
Goto the project root and get the dependencies
```
cd flutter_pexels && flutter pub get
```

## Step 3:
This project uses riverpod with code generation and generated files are not included in git. Run the following command to generate missing libraries
```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

## Step 4:
At the root of the project, create .env file that contains your [Pexels API key](https://www.pexels.com/api/) or run the following command and replace `<your_api_key>` with your original [Pexels API key](https://www.pexels.com/api/)
```
cat > .env .env.example
```

## Step 5:
Run the project
```
flutter run
```

# Folder Structure
```
lib/
┣ core/
┃ ┣ configs/
┃ ┃ ┗ configs.dart
┃ ┣ exceptions/
┃ ┣ models/
┃ ┃ ┗ paginated_data.dart
┃ ┣ services/
┃ ┃ ┗ http/
┃ ┗ widgets/
┃   ┗ fake_search_bar.dart
┣ features/
┃ ┣ photo_search/
┃ ┃ ┣ providers/
┃ ┃ ┣ repositories/
┃ ┃ ┗ widget/
┃ ┣ popular_photos/
┃ ┃ ┣ models/
┃ ┃ ┣ providers/
┃ ┃ ┣ repositories/
┃ ┃ ┗ widget/
┃ ┣ popular_videos/
┃ ┃ ┣ models/
┃ ┃ ┣ providers/
┃ ┃ ┣ repositories/
┃ ┃ ┗ widget/
┃ ┗ video_search/
┃   ┣ models/
┃   ┣ providers/
┃   ┣ repositories/
┃   ┗ widget/
┣ screens/
┃ ┗ home.dart
┗ main.dart
```
