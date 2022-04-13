const price=document.getElementById("price");
const tax=document.getElementById("tax");
const downPayment=document.getElementById("down-payment");
let leasing=0;
price.addEventListener('click',(e)=>{
    leasing+=e.target.value;
})
tax.addEventListener('change',(e)=>{
    leasing+=e.target.value;
})
downPayment.addEventListener('change',(e)=>{
    leasing+=e.target.value;
})

document.getElementById("leasing").innerHTML=leasing;