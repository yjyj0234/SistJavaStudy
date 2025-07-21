var numbers=[1,3,5,2,36];

var proc=numbers.map(function(num){
    return num*num;
})
console.log(proc);

var colors=['red','darkred','green','darkgreen','coral'];

colors.map((color,index)=>{
    console.log(color,index);
})