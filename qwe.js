/**
 * 将输入参数的值打印到控制台并返回它。
 *
 * @param {*} q - 要打印和返回的输入参数。
 * @returns {*} 传入的相同输入参数。
 */
function qwe(q) {
  console.log(q);
  return q;
}

const q = () => {
  return 0;
};

console.log(q);

/**
 * 计算斐波那契数列的第n项
 * @param {number} n 斐波那契数列的项数
 * @returns {number} 第n项的斐波那契数列值
 */
function fibonacci(n) {
  if (n <= 1) {
    return n;
  }
  return fibonacci(n - 1) + fibonacci(n - 2);
}

export default qwe;
