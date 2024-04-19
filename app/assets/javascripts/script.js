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
  const editFormContainer = document.querySelector('.container-edit-user-screen');

  const closeAccountLink = document.querySelector('.close-account-link-autohide');
  const accountOverviewBottom = document.querySelector('.account-overview-bottom');

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

// document.addEventListener('DOMContentLoaded', () => {
//   var timeout;
//   var sessionExpiresAt;
//   function fetchar(){
//     return fetch('/session_timeout')
//       .then(response => response.json())
//       .then(data => {
//         timeout = data.session_timeout; // Obter o valor da constante do objeto JSON
//         sessionExpiresAt = new Date(timeout); // Obtenha o tempo de expiração da sessão do Rails
//         console.log(sessionExpiresAt.toString());
//       })
//       .catch(error => {
//         console.error('Erro ao obter o valor da constante:', error);
//       }
//     );
//   }
//   fetchar();
//   const timerElement = document.getElementById('sessionTimer');

//   function updateTimer() {
//     const now = new Date();
//     const timeRemaining = sessionExpiresAt - now;

//     console.log("expira em"+ sessionExpiresAt);
//     console.log("agora"+ now);

//     if (timeRemaining <= 0) {

//       timerElement.textContent = 'Sessão expirada!';
//       clearInterval(intervalId); // Encerra a atualização do cronômetro quando a sessão expirar
//     } else {
//       const minutes = Math.floor((timeRemaining / (1000 * 60)) % 60);
//       const seconds = Math.floor((timeRemaining / 1000) % 60);

//       timerElement.textContent = `Tempo de sessão restante: ${minutes}m ${seconds}s`;
//     }
//   }

//   // Atualize o cronômetro a cada segundo
//   const intervalId = setInterval(updateTimer, 1000);
//   updateTimer(); // Atualiza o cronômetro imediatamente ao carregar a página
// });
