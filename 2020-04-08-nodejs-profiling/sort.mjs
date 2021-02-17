const randomArray = (length) => Array.from(
  { length },
  () => Math.floor(Math.random() * 2 ** 12),
);

const reduceSort = (acc, curr) => [
  ...acc.filter((n) => n < curr),
  curr,
  ...acc.filter((n) => n >= curr),
];

const bubble = (arr) => {
  let swapped = false;
  do {
    swapped = false;
    for (let i = 0; i < arr.length - 1; ++i) {
      if (arr[i] > arr[i+1]) {
        [arr[i], arr[i+1]] = [arr[i+1], arr[i]];
        swapped = true;
      }
    }
  } while(swapped)
  return arr;
}

const quick = (arr) => {
  if (!arr.length) return arr;
  const [pivot, ...tail] = arr;
  const left = tail.filter((n) => pivot >= n);
  const right = tail.filter((n) => pivot < n);
  return quick(left).concat(pivot, quick(right));
}

const baseArray = randomArray(20_000);

export const slowSort = () => baseArray.reduce(reduceSort, []);
export const bubbleSort = () => bubble([...baseArray]);
export const quickSort = () => quick([...baseArray]);
export const defaultSort = () => [...baseArray].sort();

(function main() {
  slowSort();
  bubbleSort();
  quickSort();
  defaultSort();
})();