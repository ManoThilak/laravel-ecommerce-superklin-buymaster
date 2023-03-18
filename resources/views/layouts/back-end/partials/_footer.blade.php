<link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Satisfy">

<style>
.jellysoft {
    font-family: 'Satisfy', cursive;
    font-size: 18px;
    font-weight: bold;
    color:rgb(255 7 7);
}
.jellysoft:hover {
    font-family: 'Satisfy', cursive;
    font-size: 24px;
    font-weight: bold;
    color: blue !important;
}  
</style>

<div class="footer">
    <div class="row justify-content-between align-items-center">
       <!--  <div class="col-lg-4 mb-3 mb-lg-0">
            <p class="font-size-sm mb-0 title-color text-center text-lg-left">
                &copy; {{\App\Model\BusinessSetting::where(['type'=>'company_name'])->first()->value}}. <span
                    class="d-none d-sm-inline-block">{{\App\Model\BusinessSetting::where(['type'=>'company_copyright_text'])->first()->value}}</span>
            </p>
        </div> -->
          <footer style="
    position: fixed;
    z-index: 100000;
    bottom: 10px;
    right: 10px;
" class="main-footer">
    <div class="pull-right hidden-xs">
     </div>
    <!-- <strong>Copyright &copy; <?php echo date('Y')?> <a href="https://jellysoft.in" data-toggle="tab">Jellysoft</a>.</strong> All rights
    reserved. -->
    <strong>Copyright © <?php echo date('Y')?> Buy Master | E-Basket Technology | All rights reserved | <span>Powered By : <a style="color: rgb(250 0 0);" onmouseover="this.style.color='rgb(250 0 0)'" onmouseout="this.style.color='rgb(250 0 0)'" class="jellysoft" href="https://jellysoft.in" target="_blank">Jellysoft</a></span></strong> 
  </footer>

        <div class="col-lg-8">
            <div class="d-flex justify-content-center justify-content-lg-end">
                <!-- List Dot -->
                <ul class="list-inline list-footer-icon justify-content-center justify-content-lg-start mb-0">
                    <!-- <li class="list-inline-item">
                        <a class="list-separator-link" href="{{route('admin.business-settings.web-config.index')}}">
                            <i class="tio-settings"></i>
                            {{\App\CPU\translate('Business Setup')}}
                        </a>
                    </li>

                    <li class="list-inline-item">
                        <a class="list-separator-link"href="{{route('admin.profile.update',auth('admin')->user()->id)}}">
                            <i class="tio-user"></i>
                            {{\App\CPU\translate('Profile')}}
                        </a>
                    </li>

                    <li class="list-inline-item">
                        <a class="list-separator-link" href="{{route('admin.dashboard.index')}}">
                            <i class="tio-home-outlined"></i>
                            {{\App\CPU\translate('Home')}}
                        </a>
                    </li>

                    <li class="list-inline-item">
                        <label class="badge badge-soft-version text-capitalize">
                            {{\App\CPU\translate('Software version')}} {{ env('SOFTWARE_VERSION') }}
                        </label>
                    </li> -->
                </ul>
                <!-- End List Dot -->
            </div>
        </div>
    </div>
</div>
