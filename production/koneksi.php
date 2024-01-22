<?php 

$host = "localhost";
$user = "root";
$pass = "78789898";
$db = "sistem"; //nama database
//melakukan koneksi ke database
$koneksi = mysqli_connect($host, $user, $pass, $db);
if (!$koneksi) {
	echo "Gagal konek: " . die(mysqli_error($koneksi));
}



function query($query){
	global $koneksi;
	$result = mysqli_query($koneksi, $query);
	$rows = [];
	while ($row = mysqli_fetch_assoc($result) ) {
		$rows[] = $row;
	}

	return $rows;
}

// function tambahPengajuan($data) {
// 	global $koneksi;
// 	// $kode_pengajuan = htmlspecialchars($data["kode_pengajuan"]);
// 	$kode_pengajuan = 1;
// 	$nama_barang = htmlspecialchars($data["nama_barang"]);
// 	$spek = htmlspecialchars($data["spek"]);
// 	$deskripsi = htmlspecialchars($data["deskripsi"]);
// 	$qty = htmlspecialchars($data["qty"]);
// 	$tgl_pengajuan = htmlspecialchars($data["tgl_pengajuan"]);
// 	$status = htmlspecialchars($data["status"]);
// 	$id_user = mysqli_real_escape_string($koneksi, $_SESSION["id_user"]);
// 	$new_kode_pengajuan = $kode_pengajuan+1;

// 	$query = "INSERT INTO barang VALUES
// 			('', '$new_kode_pengajuan', '$nama_barang', '$spek', '$deskripsi', '$qty', '$tgl_pengajuan', '$status','$id_user')";
// 	mysqli_query($koneksi, $query);

// 	return mysqli_affected_rows($koneksi);
// }

function tambahPengajuan($data) {

	global $koneksi;
	// $kode_pengajuan = htmlspecialchars($data["kode_pengajuan"]);
	$nama_barang = htmlspecialchars($data["nama_barang"]);
	$spek = htmlspecialchars($data["spek"]);
	$deskripsi = htmlspecialchars($data["deskripsi"]);
	$qty = htmlspecialchars($data["qty"]);
	$tgl_pengajuan = htmlspecialchars($data["tgl_pengajuan"]);
	$status = htmlspecialchars($data["status"]);
	// $acc1 = htmlspecialchars($data["acc1"]);
	// $acc2 = htmlspecialchars($data["acc2"]);
	$id_user = mysqli_real_escape_string($koneksi, $_SESSION["id_user"]);

	$query = "SELECT MAX(kode_pengajuan) AS kode_pengajuan FROM barang";
	$result = mysqli_query($koneksi, $query);
	$row = mysqli_fetch_assoc($result);
	$new_kode_pengajuan = $row["kode_pengajuan"] + 1;

	$query = "INSERT INTO barang VALUES
			('', '$new_kode_pengajuan', '$nama_barang', '$spek', '$deskripsi', '$qty', '$tgl_pengajuan', '$status', '', '', '$id_user')";
	mysqli_query($koneksi, $query);

	return mysqli_affected_rows($koneksi);


}


function ubahPengajuan($data) {
	global $koneksi;
	$id_barang = $data["id_barang"];
	// $kode_pengajuan = htmlspecialchars($data["kode_pengajuan"]);
	$nama_barang = htmlspecialchars($data["nama_barang"]);
	$spek = htmlspecialchars($data["spek"]);
	$deskripsi = htmlspecialchars($data["deskripsi"]);
	$qty = htmlspecialchars($data["qty"]);
	$tgl_pengajuan = htmlspecialchars($data["tgl_pengajuan"]);
	$status = htmlspecialchars($data["status"]);


	$query = "UPDATE barang SET
				nama_barang = '$nama_barang',
				spek = '$spek',
				deskripsi = '$deskripsi',
				qty = '$qty',
				tgl_pengajuan = '$tgl_pengajuan',
				status = '$status'
			  WHERE id_barang = $id_barang
			";
	mysqli_query($koneksi, $query);

	return mysqli_affected_rows($koneksi);
}

function ubahApprove($data) {
	global $koneksi;
	$id_barang = $data["id_barang"];
	$kode_pengajuan = htmlspecialchars($data["kode_pengajuan"]);
	$nama_barang = htmlspecialchars($data["nama_barang"]);
	$spek = htmlspecialchars($data["spek"]);
	$deskripsi = htmlspecialchars($data["deskripsi"]);
	$qty = htmlspecialchars($data["qty"]);
	$tgl_pengajuan = htmlspecialchars($data["tgl_pengajuan"]);
	$status = htmlspecialchars($data["status"]);
	$acc1 = htmlspecialchars($data["acc1"]);


	$query = "UPDATE barang SET
				kode_pengajuan = '$kode_pengajuan',
				nama_barang = '$nama_barang',
				spek = '$spek',
				deskripsi = '$deskripsi',
				qty = '$qty',
				tgl_pengajuan = '$tgl_pengajuan',
				status = '$status',
				acc1 = '$acc1'
			  WHERE id_barang = $id_barang
			";
	mysqli_query($koneksi, $query);

	return mysqli_affected_rows($koneksi);
}

