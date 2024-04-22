addEventListener("click", (event) => {});

onclick = (event) => {
        var noticeDiv = document.getElementById("notice");
        var divNoticeParent = document.querySelector(".div-notice");

        if (noticeDiv == null){
            divNoticeParent.style.display = "none";
        }
        else{
            divNoticeParent.style.display = "none";
        }
};

document.addEventListener('DOMContentLoaded', function() {
  const editButton = document.querySelector('.user-edit-button');
  const editFormContainer = document.querySelector('.container-edit-account-option');

  const closeAccountLink = document.querySelector('.close-account-link-autohide');
  const accountOverviewBottom = document.querySelector('.container-close-account-option');

  function collapseAll(){
    editFormContainer.style.display = 'none';
    accountOverviewBottom.style.display = 'none';
  }
  
  if (editButton && editFormContainer) {
    editButton.addEventListener('click', function(event) {

      event.preventDefault();
      collapseAll();
      editFormContainer.style.display = 'block';
    });
  }
  if (closeAccountLink && accountOverviewBottom) {
    closeAccountLink.addEventListener('click', function(event) {

      event.preventDefault();
      collapseAll();
      accountOverviewBottom.style.display = 'block';
    });
  }
});
