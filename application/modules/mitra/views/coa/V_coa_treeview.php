<style>
body { background-color:#fafafa; font-family:'Open Sans';}
.container { margin:150px auto;}
    .treegrid-indent {
        width: 0px;
        height: 16px;
        display: inline-block;
        position: relative;
    }

    .treegrid-expander {
        width: 0px;
        height: 16px;
        display: inline-block;
        position: relative;
        left:-17px;
        cursor: pointer;
    }
</style>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script> 
<script src="<?php echo base_url()?>assets/custom_theme/tg/js/javascript.js"></script>
<!-- BEGIN CONTENT -->
 <!-- Server-side processing -->
 <section id="server-processing">
	<div class="row">
	    <div class="col-12">
	        <div class="card">
	            <div class="card-header">
	                <h4 class="card-title">List Chart of Account (Coa)</h4>
	                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
        			<div class="heading-elements">
                        
                        
	                    <ul class="list-inline mb-0">
                        <a href="<?php echo base_url(); ?>mitra/accounting/coa">
                                <button id="inlineForm" class="btn btn-warning btn-sm mr-1 mb-1 ladda-button"><i class="ft-list"></i>&nbsp; Show Table</button>
                            </a>
	                        <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
	                        <li><a data-action="reload"><i class="ft-rotate-cw"></i></a></li>
	                        <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
	                        <li><a data-action="close"><i class="ft-x"></i></a></li>
	                    </ul>
	                </div>
	            </div>
	            <div class="card-content collpase show">
	                <div class="card-body card-dashboard">
                        <table id="tree-table" class="table table-hover table-bordered">
                            <thead>
                                <tr>
                                    <th>Kode Coa</th>
                                    <th>Nama</th>
                                    <th>Induk</th>
                                    <th>Level</th>
                                    <th>D/K</th>
                                    <th>Klasifikasi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php echo $printview ?: ''?>
                            </tbody>

                        </table>
                        </div>
	            </div>
	        </div>
	    </div>
	</div>
</section>

