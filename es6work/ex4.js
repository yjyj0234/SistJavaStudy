let a=6;
let b="6";

console.log(a==b); //true..값으로만 비교

console.log(a===b);  // === : 타입까지도 비교: false
console.log(Object.is(a,b));  // === 쓰는 것과 동일

console.log(`a의 타입은 ${typeof(a)}입니다` );
console.log(`b의 타입은 ${typeof(b)}입니다` );
