
function toUC()
{
    let t=document.getElementById('en');
    t.value=t.value.toUpperCase();
}
function mouseIn(param)
{
    param.style.border="2px solid lightblue";
}
function mouseOut(param)
{
    param.style.border="";
}
function mouseDn(param)
{

    param.style.color="#ffffff";
    param.style.backgroundColor="#fcc162";
    param.style.fontWeight="bold";
    param.style.border="none";

}
function mouseUp(param)
{
    
    param.style.color="";
    param.style.backgroundColor="";
    param.style.fontWeight="";
    param.style.border="";
}