function ubahApprove2($data) {
	global $koneksi;
	$id_barang = $data["id_barang"];
	$kode_pengajuan = htmlspecialchars($data["kode_pengajuan"]);
	$nama_barang = htmlspecialchars($data["nama_barang"]);
	$spek = htmlspecialchars($data["spek"]);
	$deskripsi = htmlspecialchars($data["deskripsi"]);
	$qty = htmlspecialchars($data["qty"]);
	$tgl_pengajuan = htmlspecialchars($data["tgl_pengajuan"]);
	$status = htmlspecialchars($data["status"]);
	$acc2 = htmlspecialchars($data["acc2"]);


	$query = "UPDATE barang SET
				kode_pengajuan = '$kode_pengajuan',
				nama_barang = '$nama_barang',
				spek = '$spek',
				deskripsi = '$deskripsi',
				qty = '$qty',
				tgl_pengajuan = '$tgl_pengajuan',
				status = '$status',
				acc2 = '$acc2'
			  WHERE id_barang = $id_barang
			";
	mysqli_query($koneksi, $query);

	return mysqli_affected_rows($koneksi);
}

function hapusPengajuan($id_barang) {
	global $koneksi;
	mysqli_query($koneksi, "DELETE FROM barang WHERE id_barang=$id_barang");

	return mysqli_affected_rows($koneksi);

}

function tambahKaryawan($data) {
	global $koneksi;
	$nama_emp = htmlspecialchars($data["nama_emp"]);
	$jabatan = htmlspecialchars($data["jabatan"]);
	$divisi = htmlspecialchars($data["divisi"]);
	$status = htmlspecialchars($data["status"]);
	$tgl_lahir = htmlspecialchars($data["tgl_lahir"]);
	$jenis_kelamin = htmlspecialchars($data["jenis_kelamin"]);
	$alamat = htmlspecialchars($data["alamat"]);
	$no_hp = htmlspecialchars($data["no_hp"]);
	$email = htmlspecialchars($data["email"]);
	$status_p = htmlspecialchars($data["status_pernikahan"]);
	$nik = htmlspecialchars($data["nik"]);
	$npwp = htmlspecialchars($data["npwp"]);

	// upload gambar
	$gambar =  upload();
	if (!$gambar) {
		return false;
	}

	$query = "INSERT INTO karyawan VALUES
			('', '$nama_emp', '$jabatan', '$divisi', '$status', '$gambar', '$tgl_lahir', '$jenis_kelamin', '$alamat', '$no_hp', '$email', '$status_p', '$nik', '$npwp')";
	mysqli_query($koneksi, $query);

	return mysqli_affected_rows($koneksi);
}

function upload(){

	$namaFile = $_FILES['gambar']['name'];
	$ukuranFile = $_FILES['gambar']['size'];
	$error = $_FILES['gambar']['error'];
	$tmpName = $_FILES['gambar']['tmp_name'];

	// cek apakah tidak ada gambar yang diupload
	if ($error === 4) {
		echo "
			<script>
				alert('pilih gambar terlebih dahulu!');
			</script>
		";
		return false;
	}

	// cek apakah yang diupload adalah gambar
	$ekstensiGambarValid = ['jpg', 'jpeg', 'png'];
	$ekstensiGambar = explode('.', $namaFile);
	$ekstensiGambar = strtolower(end($ekstensiGambar));
	if (!in_array($ekstensiGambar, $ekstensiGambarValid) ){
		echo "
			<script>
				alert('yang anda upload bukan gambar!');
			</script>
		";
		return false;
	}

	// cek jika ukurannya terlalu besar
	if ($ukuranFile > 1000000){
		echo "
			<script>
				alert('ukuran gambar terlalu besar!');
			</script>
		";
		return false;
	}

	// lolos pengecekan, gambar siap diupload
	// generate nama gambar baru
	$namaFileBaru = uniqid();
	$namaFileBaru .= '.';
	$namaFileBaru .= $ekstensiGambar;

	move_uploaded_file($tmpName, 'img/'. $namaFileBaru);
	return $namaFileBaru;
 }

