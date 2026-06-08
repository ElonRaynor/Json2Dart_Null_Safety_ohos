import 'package:flutter/material.dart';
import 'package:json2dart_safe/json2dart.dart';

/// DemoModel - 用于演示 asBean/asBeans 的模型类
class DemoModel {
  final String name;
  final int age;
  final double score;

  DemoModel({required this.name, required this.age, required this.score});

  factory DemoModel.fromJson(Map json) => DemoModel(
    name: json.asString('name'),
    age: json.asInt('age'),
    score: json.asDouble('score'),
  );

  static DemoModel toBean(Map json) => DemoModel.fromJson(json);

  @override
  String toString() => 'DemoModel(name: $name, age: $age, score: $score)';
}

/// API Demo 页面 - 展示所有 json2dart_safe API 的使用示例
class PageApiDemo extends StatefulWidget {
  static const String routeName = '/page/PageApiDemo';

  const PageApiDemo({Key? key}) : super(key: key);

  @override
  State<PageApiDemo> createState() => _PageApiDemoState();
}

class _PageApiDemoState extends State<PageApiDemo> {
  final List<String> _demoResults = [];

  @override
  void initState() {
    super.initState();
    // 注册错误回调
    _setupErrorCallbacks();
    // 运行所有 demo
    _runAllDemos();
  }

  void _setupErrorCallbacks() {
    // addCallback - 添加解析错误回调
    Json2Dart.instance.addCallback((String errorMsg) {
      debugPrint('JsonParse Error: $errorMsg');
    });

    // addDetailCallback - 添加详细错误回调
    Json2Dart.instance.addDetailCallback((String method, String key, Map? map) {
      debugPrint('JsonParse Detail: method=$method, key=$key, map=$map');
    });
  }

  void _runAllDemos() {
    _demoResults.clear();

    // 1. asInts - 多字段整数解析
    _demoAsInts();

    // 2. asBools - 多字段布尔解析
    _demoAsBools();

    // 3. asDouble - 安全获取浮点值
    _demoAsDouble();

    // 4. asDoubles - 多字段浮点解析
    _demoAsDoubles();

    // 5. asNum - 安全获取数字值
    _demoAsNum();

    // 6. asLists - 多字段列表解析
    _demoAsLists();

    // 7. asArray2d - 二维数组解析
    _demoAsArray2d();

    // 8. asBean - 解析为模型对象
    _demoAsBean();

    // 9. asBeans - 多字段模型解析
    _demoAsBeans();

    // 10. removeNull - 移除空值键
    _demoRemoveNull();

    // 11. removeNullOrEmpty - 移除空值和空字符串键
    _demoRemoveNullOrEmpty();

    // 12. JsonFormatter.format - 格式化 JSON
    _demoJsonFormatter();
  }

  void _demoAsInts() {
    final json = {'count': 10, 'num': 20, 'total': null};
    // 从多个字段中解析第一个有效的整数
    final result = json.asInts(['total', 'count', 'num'], 0);
    _demoResults.add('asInts: json=$json -> result=$result (从多字段取第一个有效值)');
  }

  void _demoAsBools() {
    final json1 = {'enabled': true, 'active': false};
    final result1 = json1.asBools(['enabled', 'active'], false);

    final json2 = {'status': 1, 'flag': 'true'};
    final result2 = json2.asBools(['status', 'flag'], false);

    _demoResults.add('asBools: json1=$json1 -> $result1');
    _demoResults.add('asBools: json2=$json2 -> $result2 (支持 bool/int/string)');
  }

  void _demoAsDouble() {
    final json1 = {'price': 99.5};
    final result1 = json1.asDouble('price');

    final json2 = {'rate': '3.14159'};
    final result2 = json2.asDouble('rate');

    final json3 = {'score': null};
    final result3 = json3.asDouble('score', 0.0);

    _demoResults.add('asDouble: json1=$json1 -> $result1');
    _demoResults.add('asDouble: json2=$json2 -> $result2 (字符串转double)');
    _demoResults.add('asDouble: json3=$json3 -> $result3 (null返回默认值)');
  }

  void _demoAsDoubles() {
    final json = {'price1': null, 'price2': 88.5, 'price3': '12.3'};
    final result = json.asDoubles(['price1', 'price2', 'price3'], 0.0);
    _demoResults.add('asDoubles: json=$json -> $result (多字段取第一个有效值)');
  }

