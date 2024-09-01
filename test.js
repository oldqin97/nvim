/**
 * test
 *
 * @param {string} q - string
 * @param {string} w - string
 * @param {number} e - number
 */
function test(q, w, e) {
  console.log(q, w, e);
  return 123;
}

test("hello", "world", 123);

const p = Promise.resolve(1);

p.then(res => {
  console.log(res);
});

const arr = [(1, 2, 3)].map(value => {
  return console.log(value);
});

const test = test => {
  return test;
};

let q = false;
// v5.3.0

test(1, 2, 3);
test();
