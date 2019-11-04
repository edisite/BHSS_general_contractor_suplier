            <!-- BEGIN CONTENT -->
            <div class="page-content-wrapper">
                <!-- BEGIN CONTENT BODY -->
                <div class="page-content">
                    <!-- BEGIN PAGE HEAD-->
                    <div class="page-head">
                        <!-- BEGIN PAGE TITLE -->
                        <div class="page-title">
                            <h1><?php if(isset($title_page)) echo $title_page;?>
                                <small><?php if(isset($title_page2)) echo $title_page2;?></small>
                            </h1>
                        </div>
                        <!-- END PAGE TITLE -->
                        <!-- END PAGE TOOLBAR -->
                    </div>
                    <!-- END PAGE HEAD-->
                    <!-- BEGIN PAGE BREADCRUMB -->
                    <ul class="page-breadcrumb breadcrumb">
                        <li>
                            <a href="<?php echo base_url();?>"> Dashboard </a>
                            <i class="fa fa-circle"></i>
                        </li>
                        <li>
                            <a href="#"> <?php if(isset($title_page)) echo $title_page;?> </a>
                            <i class="fa fa-circle"></i>
                        </li>
                        <li>
                            <span class="active"><?php if(isset($title_page2)) echo $title_page2;?></span>
                        </li>
                    </ul>
                    <!-- END PAGE BREADCRUMB -->
                    <!-- BEGIN PAGE BASE CONTENT -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="portlet light portlet-fit portlet-datatable bordered">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <i class=" icon-list font-dark"></i> &nbsp;&nbsp;
                                        <span class="caption-subject font-dark sbold uppercase">Data <?php if(isset($title_page2)) echo $title_page2;?></span>
                                    </div>                                    
                                </div>
                                <div class="portlet-body">
                                   
                                    <table class="table table-striped table-bordered table-hover table-checkable order-column" id="default-table-dvoucher">
                                        <thead>
                                            <tr>
                                                <th> No. </th>
                                                <th> Cabang </th>
                                                <th> Nama </th>
                                                <th> No.Voucher </th>
                                                <th> Tanggal </th>
                                                <th> Nominal </th>
                                                <th> Alasan </th>
                                                <th> Status </th>
                                                <th> Action </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th colspan="5">Total Current Page</th>                                                
                                                <th></th>
                                                <th colspan="3"></th>
                                            </tr>
<!--                                            <tr>
                                                <th colspan="5">Total</th>                                                
                                                <th colspan="4"></th>
                                            </tr>-->
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- END PAGE BASE CONTENT -->
                </div>
                <!-- END CONTENT BODY -->
            </div>
            <!-- END CONTENT -->
        </div>
        <!-- END CONTAINER -->
    <?php $this->load->view('layout/V_footer');?>

