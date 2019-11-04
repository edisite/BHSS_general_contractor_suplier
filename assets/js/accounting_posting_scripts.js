var $base_url = $("body").data("base_url");

    $(document).ready(function(){

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

          searchMitra_JurnalPosting();
    });
    

    function jurnalPosting_Action() { 
        
        swal({
            title: "Perhatian !",
            text: "Pastikan data sudah benar. Data yang sudah di posting tidak dapat dirubah kembali!",
            icon: "info",
            showCancelButton: true,
            buttons: {
                    cancel: {
                        text: "Periksa Lagi?",
                        value: null,
                        visible: true,
                        className: "btn-warning",
                        closeModal: false,
                    },
                    confirm: {
                        text: "Yes, Posting",
                        value: true,
                        visible: true,
                        className: "",
                        closeModal: false
                    }
            }
        }).then(isConfirm => {
            if (isConfirm) {

                JurnalPosting_execution();
                //swal("Deleted!", "Your imaginary file has been deleted.", "success");
            } else {
                swal("Cancelled", "Mohon di periksa lagi lebih teliti", "error");
            }
        });


      }


    function JurnalPosting_execution() {
        $.ajax({
            type : "GET",
            url  : $base_url + 'mitra/accounting/jurnalUmumPosting_action',         
            dataType : "json",
            success:function(data){
              if(data.status=='200'){
                  swal("Selesai!", "Silakan cek di bukubesar", "success");
                  searchMitra_JurnalPosting();
            } else if (data.status=='204') {
                swal({   title: "Data Kosong",   text: "Tidak ada transaksi yang akan di posting",   timer: 2000,   showConfirmButton: false });
            }
          }
        });
    }