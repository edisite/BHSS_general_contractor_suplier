var $base_url = $("body").data("base_url");

    $(document).ready(function(){
        itemBarang = 0;
        idBarang = [];
        itemBarang = parseInt($("#jml_itemBarang").val());
        barang = [];
        id_jenis = 1;       
        $('#m_barang_id').css('width', '100%');

        selectList_ssp();

        // selectList_barang2(id_jenis);
        // selectList_gudangCabangPermintaan();
        
    });

    $('#spp_project').on('select2:select', function (evt) {
        $("#m_barang_id").select2();
        $("#m_barang_id").select2('destroy');
        $("#m_barang_id").empty();
        id_jenis = $(evt.currentTarget).find("option:selected").val();
        selectList_barang_ssp("#m_barang_id", id_jenis);
    });

    function ubahJenisBarang (element) {
        $("#m_barang_id").empty();
        id_jenis = element.value;
        selectList_barang2("#m_barang_id", id_jenis);
    }


    function addPO_1() {
        var id = document.getElementsByName('m_barang_id')[0].value;
        if (id.length > 0) {
            getDetailBarang(id);
        }
        $("#m_barang_id").select2('destroy');
        $("#m_barang_id").empty();
        
        var e = document.getElementById("spp_project");
        var no_ssp = e.options[e.selectedIndex].value;

        selectList_barang2("#m_barang_id", no_ssp);    
    }
    function addPO() {
        $("#tipe_ppn0").hide();
        $("#tipe_ppn1").hide();
        id = document.getElementById('m_barang_id').value;
        $.ajax({
          type : "GET",
          url  : $base_url + 'api/internal/barang/loadData_where_id',
          data : "id="+id,
          dataType : "json",
          success:function(data){
            // $("#default-table tbody").empty();

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
                            <input type="hidden" name="permintaan_barang_kode[]" value='+data.val[i].barang_kode+'/>\
                            '+data.val[i].barang_kode+'\
                        </td>\
                        <td id="td2'+(i+1)+'">\
                            '+data.val[i].barang_nama+' ('+data.val[i].barang_nomor+')\
                        </td>\
                        <td id="td3'+(i+1)+'">\
                            <input type="text" class="form-control num num2" id="orderdet_qty'+data.val[i].kode+'" name="orderdet_qty[]" value="10" onchange="sumSubTotal()" required/>\
                        </td>\
                        <td id="td4'+(i+1)+'">\
                            '+data.val[i].barang_satuan+'\
                        </td>\
                        <td id="td5'+(i+1)+'">\
                            <input type="text" class="form-control num num2" id="orderdet_harga_satuan'+data.val[i].kode+'" name="orderdet_harga_satuan[]" value="0" onchange="sumSubTotal()" required/>\
                        </td>\
                        <td id="td6'+itemBarang+'">\
                            <input type="text" class="form-control money money2" id="orderdet_total'+data.val[i].kode+'" name="orderdet_total[]" value="0" required readonly/>\
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
            }
          }            
        
        });
        $("#m_barang_id").select2('destroy');
        $("#m_barang_id").empty();
        var e = document.getElementById("spp_project");
        var no_ssp = e.options[e.selectedIndex].value;
        selectList_barang_ssp("#m_barang_id", id_jenis);
    }


    function removeBarang(itemSeq) {
        var parent = document.getElementById("tbody1");
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

    function sumSubTotal() {
        subTotal = 0;
        for (var i = 1; i <= itemBarang; i++) {
            // alert(idBarang);
            qty = parseFloat(document.getElementById('orderdet_qty'+idBarang[i-1]).value.replace(/\,/g, ""));
            hrg = parseFloat(document.getElementById('orderdet_harga_satuan'+idBarang[i-1]).value.replace(/\,/g, ""));
            document.getElementById('orderdet_total'+idBarang[i-1]).value = qty * hrg;
            subTotal += qty * hrg;
        }
        document.getElementById('order_subtotal').value = subTotal;
        sumDiscount();
        sumTotal();
        sumTax();
    }

    function sumTotal() {
        subTotal            = parseFloat(document.getElementById('order_subtotal').value.replace(/\,/g, ""));
        order_diskon        = parseFloat(document.getElementById('order_diskon').value.replace(/\,/g, ""));
        order_tax           = parseFloat(document.getElementById('order_tax').value.replace(/\,/g, ""));
        order_other_cost    = parseFloat(document.getElementById('order_other_cost').value.replace(/\,/g, ""));

        document.getElementById('order_total').value = subTotal - order_diskon - order_tax - order_other_cost;
    }

    function sumDiscount() {
        order_diskon_input = parseFloat(document.getElementById('order_diskon_input').value.replace(/\,/g, ""));        
        subTotal = parseFloat(document.getElementById('order_subtotal').value.replace(/\,/g, ""));
        document.getElementById('order_diskon').value = order_diskon_input * subTotal  / 100;
        sumTotal();            
    }

    function sumTax() {
        order_tax_input = parseFloat(document.getElementById('order_tax_input').value.replace(/\,/g, ""));        
        subTotal = parseFloat(document.getElementById('order_subtotal').value.replace(/\,/g, ""));
        document.getElementById('order_tax').value = order_tax_input * subTotal  / 100;
        sumTotal();            
    }