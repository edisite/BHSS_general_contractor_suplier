<style>
    /*----------------------------------------
    Profile Page
------------------------------------------*/

#profile-page-header .card-content{
  margin-top: -30px;
}
#profile-page-header .card-content .card-title{
  margin-bottom: 0px;
}

/*profile-page-wall*/

#profile-page-wall .profile-image-post{
  width: 60px;
  margin: 30px 10px;
}
#profile-page-wall .tab-profile .tab i{
  font-size: 16px;
}
#profile-page-wall .tab-content{
  padding: 10px;
}
#profile-page-wall .share-icons{
  margin-top: 10px;
}
#profile-page-wall .share-icons i{
  padding: 0px 5px;
}

</style>


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
                            
                        <div class="col-sm-12">
                            <!--<h4>Profile </h4>-->
                            <div class="card-title text-left">    
                            <span style="font-family: Baloo, cursive;font-size: 25px;">My Account </span>
                            </div>
                            <hr>   
                        </div>
                    <?php echo $form->open(); ?>                                
                    <?php echo $form->messages(); ?>    
                    <div class="row">
                            <div class="col-sm-8">                             
                                <div class="form-group col-sm-12 col-md-12"><label>Nama Lengkap </label><input class="form-control" name="nama_lengkap" type="text" <?php echo $readonly; ?> value="<?php echo $nama_lengkap ?: ''; ?>"></div>
                                <div class="form-group col-sm-12 col-md-12"><label>Email </label><input class="form-control" name="email" <?php echo $readonly; ?> value="<?php echo $email ?: ''; ?>"></div>
                                <div class="form-group col-sm-12 col-md-12"><label>Handphone </label><input class="form-control" name="hp" <?php echo $readonly; ?> value="<?php echo $handphone ?: ''; ?>"></div>                                
                                <div class="form-group col-sm-12 col-md-12"><label>Kategori </label>
                                    <div class="input-group">
                                        <div class="d-inline-block custom-control custom-radio mr-1">
                                            <input type="radio" name="kategori" class="form-control" id="individu" value="individu" <?php echo $individu.' '.$disabled; ?>>
                                            <label class="" for="yes">Individu</label>
                                        </div>
                                        <div class="d-inline-block custom-control custom-radio">
                                            <input type="radio" name="kategori" class="form-control" id="perusahaan" value="perusahaan" <?php echo $perusahaan.' '.$disabled; ?>>
                                            <label class="" for="no">Perusahaan</label>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="form-group col-sm-12 col-md-12"><label>Perusahaan </label><input class="form-control" name="name_perusahaan" <?php echo $readonly; ?> value="<?php echo $company_name ?: ''; ?>"></div>
                                <div class="form-group col-sm-12 col-md-12"><label>Alamat </label><textarea class="form-control" name="alamat" rows="5" <?php echo $readonly; ?>><?php echo $address ?: ''; ?></textarea></div>
                            </div>
                            <div class="col-sm-4 text-center">
                                <br>
                                <br>     
                                <?php 
                                    if($readonly == ""){
                                        ?>
                                            <button type="submit" class="btn btn-success btn-sm btn-block">SIMPAN</button>  
                                            <br>
                                            
                                            <!--<a href="<?php echo base_url(); ?>account/" class="btn btn-warning btn-block">KEMBALI</a>-->
                                        <?php
                                    }else{
                                        ?>
                                            <a href="<?php echo base_url(); ?>account/?type=edit" class="btn btn-info btn-sm">UBAH</a>
                                            <a href="<?php echo base_url(); ?>account/HapusAkun" class="btn btn-danger btn-sm">HAPUS AKUN</a>
                                            
                                        
                                        <?php
                                    }
                                
                                ?>
                           
                            </div>
                    </div>
                    <?php echo $form->close(); ?>
            </section>
        </div>
    </div>
                    
                
                          
</div>
<!--    </div>
</div>-->


<script>
      $(document).ready(function(){
    $('select').formSelect();
  });
  
   $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15 // Creates a dropdown of 15 years to control year
  });
</script>