function ubahKaryawan($data) {
	global $koneksi;
	$id_emp = $data["id_emp"];
	$nama_emp = htmlspecialchars($data["nama_emp"]);
	$jabatan = htmlspecialchars($data["jabatan"]);
	$divisi = htmlspecialchars($data["divisi"]);
	$status = htmlspecialchars($data["status"]);
	$gambarLama = htmlspecialchars($data["gambarLama"]);
	$tgl_lahir = htmlspecialchars($data["tgl_lahir"]);
	$jenis_kelamin = htmlspecialchars($data["jenis_kelamin"]);
	$alamat = htmlspecialchars($data["alamat"]);
	$no_hp = htmlspecialchars($data["no_hp"]);
	$email = htmlspecialchars($data["email"]);
	$status_p = htmlspecialchars($data["status_pernikahan"]);
	$nik = htmlspecialchars($data["nik"]);
	$npwp = htmlspecialchars($data["npwp"]);

	// cek apakah user pilih gambar baru atau tidak
	if ($_FILES['gambar']['error'] === 4 ) {
		$gambar = $gambarLama;
	} else {

		$gambar = upload();
	}


	$query = "UPDATE karyawan SET
				nama_emp = '$nama_emp',
				jabatan = '$jabatan',
				divisi = '$divisi',
				status = '$status',
				gambar = '$gambar',
				tgl_lahir = '$tgl_lahir',
				jenis_kelamin = '$jenis_kelamin',
				alamat = '$alamat',
				no_hp = '$no_hp',
				email = '$email',
				status_pernikahan = '$status_p',
				nik = '$nik',
				npwp = '$npwp'
			  WHERE id_emp = $id_emp
			";
	mysqli_query($koneksi, $query);

	return mysqli_affected_rows($koneksi);
}

function hapusKaryawan($id_emp) {
	global $koneksi;
	mysqli_query($koneksi, "DELETE FROM karyawan WHERE id_emp=$id_emp");

	return mysqli_affected_rows($koneksi);

}

function tambahAbsen($data) {
	global $koneksi;
	$no_absen = htmlspecialchars($data["no_absen"]);
	$id_emp = htmlspecialchars($data["id_emp"]);
	$id_lantai = htmlspecialchars($data["id_lantai"]);


	$query = "INSERT INTO absen VALUES
			('', '$no_absen', '$id_emp', '$id_lantai')";
	mysqli_query($koneksi, $query);

	return mysqli_affected_rows($koneksi);
}

function ubahAbsen($data) {
	global $koneksi;
	$id_absen = $data["id_absen"];
	$no_absen = htmlspecialchars($data["no_absen"]);
	$id_emp = htmlspecialchars($data["id_emp"]);
	$id_lantai = htmlspecialchars($data["id_lantai"]);


	$query = "UPDATE absen SET
				no_absen = '$no_absen',
				id_emp = '$id_emp',
				id_lantai = '$id_lantai'
			  WHERE id_absen = $id_absen
			";
	mysqli_query($koneksi, $query);

	return mysqli_affected_rows($koneksi);
}

function hapusAbsen($id_absen) {
	global $koneksi;
	mysqli_query($koneksi, "DELETE FROM absen WHERE id_absen=$id_absen");

	return mysqli_affected_rows($koneksi);

}

function tambahAkses($data) {
	global $koneksi;
	$no_akses = htmlspecialchars($data["no_akses"]);
	$id_emp = htmlspecialchars($data["id_emp"]);
	$id_lantai = htmlspecialchars($data["id_lantai"]);


	$query = "INSERT INTO akses_pintu VALUES
			('', '$no_akses', '$id_emp', '$id_lantai')";
	mysqli_query($koneksi, $query);

	return mysqli_affected_rows($koneksi);
}

function ubahAkses($data) {
	global $koneksi;
	$id_akses = $data["id_akses"];
	$no_akses = htmlspecialchars($data["no_akses"]);
	$id_emp = htmlspecialchars($data["id_emp"]);
	$id_lantai = htmlspecialchars($data["id_lantai"]);


	$query = "UPDATE akses_pintu SET
				no_akses = '$no_akses',
				id_emp = '$id_emp',
				id_lantai = '$id_lantai'
			  WHERE id_akses = $id_akses
			";
	mysqli_query($koneksi, $query);

	return mysqli_affected_rows($koneksi);
}

function hapusAkses($id_akses) {
	global $koneksi;
	mysqli_query($koneksi, "DELETE FROM akses_pintu WHERE id_akses=$id_akses");

	return mysqli_affected_rows($koneksi);

}

