var $base_url = $("body").data("base_url");

    $(document).ready(function(){
        itemBarang = 0;
        idBarang = [];
        itemBarang = parseInt($("#jml_itemBarang").val());
        barang = [];
        id_jenis = 1;       
        $('#m_karyawan_id').css('width', '100%');
        $('#m_gudang_id').css('width', '100%');
        $('#po_select').css('width', '100%');

        selectList_karyawan();
        selectList_gudang();
        selectList_PO();
        
    });

    $('#po_select').on('select2:select', function (evt) {
        removeTableBody();
        itemBarang = 0;
        id_jenis = $(evt.currentTarget).find("option:selected").val();
        addPB(id_jenis);
    });

    function ubahJenisBarang (element) {
        $("#m_barang_id").empty();
        id_jenis = element.value;
        selectList_barang2("#m_barang_id", id_jenis);
        addPB(id_jenis);
    }
    function addPB(id) {
        $.ajax({
          type : "GET",
          url  : $base_url+'api/internal/barang/loadData_where_orderid',
          data : "id="+id,
          dataType : "json",
          success:function(data){
            $("#default-table tbody").empty();

            itemBarang++;
            $("#jml_itemBarang").val(itemBarang);

            for(var i = 0; i < data.val.length; i++){               

                $("#default-table tbody").append('\
                    <tr id="detail'+itemBarang+'">\
                        <td id="td0'+itemBarang+'">\
                            '+itemBarang+'\
                        </td>\
                        <td id="td1'+itemBarang+'">\
                            <input type="hidden" name="m_barang_id[]" value="'+data.val[i].kode+'"/>\
                            <input type="hidden" name="m_project_kode[]" value="'+data.val[i].project_kode+'"/>\
                            <input type="hidden" name="orderdet_id[]" value="'+data.val[i].orderdet_id+'"/>\
                            <input type="hidden" name="permintaan_barang_kode[]" value='+data.val[i].barang_kode+'/>\
                            '+data.val[i].barang_kode+'\
                        </td>\
                        <td id="td2'+(i+1)+'">\
                            '+data.val[i].project_kode+'\
                        </td>\
                        <td id="td2'+(i+1)+'">\
                            '+data.val[i].barang_nama+' ('+data.val[i].barang_nomor+')\
                        </td>\
                        <td id="td2'+(i+1)+'">\
                            '+data.val[i].barang_satuan+'\
                            </td>\
                            <td id="td2'+(i+1)+'">\
                            '+data.val[i].order_qty+'\
                        </td>\
                        <td id="td2'+(i+1)+'">\
                            '+data.val[i].order_qty_realisasi+'\
                        </td>\
                            <td id="td2'+(i+1)+'">\
                            '+data.val[i].order_qty_selisih+'\
                        </td>\
                        <td id="td3'+(i+1)+'">\
                            <input type="text" class="form-control num num3" id="orderdet_qty'+data.val[i].kode+'" name="orderdet_qty[]" value="0" onchange="sumSubTotal()" required/>\
                        </td>\
                        <td id="td4'+(i+1)+'">\
                            '+data.val[i].order_status+'\
                        </td>\
                        <td id="td7'+itemBarang+'">\
                            <buttonf type="button" id="removeBtn'+itemBarang+'" class="btn btn-danger" title="remove list" onclick="removeBarang('+itemBarang+')">\
                                <i class="icon-close"></i>\
                            </button>\
                        </td>\
                    </tr>\
                ');
                idBarang.push(data.val[i].kode);
                $('.num2').number( true, 2, '.', ',' );
                $('.persen').number( true, 0, '.', ',' );
                $('.num2').css('text-align', 'right');
                $('.money2').number( true, 2, '.', ',' );
                $('.money').css('text-align', 'right');
                $('.num3').css('text-align', 'right');
                $('.num3').number( true, 0, '.', ',' );
                
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
               
                itemBarang++;
            }
          }          
        
        });
        // $("#m_barang_id").select2('destroy');
        // $("#m_barang_id").empty();
        // var e = document.getElementById("po_select");
        // var no_pb = e.options[e.selectedIndex].value;
        // selectList_barang_penerimaanbarang("#m_barang_id", no_pb);
    }


    function removeBarang(itemSeq) {
        var parent = document.getElementById("tbody");
        for (var i = 1; i <= itemBarang; i++) {
          if (i >= itemSeq && i < itemBarang) {
            document.getElementById("td2"+i).innerHTML = document.getElementById("td2"+(i+1)).innerHTML;
            document.getElementById("td3"+i).innerHTML = document.getElementById("td3"+(i+1)).innerHTML;
            document.getElementById("td4"+i).innerHTML = document.getElementById("td4"+(i+1)).innerHTML;
            // document.getElementById("po_customerdet_qty"+i).value = document.getElementById("po_customerdet_qty"+(i+1)).value;
            document.getElementById("td5"+i).innerHTML = document.getElementById("td5"+(i+1)).innerHTML;
            document.getElementById("td6"+i).innerHTML = document.getElementById("td6"+(i+1)).innerHTML;
          };
        };
        for (var i = 1; i <= itemBarang; i++) {
          if (i == itemSeq) {
            var child = document.getElementById("detail"+i);
            parent.removeChild(child);
          };
        };
        itemBarang--;
    }
    function removeTableBody(){
        $("#default-table tbody").empty();
        itemBarang = 0;
    }

    function alert_success_save() {
        swal({
            title: "Success!",
            text: "Data telah tersimpan!",
            type: "success",
            confirmButtonClass: "btn-raised btn-success",
            confirmButtonText: "OK",
        });
    }