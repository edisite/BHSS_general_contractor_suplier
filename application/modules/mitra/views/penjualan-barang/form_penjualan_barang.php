<section>
    <?php echo $form->open(); ?>
	<div class="row">
		<div class="col-xl-9 col-lg-12">
			<div class="card">
				<div class="card-header bg-warning">
					<h4 class="card-title">Transaksi Penjualan</h4>
					<a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>

				</div>
				<div class="card-content collapse show">                       
					<div class="card-body">
                            <div class="form-group row">
                                    <label class="col-md-4 label-control">Project  </label>
                                    <div class="col-md-8">			                            
                                        <select class="form-control border-warning" id="spp_kode_project" name="spp_kode_project"></select>                
                                    </div>
                            </div>
                            <div class="form-group row">
                                    <label class="col-md-4 label-control">Barang  </label>
                                    <div class="col-md-8">			                            
                                    <select class="form-control border-warning" id="m_barang_id" name="m_barang_id" onchange="ChangeBarang()"></select>
                                                        
                                    </div>                                    
                            </div>    
                            <div class="form-group row">
                                    <label class="col-md-4 label-control">Nama Barang  </label>
                                    <div class="col-md-8">			                            
                                    <input type="text" class="form-control" id="temp_barang_id" name="temp_barang_id" value="" required readonly />
                                                        
                                    </div>                                    
                            </div>    
                            <div class="form-group row">
                                    <label class="col-md-4 label-control">Stok Barang  </label>
                                    <div class="col-md-8">			                            
                                    <input type="text" class="form-control persen" id="temp_barang_stok" name="temp_barang_stok" value="0" required readonly />
                                                        
                                    </div>                                    
                            </div>    
                            <div class="form-group row">
                                    <label class="col-md-4 label-control">  </label>
                                    <div class="col-md-8">			                            
                                                    
                                    <button type="button" id="btnAddBarang" class="btn btn-warning" onclick="addBarang()"><i class="icon-plus"></i> TAMBAH</button>
                                    </div>
                            </div>                    
					</div>
                    <div class="card-body">
                    <div class="form-group" id="tblInsert">
                            <div class="table-responsive">
                                <div class="col-md-12">
                                    <input type="hidden" name="jml_itemBarang" id="jml_itemBarang" value="0" />
                                    <table class="table table-striped table-bordered table-hover table-checkable order-column table-responsive{" id="default-table">
                                        <thead id="thead">
                                            <tr>
                                                <th> No </th>
                                                <!-- <th> Kode Barang </th> -->
                                                <th> Nama Barang </th>
                                                <th> Harga </th>
                                                <th height='40'> Qty </th>
                                                <th> Total </th>
                                            </tr>
                                        </thead>
                                        <tbody id="tbody">
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th colspan="3" class="text-right"> Sub Total </th>
                                                <th colspan="2">
                                                    <input type="text" class="form-control num num2" id="penjualan_subtotal" name="penjualan_subtotal" value="0" required readonly />
                                                </th>
                                            </tr>
                                            <tr>
                                                <th colspan="2" class="text-right"> Diskon </th>      <th>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control persen" id="order_diskon_input" name="order_diskon_input" value="0" onchange="sumDiscount()" required />
                                                        <span class="input-group-addon">
                                                            % 
                                                        </span>
                                                    </div>
                                                </th>                                                  
                                                <th colspan="2">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control num num2" id="order_diskon" name="order_diskon" value="0" onchange="sumSubTotal()" required readonly />
                                                        
                                                    </div>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th colspan="2" class="text-right"> Pajak </th>    
                                                <th>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control persen" id="order_tax_input" name="order_tax_input" value="0" onchange="sumTax()" required />
                                                        <span class="input-group-addon">
                                                            % 
                                                        </span>
                                                    </div>
                                                </th>                                                      
                                                <th colspan="2">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control num num2" id="order_tax" name="order_tax" value="0" onchange="sumSubTotal()" readonly required />
                                                        
                                                    </div>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th colspan="3" class="text-right"> Ongkir / Biaya</th>                                                       
                                                <th colspan="2">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control num num2" id="penjualan_biaya" name="penjualan_biaya" value="0" onchange="sumSubTotal()" required />
                                                        
                                                    </div>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th colspan="3" class="text-right"> Total </th>                                                       
                                                <th colspan="2">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control num num2 input-xl" id="penjualan_total" name="penjualan_total" value="0" onchange="sumSubTotal()" required readonly/>
                                                        
                                                    </div>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th colspan="3" class="text-right"> DP </th>                                                       
                                                <th colspan="2">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control num num2" id="penjulan_dp" name="penjulan_dp" value="0" onchange="sumDP()" required />
                                                        
                                                    </div>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th colspan="3" class="text-right"> Sisa Bayar </th>                                                       
                                                <th colspan="2">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control num num2 input-xl" id="penjualan_sisa_bayar" name="penjualan_sisa_bayar" value="0" onchange="sumSubTotal()" required  readonly/>
                                                        
                                                    </div>
                                                </th>
                                            </tr>

                                        </tfoot>
                                    </table>
                                </div>
                            </div>                         
                        </div>                         
                    </div>
                </div>
			</div>
		</div>
		<div class="col-xl-3 col-lg-12">
			<div class="card">
				<div class="card-header bg-info">
					<h4 class="card-title">Data Pelanggan</h4>
					<a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
				</div>
				<div class="card-content collapse show">
					<div class="card-body">
                        <div class="row">
                            <div class="form-group col-md-12 mb-12">
                                <label >Kategori</label>
                                <select name="kategori" class="form-control border-info">
                                    <option value="none" selected="" disabled="">
                                    Nama Kategori di ...</option>
                                    <option value="Bukalapak">CASH</option>
                                    <option value="PERUSAHAAN">PERUSAHAAN</option>
                                    <option value="DISTRIBUTOR">DISTRIBUTOR</option>
                                    <option value="CABANG">CABANG</option>
                                    <option value="WHATSAPP">WHATSAPP</option>
                                    <option value="SOCIAL MEDIA">SOCIAL MEDIA</option>
                                    <option value="MARKET PLACE">MARKET PLACE</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-12 mb-12">
                                <label>Nama Pelanggan</label>
                                <input type="text" id="projectinput2" class="form-control border-info" placeholder="" name="pel_nama" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-12 mb-12">
                                <label>No Handphone</label>
                                <input type="text" class="form-control border-info" placeholder="" name="pel_hp" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-12 mb-12">
                                <label for="projectinput2">Pelanggan <span class="label label-sm label-cyan">(detail)<span></label>
                                <textarea id="userinput8" rows="5" class="form-control border-info" name="pelanggan_detail" placeholder="..." required></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-12 mb-12">
                                <label for="projectinput2">No. Invoice</label>
                                <input type="text" id="projectinput2" class="form-control border-info" placeholder="" name="pel_invoice" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-12 mb-12">
                                <label for="projectinput2">Ekspedisi</label>
                                <input type="text" id="projectinput2" class="form-control border-info" placeholder="" name="pel_expedisi" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-12 mb-12">
                                <label for="projectinput2">Keterangan</label>
                                <textarea id="userinput8" rows="5" class="form-control border-info" name="pel_keterangan" placeholder="..." required></textarea>
                            </div>
                        </div>
					</div>
                    
				</div>
                
			</div>
		</div>
        <?php echo $form->messages(); ?>     
        <div class="col-md-12">
            <div class="card-content">                
                    <div class="card-body">
                        <div class="form-actions right">
                            <button type="button" class="btn btn-warning mr-1">
                                <i class="ft-x"></i> Cancel
                            </button>
                            <button type="submit" class="btn btn-primary">
                                <i class="fa fa-check-square-o"></i> Save
                            </button>
                        </div>
                    </div>
            </div>
        </div>
	</div>
        </form>
</section>
<!-- Basic Select2 end -->