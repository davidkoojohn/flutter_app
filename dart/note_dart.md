# Dart

### 变量的声明 `var、dynamic和Object`

- `var`: 如果没有初始值，可以变成任何类型，但如果var有初始值，那么类型将被锁定
- `Object`: **编译阶段检查类型**，动态类型，即使赋了初始值，也同样可以指定别的类型
- `dynamic`: **编译阶段不检查类型**，动态类型

### 变量的默认值，没有初始化的变量自动获取一个默认值为null
> 一切皆对象，对象的默认值为null

### 变量 `final和const`

- 声明的类型可省略
- 初始化后不能再赋值
- 不能和var同时使用
- 不同点：
    - 类级别常量，使用static const
    - const可使用其他const 常量的值来初始化其值
    - 使用const赋值声明，const可省略
    - 可以更改非final、非const变量的值，即使曾经具有const值
    - const导致的不可变性是可传递的
    - 相同的const常量不会在内存中重复创建 #identical用于检查两个引用是否指向同一个对象
    - const需要是编译时常量

## 内置类型
> Numbers 数值、Strings 字符串、Booleans 布尔值、Lists 列表(数组)、Sets 集合、Maps 集合、Runes 符号字符、Symbols 标识符。

### num, `int`整数值, `double`(64-bit双精度浮点数)
> int和double是num的子类

### String
- 使用单引号或者双引号来创建字符串
- 三个单引号或者双引号创建多行字符串对象
- r 前缀创建”原始raw”字符串
```dart
String f = r'''ssss
  fff\nffffgg
  grrrr''';
```
- 使用表达式： `${expression}`,如果表达式是一个标识符，可以省略 {}
```dart
String c = 'aaa';
print("object:$c");
```
### bool
### List
### Map
### Set
### Runes 符文的意思，用于在字符串中表示Unicode字符
```dart
Runes runes = new Runes('\u{1f605} \u6211');
var str1 = String.fromCharCodes(runes);  
print(str1);
```