<script type="text/javascript">
            $(document).ready(function(){
               searchData();
                //rules();
                $('#default-table-dvoucher').DataTable();
//                $('#m_coa_id').css('width', '100%');
//                selectList_masterCOA('#m_coa_id', 4);                
//                $('.date-picker').datepicker();
            });

            function searchData() { 
                $('#default-table-dvoucher').DataTable({
                     "footerCallback": function ( row, data, start, end, display ) {
                    var api = this.api(), data;

                    // Remove the formatting to get integer data for summation
                    var intVal = function ( i ) {
                        return typeof i === 'string' ?
                            i.replace(/[\$,]/g, '')*1 :
                            typeof i === 'number' ?
                                i : 0;
                    };

//                    // Total over all pages
//                    totalkredit = api
//                        .column( 5 )
//                        .data()
//                        .reduce( function (a, b) {
//                            return intVal(a) + intVal(b);
//                        }, 0 );

                    // Total over this page
                    pageTotalkredit = api
                        .column( 5, { page: 'current'} )
                        .data()
                        .reduce( function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0 );
                    // Total over all pages

                    // Update footer

                        $('tr:eq(0) th:eq(1)', api.table().footer()).html(rubah(pageTotalkredit));
//                        $('tr:eq(1) th:eq(1)', api.table().footer()).html(rubah(totalkredit));


                },
                    destroy: true,
                    "processing": true,
                    "serverSide": true,
                    ajax: {
                      url: '<?php echo base_url();?>Trans/Jurnal-Khusus/loadDataDVoucher',                     
                    },
                    "columns": [
                      {"name": "no","orderable": false,"searchable": false,  "className": "text-center", "width": "5%"},
                      {"name": "cabang_nama"},
                      {"name": "jv_nama_pengajuan"},
                      {"name": "jv_no_voucher"},
                      {"name": "jv_tgl_pengajuan"},
                      {"name": "jv_nominal", "className": "text-right", render: $.fn.dataTable.render.number( '.', ',', 0, '')},
                      {"name": "jv_alasan"},
                      {"name": "jv_status"},
                      {"name": "jv_status"},
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
                        "infoFiltered": "(filtered from _MAX_ total records)",
                        "lengthMenu": "Show _MENU_",
                        "search": "Search:",
                        "zeroRecords": "Record not found",
                        "paginate": {
                            "previous":"Prev",
                            "next": "Next",
                            "last": "Last",
                            "first": "First"
                        },
                        "processing": "Mohon di tunggu",
                    },

                    // Uncomment below line("dom" parameter) to fix the dropdown overflow issue in the datatable cells. The default datatable layout
                    // setup uses scrollable div(table-scrollable) with overflow:auto to enable vertical scroll(see: assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js). 
                    // So when dropdowns used the scrollable div should be removed. 
                    //"dom": "<'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r>t<'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",

                    "bStateSave": true, // save datatable state(pagination, sort, etc) in cookie.
                    "pagingType": "bootstrap_extended",

                    "lengthMenu": [
                        [10, 25, 50, 100, 200],
                        [10, 25, 50, 100, 200] // change per page values here
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
                        [1, "asc"]
                    ],
                    "iDisplayLength": 10
                });
            }
            
            function PostingAction(){
                    
                    $("#btn-posting").attr("disabled", true);
                    toastr["info"]("Proses Posting sedang berjalan, Mohon di tunggu", "Waiting", {
                        "closeButton": true,
                        "debug": false,
                        "newestOnTop": true,
                        "progressBar": true,
                        "positionClass": "toast-top-right",
                        "preventDuplicates": false,
                        "onclick": null,
                        "showDuration": "300",
                        "hideDuration": "200",
                        "timeOut": "5000",
                        "extendedTimeOut": "200",
                        "showEasing": "swing",
                        "hideEasing": "linear",
                        "showMethod": "fadeIn",
                        "hideMethod": "fadeOut"
                  });
                    $.ajax({
                    type : "POST",
                    url  : $base_url+'Trans/Jurnal/Posting-Action',
//                    data : $( "#formAdd" ).serialize(),
                    dataType : "json",
                    success:function(data){
                      if(data.status=='200'){
                        reset();
                        searchData();
                        alert_success_aktif();  
                        $("#btn-posting").attr("disabled", false);
                      } else if (data.status=='204') {
                        alert_fail_aktif();
                        searchData();
                        $("#btn-posting").attr("disabled", false);
                      }else if (data.status=='0') {
                        alert_fail_aktif();
                        searchData();
                        $("#btn-posting").attr("disabled", false);
                      }
                    }
                  });
            }   
            function searchDataKartuStokMasuk() { 
                $('#default-table-kartu-stok').DataTable({
                    destroy: true,
                    "processing": true,
                    "serverSide": true,
                    ajax: {
                      url: '<?php echo base_url();?>Laporan/Laporan-Harian-Keluar-Barang/loadDataKartuStokMasuk/',
                      data: { id_cabang : document.getElementById("m_cabang_id").value, id_gudang : document.getElementById("m_gudang_id").value, from_tanggal : document.getElementById("from_tanggal").value, to_tanggal : document.getElementById("to_tanggal").value }
                    },
                    "columns": [
                      {"name": "no","orderable": false,"searchable": false,  "className": "text-center", "width": "5%"},
                      {"name": "kartu_stok_tanggal"},
                      {"name": "kartu_stok_referensi"},
                      {"name": "departemen_nama"},
                      {"name": "barang_kode"},
                      {"name": "barang_nama"},
                      {"name": "kartu_stok_masuk", "className" : "text-right"},
                      {"name": "satuan_nama"},
                      {"name": "kartu_stok_keterangan"}
                      // {"name": "kartu_stok_masuk"},
                      // {"name": "kartu_stok_keluar"},
                      // {"name": "kartu_stok_saldo"}
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
                        [10, 25, 50, 100],
                        [10, 25, 50, 100] // change per page values here
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
                        [1, "asc"]
                    ],
                    "iDisplayLength": 10
                });
            }

            function cetak()
            {
               $('#formDataLHKB').submit();
            }
            
            function rubah(angka){
                var reverse = angka.toString().split('').reverse().join(''),
                ribuan = reverse.match(/\d{1,3}/g);
                ribuan = ribuan.join('.').split('').reverse().join('');
                return ribuan;
              }
        </script>