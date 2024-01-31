<?php

$id_user = $_SESSION["id_user"];

$vendor = query("SELECT * FROM vendor");
// $pengajuan = query("SELECT * FROM barang WHERE barang.id_barang=$id_user");
$id_vendor = isset($_GET['id_vendor']) ? $_GET['id_vendor'] : '';

?>
    <div class="x_panel">
      <div class="x_title">
        <h2>Data Pembelian Barang <small></small></h2>
        
        <form action="laporan/cetak_po.php" method="get">
            <input type="hidden" name="aksi">
            <input type="hidden" name="id_user" value="<?= $id_user;?>">
            <input type="hidden" name="id_vendor" value="<?= $id_vendor;?>">
            <!-- <input type="hidden" name="id_room" value="<?= $id_room;?>"> -->
            <a href="?form=tambahPembelian" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i> Ajukan PO</a>
            <button type="submit" class="btn btn-info btn-sm" name="cetakData"><i class="fa fa-print"></i> Cetak PO</button>
        </form>

        <div class="row">
              <div class="col-md-3 col-sm-6">
                  <form method="get">
                    <input type="hidden" name="aksi">
                        <!-- <input type="hidden" name="id_user" value="<?= $storage_barang['id_user'];?>"> -->
                      <select class="form-control" name="id_vendor" id="id_vendor" required>
                          <option value="">--Pilih Vendor--</option>
                          <?php foreach($vendor as $row) : ?>
                              <option value="<?= $row['id_vendor']?>" <?php echo ($id_vendor == $row['id_vendor']) ? 'selected' : ''; ?>>
                                  <?= $row['nama_vendor']?>
                              </option>
                          <?php endforeach;?> 
                      </select><br>
                      <!-- <button type="submit" class="btn btn-primary btn-sm">Filter</button> -->
                  </form>
              </div>
              <!-- <div class="col-md-2 col-sm-6">
                    <select class="form-control" name="id_room" id="id_room" required>
                        <option value="">--Pilih Lokasi Ruangan--</option>
                        <?php foreach($room as $row) : ?>
                            <option value="<?= $row['id_room']?>" <?php echo ($id_room == $row['id_room']) ? 'selected' : ''; ?>>
                                <?= $row['room_name']?>
                            </option>
                        <?php endforeach;?> 
                    </select>
                    <br>
              </div> -->
          </div>

        <div class="clearfix"></div>
      </div>

      <div class="x_content">

        <script type="text/javascript">
          $(document).ready(function() {
              // Add change event listeners to the dropdowns
              $('#id_vendor, #id_room').change(function() {
                  // Get selected values
                  var id_vendor = $('#id_vendor').val();
                  var id_room = $('#id_room').val();

                  // Redirect to the current page with filter parameters
                  window.location.href = '?page=pengajuanPembelian&id_vendor=' + id_vendor + '&id_room=' + id_room;
                  // window.location.href = '?id_lokasi=' + id_lokasi + '&id_room=' + id_room;
              });

              // ... (rest of the JavaScript code)
          });
        </script>

        <!-- <p>Add class <code>bulk_action</code> to table for bulk actions options on row select</p> -->

        <div class="table-responsive">
          <table id="example" class="display" style="width:100%">
            <thead style="background-color: #2a3f54; color: #dfe5f1;">
              <tr class="headings">
                <!-- <th>
                  <input type="checkbox" id="check-all" class="flat">
                </th> -->
                <th class="column-title">No. </th>
                <th class="column-title">Tanggal PO</th>
                <th class="column-title">Nama Barang </th>
                <th class="column-title">Spesifikasi </th>
                <th class="column-title">Keterangan </th>
                <th class="column-title">Qty </th>
                <th class="column-title">Satuan </th>
                <th class="column-title">Harga Satuan</th>
                <th class="column-title">Total Harga</th>
                <th class="column-title">Vendor </th>
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
              		$query = "SELECT * FROM po_barang JOIN vendor ON vendor.id_vendor=po_barang.id_vendor JOIN req_barang ON req_barang.id_req_brg=po_barang.id_req_brg JOIN barang ON barang.kode_brg=req_barang.kode_brg JOIN satuan ON satuan.id_satuan=req_barang.id_satuan";
                  // $query = "SELECT * FROM po_barang JOIN req_barang ON req_barang.id_req_brg JOIN vendor ON vendor.id_vendor=po_barang.id_vendor JOIN barang ON barang.kode_brg=req_barang.kode_brg JOIN satuan ON satuan.id_satuan=req_barang.id_satuan";

                  if (!empty($id_vendor)) {
                      $query .= " WHERE po_barang.id_vendor = $id_vendor";
                  }
              		
              		$tampil = mysqli_query($koneksi, $query);
              		while ($data = mysqli_fetch_assoc($tampil)) {
              	     $harga_po = $data['harga_po'];
                     $total_harga = $harga_po * $data['qty_po'];
              	 ?>
                <td class=" "><?= $no++;?></td>
                <td class=" "><?= date('d-M-Y', strtotime($data['tgl_po']));?></td>
                <td class=" "><a href="img/barang/<?= $data['gambar_barang'];?>" style="text-decoration: underline; color:blue;"><?= $data['nama_barang'];?> </a></td>
                <td class=" "><?= $data['spek'];?></td>
                <td class=" "><?= $data['ket_po'];?></td>
                <td class=" "><?= $data['qty_po'];?></td>
                <td class=" "><?= $data['nama_satuan'];?></td>
                <td class=" "><?= "Rp. ".number_format("$harga_po", 2, ",", "."); ?></td>
                <td class=" "><?= "Rp. ".number_format("$total_harga", 2, ",", "."); ?></td>
                <td class=" "><?= $data['nama_vendor'];?></td>
                <td class=" "><?= $data['status_req'];?></td>
                
                <td class="last">
                    <?php
                    if ($data['status_req'] == 'Menunggu Persetujuan Dir. HRD') {
                        echo '<a href="?form=ubahPembelian&id_po=' . $data["id_po"] . '" class="btn btn-info btn-sm">Ubah</a> | ';
                        echo '<a href="?form=hapusPembelian&id_po=' . $data["id_po"] . '" onclick="return confirm(\'Anda yakin ingin menghapus data ini?\')" class="btn btn-danger btn-sm">Hapus</a>';
                    } else {
                        echo '<button class="btn btn-secondary btn-sm" disabled>Selesai</button>';
                    }
                    ?>
                </td>
                <!-- <td class=" last"><a href="?form=ubahPembelian&id_po=<?= $data["id_po"]; ?>" class="btn btn-info btn-sm">Ubah </a> | <a href="?form=hapusPembelian&id_po=<?= $data["id_po"]; ?>" onclick="return confirm('Anda yakin ingin menghapus data ini?')" class="btn btn-danger btn-sm">Hapus </a>
                </td> -->
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
