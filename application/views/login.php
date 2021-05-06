    <!-- ////////////////////////////////////////////////////////////////////////////-->
    <div class="app-content content">
      <div class="content-wrapper">
        <div class="content-header row">
        </div>
        <div class="content-body">
            <section class="flexbox-container">
                <div class="col-12 d-flex align-items-center justify-content-center">
                    <div class="col-md-6 col-10 box-shadow-2 p-0">
                        <div class="card border-grey border-lighten-3 m-0">
                            <div class="card-header border-0">
                                <div class="card-title text-center">
                                    <div class="p-1"><img src="<?php echo base_url(); ?>assets/3th/img/loder-logo.png" alt="branding logo" width="180px" height="90px"></div>
                                     
                                </div>                            
                            </div>
                            <div class="card-content">
                                <div class="card-body pt-0">
                                    <h3 class="_title font-bold">Halo, Selamat datang kembali!</h3>
                                        <p class="nomargin">Masukan username dan kata sandi Anda pada form di bawah. </p>
                                    <?php echo $form->open(); ?>                                
                                    <?php echo $form->messages(); ?>                                
                                            <?php echo $form->bs3_text('Username', 'username', ENVIRONMENT==='development' ? 'joko01@gmail.com' : ''); ?>
                                            <?php echo $form->bs3_password('Password', 'password', ENVIRONMENT==='development' ? '12345' : ''); ?>
                                        <div class="form-group row">
                                            <div class="col-md-6 col-12 text-center text-sm-left">
                                                <fieldset>
                                                    <input type="checkbox" id="remember-me" name="remember" class="chk-remember">
                                                    <label for="remember-me"> Remember Me</label>
                                                </fieldset>
                                            </div>
                                            <div class="col-md-6 col-12 float-sm-left text-center text-sm-right"><a href="<?php echo base_url();?>auth/register" class="card-link">Buat Akun</a></div>
                                        </div>
                                        <button type="submit" class="btn btn-danger btn-border"><i class="ft-unlock"></i> Login</button>
                                </div>
                                <?php echo $form->close(); ?>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </div>
      </div>
    </div>
    <!-- ////////////////////////////////////////////////////////////////////////////-->
