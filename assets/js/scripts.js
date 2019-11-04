(function(window, undefined) {
  'use strict';

  /*
  NOTE:
  ------
  PLACE HERE YOUR OWN JAVASCRIPT CODE IF NEEDED
  WE WILL RELEASE FUTURE UPDATES SO IN ORDER TO NOT OVERWRITE YOUR JAVASCRIPT CODE PLEASE CONSIDER WRITING YOUR SCRIPT HERE.  */
    var $base_url = $("body").data("base_url");
    function rules() {
  $(".kode").keydown(function(event) {
    if ( event.keyCode != 32 ) {
      // let it happen, don't do anything
    } else {
      event.preventDefault();
    }
  });
  $(".telp2").keyup(function(event) {
    // Allow: backspace, delete, tab, escape, enter and .
    // Get content
    var content = event || window.event;
    var string = this.value;
    // alert("string="+string);
    var key = content.keyCode || content.which;
    // Make Regex pattern \+?\d
    var regex = /\+?\d?/;
    // Match content with pattern
    // If match do nothing
    // if not match, set value = content
    var plus = event.which || event.keyCode;
    key = String.fromCharCode(key);
    if(regex.test(string)) {
        content.returnValue = false;
    } else {
        this.value = "";
        alert("not match");
    }
  });
  $(".telp").keydown(function(event) {
    // Allow: backspace, delete, tab, escape, enter and .
    var plus = event.which || event.keyCode;
    if ($.inArray(event.keyCode, [43, 46, 8, 9, 27, 13, 110, 190]) !== -1 ||
         // Allow: Ctrl+A, Command+A
        (event.keyCode === 65 && (event.ctrlKey === true || event.metaKey === true)) || 
         // Allow: home, end, left, right, down, up
        (event.keyCode >= 35 && event.keyCode <= 40)) {
             // let it happen, don't do anything
             return;
    }
    // Ensure that it is a number and stop the keypress
    if ((event.shiftKey || (event.keyCode < 48 || event.keyCode > 57)) && (event.keyCode < 96 || event.keyCode > 105)) {
        event.preventDefault();
    }
  });
  $('.num2').number( true, 2, '.', ',' );
  $('.num2').css('text-align', 'right');
  $(".num").keydown(function(event) {
    // Allow: backspace, delete, tab, escape, enter and .
    if ($.inArray(event.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
         // Allow: Ctrl+A, Command+A
        (event.keyCode === 65 && (event.ctrlKey === true || event.metaKey === true)) || 
         // Allow: home, end, left, right, down, up
        (event.keyCode >= 35 && event.keyCode <= 40)) {
             // let it happen, don't do anything
             return;
    }
    // Ensure that it is a number and stop the keypress
    if ((event.shiftKey || (event.keyCode < 48 || event.keyCode > 57)) && (event.keyCode < 96 || event.keyCode > 105)) {
        event.preventDefault();
    }
  });

  $(".decimal").keydown(function(event) {
    // Allow: backspace, delete, tab, escape, enter and .
    if ($.inArray(event.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
         // Allow: Ctrl+A, Command+A
        (event.keyCode === 65 && (event.ctrlKey === true || event.metaKey === true)) || 
         // Allow: home, end, left, right, down, up
        (event.keyCode >= 35 && event.keyCode <= 40) || event.keyCode == 190 ) {
             // let it happen, don't do anything
             return;
    }
    // Ensure that it is a number and stop the keypress
    if ((event.shiftKey || (event.keyCode < 48 || event.keyCode > 57)) && (event.keyCode < 96 || event.keyCode > 105)) {
        event.preventDefault();
    }
  });
  $('.reset').on('click', function() {
    resetValidation();
  });
  $('.select2').select2();
  $('.select2').width('100%');
  $('.money').number( true, 2, '.', ',' );
  $('.money').css('text-align', 'right');
  $('.num2').number( true, 2, '.', ',' );
  $('.num2').css('text-align', 'right');
  $('.datepicker').datepicker({
        locale: {
            format: 'DD/MM/YYYY'
        },
        "opens": "left",
        "drops": "down"
  });
  var dateToday = new Date();
  $('.datepicker-range').daterangepicker({
        minDate : dateToday,
        locale: {
            format: 'DD/MM/YYYY',
        },
        "opens": "left",
        "drops": "down"
  });
    $('.timepicker-default').timepicker({
        autoclose: true,
        minuteStep: 5
    });
    // Select Date Range
    var dateFormat = "mm/dd/yy",
        from = $(".dp-date-range-from")
        .datepicker({
            defaultDate: "+1w",
            changeMonth: true,
        })
        .on("change", function() {
            to.datepicker("option", "minDate", getDate(this));
        }),
        to = $(".dp-date-range-to").datepicker({
            defaultDate: "+1w",
            changeMonth: true,
        })
        .on("change", function() {
            from.datepicker("option", "maxDate", getDate(this));
        });

    function getDate(element) {
        var date;
        try {
            date = $.datepicker.parseDate(dateFormat, element.value);
        } catch (error) {
            date = null;
        }

        return date;
    }

    
}


// Reset Validation
function resetValidation() {
    var form = $('#formAdd');
    if (form) {
        var formadd = form.validate();
        formadd.resetForm();
    }
    $(".has-success").removeClass("has-success");
    $(".fa-check").removeClass("fa-check");
    $('.alert-success').hide();
    $(".has-error").removeClass("has-error");
    $(".fa-warning").removeClass("fa-warning");
    $('.alert-danger').hide();
}

function reset() {
    if (document.getElementById("formadd")) {
        document.getElementById("formadd").reset();
        var formadd = $("#formadd").validate();
        formadd.resetForm();
    }
}

    
    
    //1. mitra->barang search
        // Loading remote data
        
    $("#m_kategori_barang_id").select2({
      placeholder: "Pilih Kategori Barang",
      ajax: {
        url: $base_url + "api/internal/kategoribarang/loaddata_select",
        dataType: 'json',
        delay: 250,
        cache: true,
        data: function (params) {
          return {
            q: params.term, // search term
            page: params.page
          };
        },
        processResults: function (data, params) {

          params.page = params.page || 1;

          return {
            results: data.items,
            pagination: {
              more: (params.page * 30) < data.total_count
            }
          };
        },
        cache: true
      },
      escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
      minimumInputLength: 1,
      templateResult: formatRepo, // omitted for brevity, see the source of this page
      templateSelection: formatRepoSelection // omitted for brevity, see the source of this page
    });
    
//    end  -------------
    //1. mitra->barang search
        // Loading remote data   
        
    $("#m_satuan_barang_id").select2({
      placeholder: "Pilih Satuan Barang",
      ajax: {
        url: $base_url + "api/internal/satuan/loaddata_select",
        dataType: 'json',
        delay: 250,
        cache: true,
        data: function (params) {
          return {
            q: params.term, // search term
            page: params.page
          };
        },
        processResults: function (data, params) {

          params.page = params.page || 1;

          return {
            results: data.items,
            pagination: {
              more: (params.page * 30) < data.total_count
            }
          };
        },
        cache: true
      },
      escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
      minimumInputLength: 1,
      templateResult: formatRepo, // omitted for brevity, see the source of this page
      templateSelection: formatRepoSelection // omitted for brevity, see the source of this page
    });
    
//    end  -------------
    
    function formatRepo (repo) {
      if (repo.loading) return repo.text;

      var markup = "<div class='select2-result-repository clearfix'>" +
        "<div class='select2-result-repository__avatar'></div>" +
          "<div class='select2-result-repository__title'>" + repo.text + "</div></div>";

      return markup;
    }
    function formatRepoSelection (repo) {
      return repo.text || repo.text;
    }

 
    
    function actionData2(){
        $.ajax({
          type : "POST",
          url  : $base_url+''+$("#url").val(),
          data : $( "#formAdd" ).serialize(),
          dataType : "json",
          success:function(data){
            if(data.status=='200'){
              alert_success_save();
              //window.location.href = $base_url +''+$("#url_data").val();
            } else if (data.status=='204') {
              alert_fail_save();
            }
          }
        });
    }

        //1. mitra->RAB search parent
        // Loading remote data
        
        $("#m_mitra_rab_select").select2({
          placeholder: "Pilih Parent RAB",
          ajax: {
            url: $base_url + "api/internal/RAB/loaddata_select",
            dataType: 'json',
            delay: 250,
            cache: true,
            data: function (params) {
              return {
                q: params.term, // search term
                page: params.page
              };
            },
            processResults: function (data, params) {
    
              params.page = params.page || 1;
    
              return {
                results: data.items,
                pagination: {
                  more: (params.page * 30) < data.total_count
                }
              };
            },
            cache: true
          },
          escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
          minimumInputLength: 0,
          templateResult: formatRepo, // omitted for brevity, see the source of this page
          templateSelection: formatRepoSelection // omitted for brevity, see the source of this page
        });

        //1. mitra->RAB search parent
        // Loading remote data
        
        $("#m_mitra_supplier_select").select2({
          placeholder: "Pilih Supplier",
          ajax: {
            url: $base_url + "api/internal/supplier/loaddata_select",
            dataType: 'json',
            delay: 250,
            cache: true,
            data: function (params) {
              return {
                q: params.term, // search term
                page: params.page
              };
            },
            processResults: function (data, params) {
    
              params.page = params.page || 1;
    
              return {
                results: data.items,
                pagination: {
                  more: (params.page * 30) < data.total_count
                }
              };
            },
            cache: true
          },
          escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
          minimumInputLength: 0,
          templateResult: formatRepo, // omitted for brevity, see the source of this page
          templateSelection: formatRepoSelection // omitted for brevity, see the source of this page
        });

})(window);



function selectList_project() {
  $('#spp_kode_project').select2({
    placeholder: 'Pilih Project',
    multiple: false,
    allowClear: true,
    ajax: {
      url: $base_url+'api/internal/project/loadData_select',
      dataType: 'json',
      delay: 100,
      cache: true,
      data: function (params) {
        return {
          q: params.term, // search term
          page: params.page
        };
      },
      processResults: function (data, params) {
        // parse the results into the format expected by Select2
        // since we are using custom formatting functions we do not need to
        // alter the remote JSON data, except to indicate that infinite
        // scrolling can be used
        params.page = params.page || 1;

        return {
          results: data.items,
          pagination: {
            more: (params.page * 30) < data.total_count
          }
        };
      }
    },
    escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
    minimumInputLength: 0,
    templateResult: FormatResult,
    templateSelection: FormatSelection,
  });
}

function selectList_ssp() {
  $('#spp_project').select2({
    placeholder: 'Pilih SSP (Surat Permintaan Pembelian)',
    multiple: false,
    allowClear: true,
    ajax: {
      url: $base_url+'api/internal/PermintaanPembelian/loadData_select_ssp',
      dataType: 'json',
      delay: 100,
      cache: true,
      data: function (params) {
        return {
          q: params.term, // search term
          page: params.page
        };
      },
      processResults: function (data, params) {
        // parse the results into the format expected by Select2
        // since we are using custom formatting functions we do not need to
        // alter the remote JSON data, except to indicate that infinite
        // scrolling can be used
        params.page = params.page || 1;

        return {
          results: data.items,
          pagination: {
            more: (params.page * 30) < data.total_count
          }
        };
      }
    },
    escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
    minimumInputLength: 0,
    templateResult: FormatResult,
    templateSelection: FormatSelection,
  });
}

// Select2 AJAX
function FormatResult(data) {
  markup = '<div>'+data.text+'</div>';
  return markup;
}

function FormatSelection(data) {
  return data.text;
}
// End Select2 AJAX


function selectList_barang2(idElemen, id) {
  $(idElemen).select2({
    placeholder: 'Pilih Barang',
    multiple: false,
    allowClear: true,
    ajax: {
      url: $base_url+'api/internal/barang/loadData_select',
      dataType: 'json',
      delay: 100,
      cache: true,
      data: function (params) {
        return {
          id : id,
          q: params.term, // search term
          page: params.page
        };
      },
      processResults: function (data, params) {
        // parse the results into the format expected by Select2
        // since we are using custom formatting functions we do not need to
        // alter the remote JSON data, except to indicate that infinite
        // scrolling can be used
        params.page = params.page || 1;

        return {
          results: data.items,
          pagination: {
            more: (params.page * 30) < data.total_count
          }
        };
      }
    },
    escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
    minimumInputLength: 0,
    templateResult: FormatResult,
    templateSelection: FormatSelection,
  });
}
// mitra - po -> get ssp kodebarang

function selectList_barang_ssp(idElemen, id) {
  $(idElemen).select2({
    placeholder: 'Pilih Barang',
    multiple: false,
    allowClear: true,
    ajax: {
      url: $base_url+'api/internal/PermintaanPembelian/loadData_select_ssp_barang',
      dataType: 'json',
      delay: 100,
      cache: true,
      data: function (params) {
        return {
          id : id,
          q: params.term, // search term
          page: params.page
        };
      },
      processResults: function (data, params) {
        // parse the results into the format expected by Select2
        // since we are using custom formatting functions we do not need to
        // alter the remote JSON data, except to indicate that infinite
        // scrolling can be used
        params.page = params.page || 1;

        return {
          results: data.items,
          pagination: {
            more: (params.page * 30) < data.total_count
          }
        };
      }
    },
    escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
    minimumInputLength: 0,
    templateResult: FormatResult,
    templateSelection: FormatSelection,
  });
}
// mitra - po -> get karyawan - periksa barang
function selectList_karyawan() {
  $('#m_karyawan_id').select2({
    placeholder: 'Pilih Karyawan',
    multiple: false,
    allowClear: true,
    ajax: {
      url: $base_url+'api/internal/karyawan/loadData_select',
      dataType: 'json',
      delay: 100,
      cache: true,
      data: function (params) {
        return {
          q: params.term, // search term
          page: params.page
        };
      },
      processResults: function (data, params) {
        // parse the results into the format expected by Select2
        // since we are using custom formatting functions we do not need to
        // alter the remote JSON data, except to indicate that infinite
        // scrolling can be used
        params.page = params.page || 1;

        return {
          results: data.items,
          pagination: {
            more: (params.page * 30) < data.total_count
          }
        };
      }
    },
    escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
    minimumInputLength: 0,
    templateResult: FormatResult,
    templateSelection: FormatSelection,
  });
}

function selectList_gudang() {
  $('#m_gudang_id').select2({
    placeholder: 'Pilih Gudang',
    multiple: false,
    allowClear: true,
    ajax: {
      url: $base_url+'api/internal/gudang/loadData_select',
      dataType: 'json',
      delay: 100,
      cache: true,
      data: function (params) {
        return {
          q: params.term, // search term
          page: params.page
        };
      },
      processResults: function (data, params) {
        // parse the results into the format expected by Select2
        // since we are using custom formatting functions we do not need to
        // alter the remote JSON data, except to indicate that infinite
        // scrolling can be used
        params.page = params.page || 1;

        return {
          results: data.items,
          pagination: {
            more: (params.page * 30) < data.total_count
          }
        };
      }
    },
    escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
    minimumInputLength: 0,
    templateResult: FormatResult,
    templateSelection: FormatSelection,
  });
}

// 1. Penerimaan Barang -> Select PO
function selectList_PO() {
  $('#po_select').select2({
    placeholder: 'Pilih PO',
    multiple: false,
    allowClear: true,
    ajax: {
      url: $base_url+'api/internal/PurchaseOrder/loadData_select_po',
      dataType: 'json',
      delay: 100,
      cache: true,
      data: function (params) {
        return {
          q: params.term, // search term
          page: params.page
        };
      },
      processResults: function (data, params) {
        // parse the results into the format expected by Select2
        // since we are using custom formatting functions we do not need to
        // alter the remote JSON data, except to indicate that infinite
        // scrolling can be used
        params.page = params.page || 1;

        return {
          results: data.items,
          pagination: {
            more: (params.page * 30) < data.total_count
          }
        };
      }
    },
    escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
    minimumInputLength: 0,
    templateResult: FormatResult,
    templateSelection: FormatSelection,
  });
}

// 1. Penerimaan Barang -> Select Barang

function selectList_barang_penerimaanbarang(idElemen, id) {
  $(idElemen).select2({
    placeholder: 'Pilih Barang',
    multiple: false,
    allowClear: true,
    ajax: {
      url: $base_url+'api/internal/PurchaseOrder/loadData_select_penerimaan_barang',
      dataType: 'json',
      delay: 100,
      cache: true,
      data: function (params) {
        return {
          id : id,
          q: params.term, // search term
          page: params.page
        };
      },
      processResults: function (data, params) {
        // parse the results into the format expected by Select2
        // since we are using custom formatting functions we do not need to
        // alter the remote JSON data, except to indicate that infinite
        // scrolling can be used
        params.page = params.page || 1;
        
        return {
          results: data.items,
          pagination: {
            more: (params.page * 30) < data.total_count
          }
        };
      }
    },
    escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
    minimumInputLength: 0,
    templateResult: FormatResult,
    templateSelection: FormatSelection,
  });
}


// 1. Penerimaan Barang -> Select PO
function selectList_coa(idElemen) {
  $(idElemen).select2({
    placeholder: 'Pilih C o A',
    multiple: false,
    allowClear: true,
    ajax: {
      url: $base_url+'api/internal/accounting/loadData_select',
      dataType: 'json',
      delay: 100,
      cache: true,
      data: function (params) {
        return {
          q: params.term, // search term
          page: params.page
        };
      },
      processResults: function (data, params) {
        // parse the results into the format expected by Select2
        // since we are using custom formatting functions we do not need to
        // alter the remote JSON data, except to indicate that infinite
        // scrolling can be used
        params.page = params.page || 1;

        return {
          results: data.items,
          pagination: {
            more: (params.page * 30) < data.total_count
          }
        };
      }
    },
    escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
    minimumInputLength: 0,
    templateResult: FormatResult,
    templateSelection: FormatSelection,
  });
}
// 1. mitra lap. jurnal transaksi
function searchMitra_DataJurnal() { 
  var input = document.getElementById("date_from");
  var inputVal = "";
  if (input) {
      inputVal = input.value;
  }
  var input_to = document.getElementById("date_to");
  var inputValTo = "";
  if (input_to) {
      inputValTo = input_to.value;
  }
  var input_project = document.getElementById("spp_kode_project");
  var inputValProject = "";
  if (input_project) {
    inputValProject = input_project.value;
  }
  $('#mitraDataJurnal').DataTable( {
      "processing": true,
      "serverSide": true,
      ajax: { url: $base_url + "mitra/accounting/JurnalTransaksi_loaddata",
            data: { date_from :  inputVal, date_to : inputValTo, project : inputValProject},
              },
      "destroy" : true,
      "columns": [
        {"name": "jurnalid","orderable": false,"searchable": false,  "className": "text-center", "width": "5%"},
        {"name": "barang_kode"},
        {"name": "barang_nama"},
        {"name": "qty", "className": "text-right"},
        {"name": "satuan_nama"},
        {"name": "hpp_jual"},
        {"name": "harga_jual_satuan", "className": "text-right"},
        {"name": "harga_jual_satuan_ppn", "className": "text-right"},
      ],
  } );    
}

function selectList2_coa(idElemen) {
  $(idElemen).select2({
    placeholder: 'Pilih C o A',
    multiple: true,
    allowClear: true,
    ajax: {
      url: $base_url+'api/internal/accounting/loadData_select',
      dataType: 'json',
      delay: 100,
      cache: true,
      data: function (params) {
        return {
          q: params.term, // search term
          page: params.page
        };
      },
      processResults: function (data, params) {
        // parse the results into the format expected by Select2
        // since we are using custom formatting functions we do not need to
        // alter the remote JSON data, except to indicate that infinite
        // scrolling can be used
        params.page = params.page || 1;

        return {
          results: data.items,
          pagination: {
            more: (params.page * 30) < data.total_count
          }
        };
      }
    },
    escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
    minimumInputLength: 0,
    templateResult: FormatResult,
    templateSelection: FormatSelection,
  });
}
// 1. mitra akuntansi -> bukubesar
function searchmitra_bukubesar_report() {

  var input = document.getElementById("date_from");
  var inputVal = "";
  if (input) {
      inputVal = input.value;
  }
  var input_to = document.getElementById("date_to");
  var inputValTo = "";
  if (input_to) {
      inputValTo = input_to.value;
  }
  var input_project = document.getElementById("spp_kode_project");
  var inputValProject = "";
  if (input_project) {
    inputValProject = input_project.value;
  }
  var input_coa = document.getElementById("kode_coa");
  var inputValcoa = "";
  if (input_coa) {
    inputValcoa = input_coa.value;
  }
  
    $("#mitra_bukubesar_report").empty();
    $.ajax({
        type : "GET",
        url:  $base_url + "mitra/accounting/Ledger_loaddata",
        data: { 
            date_from :  inputVal, 
            date_to : inputValTo, 
            project : inputValProject,
            kode_coa : inputValcoa},
        dataType : "json",
        success:function(data){
            if (data.status == '204') {
                swal({
                    title: "Alert!",
                    text: "Range Tanggal Awal Harus di isi!",
                    type: "error",
                    confirmButtonClass: "btn-raised btn-danger",
                    confirmButtonText: "OK",
                });
                
            }
            if (data.status == '205') {
              swal({
                  title: "Alert!",
                    text: "Range Tanggal Akhir Harus di isi!",
                  type: "error",
                  confirmButtonClass: "btn-raised btn-danger",
                  confirmButtonText: "OK",
              });
              
            }
            if (data.status == '200') {
                $("#mitra_bukubesar_report").append(data.response);     0               
            }
        }
    });
    
}

// 1. mitra lap. penjualan per transaksi
function searchMitra_ReportJualPerTransaksi() { 
  var input = document.getElementById("date_from");
  var inputVal = "";
  if (input) {
      inputVal = input.value;
  }
  var input_to = document.getElementById("date_to");
  var inputValTo = "";
  if (input_to) {
      inputValTo = input_to.value;
  }
  var input_project = document.getElementById("spp_kode_project");
  var inputValProject = "";
  if (input_project) {
    inputValProject = input_project.value;
  }
  $('#mitraReportPenjualanPerTransaksi').DataTable( {
      "processing": true,
      "serverSide": true,
      ajax: { url: $base_url + "mitra/penjualan/ReportPerTransaction_loaddata",
            data: { date_from :  inputVal, date_to : inputValTo, project : inputValProject},
              },
      "destroy" : true,
      "columns": [
        {"name": "jual_id","orderable": false,"searchable": false,  "className": "text-center", "width": "5%"},
        {"name": "jual_tgl"},
        {"name": "project_id"},
        {"name": "jual_kode"},
        {"name": "jual_total", "className": "text-right"},
        {"name": "jual_dibayar", "className": "text-right"},
        {"name": "jual_sisa_bayar", "className": "text-right"},
        {"name": "status_name"},
      ],
  } );    
}
// 1. mitra lap. penjualan detail produk
function searchMitra_ReportDetailProduk() { 
  var input = document.getElementById("date_from");
  var inputVal = "";
  if (input) {
      inputVal = input.value;
  }
  var input_to = document.getElementById("date_to");
  var inputValTo = "";
  if (input_to) {
      inputValTo = input_to.value;
  }
  var input_project = document.getElementById("spp_kode_project");
  var inputValProject = "";
  if (input_project) {
    inputValProject = input_project.value;
  }
  $('#mitraReportPenjualanDetailProduk').DataTable( {
      "processing": true,
      "serverSide": true,
      ajax: { url: $base_url + "mitra/penjualan/ReportDetailProduk_loaddata",
            data: { date_from :  inputVal, date_to : inputValTo, project : inputValProject},
              },
      "destroy" : true,
      "columns": [
        {"name": "jual_id","orderable": false,"searchable": false,  "className": "text-center", "width": "5%"},
        {"name": "jual_tgl"},
        {"name": "project_id"},
        {"name": "produk_kode"},
        {"name": "produk_nama"},
        {"name": "jual_harga", "className": "text-right"},
        {"name": "jual_qty", "className": "text-right"},
        {"name": "jual_jumlah", "className": "text-right"},
      ],
  } );    
}

// 1. mitra lap. penjualan detail produk
function searchMitra_JurnalPosting() { 
  var input = document.getElementById("date_from");
  var inputVal = "";
  if (input) {
      inputVal = input.value;
  }
  var input_to = document.getElementById("date_to");
  var inputValTo = "";
  if (input_to) {
      inputValTo = input_to.value;
  }
  var input_project = document.getElementById("spp_kode_project");
  var inputValProject = "";
  if (input_project) {
    inputValProject = input_project.value;
  }
  $('#mitraTablePosting').DataTable( {
      "processing": true,
      "serverSide": true,
      ajax: { url: $base_url + "mitra/accounting/JurnalPosting_loaddata",
            data: { date_from :  inputVal, date_to : inputValTo, project : inputValProject},
              },
      "destroy" : true,
      "paging":   false,
      "ordering": false,
      "info":     false,
      "scrollX": true,
      "columns": [
        {"name": "TRANS_ID","orderable": false,"searchable": false,  "className": "text-center", "width": "5%"},
        {"name": "TGL_TRANS"},
        {"name": "UPLOADED"},
        {"name": "PROJECTKODE"},
        {"name": "acc_type_name"},
        {"name": "KODE_PERK"},
        {"name": "DEBET", "className": "text-right"},
        {"name": "KREDIT", "className": "text-right"},
        {"name": "act"},
      ],
  } );    
}
