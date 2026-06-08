# json2dart_safe

本项目基于 [json2dart_safe](https://github.com/fastcode555/Json2Dart_Null_Safety.git) 开发，为 OpenHarmony Flutter 场景提供 JSON 序列化/反序列化功能，支持 Null-Safety 特性和安全的默认值转换。

## 1. 安装与使用

### 1.1 安装方式

进入工程目录并在 `pubspec.yaml` 中添加依赖：

#### pubspec.yaml

```yaml
dependencies:
  json2dart_safe:
    git:
      url: https://gitcode.com/openharmony-tpc/json2dart_safe
      ref: main
```
执行命令：

```bash
flutter pub get
```

### 1.2 使用案例

使用案例详见 [example](example/lib/main.dart)。

最简单的调用方式：

```dart
import 'package:json2dart_safe/json2dart_safe.dart';

// JSON 解析示例
final json = {'name': 'John', 'age': 30};
final name = json.asString('name');  // 获取字符串，空值返回 ''
final age = json.asInt('age');       // 获取整数，空值返回 0
final list = json.asList<String>('tags');  // 获取列表，空值返回 []

// JSON 扩展方法
final map = <String, dynamic>{};
map.put('key', 'value');  // 安全添加键值对
```

## 2. 约束条件

1. Flutter: 3.22.1-ohos-1.0.3; SDK: 5.0.0(12); IDE: DevEco Studio: 5.1.1.830; ROM: 6.0.0.115 SP16;
2. Flutter: 3.35.8-ohos-0.0.2; SDK: 6.0.1(21); IDE: DevEco Studio: 6.1.0.830; ROM: 6.0.0.120 SP6;

## 3. 版本和框架对应关系

|       | 3.7 | 3.22 | 3.27 | 3.35 |
|-------|:---:|:----:|:----:|:----:|
| 1.6.0 |  ❌  |  ✅   |  ❌   |  ✅   |

## 4. API

> [!TIP] "ohos Support" 列：yes 表示支持；no 表示不支持；partially 表示部分支持。

### MapExt 扩展方法

| Name | Description | Type | Input | Output | ohos Support |
| --- | --- | --- | --- | --- | --- |
| asString | 安全获取字符串值 | function | key: 键名; defValue: 默认值（可选） | String | yes |
| asStrings | 多字段解析字符串 | function | keys: 键名列表; defValue: 默认值（可选） | String | yes |
| asInt | 安全获取整数值 | function | key: 键名; defValue: 默认值（可选） | int | yes |
| asInts | 多字段解析整数 | function | keys: 键名列表; defValue: 默认值（可选） | int | yes |
| asBool | 安全获取布尔值 | function | key: 键名; defValue: 默认值（可选） | bool | yes |
| asBools | 多字段解析布尔值 | function | keys: 键名列表; defValue: 默认值（可选） | bool | yes |
| asDouble | 安全获取浮点数值 | function | key: 键名; defValue: 默认值（可选） | double | yes |
| asDoubles | 多字段解析浮点数 | function | keys: 键名列表; defValue: 默认值（可选） | double | yes |
| asNum | 安全获取数字值（int/double） | function | key: 键名 | num | yes |
| asList | 安全获取列表值 | function | key: 键名; toBean: 转换函数（可选） | List<T>? | yes |
| asLists | 多字段解析列表 | function | keys: 键名列表; toBean: 转换函数（可选） | List<T>? | yes |
| asArray2d | 二维数组解析 | function | key: 键名; toBean: 转换函数（可选） | List<List<T>>? | yes |
| asBean | 解析为模型对象 | function | key: 键名; toBean: 转换函数 | T? | yes |
| asBeans | 多字段解析模型 | function | keys: 键名列表; toBean: 转换函数 | T? | yes |
| put | 安全添加键值对 | function | key: 键名; value: 值 | Map | yes |
| removeNull | 移除空值键 | function | 无参数 | void | yes |
| removeNullOrEmpty | 移除空值和空字符串键 | function | 无参数 | void | yes |

### JsonFormatter 类

| Name | Description | Type | Input | Output | ohos Support |
| --- | --- | --- | --- | --- | --- |
| format | 格式化 JSON 数据 | function | data: 数据; deep: 层级; indentation: 缩进符 | String | yes |

### Json2Dart 类

| Name | Description | Type | Input | Output | ohos Support |
| --- | --- | --- | --- | --- | --- |
| addCallback | 添加解析错误回调 | function | callBack: 回调函数 | void | yes |
| addDetailCallback | 添加详细错误回调 | function | callBack: 回调函数 | void | yes |

## 7. 开源协议

本项目基于 [BSD-3-Clause](LICENSE) 开源。