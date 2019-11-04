<?php echo $form->open(); ?>
<div class="row">
		<div class="col-md-12">
	        <div class="card">
	            <div class="card-header bg-cyan">
	                <h4 class="card-title" id="horz-layout-icons">Form Jurnal Entry</h4>
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

                    <div class="card-body">  
                            <div class="form-body">
                                <?php echo $form->messages(); ?>       
                                <input type="hidden" id="url" value="Trans/Jurnal/postData">
                                <div class="form-group row" hidden="true">
                                    <label class="control-label col-md-4  label-control">ID Barang (Auto)
                                        <span class="required"> * </span>
                                    </label>
                                    <div class="col-md-8">
                                        <div class="input-icon right">
                                            <i class="fa"></i>
                                            <input type="text" class="form-control" name="kode" readonly /> </div>
                                    </div>
                                </div>
                                <input type="hidden" id="url_data" value="Trans/Jurnal-Umum">
                                <input type="hidden" name="order_status" value="0">
                                <input type="hidden" name="order_type" value="1">

                                <div class="form-group row">
                                        <label class="col-md-3 label-control">Tanggal
                                        <span class="required"> * </span>
                                        </label>
                                        <div class="col-md-8">			                            
                                            <input type="text" class="form-control pickadate-short-string" name="jurnal_tanggal" value="<?php echo date('d F, Y');?>" placeholder="" required data-validation-required-message="Tanggal Wajib di isi" />                                              
                                        </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 label-control">Nomor Bukti
                                        <span class="required"> * </span>
                                    </label>
                                    <div class="col-md-8">                           
                                            <input type="text" class="form-control" name="jurnal_no_bukti" required /> </div>
                                    </div>
                                </div>
                            
                                <div class="form-group row">
                                    <label class="col-md-3 label-control">Uraian
                                        <span class="required"> * </span>
                                    </label>
                                    <div class="col-md-8">
                                                            
                                            <input type="text" class="form-control" name="jurnal_keterangan" required />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 label-control">Tipe Jurnal
                                        <span class="required"> * </span>
                                    </label>
                                    <div class="col-md-8">
                                            <select name="jurnal_tipe" class="form-control">
												<option value="1">1 - Jurnal Umum</option>
												<option value="2">2 - Jurnal Pembelian</option>
												<option value="3">3 - Jurnal Penjualan</option>
												<option value="4">4 - Jurnal Penerimaan Kas</option>
												<option value="5">5 - Jurnal Pengeluaran Kas</option>
												<option value="6">6 - Jurnal Penyesuaian</option>
												<option value="7">7 - Jurnal Penutup</option>
												<option value="8">8 - Jurnal Pembalik</option>	
											</select>
                                            
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 label-control">Project 
                                        <span class="required"> * </span> </label>
                                    <div class="col-md-8">			                            
                                        <select class="form-control" id="spp_kode_project" name="spp_kode_project"></select>             
                                    </div>
                                </div>  
                                <div class="form-group" id="tblInsert">
                                    <div class="col-md-12">
                                        <input type="hidden" name="jml_itemBarang" id="jml_itemBarang" value="1" />
                                        <table class="table" id="default-table2">
                                            <thead>
                                                <tr>
                                                    <th> No </th>
                                                    <th> CoA</th>
                                                    <th> DEBET </th>
                                                    <th> KREDIT</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody id="tbody1">
                                                <tr id="detail1" class="form-group">
                                                    <td id="td11">
                                                    1
                                                    </td>
                                                    <td id="td21">
                                                        <select class="select2 form-control" name="kodecoa[]" id="kodecoa1" onchange="checkCoa('1')" required> </select>
                                                    </td>
                                                    <td id="td31">
                                                        <input type="text" class="form-control num num2" name="itemdebet[]" placeholder="DEBET" id="itemdebet1"  onchange="sumSubDebet()" value="0" required />
                                                    </td>
                                                    <td id="td41">
                                                        <input type="text" class="form-control num num2" name="itemkredit[]" placeholder="KREDIT" id="itemkredit1"  onchange="sumSubKredit()" value="0" required />
                                                    </td>
                                                    <td id="td51">
                                                        <button type="button" id="removeBtn1" class="btn btn-danger" onclick="removeJurnal('1')">
                                                            <i class="icon-close"></i>
                                                        </button>
                                                    </td>
                                                </tr>
                                          
                                            </tbody>
                                            <div class="form-group row">       
                                                <div class="col-md-12">                                       		                               
                                                    <button type="button" id="btnAddBarang" class="btn btn-primary" onclick="addJurnal()" title="Tambah Jurnal"><i class="icon-plus"></i> </button>
                                                </div>
                                            </div>
                                            <tfoot>
                                                <tr id="detail1" class="bg-cyan bg-accent-4">
                                                    <td id="td11" colspan="2">
                                                    
                                                        <label class="bg-success" id="idin_balance"><span>Balance</span></label>
                                                        <label  class="bg-danger" id="idno_balance"><span>No Balance</span></label>
                                                    
                                                                                    
                                                    </td>
                                                    <td id="td31">
                                                        <input type="text" class="form-control num num2" name="thasildebet" placeholder="DEBET" id="thasildebet"  onchange="sumSubDebet()" value="0" disabled  />
                                                    </td>
                                                    <td id="td41">
                                                        <input type="text" class="form-control num num2" name="thasilkredit" placeholder="KREDIT" id="thasilkredit"  onchange="sumSubKredit()" value="0" disabled />
                                                    </td>
                                                    <td id="td51">
                                                        
                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                              
                            </div>
                    </div>
                   
                    <div class="form-actions center">
                                <button type="submit" class="btn btn-primary" id="submit"> <i class="fa fa-check-square-o"></i> Submit </button>
                                <a href="<?php echo base_url();?>mitra/jurnal">
                                <button type="button" class="btn btn-default reset" onclick="reset()">Reset</button>
                    </div>
                </div>

				
	            
	        </div>
	    </div>
</div>
</form>