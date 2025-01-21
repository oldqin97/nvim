/**
 * test.js
 *
 * @param {string} q - string
 * @param {string} w - string
 * @param {string} e - string
 * @returns {string} string
 */
function theTest(q, w, e) {
  console.log(q, w, e);
  return q + w + e;
}

const p = Promise.resolve(1);

p.then(res => {
  console.log(res);
});

const arr = [(1, 2, 3)].map(value => {
  console.log(value);
  return console.log(value);
});

const qwe = test => {
  return test;
};

qwe(() => {
  console.log(139);
});
let q = true;
// v2.0.5
// false
// &&

// HACK:
// TODO:
// NOTE:
// TEST:
// FIX:
// PERF:
// TODO:
// WARN:
