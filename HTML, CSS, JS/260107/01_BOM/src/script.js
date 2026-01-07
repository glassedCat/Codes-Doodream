let id;

function changeColor()
{
    id=setInterval("flashText()", 500);
}
function flashText()
{
    let e=document.getElementById('target');
    e.style.color=(e.style.color=="pink") ? "blue":"pink";
    e.style.backgroundColor=(e.style.backgroundColor=
        (e.style.backgorundColor=="purple") ? "black":"yellow");
}
function stopColor()
{
    clearInterval(id);
}