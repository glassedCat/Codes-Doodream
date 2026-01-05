
// 변수: let/var/const(변하지 않는 요소)
// button 구현에선 const를 주로 사용함 


function bToggle()
{
   /* getElementById를 썼을땐 반드시 html에서 리스트 종류를 id로 해야되고, class로 했을 경우 getElementByClassName을 사용해야 한다.*/
  const b=document.getElementById("hList");
  b.classList.toggle("hidden"); /* classList는 getElementBy 로 불러온 아이디나 클래스 내부에 있는 엘레먼트를 불러와서 사용할 수 있게한다. */
}