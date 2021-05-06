<!-- ======= Hero Section ======= -->
<section class="d-flex align-items-center">
    <div class="container">
    </div>
</section>
    <!-- ////////////////////////////////////////////////////////////////////////////-->
<div class="app-content content">
    <div class="content-wrapper">
        <div class="content-body">
            <section class="flexbox-container">
                <div class="container">
                <!--<div class="col-12 d-flex align-items-center justify-content-center">-->
                    <div class="col-md-12">
                        <div class="card border-lighten-3 m-0">
                            <div class="card-content">                               
                                <div class="row">
                                    <div class="col-12">
                                        <div class="card">
                                                                <?php echo $form->messages(); ?>    
                                            <div class="card-header">
                                                <!-- <h4 class="card-title">Pesanan Anda</h4>   -->
                                                <span style="font-family: Baloo, cursive;font-size: 25px;">Pesanan Anda </span>                                              
                                            </div>
                                            <div class="card-content collapse show">                                                
                                                <div>
                                                    <table class="table table-responsive table-hover table-sm">
                                                        <thead>
                                                            <tr>
                                                                <th width="3%">No</th>     
                                                                <th width="10%">Tanggal</th>                                      
                                                                <th width="50%">Spesifikasi</th>
                                                                <th width="10%">Total Amount</th>
                                                                <th width="15%" class="text-center">Status</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <?php echo $data ?: ''; ?>
                                                        </tbody>
                                                    </table>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>                                
                            </div>
                        </div>
                    
                    </div>
                <!--</div>-->
                </div>
                    
                
            </section>
                          
        </div>
    </div>
</div>
