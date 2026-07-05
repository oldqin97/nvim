/**
 * 异步遍历数组并打印每个元素
 * @param {Array} arr - 要遍历的数组
 * @returns {Promise<Array>} 1秒后 resolve 原数组
 */
async function printArrayAsync(arr) {
  if (!Array.isArray(arr)) {
    throw new TypeError("参数必须是数组");
  }
  arr.forEach(item => console.log(item));

  return new Promise(resolve => setTimeout(() => resolve(arr), 1000));
}
/**
 * 计算斐波那契数列第 n 项（迭代，O(n) 时间，O(1) 空间）
 * @param {number} n - 非负整数
 * @returns {number} 第 n 项斐波那契数
 */
function fibonacci(n) {
  if (!Number.isInteger(n) || n < 0) {
    throw new Error("输入必须是非负整数");
  }
  if (n < 2) return n;

  let prev = 0,
    curr = 1;
  for (let i = 2; i <= n; i++) {
    [prev, curr] = [curr, prev + curr];
  }
  return curr;
}

/**
 * 三数取中 — 纯函数，返回 a, b, c 的中位数
 * @param {number} a
 * @param {number} b
 * @param {number} c
 * @returns {number} 中位数
 */
function medianOfThree(a, b, c) {
  if (a > b) [a, b] = [b, a];
  if (a > c) [a, c] = [c, a];
  if (b > c) [b, c] = [c, b];
  return b;
}

/**
 * 快速排序（原地，Hoare 分区 + 三数取中 pivot）
 * @param {number[]} arr - 要排序的数组
 * @param {number} [left=0] - 左边界
 * @param {number} [right=arr.length-1] - 右边界
 */
function quickSort(arr, left = 0, right = arr.length - 1) {
  if (left >= right) return;

  const mid = (left + right) >> 1;

  // 用 medianOfThree 将 left/mid/right 三位置排序，mid 即为 pivot
  const a = arr[left],
    b = arr[mid],
    c = arr[right];
  arr[left] = Math.min(a, b, c);
  arr[mid] = medianOfThree(a, b, c);
  arr[right] = Math.max(a, b, c);

  const pivot = arr[mid];
  let i = left,
    j = right;

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

module.exports = { printArrayAsync, fibonacci, medianOfThree, quickSort };
