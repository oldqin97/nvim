import { fibonacci } from "../test.js";

describe("fibonacci function", () => {
  test("should return 0 for n = 0", () => {
    expect(fibonacci(0)).toBe(0);
  });

  test("should return 1 for n = 1", () => {
    expect(fibonacci(1)).toBe(1);
  });

  test("should return 55 for n = 10", () => {
    expect(fibonacci(10)).toBe(55);
  });

  test("should throw error for negative input", () => {
    expect(() => fibonacci(-1)).toThrow("输入必须是非负整数");
  });

  test("should handle large numbers", () => {
    expect(fibonacci(50)).toBe(12586269025);
  });
});