function tambahLogin($data){
	global $koneksi;

	$username = strtolower(stripcslashes($data["username"]));
	$password = mysqli_real_escape_string($koneksi, $data["password"]);
    $password2 = mysqli_real_escape_string($koneksi, $data["password2"]);
	$id_emp	= mysqli_real_escape_string($koneksi, $data["id_emp"]);	
	$level	= mysqli_real_escape_string($koneksi, $data["level"]);	

	// cek username sudah ada atau belum
	$result = mysqli_query($koneksi, "SELECT username FROM user WHERE username= '$username'");
	if (mysqli_fetch_assoc($result)) {
		echo '<link rel="stylesheet" href="./sweetalert2.min.css"></script>';
		echo '<script src="./sweetalert2.min.js"></script>';
		echo "<script>
		setTimeout(function () { 
			swal.fire({
				
				title               : 'Daftar Akun Gagal',
				text                :  'Username yang dipilih sudah terdaftar',
				//footer              :  '',
				icon                : 'error',
				timer               : 2000,
				showConfirmButton   : true
			});  
		},10);   setTimeout(function () {
			window.location.href = '?page=userLogin'; //will redirect to your blog page (an ex: blog.html)
		}, 2000); //will call the function after 2 secs
		</script>";
		// echo "
		// 	<script>
		// 		alert('Username yang dipilih sudah terdaftar!');
		// 	</script>
		// ";
		return false;
	}

	// cek konfirmasi password
	if ($password !== $password2) {
		echo '<link rel="stylesheet" href="./sweetalert2.min.css"></script>';
		echo '<script src="./sweetalert2.min.js"></script>';
		echo "<script>
		setTimeout(function () { 
			swal.fire({
				
				title               : 'Daftar Akun Gagal',
				text                :  'Konfirmasi Password Tidak Sesuai!',
				//footer              :  '',
				icon                : 'error',
				timer               : 2000,
				showConfirmButton   : true
			});  
		},10);   setTimeout(function () {
			window.location.href = '?page=userLogin'; //will redirect to your blog page (an ex: blog.html)
		}, 2000); //will call the function after 2 secs
		</script>";
		// echo "
		// 	<script>
		// 		alert('konfirmasi password tidak sesuai!');
		// 	</script>
		// ";
		return false;
	}

	// enkripsi password
	$password = password_hash($password, PASSWORD_DEFAULT);


	// tambahkan user baru ke database
	mysqli_query($koneksi, "INSERT INTO user VALUES('', '$username', '$password', '$level', '$id_emp')");

	return mysqli_affected_rows($koneksi);
}

function ubahLogin($data) {
	global $koneksi;
	$id_user = $data["id_user"];
	$username = htmlspecialchars($data["username"]);
	$password = mysqli_real_escape_string($koneksi, $data["password"]);
	$level = htmlspecialchars($data['level']);
	$id_emp = htmlspecialchars($data["id_emp"]);

	$password2 = password_hash($password, PASSWORD_DEFAULT);

	$query = "UPDATE user SET
				username = '$username',
				password = '$password2',
				level = '$level',
				id_emp = '$id_emp'
			  WHERE id_user = $id_user
			";
	mysqli_query($koneksi, $query);

	return mysqli_affected_rows($koneksi);
}


function hapusLogin($id_user) {
	global $koneksi;
	mysqli_query($koneksi, "DELETE FROM user WHERE id_user=$id_user");

	return mysqli_affected_rows($koneksi);

}

function changePassword($data) {
	global $koneksi;
	$id_user = $data["id_user"];
	$username = htmlspecialchars($data["username"]);
	$password = mysqli_real_escape_string($koneksi, $data["password"]);
	$level = htmlspecialchars($data['level']);
	$id_emp = htmlspecialchars($data["id_emp"]);

	$password2 = password_hash($password, PASSWORD_DEFAULT);

	$query = "UPDATE user SET
				username = '$username',
				password = '$password2',
				level = '$level',
				id_emp = '$id_emp'
			  WHERE id_user = $id_user
			";
	mysqli_query($koneksi, $query);

	return mysqli_affected_rows($koneksi);
}

function tambahIjazah($data) {
	global $koneksi;
	$no_ijazah = htmlspecialchars($data["no_ijazah"]);
	$tgl_penitipan = htmlspecialchars($data["tgl_penitipan"]);
	$tgl_kembali = htmlspecialchars($data["tgl_kembali"]);
	$status_ijazah = htmlspecialchars($data["status_ijazah"]);
	$id_emp = htmlspecialchars($data["id_emp"]);

	$file =  uploadFile();
	if (!$file) {
		return false;
	}

	$query = "INSERT INTO ijazah VALUES
			('', '$no_ijazah', '$tgl_penitipan', '$tgl_kembali', '$status_ijazah', '$file', '$id_emp')";
	mysqli_query($koneksi, $query);

	return mysqli_affected_rows($koneksi);
}

