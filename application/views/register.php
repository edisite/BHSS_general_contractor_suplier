<!-- ======= Hero Section ======= -->
<section class="d-flex align-items-center">
    <div class="container">
    </div>
</section>
    <!-- ////////////////////////////////////////////////////////////////////////////-->
<div class="app-content content">
    <div class="content-wrapper">
        <div class="content-body">
            <section class="flexbox-container">
                <div class="container">
                <div class="col-12 d-flex align-items-center justify-content-center">
                    <div class="col-md-12 col-10 box-shadow-2 p-0">
                        <div class="card border-grey border-lighten-3 m-0">
                            <div class="card-header border-0">
                                <div class="card-title text-center">                                   
                                    <span style="font-family: Baloo, cursive;font-size: 25px;">BUAT AKUN</span>
                                </div>                            
                            </div>
                            <div class="card-content">                               
                        
                           
                                <?php echo $form->open(); ?> 
                                 <div class="card-body">    
                                
                                     <div class="row">
                                         <div class="col-md-6">
                                             <div class="row">
                                                 <div class="col-md-12">
                                                     <div class="form-group">
                                                         <label class="text text-muted">Nama Perusahaan / Individu :</label>
                                                         <input type="text" name="name_perusahaan" class="form-control" id="name_perusahaan" value="" placeholder="" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                                                         <div class="validate"></div>
                                                     </div>
                                                 </div>
                                             </div>    

                                             <div class="row">
                                                 <div class="col-md-12">
                                                     <div class="form-group">
                                                     <label class="text text-muted">Kategori :</label>
                                                         <div class="input-group">
                                                             <div class="d-inline-block custom-control custom-radio mr-1">
                                                                 <input type="radio" name="kategori" class="form-control" id="individu" value="individu" >
                                                                 <label class="" for="yes">Individu</label>
                                                             </div>
                                                             <div class="d-inline-block custom-control custom-radio">
                                                                 <input type="radio" name="kategori" class="form-control" id="perusahaan" value="perusahaan">
                                                                 <label class="" for="no">Perusahaan</label>
                                                             </div>

                                                         </div>
                                                     </div>
                                                 </div>
                                             </div>

                                             <div class="row">
                                                 <div class="col-md-12">
                                                     <div class="form-group">
                                                         <label class="text text-muted">No. HP / Telp :</label>
                                                         <input type="text" class="form-control" name="handphone" id="handphone" value="" placeholder="" data-rule="required" data-msg="Please enter a valid No Handphone" />
                                                          <div class="validate"></div>
                                                     </div>
                                                 </div>
                                             </div>  
                                             <div class="row">
                                                 <div class="col-md-12">
                                                     <div class="form-group">
                                                         <label class="text text-muted">Alamat Lengkap :</label>
                                                          <textarea class="form-control" name="alamat" rows="5" data-rule="required" data-msg="Please write your address" placeholder=""></textarea>
                                                         <div class="validate"></div>
                                                     </div>
                                                 </div>
                                             </div> 
                                         </div>

                                         <div class="col-md-6">
                                         <div class="row">
                                             <div class="col-md-12">
                                                 <div class="form-group">
                                                     <label class="text text-muted">Nama Pengguna :</label>
                                                     <input type="text" name="nama_pengguna" class="form-control" id="nama_pengguna" value="" placeholder="" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                                                     <div class="validate"></div>
                                                 </div>
                                             </div>
                                         </div> 
                                             <div class="row">
                                                 <div class="col-md-12">
                                                     <div class="form-group">
                                                         <label class="text text-muted">Email :</label>
                                                         <input type="email" class="form-control" name="email" id="email" placeholder="" value="" data-rule="email" data-msg="Please enter a valid email" />
                                                          <div class="validate"></div>
                                                     </div>
                                                 </div>
                                             </div>                                

                                             <div class="row">
                                                 <div class="col-md-12">
                                                     <div class="form-group">
                                                         <label class="text text-muted">Kata Sandi :</label>
                                                         <input type="password" class="form-control" name="password" id="password" value="" placeholder="" data-rule="required" data-msg="Please enter a Password" />
                                                          <div class="validate"></div>
                                                     </div>
                                                 </div>
                                             </div>                                
                                             <div class="row">
                                                 <div class="col-md-12">
                                                     <div class="form-group">
                                                         <label class="text text-muted">Konfirmasi Kata Sandi :</label>
                                                         <input type="password" class="form-control" name="retype_password" id="retype_password" value="" placeholder="" data-rule="required" data-msg="Please enter a valid retype password" />
                                                          <div class="validate"></div>
                                                     </div>
                                                 </div>
                                             </div>   
                                             <?php echo $form->messages(); ?>
                                             <div class="row">                                
                                                 <div class="input-field col s8">
                                                     <button type='submit' name='btn_login' class='btn btn-danger'>Daftar</button>
                                                 </div>
                                             </div>

                                         </div>
                                     </div>

                                 </div>

                               </form>
                            </div>
                        
                                    
                   
              
                            </div>
                        </div>
                    
                    </div>
                    <div class="row pull-right">
                        <div class="col s8">
                            <p class="margin center medium-small sign-up">Sudah memiliki Akun? <a href="<?php echo base_url();?>auth">Login</a></p>
                        </div>
                    </div>
                </div>
                
            </section>
                          
        </div>
    </div>
</div>
