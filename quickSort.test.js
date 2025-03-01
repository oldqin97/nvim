/**
 * 快速排序算法的单元测试
 */

const { quickSort } = require("./test");

// 测试用例
function testQuickSort() {
  // 测试用例1：普通数组
  const arr1 = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5];
  const sortedArr1 = quickSort(arr1);
  console.assert(
    JSON.stringify(sortedArr1) === JSON.stringify([1, 1, 2, 3, 3, 4, 5, 5, 5, 6, 9]),
    "Test Case 1 Failed",
  );

  // 测试用例2：空数组
  const arr2 = [];
  const sortedArr2 = quickSort(arr2);
  console.assert(JSON.stringify(sortedArr2) === JSON.stringify([]), "Test Case 2 Failed");

  // 测试用例3：已排序数组
  const arr3 = [1, 2, 3, 4, 5];
  const sortedArr3 = quickSort(arr3);
  console.assert(
    JSON.stringify(sortedArr3) === JSON.stringify([1, 2, 3, 4, 5]),
    "Test Case 3 Failed",
  );

  // 测试用例4：单个元素数组
  const arr4 = [42];
  const sortedArr4 = quickSort(arr4);
  console.assert(
    JSON.stringify(sortedArr4) === JSON.stringify([42]),
    "Test Case 4 Failed",
  );

  // 测试用例5：包含负数的数组
  const arr5 = [-3, -1, -4, -1, -5];
  const sortedArr5 = quickSort(arr5);
  console.assert(
    JSON.stringify(sortedArr5) === JSON.stringify([-5, -4, -3, -1, -1]),
    "Test Case 5 Failed",
  );

  console.log("All quickSort tests passed!");
}

// 运行测试
testQuickSort();