function uploadFile(){

	$namaFile = $_FILES['scan_ijazah']['name'];
	$ukuranFile = $_FILES['scan_ijazah']['size'];
	$error = $_FILES['scan_ijazah']['error'];
	$tmpName = $_FILES['scan_ijazah']['tmp_name'];

	// cek apakah tidak ada file yang diupload
	if ($error === 4) {
		echo "
			<script>
				alert('pilih file terlebih dahulu!');
			</script>
		";
		return false;
	}

	// cek apakah yang diupload adalah pdf
	$ekstensiFileValid = ['pdf'];
	$ekstensiFile = explode('.', $namaFile);
	$ekstensiFile = strtolower(end($ekstensiFile));
	if (!in_array($ekstensiFile, $ekstensiFileValid) ){
		echo "
			<script>
				alert('yang anda upload bukan pdf!');
			</script>
		";
		return false;
	}

	// cek jika ukurannya terlalu besar
	if ($ukuranFile > 1000000){
		echo "
			<script>
				alert('ukuran pdf terlalu besar!');
			</script>
		";
		return false;
	}

	// lolos pengecekan, pdf siap diupload
	// generate nama pdf baru
	$namaFileBaru = uniqid();
	$namaFileBaru .= '.';
	$namaFileBaru .= $ekstensiFile;

	move_uploaded_file($tmpName, 'files/ijazah/'. $namaFileBaru);
	return $namaFileBaru;
 }

function ubahIjazah($data) {
	global $koneksi;
	$id_ijazah = $data["id_ijazah"];
	$no_ijazah = htmlspecialchars($data["no_ijazah"]);
	$tgl_penitipan = htmlspecialchars($data["tgl_penitipan"]);
	$tgl_kembali = htmlspecialchars($data["tgl_kembali"]);
	$status_ijazah = htmlspecialchars($data["status_ijazah"]);
	$fileLama = htmlspecialchars($data['scan_ijazah_lama']);
	$id_emp = htmlspecialchars($data["id_emp"]);

	// cek apakah user pilih gambar baru atau tidak
	if ($_FILES['scan_ijazah']['error'] === 4 ) {
		$file = $fileLama;
	} else {

		$file = uploadFile();
	}

	$query = "UPDATE ijazah SET
				no_ijazah = '$no_ijazah',
				tgl_penitipan = '$tgl_penitipan',
				tgl_kembali = '$tgl_kembali',
				status_ijazah = '$status_ijazah',
				scan_ijazah = '$file',
				id_emp = '$id_emp'
			  WHERE id_ijazah = $id_ijazah
			";
	mysqli_query($koneksi, $query);

	return mysqli_affected_rows($koneksi);
}

function hapusIjazah($id_ijazah) {
	global $koneksi;
	mysqli_query($koneksi, "DELETE FROM ijazah WHERE id_ijazah=$id_ijazah");

	return mysqli_affected_rows($koneksi);

}

function tambahKontrak($data) {
	global $koneksi;
	$tgl_mulai = htmlspecialchars($data["tgl_mulai"]);
	$tgl_akhir = htmlspecialchars($data["tgl_akhir"]);
	$gaji_pokok = htmlspecialchars($data["gaji_pokok"]);
	$tunjangan = htmlspecialchars($data["tunjangan"]);
	$status_kontrak = htmlspecialchars($data["status_kontrak"]);
	$id_emp = htmlspecialchars($data["id_emp"]);


	$query = "INSERT INTO kontrak_kerja VALUES
			('', '$tgl_mulai', '$tgl_akhir', '$gaji_pokok', '$tunjangan', '$status_kontrak', '$id_emp')";
	mysqli_query($koneksi, $query);

	return mysqli_affected_rows($koneksi);
}

function ubahKontrak($data) {
	global $koneksi;
	$id_kontrak = $data["id_kontrak"];
	$tgl_mulai = htmlspecialchars($data["tgl_mulai"]);
	$tgl_akhir = htmlspecialchars($data["tgl_akhir"]);
	$gaji_pokok = htmlspecialchars($data["gaji_pokok"]);
	$tunjangan = htmlspecialchars($data["tunjangan"]);
	$status_kontrak = htmlspecialchars($data["status_kontrak"]);
	$id_emp = htmlspecialchars($data["id_emp"]);


	$query = "UPDATE kontrak_kerja SET
				tgl_mulai = '$tgl_mulai',
				tgl_akhir = '$tgl_akhir',
				gaji_pokok = '$gaji_pokok',
				tunjangan = '$tunjangan',
				status_kontrak = '$status_kontrak',
				id_emp = '$id_emp'
			  WHERE id_kontrak = $id_kontrak
			";
	mysqli_query($koneksi, $query);

	return mysqli_affected_rows($koneksi);
}

