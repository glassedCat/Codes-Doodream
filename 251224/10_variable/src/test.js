
/* 필드가 여러개가 아닌상황에선 스크립트 필드에 코드를 적어도 된다. */

function print()
{
var content=100;
document.write(content+"<br>");
content="홍길동";
document.write(content+"<br>");
var x; var y;

x=(20>10); // true
document.write(x+"<br>");
y=(20<10); // false
document.write(y+"<br>");

var person;
document.write(person+"<br>");

var t=null;
document.write(t);
}
print();
