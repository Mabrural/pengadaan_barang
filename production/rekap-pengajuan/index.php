<?php
	$content = "
	<html> 
	<body>
    <h1>REKAP DATA LAPORAN PENGAJUAN</h1>
		
	</body>
	</html>
	";

	require __DIR__.'/html2pdf_v5.2-master/vendor/autoload.php';
	use Spipu\Html2Pdf\Html2Pdf;
	$html2pdf = new Html2Pdf('P','A4','fr', true, 'UTF-8', array(35, 15, 15, 15), false); 
	$html2pdf->writeHTML($content);
	$html2pdf->output('laporan.pdf');
?>