function hapusKontrak($id_kontrak) {
	global $koneksi;
	mysqli_query($koneksi, "DELETE FROM kontrak_kerja WHERE id_kontrak=$id_kontrak");

	return mysqli_affected_rows($koneksi);

}

function tambahManageCuti($data) {
	global $koneksi;
	$id_kategori_cuti = htmlspecialchars($data["id_kategori_cuti"]);
	$kuota_cuti = htmlspecialchars($data["kuota_cuti"]);
	$id_emp = htmlspecialchars($data["id_emp"]);


	$query = "INSERT INTO manage_cuti VALUES
			('', '$id_kategori_cuti', '$kuota_cuti', '$id_emp')";
	mysqli_query($koneksi, $query);

	return mysqli_affected_rows($koneksi);
}

function ubahManageCuti($data) {
	global $koneksi;
	$id_manage_cuti = $data["id_manage_cuti"];
	$id_kategori_cuti = htmlspecialchars($data["id_kategori_cuti"]);
	$kuota_cuti = htmlspecialchars($data["kuota_cuti"]);
	$id_emp = htmlspecialchars($data["id_emp"]);


	$query = "UPDATE manage_cuti SET
				id_kategori_cuti = '$id_kategori_cuti',
				kuota_cuti = '$kuota_cuti',
				id_emp = '$id_emp'
			  WHERE id_manage_cuti = $id_manage_cuti
			";
	mysqli_query($koneksi, $query);

	return mysqli_affected_rows($koneksi);
}

function hapusManageCuti($id_manage_cuti) {
	global $koneksi;
	mysqli_query($koneksi, "DELETE FROM manage_cuti WHERE id_manage_cuti=$id_manage_cuti");

	return mysqli_affected_rows($koneksi);

}

function tambahRequestCuti($data) {
	global $koneksi;

	$tgl_mulai = htmlspecialchars($data["tgl_mulai"]);
	$tgl_akhir = htmlspecialchars($data["tgl_akhir"]);
	$jml_hari = htmlspecialchars($data["jml_hari"]);
	$alasan = htmlspecialchars($data["alasan"]);
	$status_cuti = htmlspecialchars($data["status_cuti"]);
	$created_at = htmlspecialchars($data["created_at"]);
	$updated_at = htmlspecialchars($data["updated_at"]);
	$id_kategori_cuti = htmlspecialchars($data["id_kategori_cuti"]);
	$id_emp = htmlspecialchars($data["id_emp"]);


	$query = "INSERT INTO req_cuti VALUES
			('', '$tgl_mulai', '$tgl_akhir', '$jml_hari', '$alasan', '$status_cuti', '$created_at', '$updated_at', '$id_emp', '$id_kategori_cuti')";
	mysqli_query($koneksi, $query);

	return mysqli_affected_rows($koneksi);
}

function tambahAnggaran($data) {
	global $koneksi;
	$nama_anggaran = htmlspecialchars($data["nama_anggaran"]);
	$nominal = htmlspecialchars($data["nominal"]);
	$tgl_mulai = htmlspecialchars($data["tgl_mulai"]);
	$tgl_akhir = htmlspecialchars($data["tgl_akhir"]);
	$id_mhs = mysqli_real_escape_string($koneksi, $_SESSION["id_mhs"]);


	$query = "INSERT INTO anggaran VALUES
			('', '$nama_anggaran', '$nominal', '$tgl_mulai', '$tgl_akhir', '$id_mhs')";
	mysqli_query($koneksi, $query);

	return mysqli_affected_rows($koneksi);
}
function hapusAnggaran($id_anggaran) {
	global $koneksi;


	try{
		mysqli_query($koneksi, "DELETE FROM anggaran WHERE id_anggaran='$id_anggaran'");
	}catch(Exception $e){
		return false;
	}

	return mysqli_affected_rows($koneksi);

}

