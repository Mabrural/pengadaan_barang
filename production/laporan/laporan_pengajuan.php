<?php
session_start();

if (!isset($_SESSION["login"])) {
    header("Location: ../login.php");
    exit;
}
include '../fpdf/fpdf.php';
include '../koneksi.php';
$id_user = $_SESSION["id_user"];
// $tgl_pengajuan = $_POST['tgl_pengajuan'];


$pdf=new FPDF("P", "cm", "A4");

// Set ukuran kertas
$pdf->SetAutoPageBreak(false);
$pdf->SetDisplayMode('fullpage');

// Set margin
$pdf->SetMargins(1, 1, 1, 1);

// Set posisi tabel
$pdf->SetY(7);

// Tambahkan halaman baru
$pdf->AddPage();

$pdf->SetFont("Arial", "B", 14);
$pdf->Cell(19.5, 0.7, "DATA LAPORAN PENGAJUAN BARANG", 0,10,'C');
$pdf->ln();
$pdf->ln();

$pdf->SetFont("Arial", "", 10);
$pdf->Cell(1,0.8,'No', 1,0);
$pdf->Cell(5,0.8, 'Nama Barang', 1,0);
$pdf->Cell(6,0.8, 'Spec', 1,0);
$pdf->Cell(5,0.8, 'Desc', 1,0);
$pdf->Cell(2,0.8, 'Qty', 1,0);
$pdf->SetFont('Arial', '', 10);
$no = 1;
$pdf->ln();
$query = "SELECT * FROM barang JOIN user ON user.id_user=barang.id_user WHERE status='Sudah disetujui' AND barang.id_user=$id_user";
$tampil = mysqli_query($koneksi, $query);
// $nominal = $data['nominal_catatan'];

while ($hasil = mysqli_fetch_assoc($tampil)) {
    $pdf->Cell(1,0.8,$no, 1,0);
    $pdf->Cell(6,0.8,$hasil['nama_barang'],1,0);
    $nominal = $hasil['spec'];
    $nominal = $hasil['deskripsi'];
    $nominal = $hasil['qty'];
    $pdf->Cell(7,0.8,"Rp. ".number_format("$nominal", 2, ",", "."),1,0);
    $pdf->ln();
    $no++;
}
$pdf->Output();
// $pdf->Output("laporan_mahasiswa.pdf", "I");


?>

