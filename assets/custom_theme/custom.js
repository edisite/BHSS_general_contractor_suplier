var $base_url = $("body").data("base_url");

$('#formAdd input, #formAdd select, #formAdd textarea').not("[type=submit]").jqBootstrapValidation({
            preventSubmit: true,
            submitSuccess: function($form, event){     
             event.preventDefault();
             $this = $('#barangbtn');
             $this.prop('disabled', true);
             var form_data = $("#formAdd").serialize();
             $.ajax({
              url: $base_url+''+$("#url").val(),
              method:"POST",
              data:form_data,
              success:function(){
                    alert_success_save();
                        $('#success').html("<div class='alert alert-success'><strong>Your message has been sent. </strong></div>");
                    $('#formAdd').trigger('reset');
                    $('#formAdd').select2("destroy");
              },
              error:function(){
                     $('#success').html("<div class='alert alert-danger'>There is some error</div>");
                    //$('#formAdd').trigger('reset');
              },
              complete:function(){
               setTimeout(function(){
                $this.prop("disabled", false);
                $('#success').html('');
               }, 5000);
              }
             });
            },
    });
    
    
    function alert_success_save() {
        swal({
            title: "Success!",
            text: "Data telah tersimpan!",
            type: "success",
            confirmButtonClass: "btn-raised btn-success",
            confirmButtonText: "OK",
        });
    }


//repeater form

(function(window, document, $) {
        'use strict';
    
        // Default
        $('.repeater-default').repeater();
        
        // Custom Show / Hide Configurations
        $('.file-repeater, .contact-repeater').repeater({
            show: function () {
                $(this).slideDown();
            },
            hide: function(remove) {
                if (confirm('Are you sure you want to remove this item?')) {
                    $(this).slideUp(remove);
                }
            }
        });
    
        //date time year
        
})(window, document, jQuery);


// dete picker
(function(window, document, $) {
	'use strict';

	/*******	Pick-a-date Picker	*****/
	// Basic date
	$('.pickadate').pickadate();

	// Change Day & Month strings
	$('.pickadate-short-string').pickadate({
		weekdaysShort: ['S', 'M', 'Tu', 'W', 'Th', 'F', 'S'],
		showMonthsShort: true
    });
    
    
	// Select Year
	$('.pickadate-select-year').pickadate({
		selectYears: 8
	});

})(window, document, jQuery);