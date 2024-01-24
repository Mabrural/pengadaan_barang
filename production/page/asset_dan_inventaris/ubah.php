<?php

// $id_mhs = $_SESSION["id_mhs"];

// ambil data di URL
$kode_brg = $_GET["kode_brg"];
// query data mahasiswa berdasarkan id
$storage_barang = query("SELECT * FROM storage_barang WHERE kode_brg = '$kode_brg'")[0];
$lokasi = query("SELECT * FROM lokasi_barang");
$room = query("SELECT * FROM lokasi_room");
$vendor = query("SELECT * FROM vendor");


// cek apakah tombol submit sudah ditekan atau belum
if (isset($_POST["submit"])) {
	

	

	// cek apakah data berhasil diubah atau tidak
	if(ubahKaryawan($_POST) > 0 ) {
		echo '<link rel="stylesheet" href="./sweetalert2.min.css"></script>';
		echo '<script src="./sweetalert2.min.js"></script>';
		echo "<script>
		setTimeout(function () { 
			swal.fire({
				
				title               : 'Berhasil',
				text                :  'Data berhasil diubah',
				//footer              :  '',
				icon                : 'success',
				timer               : 2000,
				showConfirmButton   : true
			});  
		},10);   setTimeout(function () {
			window.location.href = '?page=dataKaryawan'; //will redirect to your blog page (an ex: blog.html)
		}, 2000); //will call the function after 2 secs
		</script>";
		// echo "
		// 	<script>
		// 		alert('Data berhasil diubah!');
		// 		document.location.href = '?page=pengajuan';
		// 	</script>
		// ";
	} else{
		echo '<link rel="stylesheet" href="./sweetalert2.min.css"></script>';
		echo '<script src="./sweetalert2.min.js"></script>';
		echo "<script>
		setTimeout(function () { 
			swal.fire({
				
				title               : 'Gagal',
				text                :  'Data gagal diubah',
				//footer              :  '',
				icon                : 'error',
				timer               : 2000,
				showConfirmButton   : true
			});  
		},10);   setTimeout(function () {
			window.location.href = '?page=dataKaryawan'; //will redirect to your blog page (an ex: blog.html)
		}, 2000); //will call the function after 2 secs
		</script>";
		// echo "
		// 	<script>
		// 		alert('Data gagal diubah!');
		// 		document.location.href = '?page=pengajuan';
		// 	</script>
		// ";
	}

}


