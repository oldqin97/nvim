/**
 * test1
 *
 * @param {string} q - string
 * @param {string} w - string
 * @param {number} e - number
 */
function test1(q, w, e) {
  console.log(q, w, e);
  return q + w + e;
}

const p = Promise.resolve(1);

const arr = [(1, 2, 3)].map(value => {
  return console.log(value);
});

const test1 = test1 => {
  return test1;
};

let q = false;
// v6.3.0

test1(1, 2, 3);
test1();
