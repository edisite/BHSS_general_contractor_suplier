    <div class="row">
            <div class="col-md-12">
                <div class="card">                
                    <div class="card-content collapse show">
                        <div class="card-body">                            
                                <div class="form-body">								

                                    
                                        <div class="row">
                                            <div class="col-md-4">
                                                <p>From</p>
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text"><i class="ft-calendar"></i></span>
                                                    </div>
                                                    <input type="text" id="date_from" name="date_from" value="<?php echo date('d F, Y'); ?>" class="form-control pickadate-short-string" required />
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <p>To</p>
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text"><i class="ft-calendar"></i></span>
                                                    </div>
                                                    <input type="text" id="date_to" name="date_to" value="<?php echo date('d F, Y'); ?>" class="form-control pickadate-short-string" required/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <p>Project</p>
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text"><i class="ft-box"></i></span>
                                                    </div>
                                                    <select class="form-control" id="spp_kode_project" name="spp_kode_project" onclick="selectList_project()"></select>  
                                                </div>
                                            </div>
                                            <div class="col-md-5">
                                                <p>CoA</p>
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text"><i class="ft-crosshair"></i></span>
                                                    </div>
                                                    <select class="form-control" id="kode_coa" name="kode_coa" onclick="selectList2_coa(kode_coa)"></select>  
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-2">
                                                <p>-</p>
                                                <div class="input-group">
                                                <button type="submit" class="btn btn-success" onclick='searchmitra_bukubesar_report()'>
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
	<div class="row">
	    <div class="col-12">
	        <div class="card">
	            <div class="card-content collpase show">
                    <div id="mitra_bukubesar_report">
                    </div>
	            </div>
	        </div>
	    </div>
	</div>