const { describe, it } = require("node:test");
const assert = require("node:assert");
const { qwe, fibonacci, medianOfThree, quickSort } = require("./test.js");

// ============================================================
// qwe — 异步遍历数组
// ============================================================
describe("qwe(arr)", () => {
  it("普通数组应 resolve 原数组", async () => {
    const arr = [1, 2, 3];
    const result = await qwe(arr);
    assert.strictEqual(result, arr);
    assert.deepStrictEqual(result, [1, 2, 3]);
  });

  it("空数组应 resolve 空数组", async () => {
    const result = await qwe([]);
    assert.deepStrictEqual(result, []);
  });

  it("字符串数组应正常处理", async () => {
    const arr = ["a", "b", "c"];
    const result = await qwe(arr);
    assert.deepStrictEqual(result, ["a", "b", "c"]);
  });

  it("resolve 值与原数组引用相同", async () => {
    const arr = [1, 2, 3];
    const result = await qwe(arr);
    assert.strictEqual(result, arr);
  });

  it("返回值应在约 1 秒后 resolve", async () => {
    const start = Date.now();
    await qwe([1]);
    const elapsed = Date.now() - start;
    assert.ok(elapsed >= 900, `耗时 ${elapsed}ms 不足 900ms`);
  });

  it("传入 null 应 reject TypeError", async () => {
    await assert.rejects(() => qwe(null), TypeError);
  });

  it("传入 undefined 应 reject TypeError", async () => {
    await assert.rejects(() => qwe(undefined), TypeError);
  });

  it("传入数字应 reject TypeError", async () => {
    await assert.rejects(() => qwe(42), TypeError);
  });

  it("传入字符串应 reject TypeError", async () => {
    await assert.rejects(() => qwe("string"), TypeError);
  });

  it("传入对象应 reject TypeError", async () => {
    await assert.rejects(() => qwe({}), TypeError);
  });
});

// ============================================================
// fibonacci — 斐波那契数列
// ============================================================
describe("fibonacci(n)", () => {
  // 已知斐波那契值：F(0)=0, F(1)=1, F(2)=1, F(3)=2, F(5)=5, F(10)=55
  const known = [
    [0, 0],
    [1, 1],
    [2, 1],
    [3, 2],
    [4, 3],
    [5, 5],
    [6, 8],
    [7, 13],
    [8, 21],
    [9, 34],
    [10, 55],
    [20, 6765],
    [30, 832040],
    [50, 12586269025],
    [78, 8944394323791464], // Number.MAX_SAFE_INTEGER 以内最大项
  ];

  for (const [n, expected] of known) {
    it(`F(${n}) = ${expected}`, () => {
      assert.strictEqual(fibonacci(n), expected);
    });
  }

  it("负数应抛出 Error", () => {
    assert.throws(() => fibonacci(-1), Error);
    assert.throws(() => fibonacci(-100), Error);
  });

  it("小数应抛出 Error", () => {
    assert.throws(() => fibonacci(1.5), Error);
    assert.throws(() => fibonacci(0.1), Error);
  });

  it("NaN 应抛出 Error", () => {
    assert.throws(() => fibonacci(NaN), Error);
  });

  it("字符串数字应抛出 Error", () => {
    assert.throws(() => fibonacci("5"), Error);
  });

  it("空参数应抛出 Error", () => {
    assert.throws(() => fibonacci(), Error);
  });
});

