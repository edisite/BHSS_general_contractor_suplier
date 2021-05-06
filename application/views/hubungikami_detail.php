<!-- ======= Hero Section ======= -->
<section class="d-flex align-items-center">
  <div class="container">
  </div>
</section><!-- End Hero -->
<div class="container">
    <div class="header-blue" style="background-image: url(<?php echo base_url(); ?>assets/3th/img/01.BannerPage.jpg);background-position: top;margin: 0px;padding: 0px;background-repeat: repeat;background-size: cover;height: 380px;">
        <div class="row" style="margin: 0px;height: 199px;">
            <div class="col-md-6 col-lg-5 offset-lg-1 text-center ml-auto" style="margin: 121px;margin-top: 75px;margin-left: 20px;margin-right: 20px;width: 464px;color: rgb(233,239,245);height: 111px;background-repeat: no-repeat;background-size: auto;background-position: top;">
            </div>
        </div>
    </div>
    <div class="row">            <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">
        <!--<div class="container">-->
            <div>
              <iframe style="border:0; width: 100%; height: 410px;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d249.36288785437694!2d117.45019796822189!3d0.1411942562975235!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x320a11f756e8115f%3A0xac3fa2edd7160479!2zMMKwMDgnMjguMiJOIDExN8KwMjcnMDEuMCJF!5e0!3m2!1sen!2sid!4v1606242334429!5m2!1sen!2sid" frameborder="0" allowfullscreen></iframe>
            </div>
            <div class="row mt-5">

              <div class="col-lg-4">
                <div class="info">
                  <div class="address">
                    <i class="icofont-google-map"></i>
                    <!--<h4>Location:</h4>-->
                    <p>PT.BINTANG HARAPAN SUKSES SEJAHTERA<br>
                    JL. S. Parman No.14 Kelurahan Belimbing Kecamatan Bontang Barat Kota Bontang Kalimantan Timur</p>
                  </div>

                  <div class="email">
                    <i class="icofont-envelope"></i>
                    <!--<h4>Email:</h4>-->
                    <p>PTBHSS@domain.com</p>
                    <p> SENIN - JUMAT, 08.00 - 17.00 WITA</p>
                  </div>

                  <div class="phone">
                    <i class="icofont-phone"></i>
                    <!--<h4>Call:</h4>-->
                    <p>+62 853 4070 1452</p>
                    <p>Lisa Randalayuk</p>
                  </div>

                </div>

              </div>

              <div class="col-lg-8 mt-5 mt-lg-0">
                    <p><b>KIRIM PESAN</b></p>
                    <?php echo $form->open(); ?>                                
                    <?php echo $form->messages(); ?>    
                    <div class="form-row">
                      <div class="col-md-6 form-group">
                        <input type="text" name="name" class="form-control" id="name" placeholder="Masukan Nama" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                        <div class="validate"></div>
                      </div>
                      <div class="col-md-6 form-group">
                        <input type="email" class="form-control" name="email" id="email" placeholder="Masukan Email" data-rule="email" data-msg="Please enter a valid email" />
                        <div class="validate"></div>
                      </div>
                    </div>
                    <div class="form-group">
                      <input type="text" class="form-control" name="subject" id="subject" placeholder="Masukan Judul" data-rule="required" data-msg="Please enter a subject" />
                      <div class="validate"></div>
                    </div>
                    <div class="form-group">
                      <textarea class="form-control" name="message" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="Masukan Isi Pesan"></textarea>
                      <div class="validate"></div>
                    </div>
                    <div class="mb-3">
                      <!--<div class="loading">Loading</div>-->
                      <!--<div class="error-message"></div>-->
                      <!--<div class="sent-message">Your message has been sent. Thank you!</div>-->
                    </div>
                    <div class="text-center"><button type="submit" class="btn btn-primary btn-circle">KIRIM</button></div>
                <?php echo $form->close(); ?>

              </div>

            </div>
        <!--</div>-->
    </section><!-- End Contact Section -->

    </div>
</div>
</div>
