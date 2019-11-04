<div class="row">
		<div class="col-md-12">
	        <div class="card">
	            <div class="card-header bg-cyan">
	                <h4 class="card-title" id="horz-layout-icons">Form Penerimaan Barang Masuk</h4>
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
                                                <label class="col-md-4 label-control">Tanggal Terima Barang</label>
                                                <div class="col-md-8">			                            
                                                    <input type="text" class="form-control pickadate-short-string" name="tanggal_terima" value="<?php echo date('d F, Y');?>" placeholder="" required data-validation-required-message="Nama Barang Wajib di isi" />                                                        
                                                </div>
		                                </div>
                                        <div class="form-group row">
                                                <label class="col-md-4 label-control">Nama Pemeriksa  </label>
                                                <div class="col-md-8">			                            
                                                <select class="form-control" id="m_karyawan_id" name="m_karyawan_id"></select>
                                                                    
                                                </div>
                                                
		                                </div>
                                        <div class="form-group row">
                                                <label class="col-md-4 label-control">Gudang</label>
                                                <div class="col-md-8">			                            
                                                <select class="form-control" id="m_gudang_id" name="m_gudang_id"></select>                                                                    
                                                </div>                                                
		                                </div>
                                        <div class="form-group row">
                                                <label class="col-md-4 label-control">No. Surat Jalan</label>
                                                <div class="col-md-8">			                            
                                                <input type="text" class="form-control" name="no_sj" id="no_sj" placeholder="Masukan Surat Jalan" />                                                          
                                                </div>                                                
		                                </div>
                                        <div class="form-group row">
                                                <label class="col-md-4 label-control">No PO  </label>
                                                <div class="col-md-8">			                            
                                                    <select class="form-control" id="po_select" name="po_select"></select>                
                                                </div>
		                                </div>                                        
                                        <hr>
                                        <div class="form-group row" id="tblInsert">
                                            <div class="col-md-12">
                                                <input type="hidden" name="jml_itemBarang" id="jml_itemBarang" value="0" />
                                                <table class="table table-striped table-bordered table-hover table-responsive" id="default-table">
                                                    <thead>
                                                        <tr>
                                                            <th> No </th>
                                                            <th> Kode Barang </th>
                                                            <th> Kode Project </th>
                                                            <th> Uraian</th>
                                                            <th> Satuan </th>
                                                            <th> PO. Qty </th>
                                                            <th> Barang Terima  </th>
                                                            <th> Kurang/Lebih  </th>
                                                            <th> Qty Masuk </th>
                                                            <th> Status </th>
                                                            <th> Action </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="tbody1">
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                                <label class="col-md-4 label-control">Catatan   </label>
                                                <div class="col-md-8">			                            
                                                    <textarea id="projectinput9" rows="5" class="form-control" name="penerimaan_barang_catatan" placeholder=""></textarea>                
                                                </div>
		                                </div>
                                </div>
                    
	                        <div class="form-actions right">
                            <a href="<?php echo base_url(); ?>mitra/PenerimaanBarang/Gudang">
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