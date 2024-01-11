<?php

// $id_mhs = $_SESSION["id_mhs"];

// ambil data di URL
$id_user = $_GET["id_user"];
// query data mahasiswa berdasarkan id
$barang = query("SELECT * FROM barang WHERE id_user = $id_user")[0];

$tgl_pengajuan = $_GET['tgl_pengajuan'];



?>


    
      
					
					<div class="clearfix"></div>
					<div class="row">
						<div class="col-md-12 col-sm-12 ">
							<div class="x_panel">
								<div class="x_title">
									<h2>Rincian Data <small></small></h2>
                  <!-- <form action="../../laporan/rekap_data.php" method="get">
        					<a href="laporan/rekap_data.php" class="btn btn-info btn-sm"><i class="fa fa-print"></i> Cetak Data</a>
                  </form> -->
                  <form action="laporan/rekap_data.php" method="get">
                  <!-- <a href="laporan/rekap_data.php&id_user=<?= $data['id_user'];?>" class="btn btn-info btn-sm"><i class="fa fa-print"></i> Cetak Data</a> -->
                      <input type="hidden" name="aksi">
                      <input type="hidden" name="id_user" value="<?= $barang['id_user'];?>">
                      <input type="hidden" name="tgl_pengajuan" value="<?= $tgl_pengajuan;?>">
                      <button type="submit" class="btn btn-info btn-sm" name="cetakData"><i class="fa fa-print"></i> Cetak Data</button>
                  </form>

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
									
									<div class="table-responsive">
          <table class="table table-striped jambo_table bulk_action">
            <thead>
              <tr class="headings">
                <!-- <th>
                  <input type="checkbox" id="check-all" class="flat">
                </th> -->
                <th class="column-title">No. </th>
                <th class="column-title">Kode Pengajuan </th>
                <th class="column-title">Nama Barang </th>
                <th class="column-title">Spec </th>
                <th class="column-title">Desc </th>
                <th class="column-title">Qty </th>
                <th class="column-title">Tanggal Pengajuan </th>
                <th class="column-title">Nama Pemohon </th>
                <th class="column-title">Approval 1 </th>
                <th class="column-title">Approval 2 </th>
                <th class="column-title">Status </th>
                <!-- <th class="column-title no-link last"><span class="nobr">Action</span> -->
                </th>
                <th class="bulk-actions" colspan="7">
                  <a class="antoo" style="color:#fff; font-weight:500;">Bulk Actions ( <span class="action-cnt"> </span> ) <i class="fa fa-chevron-down"></i></a>
                </th>
              </tr>
            </thead>

            <tbody>
              <tr class="even pointer">
              	<?php 
              		$no = 1;
              		$query = "SELECT * FROM barang JOIN user ON user.id_user=barang.id_user WHERE status='Sudah disetujui' AND barang.id_user=$id_user AND barang.tgl_pengajuan='$tgl_pengajuan'";
              		// $query = "SELECT * FROM barang JOIN user ON user.id_user=barang.id_user WHERE status='Sudah disetujui' AND barang.id_user=$id_user";
              		// $query = "SELECT * FROM barang WHERE barang.id_user=$id_user";
              		$tampil = mysqli_query($koneksi, $query);
              		while ($data = mysqli_fetch_assoc($tampil)) {
              		
              		

              	 ?>
                <td class=" "><?= $no++;?></td>
                <td class=" "><?= $data['kode_pengajuan'];?></td>
                <td class=" "><?= $data['nama_barang'];?> </td>
                <td class=" "><?= $data['spek'];?></td>
                <td class=" "><?= $data['deskripsi'];?></td>
                <td class=" "><?= $data['qty'];?></td>
                <td class=" "><?= date('d-M-Y', strtotime($data['tgl_pengajuan']));?></td>

                <td class=" "><strong><?= $data['username'];?></strong></td>
                <td class=" "><?= $data['acc1'];?></td>
                <td class=" "><?= $data['acc2'];?></td>
                <td class=" " style="color: <?php
                    if ($data['status'] == 'Menunggu Persetujuan') {
                        echo '#b58709';
                    } elseif ($data['status'] == 'Sedang diproses') {
                        echo '#b58709';
                    } elseif ($data['status'] == 'Sudah disetujui') {
                        echo '#14a664';
                    } else {
                        echo '#a62f26';
                    }
                ?>;">
                     <strong><?= $data['status'];?></strong>

                <!-- <td><a href="?form=rincian&id_user=<?= $data["id_user"]; ?>" class="btn btn-info btn-sm">Rincian</a></td> -->

                <!-- <td class=" last"><a href="?form=ubahPengajuan&id_barang=<?= $data["id_barang"]; ?>" class="btn btn-info btn-sm">Approve </a> 
                </td> -->
              </tr>
              
        					
           
            </tbody>
                  

           <?php } ?>
          </table>
        </div>
								</div>
							</div>
						</div>
					</div>

				




					
				</div>
    
