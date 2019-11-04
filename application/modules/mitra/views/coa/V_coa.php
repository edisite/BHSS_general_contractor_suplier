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
                        <a href="<?php echo base_url(); ?>mitra/accounting/TreeView">
                                <button id="inlineForm" class="btn btn-warning btn-sm mr-1 mb-1 ladda-button"><i class="ft-list"></i>&nbsp; Show TreeView</button>
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
                            <a href="<?php echo base_url(); ?>mitra/barang/getform">
                                <button id="inlineForm" class="btn btn-success mr-1 mb-1 ladda-button"><i class="ft-plus"></i>&nbsp; Buat CoA</button>
                            </a>
                            <table class="table table-striped table-bordered server-side responsive" id="barang-server-side">
                                    <thead>
                                        <tr>
                                            <th> No </th>
                                            <th> CoA </th>
                                            <th> Nama CoA </th>
                                            <th> Induk </th>
                                            <th> D/K </th>
                                            <th> Klasifikasi </th>                                                
                                            <th> Action </th>
                                        </tr>
                                    </thead>                                    
                            </table>
                    </div>
	            </div>
	        </div>
	    </div>
	</div>
</section>


        <script type="text/javascript">
            $(document).ready(function(){
                searchData();
            });

            function searchData() { 
                $('#default-table').DataTable({
                    destroy: true,
                    "processing": true,
                    "serverSide": true,
                    ajax: {
                      url: '<?php echo base_url();?>Master-Data/COA/loadData/'
                    },
                    "columns": [
                      {"name": "no","orderable": false,"searchable": false,  "className": "text-center", "width": "5%"},
                      {"name": "coa_kode"},
                      {"name": "coa_nama"},
                      {"name": "coa_kode_induk"},
                      {"name": "coa_dk"},
                      {"name": "coa_tipe"},
                      {"name": "cabang_nama"},
                      {"name": "action","orderable": false,"searchable": false, "className": "text-center", "width": "15%"}
                    ],
                    // Internationalisation. For more info refer to http://datatables.net/manual/i18n
                    "language": {
                        "aria": {
                            "sortAscending": ": activate to sort column ascending",
                            "sortDescending": ": activate to sort column descending"
                        },
                        "emptyTable": "No data available in table",
                        "info": "Showing _START_ to _END_ of _TOTAL_ records",
                        "infoEmpty": "No records found",
                        "infoFiltered": "(filtered1 from _MAX_ total records)",
                        "lengthMenu": "Show _MENU_",
                        "search": "Search:",
                        "zeroRecords": "No matching records found",
                        "paginate": {
                            "previous":"Prev",
                            "next": "Next",
                            "last": "Last",
                            "first": "First"
                        }
                    },

                    // Uncomment below line("dom" parameter) to fix the dropdown overflow issue in the datatable cells. The default datatable layout
                    // setup uses scrollable div(table-scrollable) with overflow:auto to enable vertical scroll(see: assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js). 
                    // So when dropdowns used the scrollable div should be removed. 
                    //"dom": "<'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r>t<'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",

                    "bStateSave": true, // save datatable state(pagination, sort, etc) in cookie.
                    "pagingType": "bootstrap_extended",

                    "lengthMenu": [
                        [10, 25, 50, 100, 200, 500],
                        [10, 25, 50, 100, 200, 500] // change per page values here
                    ],
                    // set the initial value
                    "pageLength": 10,
                    "columnDefs": [{  // set default column settings
                        'orderable': false,
                        'targets': [0]
                    }, {
                        "searchable": false,
                        "targets": [0]
                    }],
                    "order": [
                        [2, "asc"]
                    ],
                    "iDisplayLength": 10
                });
            }

            function editData(id) {
              $.ajax({
                type : "GET",
                url  : '<?php echo base_url();?>Master-Data/COA/loadDataWhere/',
                data : "id="+id,
                dataType : "json",
                success:function(data){
                  for(var i=0; i<data.val.length;i++){
                    document.getElementsByName("kode")[0].value = data.val[i].kode;
                    document.getElementsByName("coa_kode")[0].value = data.val[i].coa_kode;
                    document.getElementsByName("coa_nama")[0].value = data.val[i].coa_nama;
                    document.getElementsByName("coa_keterangan")[0].value = data.val[i].coa_keterangan;
                    if (data.val[i].coa_tipe == 1) {
                      document.getElementById('header').checked = true;
                    } else if (data.val[i].coa_tipe == 2) {
                      document.getElementById('subheader').checked = true;
                    } else if (data.val[i].coa_tipe == 3) {
                      document.getElementById('nama_perkiraan').checked = true;
                    }
                    for(var j=0; j<data.val[i].coa_header.val2.length; j++){
                      $("#coa_header").append('<option value="'+data.val[i].coa_header.val2[j].id+'" selected>'+data.val[i].coa_header.val2[j].text+'</option>');
                      $("#coa_header").select2();
                    }
                    for(var j=0; j<data.val[i].coa_subheader.val2.length; j++){
                      $("#coa_subheader").append('<option value="'+data.val[i].coa_subheader.val2[j].id+'" selected>'+data.val[i].coa_subheader.val2[j].text+'</option>');
                      $("#coa_subheader").select2();
                    }
                    if (data.val[i].coa_debit_kredit == 1) {
                      document.getElementById('debit').checked = true;
                    } else if (data.val[i].coa_tipe == 2) {
                      document.getElementById('kredit').checked = true;
                    }
                    // $("#m_cabang_id").select2('destroy');
                    for(var j=0; j<data.val[i].m_cabang_id.val2.length; j++){
                        $("#m_cabang_id").append('<option value="'+data.val[i].m_cabang_id.val2[j].id+'" selected>'+data.val[i].m_cabang_id.val2[j].text+'</option>');
                        $("#m_cabang_id").select2();
                    }
                    // $("#m_cashflow_id").select2('destroy');
                    for(var j=0; j<data.val[i].m_cashflow_id.val2.length; j++){
                        $("#m_cashflow_id").append('<option value="'+data.val[i].m_cashflow_id.val2[j].id+'" selected>'+data.val[i].m_cashflow_id.val2[j].text+'</option>');
                        $("#m_cashflow_id").select2();
                    }
                  }
                }
              });
            }

        </script>

    </body>

</html>