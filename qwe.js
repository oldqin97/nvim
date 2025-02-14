/**
 * 将输入参数的值打印到控制台并返回它。
 *
 * @param {*} q - 要打印和返回的输入参数。
 * @returns {*} 传入的相同输入参数。
 */
function ttt(q) {}

console.log(123);

/**
 * 计算斐波那契数列的第n项。
 *
 * @param {number} n - 要计算的斐波那契数列的项数（非负整数）。
 * @returns {number} 斐波那契数列的第n项的值。
 */
function fibonacci(n) {
  if (n <= 1) return n;

  let a = 0;
  let b = 1;
  for (let i = 2; i <= n; i++) {
    [a, b] = [b, a + b];
  }
  return b;
}

[1].map(item => {
  console.log(item);
});

console.log(fibonacci(10)); // 55
console.log(fibonacci(11)); // 89
console.log(fibonacci(50)); // 12586269025