function ubahAnggaran($data) {
	global $koneksi;

	$id_anggaran = htmlspecialchars($data["id_anggaran"]);
	$nama_anggaran = htmlspecialchars($data["nama_anggaran"]);
	$nominal = htmlspecialchars($data["nominal"]);
	$tgl_mulai = htmlspecialchars($data["tgl_mulai"]);
	$tgl_akhir = htmlspecialchars($data["tgl_akhir"]);

	$query = "UPDATE anggaran SET
				nama_anggaran= '$nama_anggaran',
				nominal = '$nominal',
				tgl_mulai = '$tgl_mulai',
				tgl_akhir = '$tgl_akhir'
			  WHERE id_anggaran='$id_anggaran'
			";
			
	mysqli_query($koneksi, $query);

	return mysqli_affected_rows($koneksi);

}

function tambahTagihan($data) {
	global $koneksi;
	$nama_tagihan = htmlspecialchars($data["nama_tagihan"]);
	$nominal = htmlspecialchars($data["nominal"]);
	$tgl_due = htmlspecialchars($data["tgl_due"]);
	$id_mhs = mysqli_real_escape_string($koneksi, $_SESSION["id_mhs"]);


	$query = "INSERT INTO tagihan VALUES
			('', '$nama_tagihan', '$nominal', '$tgl_due', '$id_mhs')";
	mysqli_query($koneksi, $query);

	return mysqli_affected_rows($koneksi);
}

function hapusTagihan($id_tagihan) {
	global $koneksi;
	mysqli_query($koneksi, "DELETE FROM tagihan WHERE id_tagihan=$id_tagihan");

	return mysqli_affected_rows($koneksi);

}

function ubahTagihan($data) {
	global $koneksi;

	$id_tagihan = htmlspecialchars($data["id_tagihan"]);
	$nama_tagihan = htmlspecialchars($data["nama_tagihan"]);
	$nominal= htmlspecialchars($data["nominal"]);
	$tgl_due = htmlspecialchars($data["tgl_due"]);

	$query = "UPDATE tagihan SET
				nama_tagihan= '$nama_tagihan',
				nominal = '$nominal',
				tgl_due = '$tgl_due'
			  WHERE id_tagihan='$id_tagihan'
			";
			
	mysqli_query($koneksi, $query);

	return mysqli_affected_rows($koneksi);

}

function tambahCatatan($data) {
	global $koneksi;

	$tgl_catatan = mysqli_real_escape_string($koneksi, $data["tgl_catatan"]);
	$nominal = mysqli_real_escape_string($koneksi, $data["nominal"]);
	$id_anggaran = mysqli_real_escape_string($koneksi, $data["id_anggaran"]);
	$id_kategori = mysqli_real_escape_string($koneksi, $data["id_kategori"]);
	$keterangan = mysqli_real_escape_string($koneksi, $data["keterangan"]);
	$id_mhs = mysqli_real_escape_string($koneksi, $_SESSION["id_mhs"]);


	$query = "INSERT INTO catatan_pengeluaran VALUES
			('','$id_kategori', '$id_anggaran', '$tgl_catatan', '$nominal', '$keterangan', '$id_mhs')";
	mysqli_query($koneksi, $query);
	//  var_dump($query);
	//  die;
	return mysqli_affected_rows($koneksi);
}

function hapusCatatan($id_catatan) {
	global $koneksi;
	mysqli_query($koneksi, "DELETE FROM catatan_pengeluaran WHERE id_catatan=$id_catatan");

	return mysqli_affected_rows($koneksi);

}

function ubahCatatan($data) {
	global $koneksi;

	$id_catatan = mysqli_real_escape_string($koneksi, $data["id_catatan"]);
	$tgl_catatan = mysqli_real_escape_string($koneksi, $data["tgl_catatan"]);
	$nominal = mysqli_real_escape_string($koneksi, $data["nominal_catatan"]);
	$id_anggaran = mysqli_real_escape_string($koneksi, $data["id_anggaran"]);
	$id_kategori = mysqli_real_escape_string($koneksi, $data["id_kategori"]);
	$keterangan = mysqli_real_escape_string($koneksi, $data["keterangan"]);

	$query = "UPDATE catatan_pengeluaran SET
				id_kategori = '$id_kategori',
				id_anggaran= '$id_anggaran',
				tgl_catatan= '$tgl_catatan',
				nominal_catatan= '$nominal',
				keterangan = '$keterangan'
			  WHERE id_catatan='$id_catatan'
			";
			
	mysqli_query($koneksi, $query);

	return mysqli_affected_rows($koneksi);

}

function tambahJadwal($data) {
	global $koneksi;
	$matkul = htmlspecialchars($data["matkul"]);
	$hari = mysqli_real_escape_string($koneksi, $data["hari"]);
	$jam = htmlspecialchars($data["jam"]);


	$query = "INSERT INTO jadwal VALUES
			('', '$matkul', '$hari', '$jam')";
	mysqli_query($koneksi, $query);

	return mysqli_affected_rows($koneksi);
}

