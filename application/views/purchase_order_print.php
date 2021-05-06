<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/3th/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/3th/css/style.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/3th/css/invoice.min.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/3th/css/style-rtl.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/3th/css/style.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/3th/css/styles.css">
</head>

<body> 
    
    <div class="app-content container center-layout mt-2">
      <div class="content-wrapper">
        <div class="content-body">
            <section class="card">
	<div id="invoice-template" class="card-body">
		<!-- Invoice Company Details -->
		<div id="invoice-company-details" class="row">
                    <div class="col-md-12 col-sm-12 text-center">
                            <h3> PURCHASE ORDER</h3>
                    </div>
		</div>
		<div id="invoice-customer-details" class="row pt-2">
                    <div class="row col-md-12 col-sm-12">
                    <div class="col-md-7 col-sm-12 text-center text-md-left">
                        <ul class="px-0 list-unstyled">
                                <li class="text-bold-800"><strong>Kepada Yth :</strong></li>
                                <li class="text-bold-800">PT. BINTANG HARAPAN SUKSES SEJAHTERA</li>
                                <li>Jl.Letgen S Parman Kel. Telihan Kec.Bontang Barat</li>
                                <li>Bontang, Kalimantan</li>

                        </ul>
                    </div>
                    </div>
                    <div class="row col-md-12 col-sm-12">
                        <div class="col-md-6 col-sm-12 text-center text-md-left">
                            <table class="table-sm">
                                <tbody>                     
                                    <tr>
                                            <td width=30%>No. PO</td>
                                            <td>: <?php echo $po; ?></td>                                           
                                    </tr>
                                    <tr>
                                            <td width=30%>Pembuat</td>
                                            <td>: <?php echo $pembuat; ?></td>                                           
                                    </tr>
                                    <tr>
                                            <td width=30%>Alamat:</td>
                                            <td rowspan="2" valign="center" >: <?php echo $address; ?></td>                                           
                                    </tr>                                   
                                    <tr>
                                            <td width=30%></td>
                                                                                
                                    </tr>                                   
                                </tbody>
                            </table>
                        </div>
                        <div class="col-md-6 col-sm-12 text-center text-md-left">
                            <table class="table-sm">
                                <tbody>                     
                                    <tr>
                                            <td width=30%>Tanggal</td>
                                            <td>: <?php echo $order_tanggal; ?></td>                                           
                                    </tr>
                                    <tr>
                                            <td width=30%>Keterangan</td>
                                            <td>: <?php echo $order_keterangan; ?></td>                                           
                                    </tr>                                             
                                </tbody>
                            </table>
                        </div>
                    </div>
		</div>
		<!--/ Invoice Customer Details -->
                <br>
                <br>
		<!-- Invoice Items Details -->
		<div id="invoice-items-details" class="pt-2">
			<div class="row">
				<div class="table-responsive col-sm-12">
					<table class="table table-bordered table-sm">
					  <thead>
					    <tr>
                                                <th>No.</th>
                                                <th>Spesifikasi</th>
                                                <th class="text-right">Jumlah Unit</th>
                                                <?php
                                                    if($m_produk_kategori_id == "1"){
                                                        ?>
                                                            <th class="text-right">Lama Sewa</th>
                                                        <?php                                                        
                                                    }else{
                                                        ?>
                                                            <th class="text-right">Satuan</th>
                                                        <?php
                                                    }
                                                ?>

                                                <th class="text-right">Harga</th>
                                                <th class="text-right">Sub Total</th>                             
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      <th scope="row">1</th>
                                              <td><p class="text-sm"><?php echo $produkname; ?></p>
					      </td>
					      <td class="text-center"><?php echo $order_qty_unit; ?></td>
					      <td class="text-center"><?php echo $order_satuan; ?></td>
					      <td class="text-right"><?php echo $order_harga; ?></td>
					      <td class="text-right"><?php echo $order_total; ?></td>
					    </tr>                          
					  </tbody>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-md-7 col-sm-12 text-center text-md-left">
					
				</div>
				<div class="col-md-5 col-sm-12">		
					<div>
						<table class="table">
						  <tbody>
						  	<tr>
                                                            <td><strong>Total Harga</strong></td>
                                                            <td class="text-right"><strong>Rp <?php echo $order_total; ?></strong></td>
						  	</tr>					  	
		
						  </tbody>
						</table>
					</div>					
				</div>
			</div>
		</div>

		<!-- Invoice Footer -->
                <br>
		<div id="invoice-footer">
			<div class="row">
				<div class="col-md-6 col-sm-6">
					<div class="text-left">
						<p>Pemasok,</p>
						<p>PT.BINTANG HARAPAN SUKSES SEJAHTERA</p>
	                    <br><br><hr>
						<p class="text-muted text-left">Admin</p>
					</div>
				</div>
                <div class="col-md-6 col-sm-6">
					<div class="text-left">
						<p>Pembeli,</p>
                                                <p><?php echo ucwords($namapembeli).' ('.$category.')'; ?></p>
	                    <br><br><hr>
						<p class="text-muted text-left"></p>
					</div>
				</div>
                
		</div>
		<!--/ Invoice Footer -->
                
                

            </div>
            </section>
        </div>
      </div>
    </div>
    <!-- ////////////////////////////////////////////////////////////////////////////-->
    

</body>

</html>