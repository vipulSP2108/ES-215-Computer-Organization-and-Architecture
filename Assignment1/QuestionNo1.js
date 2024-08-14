// Que: Implement a program(s) to list the first 50 fibonacci numbers preferably in C/C++ in the following manner:
const length = 50

function measureTime(fn, ...args) {
    const start = performance.now();
    const result = fn(...args);
    const end = performance.now();
    return { result, time: end - start };
}

// a. Using recursion
function fibo_recursion(count) {
    function fibo_main(length) {
        if (length <= 1) return length;
        return fibo_main(length - 1) + fibo_main(length - 2);
    }
    let fiboNumbers = [];
    for (let i = 0; i < count; i++) {
        fiboNumbers.push(fibo_main(i));
    }
    return fiboNumbers;
}
const { time: timeRecursion } = measureTime(fibo_recursion, length);
console.log('fibo_recursion time:', timeRecursion)
// console.log('fibo_recursion:', fibo_recursion(length))

// b. Using loop
function fibo_loop(length) {
    if (length <= 0) return [];
    if (length === 1) return [0];
    if (length === 2) return [0, 1];
    
    let fiboNumbers = [0, 1];
    var second_priv = 0;
    var priv = 1;
    for (var i = 2; i < length; i++) {
        const temp = priv
        priv = priv + second_priv
        second_priv = temp
        fiboNumbers.push(priv)
    }
    return fiboNumbers
}
const { time: timeLoop } = measureTime(fibo_loop, length);
console.log('fibo_loop time: ',timeLoop)
// console.log('fibo_loop: ',fibo_loop(length))

// c. Using recursion and memoization
const memo = {};
function fibo_recursionMemoization(count) {
    function fibo_main(length) {
        if (length <= 1) return length;
        if(memo[length]) return memo[length];
        memo[length] = fibo_main(length - 1) + fibo_main(length - 2);
        return memo[length];
    }
    let fiboNumbers = [];
    for (let i = 0; i < count; i++) {
        fiboNumbers.push(fibo_main(i));
    }
    return fiboNumbers;
}
const { time: timeRecursionMemoization } = measureTime(fibo_recursionMemoization, length);
console.log('fibo_recursionMemoization time: ',timeRecursionMemoization)
// console.log('fibo_recursionMemoization:', fibo_recursionMemoization(length))

// d. Using loop and memoization 
function fibo_loopMemoization(length) {
    if (length <= 0) return [];
    if (length === 1) return [0];
    if (length === 2) return [0, 1];
    
    let fiboNumbers = [0, 1];
    for (var i = 2; i < length; i++) {
        const nextFib = fiboNumbers[i - 1] + fiboNumbers[i - 2];
        fiboNumbers.push(nextFib);
    }
    return fiboNumbers
}
const { time: timeLoopMemoization } = measureTime(fibo_loopMemoization, length);
console.log('fibo_loopMemoization time: ',timeLoopMemoization)
// console.log('fibo_loopMemoization: ',fibo_loopMemoization(length))

// changes
function cSpeedup(baselineTime, newTime) {
    return baselineTime / newTime;
}

console.log('relative to fibo_recursion:')
console.log('Speedup of fibo_loop is', cSpeedup(timeRecursion, timeLoop));
console.log('Speedup of fibo_recursionMemoization is:',calculateSpeedup(timeRecursion, timeRecursionMemoization));
console.log('Speedup of fibo_loopMemoization is', calculateSpeedup(timeRecursion, timeLoopMemoization));