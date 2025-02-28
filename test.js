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
