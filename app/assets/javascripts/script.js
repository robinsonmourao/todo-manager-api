addEventListener("click", (event) => {});

onclick = (event) => {
        var noticeDiv = document.getElementById("notice");
        var divNoticeParent = document.querySelector(".div-notice");

        if (noticeDiv == null){
            divNoticeParent.style.display = "none";
            console.log("noticediv com valor");
        }
        else{
            divNoticeParent.style.display = "none";
            console.log("noticediv null"+noticeDiv);
        }
   
};