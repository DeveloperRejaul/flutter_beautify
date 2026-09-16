# Adding a component

## 1. Pick one

Browse the [Components](/components/) pages — every entry has a live
preview and the exact `add` command. Or, from the terminal, run `add` with
no argument to print the full list:

```bash
flutter_beautify add
```

## 2. Add it

```bash
flutter_beautify add date-picker
```

```
Created directory: lib/widgets
Created date_picker widget from template: lib/widgets/date_picker.dart
Import it: import 'package:your_package/widgets/date_picker.dart';
```

If `lib/widgets` doesn't exist yet, it's created. If you ran
[`init`](/guide/configuration) first with a custom widgets path, that path
is used instead.

## 3. If the file already exists

`add` won't overwrite it:

```
File already exists: lib/widgets/date_picker.dart
Aborting. Remove the file if you want to overwrite.
```

This is deliberate — `add` never risks clobbering edits you've already made
to a widget. Delete the file yourself first if you want a clean copy from
the template again.

## 4. Import and use it

```dart
import 'package:your_app/widgets/date_picker.dart';

FBDatePicker.outlined(
  selectedDate: date,
  onDateChanged: (d) => setState(() => date = d),
);
```

Check the component's own page under [Components](/components/) for its
available variants and parameters.

## Adding several components

There's no batch command — run `add` once per component:

```bash
flutter_beautify add button
flutter_beautify add card
flutter_beautify add textfield
```
