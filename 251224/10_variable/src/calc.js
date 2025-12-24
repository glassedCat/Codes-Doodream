
let x;
function calc()
{
    let y;
    x=10;
    y=15;
    z=30; /* 암묵적 전역 변수; 전체 프로그램 어디서든 접근 가능한 변수. */
    if(y===15)
    {
        let b=40;
        for(var i=0; i<5;i++)
            b+=1;  
        document.write("if 블록 내 블록변수 b= "+b+"<br>");
    }
    document.write("함수 calc() 내 지역변수 y = "+y+"<br>");

}
calc();
document.write("전역변수 x = "+x+"<br>");
document.write("전역변수 z = "+z);