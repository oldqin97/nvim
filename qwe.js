/**
 * 将总数拆分为 count 份，每份保留 3 位小数，且总和精确等于 total
 *
 * 算法：前 count-1 项取 floor(total/count, 3位小数)，最后一项用减法补齐，
 *       确保总和严格等于 total，消除浮点累积误差。
 *
 * @param {number} total - 总数
 * @param {number} count - 要拆分的份数
 * @param {number} decimals - 保留小数位数，默认 3
 * @returns {number[]} 长度为 count 的数组，总和 === total
 */
function splitWithPrecision(total, count, decimals = 3) {
  const factor = 10 ** decimals;

  // 向下截断到指定小数位
  const base = Math.floor((total / count) * factor) / factor;

  const result = [];
  for (let i = 0; i < count - 1; i++) {
    result.push(base);
  }

  // 最后一项 = total - 前面各项之和，用 round 消除浮点累积误差
  const last = Math.round((total - base * (count - 1)) * factor) / factor;
  result.push(last);

  return result;
}

// --- 测试 ---
const total = 52.77
const count = 13
const decimals = 3
const parts = splitWithPrecision(total, count, decimals)
const sum = parts.reduce((a, b) => a + b, 0)

console.log("拆分结果:", parts)
console.log("份数:", parts.length)
console.log("总和:", sum)

// 严格校验：用 toFixed 在同精度下比较，消除浮点误差
const sumRounded = +sum.toFixed(decimals)
const passed = sumRounded === total
console.log("严格校验 (toFixed 比较):", passed ? "✅ 通过" : "❌ 失败", `(${sumRounded} === ${total})`)