// ============================================================
// medianOfThree — 三数取中
// ============================================================
describe("medianOfThree(a, b, c)", () => {
  it("三个不同数字取中间值", () => {
    assert.strictEqual(medianOfThree(1, 2, 3), 2);
    assert.strictEqual(medianOfThree(1, 3, 2), 2);
    assert.strictEqual(medianOfThree(2, 1, 3), 2);
    assert.strictEqual(medianOfThree(2, 3, 1), 2);
    assert.strictEqual(medianOfThree(3, 1, 2), 2);
    assert.strictEqual(medianOfThree(3, 2, 1), 2);
  });

  it("三个相同数字返回该值", () => {
    assert.strictEqual(medianOfThree(5, 5, 5), 5);
  });

  it("两个相同一个不同", () => {
    assert.strictEqual(medianOfThree(3, 3, 5), 3);
    assert.strictEqual(medianOfThree(3, 5, 3), 3);
    assert.strictEqual(medianOfThree(5, 3, 3), 3);
  });

  it("包含负数", () => {
    assert.strictEqual(medianOfThree(-5, 0, 5), 0);
    assert.strictEqual(medianOfThree(-10, -3, -8), -8);
  });

  it("包含小数", () => {
    assert.strictEqual(medianOfThree(1.1, 2.2, 3.3), 2.2);
    assert.strictEqual(medianOfThree(1.5, 0.5, 1.0), 1.0);
  });

  it("包含零", () => {
    assert.strictEqual(medianOfThree(0, -1, 1), 0);
    assert.strictEqual(medianOfThree(0, 0, 1), 0);
  });

  it("Infinity/-Infinity 排序正确", () => {
    assert.strictEqual(medianOfThree(-Infinity, 0, Infinity), 0);
    assert.strictEqual(medianOfThree(Infinity, -Infinity, 0), 0);
  });
});

// ============================================================
// quickSort — 快速排序（原地）
// ============================================================
describe("quickSort(arr, left, right)", () => {
  function testSort(desc, input, expected) {
    it(desc, () => {
      quickSort(input);
      assert.deepStrictEqual(input, expected);
    });
  }

  testSort("普通乱序数组", [3, 1, 4, 1, 5, 9, 2, 6], [1, 1, 2, 3, 4, 5, 6, 9]);
  testSort("空数组", [], []);
  testSort("单个元素", [42], [42]);
  testSort("两个元素逆序", [2, 1], [1, 2]);
  testSort("两个元素有序", [1, 2], [1, 2]);
  testSort("全部相同元素", [7, 7, 7, 7], [7, 7, 7, 7]);
  testSort("含重复值", [5, 3, 3, 5, 1], [1, 3, 3, 5, 5]);
  testSort("含负数", [3, -1, -5, 0, 2], [-5, -1, 0, 2, 3]);
  testSort("逆序数组", [9, 8, 7, 6, 5, 4, 3, 2, 1], [1, 2, 3, 4, 5, 6, 7, 8, 9]);
  testSort("正序数组（最佳情况）", [1, 2, 3, 4, 5], [1, 2, 3, 4, 5]);

  it("对已排序数组排序结果不变", () => {
    const arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    quickSort(arr);
    assert.deepStrictEqual(arr, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
  });

  it("使用 left/right 对子区间排序", () => {
    const arr = [9, 3, 1, 4, 1, 5, 9];
    quickSort(arr, 1, 5);
    // 下标 1-5 ([3,1,4,1,5]) 排序为 [1,1,3,4,5]，头尾不变
    assert.deepStrictEqual(arr, [9, 1, 1, 3, 4, 5, 9]);
  });

  it("left >= right 时不做任何操作", () => {
    const arr = [5, 3, 1];
    quickSort(arr, 1, 0);
    assert.deepStrictEqual(arr, [5, 3, 1]);
  });

  it("与原版 Array.sort 结果一致（随机数组）", () => {
    const seed = 42;
    let state = seed;
    function pseudoRand() {
      state = (state * 1664525 + 1013904223) & 0x7fffffff;
      return state;
    }

    for (let run = 0; run < 50; run++) {
      const len = (pseudoRand() % 200) + 1;
      const arr = Array.from({ length: len }, () => (pseudoRand() % 2000) - 1000);
      const expected = [...arr].sort((a, b) => a - b);
      quickSort(arr);
      assert.deepStrictEqual(
        arr,
        expected,
        `失败于第 ${run} 轮: [${arr.slice(0, 10).join(",")}...]`,
      );
    }
  });

  it("大数据量不栈溢出且结果正确", () => {
    const n = 10000;
    const arr = Array.from({ length: n }, (_, i) => n - i); // 逆序
    const expected = Array.from({ length: n }, (_, i) => i + 1);
    quickSort(arr);
    assert.deepStrictEqual(arr, expected);
  });
});
