    <div class="row">
            <div class="col-md-12">
                <div class="card">                
                    <div class="card-content collapse show">
                        <div class="card-body">                            
                                <div class="form-body">								

                                    
                                        <div class="row">
                                            <div class="col-md-3">
                                                <h4>From</h4>
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text"><i class="ft-calendar"></i></span>
                                                    </div>
                                                    <input type="text" id="date_from" name="date_from" value="<?php echo date('d F, Y'); ?>" class="form-control pickadate-short-string" required />
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <h4>To</h4>
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text"><i class="ft-calendar"></i></span>
                                                    </div>
                                                    <input type="text" id="date_to" name="date_to" value="<?php echo date('d F, Y'); ?>" class="form-control pickadate-short-string" required/>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <h4>Project</h4>
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text"><i class="ft-box"></i></span>
                                                    </div>
                                                    <select class="form-control" id="spp_kode_project" name="spp_kode_project" onclick="selectList_project()"></select>  
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-2">
                                                <h4>-</h4>
                                                <div class="input-group">
                                                <button type="submit" class="btn btn-success" onclick='searchMitra_DataJurnal()'>
                                                    <i class="fa fa-check-square-o"></i> Cari
                                                </button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>     
                                </div>
                        </div>
                    </div>

                    
                    
                </div>
            </div>
    </div>
    <!-- Server-side processing -->
    <section id="server-processing">
	<div class="row">
	    <div class="col-12">
	        <div class="card">
	            <div class="card-content collpase show">
	                <div class="card-body card-dashboard">
                        <table class="table table-striped table-bordered server-side" id="mitraDataJurnal">
                            <thead>
                                <tr>
                                    <th> No </th>
                                    <th> Tanggal </th>
                                    <th> Project </th>
                                    <th> Jurnal ID </th>
                                    <th> Uraian</th>
                                    <th> CoA</th>
                                    <th class="text-right"> Debet </th>
                                    <th class="text-right"> Kredit </th>
                                </tr>
                            </thead>
                            <!-- <tfoot>
                                <tr> 
                                    <th colspan="5"> Total </th>
                                    <th> Debet </th>
                                    <th> Kredit </th>
                                </tr>
                            </tfoot> -->
                        </table>
                    </div>
	            </div>
	        </div>
	    </div>
	</div>
</section>