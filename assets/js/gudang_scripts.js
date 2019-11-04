var $base_url = $("body").data("base_url");

    $(document).ready(function(){
        itemBarang = parseInt($("#jml_itemBarang").val());
        barang = [];
        id_jenis = 1;       
        $('#m_barang_id').css('width', '100%');

        selectList_project();

        // selectList_barang2(id_jenis);
        // selectList_gudangCabangPermintaan();
        
    });

    $('#spp_kode_project').on('select2:select', function (evt) {
        $("#m_barang_id").select2();
        $("#m_barang_id").select2('destroy');
        $("#m_barang_id").empty();
        id_jenis = $(evt.currentTarget).find("option:selected").val();
        selectList_barang2("#m_barang_id", id_jenis);
    });

    function ubahJenisBarang (element) {
        $("#m_barang_id").empty();
        id_jenis = element.value;
        selectList_barang2("#m_barang_id", id_jenis);
    }


    function addBarang() {
        var id = document.getElementsByName('m_barang_id')[0].value;
        if (id.length > 0) {
            getDetailBarang(id);
        }
        $("#m_barang_id").select2('destroy');
        $("#m_barang_id").empty();
        
        var e = document.getElementById("spp_kode_project");
        var id_jenis = e.options[e.selectedIndex].value;

        selectList_barang2("#m_barang_id", id_jenis);    
        // selectList_barang2(idElement);
        //selectList_barang();
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

    function getDetailBarang(id) {
        $.ajax({
          type : "GET",
          url  : $base_url + 'api/internal/barang/loadData_where_id',
          data : { id : id },
          dataType : "json",
          success:function(data){
            for(var i = 0; i < data.val.length; i++){
                itemBarang++;
                $("#jml_itemBarang").val(itemBarang);
                $("#default-table2 tbody").append('\
                    <tr id="detail'+itemBarang+'">\
                        <td id="td1'+itemBarang+'">\
                            '+itemBarang+'\
                        </td>\
                        <td id="td2'+itemBarang+'">\
                            <input type="hidden" name="m_barang_id[]" value="'+data.val[i].kode+'"/>\
                            <input type="hidden" name="m_project_kode[]" value="'+data.val[i].project_kode+'"/>\
                            <input type="hidden" name="permintaan_barang_kode[]" value='+data.val[i].barang_kode+'/>\
                            '+data.val[i].barang_kode+'\
                        </td>\
                        <td id="td3'+itemBarang+'">\
                            '+data.val[i].project_kode+'\
                        </td>\
                        <td id="td4'+itemBarang+'">\
                            '+data.val[i].barang_nama+' ('+data.val[i].barang_nomor+')\
                        </td>\
                        <td id="td5'+itemBarang+'">\
                            <input type="text" class="form-control" name="permintaan_pembeliandet_qty[]" value="0" required/>\
                        </td>\
                        <td id="td6'+itemBarang+'">\
                            '+data.val[i].barang_satuan+'\
                        </td>\
                        <td id="td7'+itemBarang+'">\
                            <button type="button" id="removeBtn'+itemBarang+'" class="btn btn-danger" onclick="removeBarang('+itemBarang+')">\
                                <i class="icon-close"></i>\
                            </button>\
                        </td>\
                    </tr>\
                ');
            }
          }
        });
    }
