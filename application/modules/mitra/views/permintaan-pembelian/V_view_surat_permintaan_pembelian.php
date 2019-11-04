<div class="row match-height">		
    <div class="col-xl-12 col-lg-12">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Details - Surat Permintaan Pembelian</h4>                   
                <span class="float-right"><button class="btn btn-danger btn-block btn-glow text-uppercase p-1 float-right">Status SSP Selesai</button></span>            
            </div>
            <div class="card-content">
                    
                <div class="card-body">
                    <div class="card-text">
                        <p>Description SSP : </p>
                        <dl class="row">
                            <dt class="col-sm-3 text-right">Nomor SSP</dt>
                            <dd class="col-sm-9"><?php echo $titlessp[0]->permintaan_pembelian_nomor; ?></dd>
                        </dl>
                        <dl class="row">
                            <dt class="col-sm-3 text-right">Tanggal Permintaan</dt>
                            <dd class="col-sm-9"><?php echo $titlessp[0]->permintaan_pembelian_tanggal; ?></dd>
                        </dl>
                        <dl class="row">
                            <dt class="col-sm-3 text-right">Tanggal Dibutuhkan</dt>
                            <dd class="col-sm-9"><?php echo $titlessp[0]->permintaan_pembelian_tanggal_dibutuhkan; ?></dd>
                        </dl>
                        <dl class="row">
                            <dt class="col-sm-3 text-right">Catatan Permintaan Pembelian</dt>
                            <dd class="col-sm-9"><?php echo $titlessp[0]->permintaan_pembelian_catatan; ?></dd>
                        </dl>
                        <dl class="row">
                            <dt></dt>
                            <dd class="col-sm-9 ml-auto"></dd>
                        </dl>
                        <dl class="row">
                            <dt class="col-sm-3 text-right text-truncate">Project</dt>
                            <dd class="col-sm-9"><?php echo $titlessp[0]->permintaan_pembelian_nomor; ?></dd>
                        </dl>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover mb-0">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Kode Barang</th>
                                    <th>Nama Barang</th>
                                    <th>Order Qty</th>
                                    <th>Realisasi Qty</th>
                                    <th>+(-)</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php 
                                    echo $bodyssp;
                                ?>
                                <tr>
                                    <td class="text-truncate"><a href="#">INV-001001</a></td>
                                    <td class="text-truncate">Elizabeth W.</td>
                                    <td class="text-truncate"><span class="tag tag-default tag-success">Paid</span></td>
                                    <td class="text-truncate">10/05/2016</td>
                                    <td class="text-truncate">$ 1200.00</td>
                                </tr>
                                <tr>
                                    <td class="text-truncate"><a href="#">INV-001012</a></td>
                                    <td class="text-truncate">Andrew D.</td>
                                    <td class="text-truncate"><span class="tag tag-default tag-success">Paid</span></td>
                                    <td class="text-truncate">20/07/2016</td>
                                    <td class="text-truncate">$ 152.00</td>
                                </tr>
                                <tr>
                                    <td class="text-truncate"><a href="#">INV-001401</a></td>
                                    <td class="text-truncate">Megan S.</td>
                                    <td class="text-truncate"><span class="tag tag-default tag-success">Paid</span></td>
                                    <td class="text-truncate">16/11/2016</td>
                                    <td class="text-truncate">$ 1450.00</td>
                                </tr>
                                <tr>
                                    <td class="text-truncate"><a href="#">INV-01112</a></td>
                                    <td class="text-truncate">Doris R.</td>
                                    <td class="text-truncate"><span class="tag tag-default tag-warning">Overdue</span></td>
                                    <td class="text-truncate">11/12/2016</td>
                                    <td class="text-truncate">$ 5685.00</td>
                                </tr>
                                <tr>
                                    <td class="text-truncate"><a href="#">INV-008101</a></td>
                                    <td class="text-truncate">Walter R.</td>
                                    <td class="text-truncate"><span class="tag tag-default tag-warning">Overdue</span></td>
                                    <td class="text-truncate">18/05/2016</td>
                                    <td class="text-truncate">$ 685.00</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


