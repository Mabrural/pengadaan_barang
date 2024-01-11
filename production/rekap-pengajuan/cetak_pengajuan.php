<?php
require __DIR__ . '/vendor/autoload.php';
use Spipu\Html2Pdf\Html2Pdf;
$id_user = $_GET["id_user"];
// Buat koneksi ke database
$koneksi = new mysqli("localhost", "root", "78789898", "sistem");
$tgl_pengajuan = $_GET['tgl_pengajuan'];


// Lakukan query untuk mendapatkan data pengajuan barang
$query = "SELECT * FROM barang JOIN user ON user.id_user=barang.id_user WHERE status='Sudah disetujui' AND barang.id_user=$id_user AND barang.tgl_pengajuan='$tgl_pengajuan'";
$tampil = mysqli_query($koneksi, $query);

// Buat kode HTML untuk tabel pengajuan barang
$content = "
<html>
<head>
<title>Data Pengajuan Barang</title>
</head>
<body>
<h1>Data Pengajuan Barang</h1>
<h2>Data Pengajuan Barang yang Sudah Disetujui</h2>
<table class='table table-striped jambo_table bulk_action'>
  <thead>
    <tr class='headings'>
      <th class='column-title'>No.</th>
      <th class='column-title'>Kode Pengajuan</th>
      <th class='column-title'>Nama Barang</th>
      <th class='column-title'>Spec</th>
      <th class='column-title'>Desc</th>
      <th class='column-title'>Qty</th>
      <th class='column-title'>Tanggal Pengajuan</th>
      <th class='column-title'>Nama Pemohon</th>
      <th class='column-title'>Approval 1</th>
      <th class='column-title'>Approval 2</th>
      <th class='column-title'>Status</th>
    </tr>
  </thead>
  <tbody>";

while ($data = mysqli_fetch_assoc($tampil)) {
  $content .= "
    <tr class='even pointer'>
      <td class=''>$no++</td>
      <td class=''>{$data['kode_pengajuan']}</td>
      <td class=''>{$data['nama_barang']}</td>
      <td class=''>{$data['spek']}</td>
      <td class=''>{$data['deskripsi']}</td>
      <td class=''>{$data['qty']}</td>
      <td class=''>" . date('d-M-Y', strtotime($data['tgl_pengajuan'])) . "</td>
      <td class=''><strong>{$data['username']}</strong></td>
      <td class=''>{$data['acc1']}</td>
      <td class=''>{$data['acc2']}</td>
      <td class='' style='color: " . ($data['status'] == 'Menunggu Persetujuan' ? '#b58709' : ($data['status'] == 'Sedang diproses' ? '#b58709' : ($data['status'] == 'Sudah disetujui' ? '#14a664' : '#a62f26'))) . ";'>
        <strong>{$data['status']}</strong>
      </td>
    </tr>";
}

$content .= "
  </tbody>
</table>
<br>
<p>Dicetak pada tanggal: <b>" . date("d-m-Y") . "</b>, pukul <b>" . date("H:i:s") . "</b></p>
<br>
<p>
  <b>Disetujui oleh,</b>
  <br>
  [Nama Penandatangan]
  <br>
  [Jabatan Penandatangan]
</p>
</body>
</html>";

// Buat objek HTML2PDF
$html2pdf = new Html2Pdf('P', 'A4', 'fr', true, 'UTF-8', array(15, 15, 15, 15), false);

	// Tuliskan kode HTML ke PDF
	$html2pdf->writeHTML($content);

	// Keluarkan PDF
	$html2pdf->output('Data Pengajuan Barang.pdf', 'D');
?>