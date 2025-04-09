window.onload=function(){
    let mycar=document.querySelectorAll(".mycar");  //배열타입

    //0번타입의 이벤트
    //마우스 올리면 마이카 1번사진으로 변경하고 벗어나면 다시 원래대로
    let photo="";
    mycar[0].onmouseover=function(){
        // var안붙이면 전역변수
        photo=this.getAttribute("src");
        this.setAttribute("src","../mycar/mycar1.png")
    }
    mycar[0].onmouseout=function(){
        this.setAttribute("src",photo);
    }

    // 1번이벤트
    //마우스 올리면 보더속성 알아서 설정 벗어나면 다시 설정 없애기 10px inset pink
    //속성없애는건 none
    mycar[1].onmouseover=function(){
        mycar[1].style.borderStyle="inset";
        mycar[1].style.borderWidth="10px";
        mycar[1].style.borderColor="pink";
        //or mycar[1].style.border="10px inset pink";

    }
    mycar[1].onmouseout=function(){
        this.style.border="none";
    }
    mycar[2].onmouseover=function(){
        this.setAttribute("class","mycar happy");
    }
    mycar[2].onmouseout=function(){
        this.setAttribute("class","mycar");
    }
}