<div class="app-content content">
      <div class="content-wrapper">
            <div class="content-detached content-left bordered">
                <div class="content-body">
                    <section class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-head">
                                        <div class="card-header">
                                        <h4 class="card-title">Monitoring Permintaan Modal</h4>                                  
                                        </div>

                                    </div>

                                    <div class="card-body">                                   
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12">
                                                <div class="insights px-2">
                                                    <div><span class="text-success h2">78%</span> <span class="float-right">Progres Modal</span></div>
                                                    <div class="progress progress-md mt-2 mb-0">
                                                        <div class="progress-bar bg-success" role="progressbar" style="width: 78%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                   
                                    </div>
                                </div>
                            </div>
                    </section>
                </div>
                
            </div>
            <div class="sidebar-detached sidebar-right">
                <div class="sidebar"><div class="project-sidebar-content">
                    <div class="card">
                        <div class="card-content">
                            <!-- project search -->
                            <div class="card-body border-top-blue-grey border-top-lighten-5">
                                <a href="<?php echo base_url().'mitra/project/rab/'.$project_kode.'/'.$project_id; ?>"</a>
                                <button type="button" class="btn btn-info btn-min-width btn-glow mr-1 mb-2 btn-block" id="buttonrab" onclick="window.location.locations=''"><i class="fa fa-plus-square-o"></i> BUAT RAB </button>
                                <a href="<?php echo base_url().'mitra/barang/project/'.$project_kode.'/'.$project_id; ?>"</a>
                                <button type="button" class="btn btn-default btn-min-width btn-glow mr-1 mb-2 btn-block" id="buttonrab" onclick="window.location.locations=''"><i class="fa fa-plus-square-o"></i> BUAT Daftar Barang </button>
                            </div>
                            <!-- /project search -->
                        </div>
                    </div>

            </div>

        </div>
        </div>
        </div>

</div>
<div class="app-content content">
      <div class="content-wrapper">
<section id="server-processing">
	<div class="row">
	    <div class="col-12">
	        <div class="card">
	            <div class="card-header">
	                <h4 class="card-title">Rencana Anggaran Biaya (RAB)</h4>
	                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
	            </div>
                <div class="card-text">
                    <h4 class='text-center'>KODE PROJECT  : <?php echo $project_kode; ?></h4>
                </div>
	            <div class="card-content collpase show">                
	                <div class="card-body table-responsive">
                                <table class="table table-striped table-bordered ">
		                	<thead class="bg-yellow bg-lighten-3">
                                            <tr>                    
                                                <th> Kode RAB </th>
                                                <th> Descriptions </th>
                                                <th> Budget </th>
                                                <th> Aktual </th>
                                                <th> Selisih </th>                                                                
                                                <th> % </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                                echo $rab_data;
                                            ?>
                                       </tbody>
                                       
                                </table>
                        </div>
	            </div>
	        </div>
	    </div>
	</div>
</section>

</div>
</div>

<script language="JavaScript" type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" >
</script>

<script type="text/javascript">
        
        function PostingAction(){                    
            $.ajax({
                type : "POST",
                url  : $base_url+'_admin/project/PostingProject',
        //                    data : $( "#formAdd" ).serialize(),
                data : { 
                    project : '<?php echo $project_kode; ?>', 
                    mitra_id : '<?php echo  $mitra_id; ?>'
                },
                dataType : "json",
                success:function(data){
                if(data.status=='200'){
                
                }
       
            }
        });
    }    
</script>

