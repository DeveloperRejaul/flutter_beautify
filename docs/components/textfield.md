# TextField

A `TextFormField` wrapper with three border styles, validation, input
formatting, and a built-in error state — the parameters mirror Flutter's own
`InputDecoration` where it makes sense.

[View source on GitHub ↗](https://github.com/DeveloperRejaul/flutter_beautify/blob/main/example/lib/widgets/textfield.dart)

<ComponentPreview slug="textfield" :height="260">

```dart
FBTextField.outline(
  label: 'Email',
  hint: 'you@example.com',
  keyboardType: TextInputType.emailAddress,
);
```

</ComponentPreview>

## CLI

Install this component into your project:

<CliBlock slug="textfield" />

## Variants

`FBTextField.outline()` · `FBTextField.filled()` · `FBTextField.underline()`
— the plain constructor forwards to `.outline()`.

## Key parameters

| Parameter | Type | Default |
| --- | --- | --- |
| `label` / `hint` | `String?` | — |
| `controller` | `TextEditingController?` | — |
| `keyboardType` | `TextInputType` | `.text` |
| `obscureText` | `bool` | `false` |
| `validator` | `String? Function(String?)?` | — |
| `prefixIcon` / `suffixIcon` | `Widget?` | — |
| `errorText` / `isError` | `String?` / `bool?` | — |
| `inputFormatters` | `List<TextInputFormatter>?` | — |

## Usage

```dart
import 'package:your_app/widgets/textfield.dart';

FBTextField.outline(
  label: 'Email',
  keyboardType: TextInputType.emailAddress,
  validator: (v) => v != null && v.contains('@') ? null : 'Invalid email',
);
```
