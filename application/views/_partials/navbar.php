
  <!-- ======= Top Bar ======= -->
  <div id="topbar" class="d-none d-lg-flex align-items-center fixed-top">
    <div class="container d-flex">
      <div class="contact-info mr-auto">
          <b>PT. BINTANG HARAPAN SUKSES SEJAHTERA</b>
        <i></i>
        <i class="icofont-envelope"></i> <a href="mailto:contact@example.com">PTBHSS.com</a>
        <i class="icofont-clock-time"></i> SENIN - JUMAT, 08.00 - 17.00 WITA  
      </div>
        <!-- <div class="social-links">
          <a target=”_blank” href="whatsapp://send?text=http://belanjama.com/p/bhss/en/" class="whatsapp"><i class="icofont-airplane-alt"></i> Share</a>
          <a target=”_blank” href="https://wa.me/6285340701452" class="whatsapp"><i class="icofont-whatsapp"></i> Lia T.</a>
          <a target=”_blank” href="https://www.facebook.com/lisa.layuk" class="facebook"><i class="icofont-facebook"></i> Lisa Randa</a>
          <a target=”_blank” href="https://www.instagram.com/liatimang/" class="instagram"><i class="icofont-instagram"></i> Lia T.</a>      
        </div> -->
    </div>
  </div>
    <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">      
        <h1 class="logo mr-auto"><a href="<?php echo base_url(); ?>">
          <img src="<?php echo base_url(); ?>assets/3th/img/loder-logo.png"><button data-toggle="collapse" data-target="#navbarResponsive" class="navbar-toggler navbar-toggler-right" type="button" data-toogle="collapse" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"></button>
            </a>
        </h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <!--<li class="active"><a href="<?php echo base_url(); ?>">Beranda</a></li>-->
<!--          <li><a href="#about">Tentang Kami</a></li>
          <li><a href="#services">Layanan Kami</a></li>
          <li><a href="<?php echo base_url(); ?>rekankerja#rekankerja">Rekan Kerja</a></li>
          <li><a href="<?php echo base_url(); ?>account/pesanan">Pesanan</a></li>
          <li><a href="<?php echo base_url(); ?>hubungikami">Hubungi Kami</a></li>-->
          <!--<li><a href="#contact">Hubungi Kami</a></li>-->
          <li></li>
          
			<?php foreach ($menu as $parent => $parent_params): ?>

				<?php if (empty($parent_params['children'])): ?>

					<?php $active = ($current_uri==$parent_params['url'] || $ctrler==$parent); ?>
					<li <?php if ($active) echo 'class="active"'; ?>>
						<a href='<?php echo $parent_params['url']; ?>'>
							<?php echo $parent_params['name']; ?>
						</a>
					</li>

				<?php else: ?>

					<?php $parent_active = ($ctrler==$parent); ?>
					<li class='dropdown <?php if ($parent_active) echo 'active'; ?>'>
						<a data-toggle='dropdown' class='dropdown-toggle' href='#'>
							<?php echo $parent_params['name']; ?> <span class='caret'></span>
						</a>
						<ul role='menu' class='dropdown-menu'>
							<?php foreach ($parent_params['children'] as $name => $url): ?>
                                                    <li class="dropdown-item"><a href='<?php echo $url; ?>'><?php echo $name; ?></a></li>
							<?php endforeach; ?>
						</ul>
					</li>

				<?php endif; ?>

			<?php endforeach; ?>
		
        </ul>
      </nav>                                        
                        <?php
                            if($this->ion_auth->logged_in())                                
                            {
                                $aa = $this->session->userdata('identity') ?: 'Account';
                            ?>
                                   <div class="badge badge-light">
                                       
                                           <img src="https://s3.eu-central-1.amazonaws.com/bootstrapbaymisc/blog/24_days_bootstrap/fox.jpg" width="40" height="40" class="rounded-circle"> 
                                       
                                        
                                    <a href="<?php echo base_url();?>account">                                        
                                        <?php 
                                            echo $aa;
                                        ?>
                                    </a>                                            
                                   </div>
                                    <a href="<?php echo base_url(); ?>auth/logout" class="appointment-btn">Logout</a>
                                    
                            <?php
                            }else{
                                ?>                                
                                        <a href="<?php echo base_url(); ?>auth" class="appointment-btn btn btn-outline-success">Masuk</a>

                                    
                            <?php
                            }
                        ?>
		
    </div>
  </header><!-- End Header -->
