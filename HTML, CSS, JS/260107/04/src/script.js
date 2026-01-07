

let input="";

function add(char)
{
    // 입력값+입력값 >> 입력값입력값 (숫자를 연속으로 누르면 1+2 가 12가 되게끔)
    // 자바스크립트에선 문자열과 문자열을 더하면(+) 같이 붙어버린다.
    input=input+char;
    document.getElementById('display').value=input;
}

function calculate()
{
    // eval() 은 문자열로 된 코드를 실제 자바스크립트로 실행해주는 함수이다.
    document.getElementById('display').value=eval(input);
}
function _clear()
{
    input="";
    document.getElementById('display').value="0";    
}
function erase()
{
    // index 0에서 시작해서, input의 입력값의 전체 길이에서 1을 뺀 곳까지 남겨라
    input=input.substring(0, input.length-1);
    document.getElementById('display').value=input;
}


