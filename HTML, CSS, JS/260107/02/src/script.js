

/* 
setTimeout(() => 
    {
        alert("3초 후 실행")
    },3000);

setInterval(() =>
    {
        console.log("1초마다 실행");
    }, 1000)
*/

function changeColor(c)
{
    document.getElementById('target').style.backgroundColor=c;
}