

function printTime()
{
    var tnow = document.getElementById('time');
    var timeNow = new Date();
    tnow.textContent = timeNow;
}
printTime();