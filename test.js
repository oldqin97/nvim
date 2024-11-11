/**
 * test.js
 *
 * @param {string} q - string
 * @param {string} w - string
 * @param {string} e - string
 * @returns {string} string
 */
function test(q, w, e) {
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

let q = false;
// v3.0.0
// true
// ||

test(1, 2, 3);
test();
line
