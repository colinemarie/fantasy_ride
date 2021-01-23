const initBoostrapModal = () => {
  $(document).ready(function() {
    $('#new_reservation').on('submit', function(e){
      if ($('#submit_reservation').data('user') === false) {
        $('#logIn').modal('show');
        e.preventDefault();
      }
    });
  });

}

const initBoostrapModalNavbar = () => {
  $(document).ready(function() {
    $('#garage-button').on('click', function(e){
      if ($('#garage-button').data('user') === false) {
        $('#logIn').modal('show');
        e.preventDefault();
      }
    });
  });
}

export {initBoostrapModal, initBoostrapModalNavbar}
