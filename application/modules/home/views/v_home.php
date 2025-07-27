  <!-- main-area -->
        <main>
             
           <!-- slider-area -->
            <section id="home" class="slider-area slider-four fix p-relative">
               
                <div class="slider-active">
                  
                  <?php foreach ($hero as $hkey => $h): ?>
                  <div class="single-slider slider-bg slider-bg2 d-flex align-items-center" style="background: url('<?= base_url('assets/uploads/hero/').$h->img_hero ?>') no-repeat;background-size: cover; background-position: center top;">
                        <div class="container">
                           <div class="row justify-content-center">
                                <div class="col-lg-12 col-md-12">
                                    <div class="slider-content s-slider-content text2 text-center">
                                        <!-- <h5 data-animation="fadeInDown" data-delay=".4s">WELCOME </h5> -->
                                         <h2 data-animation="fadeInUp" data-delay=".4s"><?= $h->title ?></h2>
                                        <p data-animation="fadeInUp" data-delay=".6s"><?= $h->desc_hero ?></p>
                                                           
                                    </div>
                                </div>
                               
                            </div>
                        </div>
                    </div>     
                  <?php endforeach ?>   
                   
                </div>
                    
               
            </section>
            <!-- slider-area-end -->
            <!-- about-area -->
            <section id="about" class="about-area about-p pt-120 pb-130 p-relative" style="background: url(img/bg/aliment-right.png) no-repeat; background-position: right center;">
                <div class="container">
                    <div class="row align-items-center">
                         <div class="col-lg-6 col-md-12 col-sm-12">
                            <div class="s-about-img p-relative" >
                                <img src="<?= base_url("assets/uploads/web/"). $about->img ?>" alt="img">    
                            </div>
                         
                        </div>
                        
                    <div class="col-lg-6 col-md-12 col-sm-12">
                            <div class="about-content s-about-content pl-30">
                                <div class="about-title second-title pb-25">  
                                    <h5>ABOUT US</h5>
                                    <h2><?= $about->title ?></h2>
                                </div>
                                
                                <p><?= $about->content ?></p>
                                  <ul class="progress-outer  mt-30">
                                    <li>
                                        <div class="progress-box">
                                            <div class="progress blue">
                                            <span class="progress-left">
                                                <span class="progress-bar"></span>
                                            </span>
                                            <span class="progress-right">
                                                <span class="progress-bar"></span>
                                            </span>
                                            <div class="progress-value"><?= $ami_jml ?></div>
                                        </div>
                                            <h4>AMI</h4>
                                        </div>
                                    </li>
                                  <li>
                                        <div class="progress-box">
                                            <div class="progress blue">
                                            <span class="progress-left">
                                                <span class="progress-bar"></span>
                                            </span>
                                            <span class="progress-right">
                                                <span class="progress-bar"></span>
                                            </span>
                                            <div class="progress-value"><?= $standart ?></div>
                                        </div>
                                            <h4>Standart</h4>
                                        </div>
                                    </li>
                                </ul>
                           
                            </div>
                        </div>
                     
                    </div>
                </div>
            </section>
            <!-- about-area-end -->
             <!-- services-three-area -->
            <section id="services-08" class="services-08 pb-120 p-relative" style="background: url(img/bg/aliment-left.png) no-repeat; background-position: left center;">
                <div class="container">
                    <div class="row">   
                        <div class="col-lg-12">
                            <div class="section-title center-align mb-50 text-center">
                                 <h5><?= $service->title ?></h5>  
                                <h2>
                                   <?= $service->subtitle ?>
                                </h2>
                             
                            </div>
                           
                        </div>
                         
                    </div>
                    <div class="row services-08-item--wrapper mt-0">
                            <div class="col-lg-4 col-md-4">
                                <div class="services-08-item">
                                    <div class="services-08-thumb">
                                     <?= $service->service1_icon ?>
                                    </div>
                                    <div class="services-08-content">
                                        <h3><a href="#"> <?= $service->service1_title ?></a> </h3>
                                        <p><?= $service->service1_desc ?></p>
                                    </div>
                                </div>
                            </div>
                             <div class="col-lg-4 col-md-4">
                                <div class="services-08-item">
                                    <div class="services-08-thumb">
                                     <?= $service->service2_icon ?>
                                    </div>
                                    <div class="services-08-content">
                                        <h3><a href="#"> <?= $service->service2_title ?></a> </h3>
                                        <p><?= $service->service2_desc ?></p>
                                    </div>
                                </div>
                            </div><div class="col-lg-4 col-md-4">
                                <div class="services-08-item">
                                    <div class="services-08-thumb">
                                     <?= $service->service3_icon ?>
                                    </div>
                                    <div class="services-08-content">
                                        <h3><a href="#"> <?= $service->service3_title ?></a> </h3>
                                        <p><?= $service->service3_desc ?></p>
                                    </div>
                                </div>
                            </div>
                        
                       
                        </div>
                    
                    <div class="row services-08-item--wrapper mt-0">
                            <div class="col-lg-4 col-md-4">
                                <div class="services-08-item">
                                    <div class="services-08-thumb">
                                     <?= $service->service4_icon ?>
                                    </div>
                                    <div class="services-08-content">
                                        <h3><a href="#"> <?= $service->service4_title ?></a> </h3>
                                        <p><?= $service->service4_desc ?></p>
                                    </div>
                                </div>
                            </div><div class="col-lg-4 col-md-4">
                                <div class="services-08-item">
                                    <div class="services-08-thumb">
                                     <?= $service->service5_icon ?>
                                    </div>
                                    <div class="services-08-content">
                                        <h3><a href="#"> <?= $service->service5_title ?></a> </h3>
                                        <p><?= $service->service5_desc ?></p>
                                    </div>
                                </div>
                            </div><div class="col-lg-4 col-md-4">
                                <div class="services-08-item">
                                    <div class="services-08-thumb">
                                     <?= $service->service6_icon ?>
                                    </div>
                                    <div class="services-08-content">
                                        <h3><a href="#"> <?= $service->service6_title ?></a> </h3>
                                        <p><?= $service->service6_desc ?></p>
                                    </div>
                                </div>
                            </div>
                       
                        </div>
          
                     
                    </div>
            </section>
           <!-- services-three-area -->
           
            
             <!-- counter-area -->
            <div class="counter-area p-relative pt-80 pb-80" style="background: url('<?= base_url("assets/frontend/img/bg/counter-bg.png") ?>') repeat-x;">
                <div class="container">
               
                     <div class="row">
                          <div class="col-lg-4 col-md-12 col-sm-12">
                              <div class="section-title">                                 
                                  <h5>COUNTER</h5>
                                <h2>
                                  Fun Facts
                                </h2>
                               
                            </div>
                          </div>
                          <div class="col-lg-8 col-md-12 col-sm-12">
                              <div class="row text-center">
                                  <div class="col-lg-3 col-md-6 col-sm-12">
                                     <div class="single-counter wow fadeInUp animated" data-animation="fadeInDown animated" data-delay=".2s">
                                         <div class="icon">
                                             <img src="<?= base_url("assets/frontend/") ?>img/icon/cn-iocn01.png" alt="img">
                                         </div>

                                        <div class="counter p-relative">
                                            <span class="count"><?= $ami_jml ?></span>                             
                                            <p>AMI</p>
                                        </div>

                                    </div>
                                </div>
                              <div class="col-lg-3 col-md-6 col-sm-12">
                                    <div class="single-counter wow fadeInUp animated" data-animation="fadeInDown animated" data-delay=".2s">
                                         <div class="icon">
                                             <img src="<?= base_url("assets/frontend/") ?>img/icon/cn-iocn02.png" alt="img">
                                         </div>
                                        <div class="counter p-relative">
                                            <span class="count"><?= $standart ?></span>     
                                            <p>Standart</p>
                                        </div>


                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-12">
                                    <div class="single-counter wow fadeInUp animated" data-animation="fadeInDown animated" data-delay=".2s">
                                        <div class="icon">
                                            <img src="<?= base_url("assets/frontend/") ?>img/icon/cn-iocn03.png" alt="img">
                                         </div>

                                        <div class="counter p-relative">
                                           <span class="count"><?= $unit ?></span>
                                              <p>Unit</p>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-12">
                                    <div class="single-counter wow fadeInUp animated" data-animation="fadeInDown animated" data-delay=".2s">
                                         <div class="icon">
                                           <img src="<?= base_url("assets/frontend/") ?>img/icon/cn-iocn04.png" alt="img">
                                         </div>

                                        <div class="counter p-relative">
                                            <span class="count"><?= $news_jml ?></span> 
                                        <p>News</p>
                                        </div>
                                    </div>
                                </div>
                              </div>
                                
                          </div>
                      
                    </div>
                </div>
            </div>
            <!-- counter-area-end --> 
            
            <!-- gallery-area -->
            <section id="work" class="pt-40 pb-70" style="background: url(img/bg/aliment-right2.png) no-repeat; background-position: right center;">
                <div class="container">   
                    <div class="row">   
                        <div class="col-lg-12">
                            <div class="section-title center-align mb-50 text-center">
                                 <h5>PROJECTS DONE</h5>  
                                <h2>
                                   Our Portfolio
                                </h2>
                             
                            </div>
                           
                        </div>
                         
                    </div>
              <div class="portfolio ">
              
                <div class="grid col3">
                    
                  <?php foreach ($gallery as $gkey => $g): ?>
                           <div class="grid-item website">     
                                <a >
                                    <figure class="gallery-image">
                                      <img src="<?= base_url("assets/uploads/gallery/").$g->img_gallery ?>" alt="img" class="img">      
                                        <figcaption>
                                            <h4><?= $g->title_gallery ?></h4>
                                        </figcaption>
                                    </figure>
                                  </a>        
                            </div>
                 <?php endforeach ?>                     
                </div>
            </div>
                </div>
            </section>
             <!-- gallery-area-end -->
              <!-- video-area -->
            <section id="video" class="video-area about-p p-relative" style="background-color: #010f2e;">
                <div class="container">
                     <div class="row align-items-center">
                        <div class="col-lg-6">
                            <img class="img-responsive" src="<?= base_url("assets/uploads/work/").$work->img_work ?>">
                        </div>
                         <div class="col-lg-6 p-relative pl-70">
                            <div class="section-title">
                                 <H5><?= $work->title ?></H5>
                                <h2>
                                 <?= $work->subtitle ?>
                                </h2>
                            </div>
                             
                             <div class="row how-box-contaniner">
                                <div class="col-lg-6 mt-30">
                                    <div class="how-box">
                                        <h3><?= $work->work1_title ?></h3>
                                        <p><?= $work->work1_desc ?></p>
                                    </div>
                                 </div>
                                   <div class="col-lg-6 mt-30">
                                    <div class="how-box">
                                        <h3><?= $work->work2_title ?></h3>
                                        <p><?= $work->work2_desc ?></p>
                                    </div>
                                 </div>
                                   <div class="col-lg-6 mt-30">
                                    <div class="how-box">
                                        <h3><?= $work->work3_title ?></h3>
                                        <p><?= $work->work3_desc ?></p>
                                    </div>
                                 </div>
                                   <div class="col-lg-6 mt-30">
                                    <div class="how-box">
                                        <h3><?= $work->work4_title ?> </h3>
                                        <p><?= $work->work4_desc ?></p>
                                    </div>
                                 </div>
                                
                             </div>
                           
                        </div>
                    </div>
                </div>
            </section>
            <!-- video-area-end -->
             <!-- team-area -->
            <section id="team" class="team-area2 pt-120 pb-100" style="background: url(img/bg/aliment-right3.png) no-repeat; background-position: right center;">            
                <div class="container">  
                 
                    <div class="row align-items-center">
                        <div class="col-lg-12 col-md-12">
                             <div class="section-title mb-50 text-center">
                                    <h5>OUR TEAM</h5>
                                    <h2>Our Working Expertise</h2>      
                                </div>
                        </div>
                        <div class="col-lg-12 col-md-12">
                            <div class="row">
                            <?php foreach ($team as $tkey => $t): ?>
                              <div class="col-lg-3 col-md-6">
                                  <div class="single-team mb-30 ">
                                      <div class="team-thumb">
                                        <div class="brd">
                                              <img src="<?= base_url("assets/uploads/struktur/").$t->img_struktur ?>" alt="img">
                                          </div>
                                          <div class="social align-items-center">
                                              <a href="<?= $t->fb??'#' ?>"><i class="fab fa-facebook-f"></i></a>
                                              <a href="<?= $t->twitter??'#' ?>"><i class="fab fa-twitter"></i></a>
                                              <a href="<?= $t->ig??'#' ?>"><i class="fab fa-instagram"></i></a>
                                              <a href="<?= $t->linkedin??'#' ?>"><i class="fab fa-linkedin-in"></i></a>
                                          </div>
                                      </div>
                                      <div class="team-info">
                                          <h4><a href="#"><?= $t->nama ?></a></h4>
                                          <span><?= $t->jabatan ?></span>
                                        
                                      </div>
                                  </div>
                              </div>
                            <?php endforeach ?>                        
                        </div>
                        </div>
                    
                    </div>
                    
                </div>
            </section>
            <!-- team-area-end -->   

                        
              <!-- blog-area -->
            <section id="blog" class="blog-area  p-relative pt-50 pb-120 fix" style="background: url(img/bg/aliment-right4.png) no-repeat; background-position: right center;">
                <div class="container">
                    <div class="row align-items-center"> 
                        <div class="col-lg-12">
                            <div class="section-title center-align mb-50 text-center">
                                  <h5>OUR TEAM</h5>
                                    <h2> Latest Blog & News</h2>     
                            </div>
                           
                        </div>
                    </div>
                    <div class="row">
                       
                         <?php foreach ($news as $nkey => $n): ?>
                           <div class="col-lg-6 col-md-12">
                              <div class="single-post2 mb-30">
                                  <div class="row">
                                      <div class="col-lg-4 col-md-4">
                                          <div class="blog-thumb2">
                                              <a href="<?= base_url("news/read/").$n->slug ?>"><img src="<?= base_url("assets/uploads/news/"). $n->img ?>" alt="img"></a>

                                          </div>
                                      </div>
                                      <div class="col-lg-8 col-md-8">
                                        <div class="blog-content2">     
                                                   <h4><a href="<?= base_url("news/read/").$n->slug ?>"><?= $n->title ?></a></h4>     
                                                      <div class="b-meta">
                                                  <div class="b-meta">
                                                       <div class="meta-info">
                                                          <ul>
                                                              <li><i class="fal fa-user"></i> Admin</li>
                                                              <li><i class="fal fa-calendar-alt"></i> <?= $n->tanggal ?></li>
                                                          </ul>
                                                      </div>
                                              </div>
                                              </div>
                                                      <p><?= substr($n->konten, 0, 150) ?></p>
                                          </div>
                                      </div>

                                  </div>
                                  
                              </div>
                          </div>
                         <?php endforeach ?>
                         
                    <div class="col-lg-12 col-md-12 text-center">
                            <a href="<?= base_url('news') ?>" class="btn ss-btn">View All News</a>
                        </div>
                        
                    </div>
                </div>
            </section>
            <!-- blog-area-end -->
              <!-- brand-area -->
            <div class="brand-area pt-60 pb-60">
                <div class="container">
                    <div class="row brand-active">
                        <div class="col-xl-2">
                            <div class="single-brand">
                                  <img onclick="javascript:location.href='http://syariah.iainkediri.ac.id/'" src="<?= base_url('/assets/img/link/syariah.png') ?>" class="img-fluid" alt="" data-aos="zoom-in">
                            </div>
                        </div>
                       <div class="col-xl-2">
                            <div class="single-brand">
                                     <img onclick="javascript:location.href='http://simpeg.iainkediri.ac.id/'" src="<?= base_url('/assets/img/link/kepegawaian.png') ?>" class="img-fluid" alt="" data-aos="zoom-in" data-aos-delay="100">
                            </div>
                        </div>
                        <div class="col-xl-2">
                            <div class="single-brand">
                                  <img onclick="javascript:location.href='http://tipd.iainkediri.ac.id/'" src="<?= base_url('/assets/img/link/tipd.png') ?>"  class="img-fluid" alt="" data-aos="zoom-in" data-aos-delay="200">
                            </div>
                        </div>
                        <div class="col-xl-2">
                            <div class="single-brand">
                                  <img onclick="javascript:location.href='https://iainkediri.ac.id/aka/'" src="<?= base_url('/assets/img/link/akademik.png') ?>"  class="img-fluid" alt="" data-aos="zoom-in" data-aos-delay="200">
                            </div>
                        </div>
                         <div class="col-xl-2">
                            <div class="single-brand">
                                 <img onclick="javascript:location.href='http://febi.iainkediri.ac.id/'" src="<?= base_url('/assets/img/link/febi.png') ?>"  class="img-fluid" alt="" data-aos="zoom-in" data-aos-delay="400">
                            </div>
                        </div>
                        <div class="col-xl-2">
                            <div class="single-brand">
                                 <img onclick="javascript:location.href='http://pasca.iainkediri.ac.id/'" src="<?= base_url('/assets/img/link/pasca.png') ?>"  class="img-fluid" alt="" data-aos="zoom-in" data-aos-delay="500">
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
            <!-- brand-area-end -->
      
         
        </main>
        <!-- main-area-end -->