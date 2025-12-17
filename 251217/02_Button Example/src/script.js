

function calc()
{
    const num1=parseInt(document.getElementById("price").value);
    const num2=parseInt(document.getElementById("units").value);
    const sum=num1*num2;
    
    const message=`Sum result of (${num1}+${num2}) is ${sum}$.`; // 반드시 백틱(`)으로 감싸야한다.
    alert("Calculation has been finished!\n"+message);

    const resultLog=document.getElementById("result");
    resultLog.textContent=message; // textContent는 내부의 내용을 읽거나 설정할 때 사용한다.
    
    console.log("Calculation has been completed. Result: " + sum +"$");
}