?>


    <div class="x_panel">
      <div class="">
					<!-- <div class="page-title">
						<div class="title_left">
							<h3>Form Pengadaan Barang</h3>
						</div>

						<div class="title_right">
							<div class="col-md-5 col-sm-5  form-group pull-right top_search">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="Search for...">
									<span class="input-group-btn">
										<button class="btn btn-default" type="button">Go!</button>
									</span>
								</div>
							</div>
						</div>
					</div> -->
					<div class="clearfix"></div>
					<div class="row">
						<div class="col-md-12 col-sm-12 ">
							<div class="x_panel">
								<div class="x_title">
									<h2>Ubah Data Barang<small></small></h2>
									<!-- <ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
										</li>
										<li class="dropdown">
											<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-wrench"></i></a>
											<ul class="dropdown-menu" role="menu">
												<li><a class="dropdown-item" href="#">Settings 1</a>
												</li>
												<li><a class="dropdown-item" href="#">Settings 2</a>
												</li>
											</ul>
										</li>
										<li><a class="close-link"><i class="fa fa-close"></i></a>
										</li>
									</ul> -->
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<br />
									<form action="" method="post" id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" enctype="multipart/form-data">
										<input type="hidden" name="kode_brg_lama" value="<?= $storage_barang["kode_brg"];?>">
										<input type="hidden" name="gambarBarangLama" value="<?= $storage_barang["gambar_brg"];?>">
										
										<div class="item form-group">
											<label class="col-form-label col-md-3 col-sm-3 label-align" for="kode_brg">Kode Barang <span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 ">
												<input type="text" name="kode_brg" id="kode_brg" required="required" class="form-control" value="<?= $storage_barang["kode_brg"];?>" readonly>
											</div>
										</div>
										<div class="item form-group">
											<label class="col-form-label col-md-3 col-sm-3 label-align" for="nama_barang">Nama Barang <span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 ">
												<input type="text" name="nama_barang" id="nama_barang" required="required" class="form-control" value="<?= $storage_barang["nama_barang"];?>">
											</div>
										</div>
										<div class="item form-group">
											<label class="col-form-label col-md-3 col-sm-3 label-align" for="spek">Spesifikasi 
											</label>
											<div class="col-md-6 col-sm-6 ">
												<input type="text" name="spek" id="spek" required="required" class="form-control" value="<?= $storage_barang["spek"];?>">
											</div>
										</div>
										<div class="item form-group">
											<label for="deskripsi" class="col-form-label col-md-3 col-sm-3 label-align">Deskripsi</label>
											<div class="col-md-6 col-sm-6 ">
												<textarea id="deskripsi" class="form-control" rows="4" name="deskripsi" id="deskripsi" style="resize:none;"><?= $storage_barang["deskripsi"];?></textarea>
											</div>
										</div>
										<div class="item form-group">
											<label for="qty" class="col-form-label col-md-3 col-sm-3 label-align">Qty <span class="required">*</span></label>
											<div class="col-md-6 col-sm-6 ">
												<input id="qty" name="qty" class="form-control" type="number" value="<?= $storage_barang["qty"];?>" min="0">
											</div>
										</div>

										<div class="item form-group">
											<label for="tanggal_masuk" class="col-form-label col-md-3 col-sm-3 label-align">Tanggal Masuk</label>
											<div class="col-md-6 col-sm-6 ">
												<input id="tanggal_masuk" name="date_in" class="form-control" type="date" value="<?= $storage_barang["date_in"];?>">
											</div>
										</div>

										<div class="item form-group">
											<label for="renewal" class="col-form-label col-md-3 col-sm-3 label-align">Renewal</label>
											<div class="col-md-6 col-sm-6 ">
												<input id="renewal" name="renewal" class="form-control" type="date" value="<?= $storage_barang["renewal"];?>">
											</div>
										</div>

										<div class="item form-group">
											<label for="kondisi_brg" class="col-form-label col-md-3 col-sm-3 label-align">Kondisi <span class="required">*</span></label>
											<div class="col-md-6 col-sm-6 ">
												<!-- <input id="kondisi_brg" name="kondisi_brg" class="form-control" type="text" placeholder="Ketikkan Kondisi Barang" required> -->
												<select class="form-control" name="kondisi_brg" required>
													<option value="">--Pilih Kondisi--</option>
													<option value="Baik" <?php if($storage_barang['kondisi_brg'] == 'Baik') { echo "selected" ;}?>>Baik</option>
													<option value="Perlu Perbaikan" <?php if($storage_barang['kondisi_brg'] == 'Perlu Perbaikan') { echo "selected" ;}?>>Perlu Perbaikan</option>
													<option value="Kurang Lengkap" <?php if($storage_barang['kondisi_brg'] == 'Kurang Lengkap') { echo "selected" ;}?>>Kurang Lengkap</option>
													<option value="Rusak" <?php if($storage_barang['kondisi_brg'] == 'Rusak') { echo "selected" ;}?>>Rusak</option>
													<option value="Hilang" <?php if($storage_barang['kondisi_brg'] == 'Hilang') { echo "selected" ;}?>>Hilang</option>
												</select>
											</div>
										</div>

										<div class="item form-group">
											<label for="id_lokasi" class="col-form-label col-md-3 col-sm-3 label-align">Lokasi Barang <span class="required">*</span></label>
											<div class="col-md-6 col-sm-6 ">
												
												<select class="form-control" name="id_lokasi" id="id_lokasi" required>
													<option value="">--Pilih Lokasi Barang--</option>
													<?php foreach($lokasi as $row) : ?>
														<option value="<?= $row['id_lokasi']?>" <?= ($row['id_lokasi'] == $storage_barang['id_lokasi'])?'selected': '';?>><?= $row['nama_lokasi']?></option>
													<?php endforeach;?>	
												</select>
											</div>
										</div>

										<div class="item form-group">
											<label for="id_room" class="col-form-label col-md-3 col-sm-3 label-align">Lokasi Ruangan <span class="required">*</span></label>
											<div class="col-md-6 col-sm-6 ">
												<select class="form-control" name="id_room" id="id_room" required>
													<option value="">--Pilih Lokasi Ruangan--</option>
													<?php foreach($room as $row) : ?>
														<option value="<?= $row['id_room']?>" <?= ($row['id_room'] == $storage_barang['id_room'])?'selected': '';?>><?= $row['room_name']?></option>
													<?php endforeach;?>	
												</select>
											</div>
										</div>

										<div class="item form-group">
											<label for="id_vendor" class="col-form-label col-md-3 col-sm-3 label-align">Vendor</label>
											<div class="col-md-6 col-sm-6 ">
												<select class="form-control" name="id_vendor" id="id_vendor">
													<option value="">--Pilih Vendor--</option>
													<?php foreach($vendor as $row) : ?>
														<option value="<?= $row['id_vendor']?>" <?= ($row['id_vendor'] == $storage_barang['id_vendor'])?'selected' : '';?>><?= $row['nama_vendor']?></option>
													<?php endforeach;?>	
												</select>
											</div>
										</div>


										<div class="item form-group">
											<label for="middle-name" class="col-form-label col-md-3 col-sm-3 label-align">Gambar Barang<span class="required">*</span></label>
											<div class="col-md-6 col-sm-6 ">
												<img src="img/asset_dan_inventaris/<?= $storage_barang['gambar_brg'];?>" width="50">
												<input type="file" name="gambar_brg">
											</div>
										</div>

										
									
										<div class="ln_solid"></div>
										<div class="item form-group">
											<div class="col-md-6 col-sm-6 offset-md-3">
												<!-- <button class="btn btn-primary" type="button">Cancel</button> -->
												<button class="btn btn-primary" type="reset">Reset</button>
												<button type="submit" class="btn btn-success" name="submit">Submit</button>
											</div>
										</div>

									</form>
								</div>
							</div>
						</div>
					</div>

				




					
				</div>
    </div>
