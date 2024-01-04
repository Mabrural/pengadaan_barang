<?php 

// Check if the form is submitted

    // Check if "inv_id" is set before using it
    $inv_id = isset($_POST["inv_id"]) ? $_POST["inv_id'"] : null;

    if ($inv_id !== null && hapusPengajuan($inv_id) > 0 ){
        echo '<link rel="stylesheet" href="./sweetalert2.min.css"></script>';
		echo '<script src="./sweetalert2.min.js"></script>';
		echo "<script>
		setTimeout(function () { 
			swal.fire({
				
				title               : 'Berhasil',
				text                :  'Data berhasil dihapus',
				//footer              :  '',
				icon                : 'success',
				timer               : 2000,
				showConfirmButton   : true
			});  
		},10);   setTimeout(function () {
			window.location.href = '?page=pengajuan'; //will redirect to your blog page (an ex: blog.html)
		}, 2000); //will call the function after 2 secs
		</script>";
        // echo "
        //     <script>
        //         alert('Data berhasil dihapus!');
        //         document.location.href = '?page=catatan';
        //     </script>
        // ";
    } else {
        echo '<link rel="stylesheet" href="./sweetalert2.min.css"></script>';
		echo '<script src="./sweetalert2.min.js"></script>';
		echo "<script>
		setTimeout(function () { 
			swal.fire({
				
				title               : 'Gagal',
				text                :  'Data gagal dihapus',
				//footer              :  '',
				icon                : 'error',
				timer               : 2000,
				showConfirmButton   : true
			});  
		},10);   setTimeout(function () {
			window.location.href = '?page=pengajuan'; //will redirect to your blog page (an ex: blog.html)
		}, 2000); //will call the function after 2 secs
		</script>";
        // echo "
        //     <script>
        //         alert('Data gagal dihapus!');
        //         document.location.href = '?page=catatan';
        //     </script>
        // ";
    }


 ?>