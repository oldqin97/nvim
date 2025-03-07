/**
 * 测试函数
 *
 * @param {string} q - 输入字符串
 * @returns {string} 返回字符串
 */
function ttt(q) {
  console.log(q);
  return q;
}

/**
 * 计算斐波那契数列的第n项
 *
 * @param {number} n - 要计算的项数
 * @returns {number} 斐波那契数列的第n项
 *
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
 * @param {number} a
 * @param {number} b
 * @param {number} c
 * @returns {number}
 */
function medianOfThree(a, b, c) {
  if (a > b) [a, b] = [b, a];
  if (a > c) [a, c] = [c, a];
  if (b > c) [b, c] = [c, b];
  return b;
}

/**
 * 快速排序算法（优化版）
 *
 * @param {number[]} arr - 要排序的数组
 * @param {number} [left=0] - 左边界
 * @param {number} [right=arr.length-1] - 右边界
 * @returns {void} 原地排序
 *
 * @example
 * const arr = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5];
 * quickSort(arr);
 * console.log(arr); // [1, 1, 2, 3, 3, 4, 5, 5, 5, 6, 9]
 */
function quickSort(arr, left = 0, right = arr.length - 1) {
  if (left >= right) return;

  // 三数取中法选择基准值
  const mid = Math.floor((left + right) / 2);
  const pivot = medianOfThree(arr[left], arr[mid], arr[right]);

  let i = left;
  let j = right;

  while (i <= j) {
    while (arr[i] < pivot) i++;
    while (arr[j] > pivot) j--;
    if (i <= j) {
      [arr[i], arr[j]] = [arr[j], arr[i]];
      i++;
      j--;
    }
  }

  quickSort(arr, left, j);
  quickSort(arr, i, right);
}