function hapusJadwal($id_matkul) {
	global $koneksi;
	mysqli_query($koneksi, "DELETE FROM jadwal WHERE id_matkul=$id_matkul");

	return mysqli_affected_rows($koneksi);

}

function ubahJadwal($data) {
	global $koneksi;

	$id_matkul = htmlspecialchars($data["id_matkul"]);
	// $id_lama = htmlspecialchars($data["id_lama"]);	
	$matkul = htmlspecialchars($data["matkul"]);
	$hari = mysqli_real_escape_string($koneksi, $data["hari"]);
	$jam = htmlspecialchars($data["jam"]);

	$query = "UPDATE jadwal SET
				matkul= '$matkul',
				hari = '$hari',
				jam = '$jam'
			  WHERE id_matkul='$id_matkul'
			";
			
	mysqli_query($koneksi, $query);

	return mysqli_affected_rows($koneksi);

}

function registrasi($data){
	global $koneksi;

	$username = strtolower(stripcslashes($data["username"]));
	$password = mysqli_real_escape_string($koneksi, $data["password"]);
    $password2 = mysqli_real_escape_string($koneksi, $data["password2"]);
    $email = stripcslashes($data["email"]);
	

	// cek username sudah ada atau belum
	$result = mysqli_query($koneksi, "SELECT username FROM user WHERE username= '$username'");
	if (mysqli_fetch_assoc($result)) {
		echo '<link rel="stylesheet" href="./sweetalert2.min.css"></script>';
		echo '<script src="./sweetalert2.min.js"></script>';
		echo "<script>
		setTimeout(function () { 
			swal.fire({
				
				title               : 'Daftar Akun Gagal',
				text                :  'Username yang dipilih sudah terdaftar',
				//footer              :  '',
				icon                : 'error',
				timer               : 2000,
				showConfirmButton   : true
			});  
		},10);   setTimeout(function () {
			window.location.href = 'index.php'; //will redirect to your blog page (an ex: blog.html)
		}, 2000); //will call the function after 2 secs
		</script>";
		// echo "
		// 	<script>
		// 		alert('Username yang dipilih sudah terdaftar!');
		// 	</script>
		// ";
		return false;
	}

	// cek konfirmasi password
	if ($password !== $password2) {
		echo '<link rel="stylesheet" href="./sweetalert2.min.css"></script>';
		echo '<script src="./sweetalert2.min.js"></script>';
		echo "<script>
		setTimeout(function () { 
			swal.fire({
				
				title               : 'Daftar Akun Gagal',
				text                :  'Konfirmasi Password Tidak Sesuai!',
				//footer              :  '',
				icon                : 'error',
				timer               : 2000,
				showConfirmButton   : true
			});  
		},10);   setTimeout(function () {
			window.location.href = 'login.php'; //will redirect to your blog page (an ex: blog.html)
		}, 2000); //will call the function after 2 secs
		</script>";
		// echo "
		// 	<script>
		// 		alert('konfirmasi password tidak sesuai!');
		// 	</script>
		// ";
		return false;
	}

	// enkripsi password
	$password = password_hash($password, PASSWORD_DEFAULT);


	// tambahkan user baru ke database
	mysqli_query($koneksi, "INSERT INTO user VALUES('', '$username', '$password', '$email')");

	return mysqli_affected_rows($koneksi);
}


function ubahProfil($data){
	global $koneksi;
	$id_mhs = $data['id_mhs'];
    $nama = stripcslashes($data["nama_mhs"]);
	$username =stripcslashes($data["username"]);
	$password = mysqli_real_escape_string($koneksi, $data["password"]);
    $no_hp = stripcslashes($data["no_hp"]);
    $alamat = stripcslashes($data["alamat"]);
    $email = stripcslashes($data["email"]);

	
	$password2 = password_hash($password, PASSWORD_DEFAULT);

		// Update user data in the database
		$update_query = "UPDATE mahasiswa 
		SET nama_mhs = '$nama', 
			username = '$username',
			password = '$password2',
			no_hp = '$no_hp', 
			alamat = '$alamat', 
			email = '$email' 
		WHERE id_mhs='$id_mhs'";
	
	

	mysqli_query($koneksi, $update_query);

	return mysqli_affected_rows($koneksi);
}



function cariAnggaran($keyword){
	$query = "SELECT * FROM anggaran
				WHERE
			  nama_anggaran LIKE '%$keyword%' OR 
			  nominal LIKE '%$keyword%' OR 
			  tgl_mulai LIKE '%$keyword%' OR
			  tgl_akhir LIKE '%$keyword%'
			";

	return query($query);
}



 ?>