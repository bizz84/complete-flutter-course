# Complete Flutter Course Bundle - eCommerce App

This is the official repo for this course:

- [Complete Flutter Course Bundle](https://codewithandrea.com/courses/complete-flutter-bundle/)

This will include a full-stack eCommerce app using Flutter & Firebase:

![eCommerce App Preview](/.github/images/ecommerce-app-preview.png)

A Flutter web preview of the app can be found here:

- [Flutter Web Demo](https://my-shop-ecommerce-stg.web.app/)

## Project Setup

To clone the repo for the first time and open it in VSCode, run this:

```
git clone https://github.com/bizz84/complete-flutter-course.git
cd complete-flutter-course
code .
```

This will checkout the `main` branch which contains the **latest code**.

But at various points in the course, I'll ask you to checkout a **specific branch name**, so you can follow along with the right code, at the right time.

And to prevent any conflicts, you may need to reset your local changes:

```
git reset --hard HEAD
git checkout <branch-name>
```

## Flutter Foundations - Course Syllabus

### 1. Intro & Project Overview

1. What you will learn in this course
2. Section overview
3. VSCode Shortcuts, Extensions & Settings for Flutter development
4. Join the Slack Channel
5. Course Project on GitHub
6. Download the Starter Project & `pubspec.yaml` overview
7. eCommerce app overview
8. Code walkthrough: project structure
9. Exploring the codebase with the Widget Inspector (DevTools)
10. UI Design Principles: Composition & Reusable Widget Classes
11. Useful Widgets for Responsive Design
12. App Localization

### 2. Navigation with GoRouter

1. Section Intro
2. Limitations of Navigator 1.0
3. GoRouter installation & initial setup with `MaterialApp.router`
4. Routes, sub-routes and navigation
5. `GoRouterHelper` Extension and `pageBuilder`
6. Adding some additional routes
7. Routing by **path** vs routing by **name**
8. Routing with parameters
9. GoRouter error handling
10. Navigating with **go** vs **push**
11. Adding the remaining routes
12. How to pop a route with GoRouter
13. Nested Navigation
14. Bug fix & wrap up

### 3. Flutter App Architecture

1. Section Intro
2. Popular App Architectures: MVC, MVP, MVVM, Clean Architecture, Bloc
3. Riverpod App Architecture with the Controller-Service-Repository Pattern
4. Project Structure: Feature-first vs Layer-first
5. The Repository Pattern and the Data Layer
6. Implementing the "fake" products repository as a singleton
7. Working with Future and Stream-based APIs
8. Wrap Up

### 4. State Management with Riverpod - Part 1

1. Section Intro
2. Introduction to Riverpod
3. Riverpod installation and setup
4. Creating our first provider
5. Reading providers with `ConsumerWidget` and `Consumer`
6. Working with `FutureProvider`, `StreamProvider`, and `AsyncValue`
7. Testing `AsyncValue` by adding a delay
8. The `family` modifier
9. The `autoDispose` modifier + advanced data caching options
10. Creating a reusable `AsyncValueWidget` helper
11. Wrap Up + Exercise

### [LICENSE: MIT](LICENSE.md)