<?php

// $id_mhs = $_SESSION["id_mhs"];

// ambil data di URL
$id_req_brg = $_GET["id_req_brg"];
// query data berdasarkan id
$req_barang = query("SELECT * FROM req_barang WHERE id_req_brg = $id_req_brg")[0];
$barang = query("SELECT * FROM barang");
$lokasi = query("SELECT * FROM lokasi_barang");
$room = query("SELECT * FROM lokasi_room");
$satuan = query("SELECT * FROM satuan");


// cek apakah tombol submit sudah ditekan atau belum
if (isset($_POST["submit"])) {
	

	

	// cek apakah data berhasil diubah atau tidak
	if(ubahPengajuan($_POST) > 0 ) {
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
			window.location.href = '?page=pengajuan'; //will redirect to your blog page (an ex: blog.html)
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
			window.location.href = '?page=pengajuan'; //will redirect to your blog page (an ex: blog.html)
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
									<h2>Ubah Data Pengajuan Barang<small></small></h2>
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
									<form action="" method="post" id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">
										<input type="hidden" name="id_req_brg" value="<?= $req_barang["id_req_brg"];?>">
										<input type="hidden" name="kode_pengajuan" id="last-name" required="required" class="form-control" value="<?= $req_barang["kode_pengajuan"];?>">
										
										<div class="item form-group">
											<label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name">Kode Barang <span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 ">

												<select class="form-control" name="kode_brg" required>
													<option value="">--Pilih Barang--</option>
													<?php foreach($barang as $row) : ?>
														<option value="<?= $row['kode_brg']?>" <?= ($row['kode_brg'] == $req_barang['kode_brg'])?'selected': ''; ?>><?= $row['kode_brg']?> - <?= $row['nama_barang']?> - <?= $row['spek']?></option>
													<?php endforeach;?>	
												</select>
											</div>
										</div>

										<div class="item form-group">
											<label for="id_lokasi" class="col-form-label col-md-3 col-sm-3 label-align">Lokasi Barang <span class="required">*</span></label>
											<div class="col-md-6 col-sm-6 ">
												
												<select class="form-control" name="id_lokasi" id="id_lokasi" required>
													<option value="">--Pilih Lokasi Barang--</option>
													<?php foreach($lokasi as $row) : ?>
														<option value="<?= $row['id_lokasi']?>" <?= ($row['id_lokasi'] == $req_barang['id_lokasi'])? 'selected' : '';?>><?= $row['nama_lokasi']?></option>
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
														<option value="<?= $row['id_room']?>" <?= ($row['id_room'] == $req_barang['id_room'])?'selected' : '';?>><?= $row['room_name']?></option>
													<?php endforeach;?>	
												</select>
											</div>
										</div>

										<div class="item form-group">
										    <label for="qty_req" class="col-form-label col-md-3 col-sm-3 label-align">Qty <span class="required">*</span></label>
										    <div class="col-md-6 col-sm-6">
										        <input id="qty_req" name="qty_req" class="form-control" type="number" min="1" value="<?= $req_barang['qty_req']?>" required>
										    </div>
										</div>

										<div class="item form-group">
											<label for="id_room" class="col-form-label col-md-3 col-sm-3 label-align">Satuan Barang <span class="required">*</span></label>
											<div class="col-md-6 col-sm-6 ">
												<select class="form-control" name="id_satuan" id="id_satuan" required>
													<option value="">--Pilih Satuan--</option>
													<?php foreach($satuan as $row) : ?>
														<option value="<?= $row['id_satuan']?>" <?= ($row['id_satuan'] == $req_barang['id_satuan'])?'selected': '';?>><?= $row['nama_satuan']?></option>
													<?php endforeach;?>	
												</select>
											</div>
										</div>

										<div class="item form-group">
											<label for="alasan" class="col-form-label col-md-3 col-sm-3 label-align">Alasan</label>
											<div class="col-md-6 col-sm-6 ">
												<textarea id="alasan" class="form-control" rows="4" name="alasan" id="alasan" style="resize:none;"><?= $req_barang['alasan']?></textarea>
											</div>
										</div>


										<div class="item form-group">
											<!-- <label for="middle-name" class="col-form-label col-md-3 col-sm-3 label-align">Date In</label> -->
											<div class="col-md-6 col-sm-6 ">
												<input id="middle-name" name="tgl_req_brg" class="form-control" type="hidden" value="<?= $req_barang["tgl_req_brg"];?>" >
												<input id="middle-name" name="status_req" class="form-control" type="hidden" value="Menunggu Persetujuan KC">
												<input id="middle-name" name="acc1" class="form-control" type="hidden" value="">
												<input id="middle-name" name="acc2" class="form-control" type="hidden" value="">

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
