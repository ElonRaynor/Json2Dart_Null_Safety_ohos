# json2dart_safe

This project is based on [json2dart_safe](https://github.com/fastcode555/Json2Dart_Null_Safety.git), providing JSON serialization/deserialization functionality for OpenHarmony Flutter scenarios, with Null-Safety feature and safe default value conversion.

## 1. Installation and Usage

### 1.1 Installation

Add dependency in `pubspec.yaml`:

#### pubspec.yaml

```yaml
dependencies:
  json2dart_safe:
    git:
      url: https://gitcode.com/openharmony-tpc/json2dart_safe
      ref: main
```
Run command:

```bash
flutter pub get
```

### 1.2 Usage Example

See [example](example/lib/main.dart) for usage details.

The simplest usage:

```dart
import 'package:json2dart_safe/json2dart_safe.dart';

// JSON parsing example
final json = {'name': 'John', 'age': 30};
final name = json.asString('name');  // Get string, returns '' for null
final age = json.asInt('age');       // Get integer, returns 0 for null
final list = json.asList<String>('tags');  // Get list, returns [] for null

// JSON extension methods
final map = <String, dynamic>{};
map.put('key', 'value');  // Safely add key-value pair
```

## 2. Constraints

1. Flutter: 3.22.1-ohos-1.0.3; SDK: 5.0.0(12); IDE: DevEco Studio: 5.1.1.830; ROM: 6.0.0.115 SP16;
2. Flutter: 3.35.8-ohos-0.0.2; SDK: 6.0.1(21); IDE: DevEco Studio: 6.1.0.830; ROM: 6.0.0.120 SP6;

## 3. Version and Framework Mapping

|       | 3.7 | 3.22 | 3.27 | 3.35 |
|-------|:---:|:----:|:----:|:----:|
| 1.6.0 |  ❌  |  ✅   |  ❌   |  ✅   |

## 4. API

> [!TIP] "ohos Support" column: yes means supported; no means not supported; partially means partially supported.

### MapExt Extension Methods

| Name | Description | Type | Input | Output | ohos Support |
| --- | --- | --- | --- | --- | --- |
| asString | Safely get string value | function | key: key name; defValue: default (optional) | String | yes |
| asStrings | Multi-key string parsing | function | keys: key list; defValue: default (optional) | String | yes |
| asInt | Safely get integer value | function | key: key name; defValue: default (optional) | int | yes |
| asInts | Multi-key integer parsing | function | keys: key list; defValue: default (optional) | int | yes |
| asBool | Safely get boolean value | function | key: key name; defValue: default (optional) | bool | yes |
| asBools | Multi-key boolean parsing | function | keys: key list; defValue: default (optional) | bool | yes |
| asDouble | Safely get double value | function | key: key name; defValue: default (optional) | double | yes |
| asDoubles | Multi-key double parsing | function | keys: key list; defValue: default (optional) | double | yes |
| asNum | Safely get num value (int/double) | function | key: key name | num | yes |
| asList | Safely get list value | function | key: key name; toBean: converter (optional) | List<T>? | yes |
| asLists | Multi-key list parsing | function | keys: key list; toBean: converter (optional) | List<T>? | yes |
| asArray2d | 2D array parsing | function | key: key name; toBean: converter (optional) | List<List<T>>? | yes |
| asBean | Parse to model object | function | key: key name; toBean: converter | T? | yes |
| asBeans | Multi-key model parsing | function | keys: key list; toBean: converter | T? | yes |
| put | Safely add key-value pair | function | key: key name; value: value | Map | yes |
| removeNull | Remove null value keys | function | none | void | yes |
| removeNullOrEmpty | Remove null and empty string keys | function | none | void | yes |

### JsonFormatter Class

| Name | Description | Type | Input | Output | ohos Support |
| --- | --- | --- | --- | --- | --- |
| format | Format JSON data | function | data: data; deep: level; indentation: indent char | String | yes |

### Json2Dart Class

| Name | Description | Type | Input | Output | ohos Support |
| --- | --- | --- | --- | --- | --- |
| addCallback | Add parse error callback | function | callBack: callback function | void | yes |
| addDetailCallback | Add detailed error callback | function | callBack: callback function | void | yes |

## 7. License

This project is open sourced under [BSD-3-Clause](LICENSE).