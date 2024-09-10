/**
 * test
 *
 * @param {string} q - string
 * @param {string} w - string
 * @param {number} e - number
 */
function test(q, w, e) {
  console.log(q, w, e);
  return q + w + e;
}

const p = Promise.resolve(1);

const arr = [(1, 2, 3)].map(value => {
  return console.log(value);
});

const qwe = test => {
  return test;
};

let q = false;
// v3.3.0

test(1, 2, 3);
test();
