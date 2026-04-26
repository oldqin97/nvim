/**
 * 异步遍历数组并打印每个元素
 * @param {Array} arr - 要遍历的数组
 * @returns {Promise<Array>} 1秒后 resolve 原数组
 */
function qwe(arr) {
  if (!Array.isArray(arr)) {
    return Promise.reject(new TypeError("参数必须是数组"));
  }
  arr.forEach(item => console.log(item));
  return new Promise(resolve => setTimeout(() => resolve(arr), 1000));
}

qwe([1, 2, 3]);

/**
 * 计算斐波那契数列第 n 项（迭代，O(n) 时间，O(1) 空间）
 * @param {number} n - 非负整数
 */
function fibonacci(n) {
  if (n < 0 || !Number.isInteger(n)) throw new Error("输入必须是非负整数");
  if (n < 2) return n;

  let [prev, curr] = [0, 1];
  for (let i = 2; i <= n; i++) {
    [prev, curr] = [curr, prev + curr];
  }
  return curr;
}

/**
 * 三数取中
 */
function medianOfThree(a, b, c) {
  if (a > b) [a, b] = [b, a];
  if (a > c) [a, c] = [c, a];
  if (b > c) [b, c] = [c, b];
  return b;
}

/**
 * 快速排序（原地，Hoare 分区 + 三数取中 pivot）
 */
function quickSort(arr, left = 0, right = arr.length - 1) {
  if (left >= right) return;

  // 三数取中选 pivot，同时将 left/mid/right 三位置排序就位
  const mid = (left + right) >> 1;
  if (arr[left] > arr[mid]) [arr[left], arr[mid]] = [arr[mid], arr[left]];
  if (arr[left] > arr[right]) [arr[left], arr[right]] = [arr[right], arr[left]];
  if (arr[mid] > arr[right]) [arr[mid], arr[right]] = [arr[right], arr[mid]];
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

module.exports = { qwe, fibonacci, medianOfThree, quickSort };
