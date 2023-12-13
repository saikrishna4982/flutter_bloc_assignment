# flutter Bloc App
Devloped a Flutter App Using Bloc pattern. Here we are using [https://jsonplaceholder.typicode.com/posts] to display our Posts.

### Project Requirements
Make Sure That You Have The Following Requirements Before Running The Project.
- Flutter
- Android SDK
- Any Code Editor (I Prefer VS Code)
- Android Virtual Device
- Git

### Project Structure
```
│   main.dart
│
├───bloc
│       post_bloc.dart
│       post_event.dart
│       post_state.dart
│
├───model
│       postsmodel.dart
│
├───repository
│       repo.dart
│
└───UI
        home_page.dart
```
### Steps To Run the project
- Clone the project into your local reposiorty by typing ```git clone https://github.com/saikrishna4982/flutter_bloc_assignment.git``` in terminal
- After Cloning Open The Project in Any Code Editor Of Your Choice ( I Prefer VS Code)
- Now Open The  Terminal and Check if The Present Working Directory is Project Folder or Not, If not Change Path to Project Directory
- In Terminal Type ```flutter pub get``` and Wait Until All The Dependencies are Resolved.
- Now Make Sure That You Have Atleast One Android Virtual Device Opened
- In Terminal Type ```flutter run``` you Can See List Of Emulators To Run The Project Select Your Desired Emulator
- The Application Will Be Installed On The Emulator, Open The Emulator To See The Application

### About Application
In this app we are displaying the posts from an API using a ListView.The UI Functionality is Mentioned in ```UI/home_page.dart```.The App Uses Bloc Architecure To Manage The State Of The Application The Bloc Implementation is Mentioned in ```bloc Folder```

### Special Feature
Added a Pull-Down-Refresh functionality
