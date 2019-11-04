var $base_url = $("body").data("base_url");

    $(document).ready(function(){
        itemBarang = parseInt($("#jml_itemBarang").val());
        selectList_project();        
        selectList_coa('#kodecoa1');           
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
          
          $("#idin_balance").hide();
          $("#idno_balance").show();
          CheckBalance();
          defaultValue();
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


    function addJurnal() {
        itemBarang++;
        $("#jml_itemBarang").val(itemBarang);
        $("#default-table2 tbody").append('\
            <tr id="detail'+itemBarang+'" class="form-group">\
                <td id="td1'+itemBarang+'">\
                    '+itemBarang+'\
                </td>\
                <td id="td2">\
                <select class="select2 form-control" name="kodecoa[]" id="kodecoa'+itemBarang+'"> </select>\
                </td>\
                <td id="td3'+itemBarang+'">\
                    <input type="text" class="form-control num num2" name="itemdebet[]" placeholder="DEBET" id="itemdebet'+itemBarang+'"  onchange="sumSubDebet()" value="0" required />\
                </td>\
                <td id="td4'+itemBarang+'">\
                    <input type="text" class="form-control num num2" name="itemkredit[]" placeholder="KREDIT" id="itemkredit'+itemBarang+'"  onchange="sumSubKredit()" value="0" required />\
                </td>\
                <td id="td5'+itemBarang+'">\
                    <button type="button" id="removeBtn'+itemBarang+'" class="btn btn-danger" onclick="removeJurnal('+itemBarang+')">\
                        <i class="icon-close"></i>\
                    </button>\
                </td>\
            </tr>\
        ');
        $('.num2').number( true, 2, '.', ',' );
        $('.num2').css('text-align', 'right');
        selectList_coa('#kodecoa'+itemBarang);
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


    function removeJurnal(itemSeq) {
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
    function sumSubDebet() {
        subTotalDebet = 0;
        for (var i = 1; i <= itemBarang; i++) {
                                qty = 0;
                                qty = parseFloat(document.getElementById('itemdebet'+i).value.replace(/\,/g, ""));

            subTotalDebet += qty;					
        }
        document.getElementById('thasildebet').value = subTotalDebet;
        $('.money').number( true, 2, '.', ',' );
        $('.money').css('text-align', 'right');
//                sumTotal();
                        CheckBalance()
    }

    function sumSubKredit() {
    subTotalKredit = 0;
    for (var i = 1; i <= itemBarang; i++) {
                            qty = 0;
                            qty = parseFloat(document.getElementById('itemkredit'+i).value.replace(/\,/g, ""));		

        subTotalKredit += qty;					
    }
    document.getElementById('thasilkredit').value = subTotalKredit;
    $('.money').number( true, 2, '.', ',' );
    $('.money').css('text-align', 'right');
    //                sumTotal();
                    CheckBalance()
    }

    function CheckBalance() {
            qdebet = parseFloat(document.getElementById('thasildebet').value.replace(/\,/g, ""));
            qkredit = parseFloat(document.getElementById('thasilkredit').value.replace(/\,/g, ""));
            if(qdebet == 0 && qkredit == 0){
                    $("#idin_balance").hide();
                    $("#idno_balance").show();
                    document.getElementById("submit").disabled = true;
            }
            else if(qdebet == qkredit){
                    $("#idin_balance").show();
                    $("#idno_balance").hide();
                    document.getElementById('submit').disabled = false;

            }else{
                    $("#idin_balance").hide();
                    $("#idno_balance").show();
                    document.getElementById("submit").disabled = true;

            }
    }
    function CheckValue(){

        for (var i = 1; i <= itemBarang; i++) {
                        cdebet 		= parseFloat(document.getElementById('itemdebet'+i).value.replace(/\,/g, ""));		
                        ckredit 	= parseFloat(document.getElementById('itemkredit'+i).value.replace(/\,/g, ""));			

                        if(cdebet == 0 && ckredit == 0){
                                document.getElementById('itemkredit'+i).readOnly = false;
                                document.getElementById('itemdebit'+i).readOnly = false;
                        }
                        else if(qdebet == 0 && qkredit > 0){
                                document.getElementById('itemkredit'+i).readOnly = false;
                                document.getElementById('itemdebit'+i).readOnly = true;

                        }else if(qkredit == 0 && qkredit > 0){
                                document.getElementById('itemkredit'+i).readOnly = false;
                                document.getElementById('itemdebit'+i).readOnly = true;

                        }				
        }

}
