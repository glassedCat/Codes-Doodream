
let x;
function variables()
{
    let x;
    let y;
    this.x=10; // field variable
    x=15; // local variable
    y=20; // local variable 
    z=30; // implicit field variable
    if(y===20)
    {
        let b=40;
        b++;
        document.write("if 블록 내 블록변수(let) b = " + b + "<br>");
    }
    document.write("함수 variables() 내 지역변수(let) y = " + y + "<br>");
}
document.write("전역변수(this.x) x = "+x+"<br>");
document.write("암묵적 전역변수 z = "+z);
variable();
