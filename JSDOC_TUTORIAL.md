# JSDoc 教程

<!--toc:start-->

- [JSDoc 教程](#jsdoc-教程)
  - [什么是 JSDoc？](#什么是-jsdoc)
    - [主要用途：](#主要用途)
  - [基本语法](#基本语法)
  - [常用标签](#常用标签)
    - [1. @param - 参数描述](#1-param-参数描述)
    - [2. @returns - 返回值描述](#2-returns-返回值描述)
    - [3. @type - 类型定义](#3-type-类型定义)
    - [4. @typedef - 自定义类型](#4-typedef-自定义类型)
    - [5. @class 和 @constructor](#5-class-和-constructor)
    - [6. @example - 使用示例](#6-example-使用示例)
    - [7. @throws - 抛出异常](#7-throws-抛出异常)
    - [8. @deprecated - 已弃用](#8-deprecated-已弃用)
    - [9. @see - 相关参考](#9-see-相关参考)
  - [复杂类型定义](#复杂类型定义)
    - [联合类型](#联合类型)
    - [函数类型](#函数类型)
    - [泛型](#泛型)
  - [实际示例](#实际示例)
  - [生成文档](#生成文档)
    - [安装 JSDoc](#安装-jsdoc)
    - [生成文档](#生成文档)
    - [配置 jsdoc.json](#配置-jsdocjson)
  - [最佳实践](#最佳实践)
  <!--toc:end-->

## 什么是 JSDoc?

JSDoc 是一种用于 JavaScript 代码的文档注释标准。它使用特定的注释格式来描述函数、类、变量等代码元素，这些注释可以被工具解析生成正式的文档。

### 主要用途

- 生成 API 文档
- 提供代码智能提示（IDE 支持）
- 提高代码可读性和可维护性
- 类型检查支持

## 基本语法

JSDoc 注释以 `/**` 开头，以 `*/` 结尾：

```javascript
/**
 * 函数描述
 * @param {类型} 参数名 - 参数描述
 * @returns {类型} 返回值描述
 */
function example(param) {
  return param;
}
```

## 常用标签

### 1. @param - 参数描述

```javascript
/**
 * @param {string} name - 用户名
 * @param {number} age - 年龄
 * @param {boolean} [isActive=true] - 是否激活（可选参数）
 */
function createUser(name, age, isActive = true) {
  // ...
}
```

### 2. @returns - 返回值描述

```javascript
/**
 * 计算两个数的和
 * @param {number} a - 第一个数
 * @param {number} b - 第二个数
 * @returns {number} 两个数的和
 */
function add(a, b) {
  return a + b;
}
```

### 3. @type - 类型定义

```javascript
/** @type {number} */
let count = 0;

/** @type {Array<string>} */
const names = [];

/** @type {{name: string, age: number}} */
const user = { name: "John", age: 25 };
```

### 4. @typedef - 自定义类型

```javascript
/**
 * @typedef {Object} User
 * @property {string} name - 用户名
 * @property {number} age - 年龄
 * @property {boolean} [isActive] - 是否激活
 */

/**
 * @param {User} user - 用户对象
 * @returns {string} 用户信息
 */
function getUserInfo(user) {
  return `${user.name} (${user.age})`;
}
```

### 5. @class 和 @constructor

```javascript
/**
 * 用户类
 * @class
 */
class User {
  /**
   * 创建用户实例
   * @constructor
   * @param {string} name - 用户名
   * @param {number} age - 年龄
   */
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }

  /**
   * 获取用户信息
   * @returns {string} 用户信息字符串
   */
  getInfo() {
    return `${this.name} - ${this.age}`;
  }
}
```

### 6. @example - 使用示例

```javascript
/**
 * 计算阶乘
 * @param {number} n - 要计算阶乘的数
 * @returns {number} 阶乘结果
 * @example
 * factorial(5) // 返回 120
 * factorial(0) // 返回 1
 */
function factorial(n) {
  if (n === 0) return 1;
  return n * factorial(n - 1);
}
```

### 7. @throws - 抛出异常

```javascript
/**
 * 除法运算
 * @param {number} a - 被除数
 * @param {number} b - 除数
 * @returns {number} 商
 * @throws {Error} 当除数为0时抛出错误
 */
function divide(a, b) {
  if (b === 0) {
    throw new Error("除数不能为0");
  }
  return a / b;
}
```

### 8. @deprecated - 已弃用

```javascript
/**
 * 旧的计算方法（已弃用）
 * @deprecated 请使用新的 calculate 方法
 * @param {number} x - 输入值
 * @returns {number} 计算结果
 */
function oldCalculate(x) {
  return x * 2;
}
```

### 9. @see - 相关参考

```javascript
/**
 * 验证邮箱格式
 * @param {string} email - 邮箱地址
 * @returns {boolean} 是否有效
 * @see {@link https://emailregex.com/} 邮箱正则表达式参考
 */
function isValidEmail(email) {
  const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return regex.test(email);
}
```

## 复杂类型定义

### 联合类型

```javascript
/**
 * @param {string|number} id - 用户ID
 * @returns {string|number} 处理后的ID
 */
function processId(id) {
  return id;
}
```

### 函数类型

```javascript
/**
 * @callback Predicate
 * @param {*} value - 要检查的值
 * @returns {boolean} 检查结果
 */

/**
 * @param {Array} array - 数组
 * @param {Predicate} predicate - 判断函数
 * @returns {Array} 过滤后的数组
 */
function filter(array, predicate) {
  return array.filter(predicate);
}
```

### 泛型

```javascript
/**
 * @template T
 * @param {T} value - 任意类型的值
 * @returns {T} 相同的值
 */
function identity(value) {
  return value;
}
```

## 实际示例

基于你提供的代码，这里是一些改进的 JSDoc 示例：

```javascript
/**
 * 异步遍历数组并打印每个元素
 * @param {Array} array - 要遍历的数组
 * @returns {Promise<Array>} 返回一个Promise，在1秒后resolve原始数组
 * @example
 * asyncTraverse([1, 2, 3]).then(res => console.log(res)); // 打印数组元素后返回[1, 2, 3]
 */
function asyncTraverse(array) {
  array.forEach(item => {
    console.log(item);
  });

  return new Promise(resolve => {
    setTimeout(() => {
      resolve(array);
    }, 1000);
  });
}

/**
 * 计算斐波那契数列的第n项
 * @param {number} n - 要计算的项数（非负整数）
 * @returns {number} 斐波那契数列的第n项
 * @throws {Error} 当n为负数时抛出错误
 * @example
 * fibonacci(0) // 返回 0
 * fibonacci(1) // 返回 1
 * fibonacci(10) // 返回 55
 */
function fibonacci(n) {
  if (n < 0) throw new Error("输入必须是非负整数");
  if (n === 0) return 0;
  if (n === 1) return 1;

  let prev = 0;
  let curr = 1;

  for (let i = 2; i <= n; i++) {
    [prev, curr] = [curr, prev + curr];
  }

  return curr;
}

/**
 * 三数取中法
 * @param {number} a - 第一个数
 * @param {number} b - 第二个数
 * @param {number} c - 第三个数
 * @returns {number} 三个数的中位数
 */
function medianOfThree(a, b, c) {
  if (a > b) [a, b] = [b, a];
  if (a > c) [a, c] = [c, a];
  if (b > c) [b, c] = [c, b];
  return b;
}
```

## 生成文档

### 安装 JSDoc

```bash
npm install -g jsdoc
```

### 生成文档

```bash
jsdoc your-file.js
```

### 配置 jsdoc.json

```json
{
  "source": {
    "include": ["src"],
    "exclude": ["node_modules", "dist"]
  },
  "opts": {
    "destination": "./docs/",
    "recurse": true
  }
}
```

## 最佳实践

1. **为所有公共函数添加 JSDoc**
2. **使用准确的类型描述**
3. **提供有意义的示例**
4. **描述异常情况**
5. **保持注释与代码同步**

JSDoc 不仅帮助生成文档，还能在 IDE 中提供更好的代码智能提示和类型检查支持。
