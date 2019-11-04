<!-- BEGIN FORM-->
    <form action="#" id="formAdd" class="form-horizontal" method="post" enctype="multipart/form-data">
        <div class="form-body">
            <div class="alert alert-danger display-hide">
                <button class="close" data-close="alert"></button> You have some form errors. Please check below. </div>
            <div class="alert alert-success display-hide">
                <button class="close" data-close="alert"></button> Your form validation is successful! </div>
            <input type="hidden" id="url" value="Master-Data/COA/postData/">
            <div class="form-group" hidden="true">
                <label class="control-label col-md-4">Kode COA (Auto)
                    <span class="required"> * </span>
                </label>
                <div class="col-md-8">
                    <div class="input-icon right">
                        <i class="fa"></i>
                        <input type="text" class="form-control" name="kode" readonly /> </div>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-4">Cabang
                    <span class="required"> * </span>
                </label>
                <div class="col-md-8">
                    <div class="input-icon right">
                        <i class="fa"></i>
                        <select class="form-control" id="m_cabang_id" name="m_cabang_id" aria-required="true" aria-describedby="select-error" required>
                        </select>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-4">Kode COA
                    <span class="required"> * </span>
                </label>
                <div class="col-md-8">
                    <div class="input-icon right">
                        <i class="fa"></i>
                        <input type="text" class="form-control num" name="coa_kode" onchange="checkCoa()" required /> </div>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-4">Tipe COA
                    <span class="required"> * </span>
                </label>
                <div class="col-md-8">
                    <div class="mt-radio-inline">
                        <i class="fa"></i>
                        <label class="mt-radio"> Header
                            <input type="radio" value="1" name="coa_tipe" id="header" onchange="check(this)" required />
                            <span></span>
                        </label>
                        <label class="mt-radio"> Sub Header
                            <input type="radio" value="2" name="coa_tipe" id="subheader" onchange="check(this)" />
                            <span></span>
                        </label>
                        <label class="mt-radio"> Nama Perkiraan
                            <input type="radio" value="3" name="coa_tipe" id="nama_perkiraan" onchange="check(this)" />
                            <span></span>
                        </label> </div>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-4">Header COA
                </label>
                <div class="col-md-8">
                    <div class="input-icon right">
                        <i class="fa"></i>
                        <select class="form-control" id="coa_header" name="coa_header" aria-required="true" aria-describedby="select-error">
                        </select>
                    </div>
                    <p class="help-block">Kosongkan jika tidak ada header.</p>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-4">Sub Header COA
                </label>
                <div class="col-md-8">
                    <div class="input-icon right">
                        <i class="fa"></i>
                        <select class="form-control" id="coa_subheader" name="coa_subheader" aria-required="true" aria-describedby="select-error">
                        </select>
                    </div>
                    <p class="help-block">Kosongkan jika tidak ada sub header.</p>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-4">Nama COA
                    <span class="required"> * </span>
                </label>
                <div class="col-md-8">
                    <div class="input-icon right">
                        <i class="fa"></i>
                        <input type="text" class="form-control" name="coa_nama" required /> </div>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-4">Cashflow
                    <span class="required"> * </span>
                </label>
                <div class="col-md-8">
                    <div class="input-icon right">
                        <i class="fa"></i>
                        <select class="form-control" id="m_cashflow_id" name="m_cashflow_id" aria-required="true" aria-describedby="select-error" required>
                        </select>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-4">Debit/Kredit
                    <span class="required"> * </span>
                </label>
                <div class="col-md-8">
                    <div class="mt-radio-inline">
                        <i class="fa"></i>
                        <label class="mt-radio"> Debit
                            <input type="radio" value="1" name="coa_debit_kredit" id="debit" required />
                            <span></span>
                        </label>
                        <label class="mt-radio"> Kredit
                            <input type="radio" value="-1" name="coa_debit_kredit" id="kredit"/>
                            <span></span>
                        </label> </div>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-4">Keterangan COA
                    <span class="required"> * </span>
                </label>
                <div class="col-md-8">
                    <div class="input-icon right">
                        <i class="fa"></i>
                        <textarea class="form-control" rows="3" name="coa_keterangan" required></textarea> </div>
                </div>
            </div>
        </div>
        <div class="form-actions">
            <div class="row">
                <div class="col-md-offset-4 col-md-8 text-right">
                    <button type="submit" class="btn green-jungle">Submit</button>
                    <button type="button" class="btn default reset" onclick="reset()">Reset</button>
                </div>
            </div>
        </div>
    </form>
    <!-- END FORM-->
    <script type="text/javascript">
        $(document).ready(function(){
        });

        function check(element)
        {
            if(element.value == 1)
            {
                document.getElementById('coa_header').disabled = true;
                document.getElementById('coa_subheader').disabled = true;
            }
            else if(element.value == 2)
            {
                document.getElementById('coa_header').disabled = false;
                document.getElementById('coa_subheader').disabled = true;
            }
            else if(element.value == 3)
            {
                document.getElementById('coa_header').disabled = false;
                document.getElementById('coa_subheader').disabled = false;
            }
        }

        function checkCoa() {
            $.ajax({
                type : "GET",
                url  : '<?php echo base_url();?>Master-Data/COA/checkCOA/',
                data : { coa : document.getElementsByName('coa_kode')[0].value },
                dataType : "json",
                success:function(data){
                    if (data.status == '204') {
                        swal({
                            title: "Alert!",
                            text: "Kode COA Sudah ada!",
                            type: "error",
                            confirmButtonClass: "btn-raised btn-danger",
                            confirmButtonText: "OK",
                        });
                        document.getElementsByName('coa_kode')[0].value = null;
                    }
                }
            });
        }
    </script>