  void _demoAsNum() {
    final json1 = {'value': 100};
    final result1 = json1.asNum('value');

    final json2 = {'value': 3.14};
    final result2 = json2.asNum('value');

    final json3 = {'value': '42'};
    final result3 = json3.asNum('value');

    _demoResults.add('asNum: json1=$json1 -> $result1 (int)');
    _demoResults.add('asNum: json2=$json2 -> $result2 (double)');
    _demoResults.add('asNum: json3=$json3 -> $result3 (字符串转num)');
  }

  void _demoAsLists() {
    final json = {'items1': null, 'items2': [1, 2, 3], 'items3': [4, 5]};
    final result = json.asLists<int>(['items1', 'items2', 'items3']);
    _demoResults.add('asLists: json=$json -> $result (多字段取第一个有效列表)');

    // 使用 toBean 转换
    final jsonModel = {
      'users1': null,
      'users2': [
        {'name': 'Alice', 'age': 25, 'score': 90.5},
        {'name': 'Bob', 'age': 30, 'score': 85.0}
      ]
    };
    final models = jsonModel.asLists<DemoModel>(['users1', 'users2'], DemoModel.toBean);
    _demoResults.add('asLists with toBean: -> ${models?.map((m) => m.name).toList()}');
  }

  void _demoAsArray2d() {
    // 基本类型二维数组
    final json1 = {
      'matrix': [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
      ]
    };
    final result1 = json1.asArray2d<int>('matrix');
    _demoResults.add('asArray2d: json=$json1 -> $result1');

    // 模型二维数组
    final json2 = {
      'groups': [
        [
          {'name': 'A1', 'age': 20, 'score': 80.0},
          {'name': 'A2', 'age': 21, 'score': 85.0}
        ],
        [
          {'name': 'B1', 'age': 22, 'score': 90.0}
        ]
      ]
    };
    final result2 = json2.asArray2d<DemoModel>('groups', DemoModel.toBean);
    final names = result2?.map((group) => group.map((m) => m.name).toList()).toList();
    _demoResults.add('asArray2d with toBean: -> $names');
  }

  void _demoAsBean() {
    final json = {
      'user': {'name': 'Charlie', 'age': 28, 'score': 92.5}
    };
    final result = json.asBean<DemoModel>('user', DemoModel.toBean);
    _demoResults.add('asBean: json[key=user] -> $result');

    // JSON 字符串转模型
    final jsonStr = {'user': '{"name":"David","age":35,"score":78.0}'};
    final resultStr = jsonStr.asBean<DemoModel>('user', DemoModel.toBean);
    _demoResults.add('asBean from String: -> $resultStr');
  }

  void _demoAsBeans() {
    final json = {
      'profile': null,
      'account': {'name': 'Eve', 'age': 24, 'score': 95.0},
      'user': {'name': 'Frank', 'age': 26, 'score': 88.0}
    };
    final result = json.asBeans<DemoModel>(['profile', 'account', 'user'], DemoModel.toBean);
    _demoResults.add('asBeans: 多字段取第一个有效模型 -> $result');
  }

  void _demoRemoveNull() {
    final json = {'name': 'Test', 'age': null, 'city': 'Beijing', 'score': null};
    final original = Map<String, dynamic>.from(json);
    json.removeNull();
    _demoResults.add('removeNull: $original -> $json (移除 null 值键)');
  }

  void _demoRemoveNullOrEmpty() {
    final json = {'name': 'Test', 'age': null, 'city': '', 'score': 100, 'desc': '   '};
    final original = Map<String, dynamic>.from(json);
    json.removeNullOrEmpty();
    _demoResults.add('removeNullOrEmpty: $original -> $json (移除 null 和空字符串)');
  }

  void _demoJsonFormatter() {
    final json = {
      'name': 'Formatter Demo',
      'items': [1, 2, 3],
      'nested': {'key': 'value', 'nums': [10, 20]}
    };

    // 格式化 JSON，默认缩进
    final formatted = JsonFormatter.format(json, deep: 0, indentation: '  ');
    _demoResults.add('JsonFormatter.format:\n$formatted');

    // 格式化 JSON 字符串
    final jsonStr = '{"a":1,"b":[2,3]}';
    final formattedStr = JsonFormatter.format(jsonStr, indentation: '    ');
    _demoResults.add('JsonFormatter.format(String):\n$formattedStr');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('json2dart_safe API Demo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _runAllDemos();
              });
            },
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _demoResults.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                _demoResults[index],
                style: const TextStyle(fontSize: 14),
              ),
            ),
          );
        },
      ),
    );
  }
}