<div class="row">
		<div class="col-md-12">
	        <div class="card">
	            <div class="card-header bg-cyan">
	                <h4 class="card-title" id="horz-layout-icons">Form Permintaan Pembelian Barang</h4>
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
                                                <label class="col-md-4 label-control">Tanggal Permintaan Pembelian</label>
                                                <div class="col-md-8">			                            
                                                    <input type="text" class="form-control pickadate-short-string" name="tanggal_permintaan" value="<?php echo date('d F, Y');?>" placeholder="" required data-validation-required-message="Nama Barang Wajib di isi" />                                                        
                                                </div>
		                                </div>
                                        <div class="form-group row">
                                                <label class="col-md-4 label-control">Tanggal Dibutuhkan</label>
                                                <div class="col-md-8">			                            
                                                    <input type="text" class="form-control pickadate-short-string" name="tanggal_dibutuhkan" value="<?php echo date('d F, Y');?>" placeholder="" required data-validation-required-message="Nama Barang Wajib di isi" />                                                        
                                                </div>
		                                </div>
                                        <div class="form-group row">
                                                <label class="col-md-4 label-control">Catatan Permintaan Pembelian  </label>
                                                <div class="col-md-8">			                            
                                                    <textarea id="projectinput9" rows="5" class="form-control" name="permintaan_pembelian_catatan" placeholder=""></textarea>                
                                                </div>
		                                </div>
                                        <div class="form-group row">
                                                <label class="col-md-4 label-control">Project  </label>
                                                <div class="col-md-8">			                            
                                                    <select class="form-control" id="spp_kode_project" name="spp_kode_project"></select>                
                                                </div>
		                                </div>
                                        <div class="form-group row">
                                                <label class="col-md-4 label-control">Barang  </label>
                                                <div class="col-md-8">			                            
                                                <select class="form-control" id="m_barang_id" name="m_barang_id"></select>
                                                                    
                                                </div>
                                                
		                                </div>
                                        <div class="form-group row">
                                                <label class="col-md-4 label-control">  </label>
                                                <div class="col-md-8">			                            
                                                               
                                                <button type="button" id="btnAddBarang" class="btn btn-info" onclick="addBarang()"><i class="icon-plus"></i> TAMBAH</button>
                                                </div>
		                                </div>
                                        
                                        <hr>
                                        <div class="form-group row" id="tblInsert">
                                            <div class="col-md-12">
                                                <input type="hidden" name="jml_itemBarang" id="jml_itemBarang" value="0" />
                                                <table class="table table-striped table-bordered table-hover table-checkable order-column" id="default-table2">
                                                    <thead>
                                                        <tr>
                                                            <th> No </th>
                                                            <th> Kode Barang </th>
                                                            <th> Kode Project </th>
                                                            <th> Uraian dan Spesifikasi Barang</th>
                                                            <th> Qty </th>
                                                            <th> Satuan </th>
                                                            <th> Action </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="tbody1">
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                </div>
                    
	                        <div class="form-actions right">
                            <a href="<?php echo base_url(); ?>mitra/PermintaanPembelian/gudang">
	                            <button type="button" class="btn btn-warning mr-1" onclick="reset()">
	                            	<i class="ft-x"></i> Cancel
	                            </button>
                                </a>
                                    <button type="submit" class="btn btn-primary" id="barangbtn">
	                                <i class="fa fa-check-square-o"></i> Save
	                            </button>
	                        </div>
	                    </form>

	                </div>
	            </div>
	        </div>
	    </div>
	</div>


