<?php

$id_user = $_SESSION["id_user"];

// $pengajuan = query("SELECT * FROM barang WHERE barang.id_barang=$id_user");

?>
    <div class="x_panel">
      <div class="x_title">
        <h2>Data Karyawan <small></small></h2>
        <a href="?form=tambahKaryawan" class="btn btn-primary btn-sm"><i class="fa fa-plus fa-sm"></i> Tambah Karyawan</a>
        <!-- <ul class="nav navbar-right panel_toolbox">
          <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
          </li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                <a class="dropdown-item" href="#">Settings 1</a>
                <a class="dropdown-item" href="#">Settings 2</a>
              </div>
          </li>
          <li><a class="close-link"><i class="fa fa-close"></i></a>
          </li>
        </ul> -->
        <div class="clearfix"></div>
      </div>

      <div class="x_content">

        <!-- <p>Add class <code>bulk_action</code> to table for bulk actions options on row select</p> -->

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
                <th class="column-title">Status </th>
                <th class="column-title no-link last"><span class="nobr">Action</span>
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
              		$query = "SELECT * FROM barang WHERE barang.id_user=$id_user AND status='Menunggu Persetujuan' OR status='Sedang diproses'";
              		$tampil = mysqli_query($koneksi, $query);
              		while ($data = mysqli_fetch_assoc($tampil)) {
              		// $hari_indonesia = array(
                  //     'Sunday' => 'Minggu',
                  //     'Monday' => 'Senin',
                  //     'Tuesday' => 'Selasa',
                  //     'Wednesday' => 'Rabu',
                  //     'Thursday' => 'Kamis',
                  //     'Friday' => 'Jumat',
                  //     'Saturday' => 'Sabtu',
                  // );
                  //     $hari = strftime('%A', strtotime($data['tgl_pengajuan']));          		

              	 ?>
                <td class=" "><?= $no++;?></td>
                <td class=" "><?= $data['kode_pengajuan'];?></td>
                <td class=" "><?= $data['nama_barang'];?> </td>
                <td class=" "><?= $data['spek'];?></td>
                <td class=" "><?= $data['deskripsi'];?></td>
                <td class=" "><?= $data['qty'];?></td>
                <!-- <td class=" "><?= $hari_indonesia[$hari].date(', d-M-Y', strtotime($data['tgl_pengajuan']));?></td> -->
                <td class=" "><?= date('d-M-Y', strtotime($data['tgl_pengajuan']));?></td>
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
                </td>

              <td class=" last">
              <?php if ($data['status'] == 'Sudah disetujui') { ?>
                <span class="text-success fa fa-check"><strong> Selesai</strong></span>
              <?php } elseif ($data['status'] == 'Sedang diproses') { ?>
                <span class="text-info fa fa-spinner fa-spin"></span><strong> Waiting</strong>
              <?php } else { ?>
                <a href="?form=ubahPengajuan&id_barang=<?= $data["id_barang"]; ?>" class="btn btn-info btn-sm">Ubah </a> | <a href="?form=hapusPengajuan&id_barang=<?= $data["id_barang"]; ?>" onclick="return confirm('Anda yakin ingin menghapus data ini?')" class="btn btn-danger btn-sm">Hapus </a>
              <?php } ?>
            </td>
               <!--  <td class=" last"><a href="?form=ubahPengajuan&id_barang=<?= $data["id_barang"]; ?>" class="btn btn-info btn-sm">Ubah </a> | <a href="?form=hapusPengajuan&id_barang=<?= $data["id_barang"]; ?>" onclick="return confirm('Anda yakin ingin menghapus data ini?')" class="btn btn-danger btn-sm">Hapus </a>
                </td> -->
              </tr>
              
           
            </tbody>
           <?php } ?>
          </table>
        </div>
				
			
      </div>
    </div>