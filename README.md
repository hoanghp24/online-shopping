# Guide to Clone and Run Flutter

## Clone the Project

#### 1. Copy Repository Link: Copy the GitHub link of the Flutter project.

#### 2. Open Terminal: Navigate to your desired directory and open a terminal.

#### 3. Run Clone Command: Execute the following command:

```
git clone https://github.com/hoanghp24/online-shopping-flutter.git
```

## Install Dependencies

#### 1. Navigate to Project Directory:

```
cd online-shopping-flutter
```

#### 2. Install Dependencies:

```
flutter pub get
```

then run the package flutter_laucher_icons:

```
flutter pub run flutter_launcher_icons
```

## Run the Application

#### 1. Check Emulator or Connect Device: Ensure an emulator or device is ready.

#### 2. Run Flutter App:

```
flutter run
```

#### 3. Verify the App: The Flutter app will install and run.

Congratulations! You've successfully cloned and run the Flutter project.

# --------------------------------------------------------

# Guide to Rebase and Push to a New Branch

If you have made code changes and want to bring your changes to a new branch while maintaining a clean commit history, you can use the rebase process. Here's a step-by-step guide:

#### 1. Switch to the Base Branch

```
git checkout develop
```

#### 2. Pull the Latest Changes

```
git pull origin develop
```

#### 3. Rebase

```
git rebase develop <new_your_branch>
```

#### 4. Push to the New Branch

```
git push origin <new_your_branch>
```

Push your changes to the new branch on the repository.

Congratulations! You have successfully rebased and pushed your changes to a new branch, maintaining a clean and organized commit history.
