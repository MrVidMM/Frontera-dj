








function confirmDelete(codigo) {

}

function eliminar(codigo) {
    Swal.fire({
        title: '¿Estas Seguro?',
        text: "¡Este cambio no se puede revertir!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '¡Si, eliminar!',
        cancelButtonText: 'Cancelar'
    }).then((result) => {
        if (result.isConfirmed) {
          Swal.fire(
            '¡Eliminado!',
            'El producto se ha eliminado.',
            'success'
          ).then(function() {
              window.location.href = "/eliminarProducto/" + codigo + "/";
          }).then(function() {
            window.location.href="/listarProductos";
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
