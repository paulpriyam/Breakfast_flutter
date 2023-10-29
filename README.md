 # Breakfast Flutter App

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Database used is Hive
### STEP 1: Add Dependency
Dependency required
```
  flutter_svg: ^1.1.6
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  hive_generator: ^1.1.3
```
### Step 2: Add Model
Add *@HiveType* and *@HIveField* to your dataClass/model class.
```
@HiveType(typeId: 1)
class DietModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String iconPath;
  @HiveField(2)
  String duration;
  @HiveField(3)
  String level;
  @HiveField(4)
  String calorie;
  @HiveField(5)
  bool isViewSelected;
}
```
@HiveType will tell the information above the data model table which contains an argument typeId.

The @HiveFieldtells the data to pass for each property.

We have exented the HiveObject so as to get the key of our datamodel data item.
### Step 3: Generate Adapter
flutter packages pub run build_runner build
It will generate the diet_modal.g.dart
### step 4: Initialize Hive

```
 //init Hive
  await Hive.initFlutter();

  //register adapter
  Hive.registerAdapter(DietModelAdapter());

  //open a box
  await Hive.openBox(Constants.HIVE_BOX);
```
### Links Followed
[Add Hive to Flutter Project and basic CRUD operations](https://medium.com/codex/hive-in-flutter-7a2b320eb1dc)

### Images
