<?php

$id_user = $_SESSION["id_user"];

// $pengajuan = query("SELECT * FROM barang WHERE barang.id_barang=$id_user");

?>
    <div class="x_panel">
      <div class="x_title">
        <h2>Asset dan Inventaris <small></small></h2>
        <a href="?form=tambahInventaris" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i> Tambah Asset</a>
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
          <table id="example" class="display" style="width:100%">
            <thead style="background-color: #2a3f54; color: #dfe5f1;">
              <tr class="headings">
                <!-- <th>
                  <input type="checkbox" id="check-all" class="flat">
                </th> -->
                <th class="column-title">No. </th>
                <th class="column-title">Kode Barang </th>
                <th class="column-title">Nama Barang </th>
                <th class="column-title">Spesifikasi </th>
                <th class="column-title">Deskripsi </th>
                <th class="column-title">Qty </th>
                <th class="column-title">Tanggal Masuk </th>
                <th class="column-title">Renewal </th>
                <th class="column-title">Kondisi Barang </th>
                <th class="column-title">Lokasi Barang </th>
                <th class="column-title">Lokasi Ruangan </th>               
                <th class="column-title">Vendor </th>               
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
              		$query = "SELECT * FROM storage_barang JOIN vendor ON vendor.id_vendor=storage_barang.id_vendor JOIN lokasi_room ON lokasi_room.id_room=storage_barang.id_room JOIN lokasi_barang ON lokasi_barang.id_lokasi=storage_barang.id_lokasi";
              		// $query = "SELECT * FROM barang WHERE barang.id_user=$id_user AND status='Menunggu Persetujuan KC' OR status='Menunggu Persetujuan Dir.Ops'";
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
                <td class=" "><?= $data['kode_brg'];?></td>
                <td class=" "><a href="img/asset_dan_inventaris/<?= $data['gambar_brg'];?>" style="text-decoration: underline; color:blue;"><?= $data['nama_barang'];?> </a></td>
                <td class=" "><?= $data['spek'];?></td>
                <td class=" "><?= $data['deskripsi'];?></td>
                <td class=" "><?= $data['qty'];?></td>
                <!-- <td class=" "><?= date('d-M-Y', strtotime($data['date_in']));?></td> -->
                <td class=" ">
                	<?php
				        if ($data['date_in'] == NULL || $data['date_in'] == '' || $data['date_in'] == '0000-00-00') {
				            echo '-';
				        } else {
				            echo date('d-M-Y', strtotime($data['date_in']));
				        }
				    ?>
                </td>
                <!-- <td class=" "><?= date('d-M-Y', strtotime($data['renewal']));?></td> -->
                <td class=" ">
                	<?php
				        if ($data['renewal'] == NULL || $data['renewal'] == '' || $data['renewal'] == '0000-00-00') {
				            echo '-';
				        } else {
				            echo date('d-M-Y', strtotime($data['renewal']));
				        }
				    ?>
                </td>
                <td class=" "><?= $data['kondisi_brg'];?></td>
                <td class=" "><?= $data['nama_lokasi'];?></td>
                <td class=" "><?= $data['room_name'];?></td>
                <td class=" "><?= $data['nama_vendor'];?></td>

 
                <td class=" last"><a href="?form=ubahInventaris&kode_brg=<?= $data["kode_brg"]; ?>" class="btn btn-info btn-sm">Ubah </a> | <a href="?form=hapusInventaris&kode_brg=<?= $data["kode_brg"]; ?>" onclick="return confirm('Anda yakin ingin menghapus data ini?')" class="btn btn-danger btn-sm">Hapus </a>
                </td>
              </tr>
              
           <?php } ?>

            </tbody>
          </table>

          <script type="text/javascript">
          $(document).ready(function() {
              // Periksa apakah ada data dalam tabel
              if ($('#example tbody td').length > 0) {
                  new DataTable('#example', {
                      responsive: true,
                      columnDefs: [
                          {
                              targets: -1,
                              responsivePriority: 'auto'
                          }
                      ]
                  });
              } else {
                  // Jika tidak ada data, inisialisasi DataTable tanpa responsivitas
                  $('#example').DataTable();
              }
          });

          </script>


          <!-- <script type="text/javascript">
            new DataTable('#example', {
            responsive: true,
            columnDefs: [
              {
                targets: -1,
                responsivePriority: 'auto'
              }
            ]
          });

          </script> -->
        </div>
				
			
      </div>
    </div>
