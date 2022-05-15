








function confirmDelete(codigo) {

}

function eliminar(codigo) {
    Swal.fire({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, delete it!'
    }).then((result) => {
        if (result.isConfirmed) {
          Swal.fire(
            'Deleted!',
            'Your file has been deleted.',
            'success'
          ).then(function() {
              window.location.href = "/eliminarProducto/" + codigo + "/";
          }).then(function() {
            window.location.href="/index";
          })
        
        } 
    })
}

function cerrarSesion() {
  Swal.fire({
      title: 'Estas seguro de salir?',
      text: "Puedes volver cuando quieras!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Si, salir!'
  }).then((result) => {
      if (result.isConfirmed) {
        Swal.fire(
          'Eliminado!',
          'Tu producto se a eliminado.',
          'success'
        ).then(function() {
            window.location.href = "/";
        })
      
      } 
  })
}
