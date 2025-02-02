/**
 * @jest-environment node
 */

const { ttt, fibonacci } = require("./qwe");

describe("ttt function", () => {
  test("should log and return the input value", () => {
    const consoleSpy = jest.spyOn(console, "log");
    const input = "test input";

    const result = ttt(input);

    expect(consoleSpy).toHaveBeenCalledWith(input);
    expect(result).toBe(input);

    consoleSpy.mockRestore();
  });

  test("should handle different types of inputs", () => {
    const testCases = [
      { input: 123, expected: 123 },
      { input: "abc", expected: "abc" },
      { input: null, expected: null },
      { input: undefined, expected: undefined },
      { input: { a: 1 }, expected: { a: 1 } },
    ];

    testCases.forEach(({ input, expected }) => {
      const result = ttt(input);
      expect(result).toEqual(expected);
    });
  });
});

describe("fibonacci function", () => {
  test("should return correct values for basic cases", () => {
    expect(fibonacci(0)).toBe(0);
    expect(fibonacci(1)).toBe(1);
    expect(fibonacci(2)).toBe(1);
    expect(fibonacci(3)).toBe(2);
  });

  test("should return correct values for larger numbers", () => {
    expect(fibonacci(10)).toBe(55);
    expect(fibonacci(20)).toBe(6765);
    expect(fibonacci(50)).toBe(12586269025);
  });

  test("should throw error for negative numbers", () => {
    expect(() => fibonacci(-1)).toThrow();
    expect(() => fibonacci(-10)).toThrow();
  });

  test("should throw error for non-integer inputs", () => {
    expect(() => fibonacci(1.5)).toThrow();
    expect(() => fibonacci("5")).toThrow();
    expect(() => fibonacci(null)).toThrow();
  });
});
