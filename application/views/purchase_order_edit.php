<!--<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Invoice Template - Robust - Responsive Bootstrap 4 Admin Dashboard Template for Web Application</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/invoice.css">
    <link rel="stylesheet" href="assets/css/invoice.min.css">
    <link rel="stylesheet" href="assets/css/style-rtl.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body> fixed-top
    -->

    <!-- ////////////////////////////////////////////////////////////////////////////-->

      <!-- ======= Hero Section ======= -->
  <section class="d-flex align-items-center">
    <div class="container">
    </div>
  </section><!-- End Hero -->
    <div class="app-content container center-layout mt-2">
        <?php echo $form->messages(); ?>   
        <div class="content-wrapper">
            <form action="<?php echo base_url(); ?>account/OrderUpdate" method="post">
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
                                                <td> <textarea name="keterangan" rows="3" cols="50" class="form-control"><?php echo $order_keterangan; ?></textarea> </td>                                           
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
                                                                <!--<th class="text-right">Satuan</th>-->
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
                                                  <td class="text-center"><input type="text" name="order_qty_unit" class="form-control" value="<?php echo $order_qty_unit; ?>" <?php echo $linedisable; ?>></td>
                                                  <?php
                                                        if($m_produk_kategori_id == "1"){
                                                            ?>                                          
                                                                <td class="text-center"><input type="text" name="order_lama_sewa" class="form-control" value="<?php echo $order_satuan; ?>" <?php echo $linedisable; ?>></td>
                                                            <?php                                                        
                                                        }else{
                                                            ?>
                                                                <!--<th class="text-right">Satuan</th>-->
                                                            <?php
                                                        }
                                                    ?>
                                                  <td class="text-right"><input type="text" class="form-control" value="<?php echo $order_harga; ?>" readonly></td>
                                                  <td class="text-right"><input type="text" class="form-control" value="<?php echo $order_total; ?>" readonly></td>
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
            <br>
            <input type="hidden" name="order_id" value="<?php echo $order_id; ?>">
            <input type="hidden" name="m_produk_id" value="<?php echo $m_produk_id; ?>">
            <input type="hidden" name="m_produk_kategori_id" value="<?php echo $m_produk_kategori_id; ?>">
            <input type="hidden" name="order_qty_sebelumnya" value="<?php echo $order_qty_unit; ?>">
            <div class="text-center">
            <?php
            if($buttonedit == "1"){
               
                ?>
                    <button type="submit" class="btn btn-success btn-sm center"><?php echo $buttonvalue; ?></button>
                <?php                                                        
            }else{
                ?>
                <a href="<?php echo base_url(); ?>account/OrderEdit/<?php echo $order_id; ?>/edit" class="btn btn-info btn-sm ?>">EDIT</a>
                <?php
            }
            
            ?>               
                <a href="<?php echo base_url(); ?>account/OrderKirimData/<?php echo $order_id; ?>" class="btn btn-info btn-sm <?php echo $kirimdisable; ?>">KIRIM DATA</a>
            </div>
            </form>
        </div>
    </div>
    <!-- ////////////////////////////////////////////////////////////////////////////-->
    <footer class="footer footer-static footer-light navbar-border">
      <p class="clearfix blue-grey lighten-2 text-sm-center mb-0 px-2"><span class="float-md-left d-block d-md-inline-block"><br></p>
    </footer>
    
<!--    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>-->
