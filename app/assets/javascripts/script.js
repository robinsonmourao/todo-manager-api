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

document.addEventListener('DOMContentLoaded', function() {
  const closeAccountLink = document.querySelector('.close-account-link-autohide');
  const accountOverviewBottom = document.querySelector('.account-overview-bottom');

  if (closeAccountLink && accountOverviewBottom) {
    closeAccountLink.addEventListener('click', function(event) {
      event.preventDefault();

      accountOverviewBottom.style.display = 'block';
    });
  }
});