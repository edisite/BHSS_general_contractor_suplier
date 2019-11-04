<div class="row">
		<div class="col-md-12">
	        <div class="card">
	            <div class="card-header bg-cyan">
	                <h4 class="card-title" id="horz-layout-icons">Form Purchase Order</h4>
	                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
        			<div class="heading-elements">
	                    <ul class="list-inline mb-0">
	                        <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
	                        <li><a data-action="reload"><i class="ft-rotate-cw"></i></a></li>
	                        <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
	                        <li><a data-action="close"><i class="ft-x"></i></a></li>
	                    </ul>
	                </div>
	            </div>
	            <div class="card-content collpase show">
                        <!-- <form id="formAdd" class="form-horizontal"> -->
                        <?php echo $form->open(); ?> 
                            <div class="card-body">    
                                <div class="form-body">
                                    <?php echo $form->messages(); ?>
                                    <div class="form-group row">
                                            <label class="col-md-4 label-control">Tanggal Order</label>
                                            <div class="col-md-8">			                            
                                                <input type="text" class="form-control pickadate-short-string" name="tanggal_order" value="<?php echo date('d F, Y');?>" placeholder="" required/>                                                  
                                            </div>
                                    </div>
                                    <!-- <div class="form-group row">
                                            <label class="col-md-4 label-control">Nama Sales</label>
                                            <div class="col-md-8">			                            
                                                <input type="text" class="form-control" name="nama_sales" value="" placeholder="" required>                                                        
                                            </div>
                                    </div> -->
                                    <div class="form-group row">
                                            <label class="col-md-4 label-control">Nama Supplier  </label>
                                            <div class="col-md-8">			                            
                                                <select class="form-control" id="m_mitra_supplier_select" name="m_mitra_supplier_select" required></select>                
                                            </div>
                                    </div>
                                    <hr>
                                    <div class="form-group row">
                                            <label class="col-md-4 label-control">Surat Permintaan Pembelian</label>
                                            <div class="col-md-8">			                            
                                                <select class="form-control" id="spp_project" name="spp_project" required></select>                
                                            </div>
                                    </div>
                                    <div class="form-group row">
                                            <label class="col-md-4 label-control">Barang</label>
                                            <div class="col-md-8">			                            
                                                <select class="form-control" id="m_barang_id" name="m_barang_id"></select>                
                                            </div>
                                    </div>
                                    <div class="form-group row">
                                                <label class="col-md-4 label-control">  </label>
                                                <div class="col-md-8">			                            
                                                               
                                                <button type="button" id="btnAddPO" class="btn btn-info" onclick="addPO()"><i class="icon-plus"></i> TAMBAH</button>
                                                </div>
                                    </div> 
                                </div>
                                <hr>
                                <div class="form-group" id="tblInsert">
                                            <div class="col-md-12 table-responsive">
                                                <input type="hidden" name="jml_itemBarang" id="jml_itemBarang" value="0" />
                                                <table class="table table-striped table-bordered table-hover table-checkable order-column" id="default-table">
                                                    <thead id="thead1">
                                                        <tr>
                                                            <th> No </th>
                                                            <th> Kode Barang </th>
                                                            <th> Uraian dan Spesifikasi Barang </th>
                                                            <th> Qty </th>
                                                            <th> Satuan </th>
                                                            <th> Harga Satuan </th>
                                                            <th> Total </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="tbody1">
                                                    </tbody>
                                                    <tfoot>
                                                        <tr>
                                                            <th colspan="6" class="text-right"> Sub Total </th>
                                                            <th>
                                                                <input type="text" class="form-control num num2" id="order_subtotal" name="order_subtotal" value="0" required readonly />
                                                            </th>
                                                        </tr>
                                                        <tr>
                                                            <th colspan="5" class="text-right"> Discount </th>
                                                            <th>
                                                                <div class="input-group">
                                                                    <input type="text" class="form-control persen" id="order_diskon_input" name="order_diskon_input" value="0" onchange="sumDiscount()" required />
                                                                    <span class="input-group-addon">
                                                                        % 
                                                                    </span>
                                                                </div>
                                                            </th>
                                                            <th>
                                                                <div class="input-group">
                                                                    <input type="text" class="form-control num num2" id="order_diskon" name="order_diskon" value="0" onchange="sumSubTotal()" required readonly/>
                                                                    
                                                                </div>
                                                            </th>
                                                        </tr>
                                                        <tr>
                                                            <th colspan="5" class="text-right"> Tax </th>
                                                            <th>
                                                                <div class="input-group">
                                                                    <input type="text" class="form-control persen" id="order_tax_input" name="order_tax_input" value="0" onchange="sumTax()" required />
                                                                    <span class="input-group-addon" style="">
                                                                        % 
                                                                    </span>
                                                                </div>
                                                            </th>
                                                            <th>
                                                                <div class="input-group">
                                                                    <input type="text" class="form-control num num2" id="order_tax" name="order_tax" value="0" onchange="sumSubTotal()" required readonly />
                                                                   
                                                                </div>
                                                            </th>
                                                        </tr>
                                                        <tr>
                                                            <th colspan="6" class="text-right"> Other Cost </th>
                                                            <th>
                                                                <div class="input-group">
                                                                    <input type="text" class="form-control num2" id="order_other_cost" name="order_other_cost" value="0" onchange="sumSubTotal()" required />                                                                    
                                                                </div>
                                                            </th>
                                                        </tr>
                                                        <tr>
                                                            <th colspan="6" class="text-right"> Total </th>
                                                            <th>
                                                                <input type="text" class="form-control money" id="order_total" name="order_total" value="0" required readonly />
                                                            </th>
                                                        </tr>
                                                    </tfoot>
                                                </table>
                                            </div>
                                        </div>
                                
                                <div class="form-actions right">
                                    <a href="<?php echo base_url(); ?>mitra/PurchaseOrder">
                                    <button type="button" class="btn btn-warning mr-1" onclick="reset()">
                                        <i class="ft-x"></i> Cancel
                                    </button>
                                    </a>
                                        <button type="submit" class="btn btn-primary" id="barangbtn">
                                        <i class="fa fa-check-square-o"></i> Save
                                    </button>
                                </div>
                            </div>
	                    </form>
                    </div>
	            </div>
	        </div>
	    </div>
	</div>
