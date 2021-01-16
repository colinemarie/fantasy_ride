const initBoostrapModal = () => {
  $(document).ready(function() {
    $('#new_reservation').on('submit', function(e){
        $('#logIn').modal('show');
        e.preventDefault();
    });
  });
}

export {initBoostrapModal}
