<?php

// $id_mhs = $_SESSION["id_mhs"];

?>
    <div class="x_panel">
      <div class="x_title">
        <h2>Table Pengajuan Barang <small></small></h2>
        <a href="" class="btn btn-primary">Form Pengajuan</a>
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
                <th class="column-title">INV ID </th>
                <th class="column-title">Nama Barang </th>
                <th class="column-title">Spec </th>
                <th class="column-title">Desc </th>
                <th class="column-title">Qty </th>
                <th class="column-title">Date in </th>
                <th class="column-title">Unit Price </th>
                <th class="column-title">Vendor </th>
                <th class="column-title">Waranty </th>
                <th class="column-title">Renewal </th>
                <th class="column-title">Condition </th>
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
              		$query = "SELECT * FROM pengadaan_barang";
              		$tampil = mysqli_query($koneksi, $query);
              		while ($data = mysqli_fetch_assoc($tampil)) {
              		
              		

              	 ?>
                <td class=" "><?= $no++;?></td>
                <td class=" "><?= $data['inv_id'];?></td>
                <td class=" "><?= $data['nama_barang'];?> </td>
                <td class=" "><?= $data['spec'];?></td>
                <td class=" "><?= $data['desc'];?></td>
                <td class=" "><?= $data['qty'];?></td>
                <td class=" "><?= $data['date_in'];?></td>
                <td class=" "><?= $data['unit_price'];?></td>
                <td class=" "><?= $data['vendor'];?></td>
                <td class=" "><?= $data['waranty'];?></td>
                <td class=" "><?= $data['renewal'];?></td>
                <td class=" "><?= $data['condition'];?></td>
                <td class=" last"><a href="#">Ubah | Hapus</a>
                </td>
              </tr>
              
           
            </tbody>
           <?php } ?>
          </table>
        </div>
				
			
      </div>
    </div>
