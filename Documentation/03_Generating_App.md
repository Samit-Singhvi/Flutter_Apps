# Generating App from Scratch

## Steps to generate an app and run it on the emulator

1. Open the directory in which you want to run the app, open it in terminal

2. Run the command
```flutter create flutter_complete_guide```

* *flutter_complete_guide* is the name of the project.

3. Once this command run, a directory will be generated with multiple folders and files in it. It looks like 

![directory](images/directory.png)

## Run the App
1. To run the app, click on Play button on the top right corner of VScode, or run the command `flutter run`.

2. An error can occur -
```This application does not support sound null-safety (its language
version is 2.9).

To build this application, you must provide the CLI flag

--no-sound-null-safety. Dart 3 will only support sound null safety, see
https://dart.dev/null-safety.
```

# Details about the Folders and file present in the direcotry

1. .idea - It is used by Android Studio, not of importance to us.
2. android and ios - They contain complete android app and iOS app which we will need later to generate an app.
3. build - it contain details of final app build.
4. lib - The most important folder, it contain all the dart files that we use to create the app/
5. pubspec.yaml - It is the file that contain details of all the third-party packages and dependencies we use in the app.
6. pubspec.lock - More details of what is there in pubspec.yaml

