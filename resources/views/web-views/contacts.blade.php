@extends('layouts.front-end.app')

@section('title',\App\CPU\translate('Contact Us'))

@push('css_or_js')
    <meta property="og:image" content="{{asset('storage/app/public/company')}}/{{$web_config['web_logo']->value}}"/>
    <meta property="og:title" content="Contact {{$web_config['name']->value}} "/>
    <meta property="og:url" content="{{env('APP_URL')}}">
    <meta property="og:description" content="{!! substr($web_config['about']->value,0,100) !!}">

    <meta property="twitter:card" content="{{asset('storage/app/public/company')}}/{{$web_config['web_logo']->value}}"/>
    <meta property="twitter:title" content="Contact {{$web_config['name']->value}}"/>
    <meta property="twitter:url" content="{{env('APP_URL')}}">
    <meta property="twitter:description" content="{!! substr($web_config['about']->value,0,100) !!}">

    <style>
        @media (max-width: 600px) {
            .sidebar_heading {
                background: {{$web_config['primary_color']}}
            }
        }
    </style>
@endpush
@section('content')
<div class="__inline-58">
    <div class="container rtl">
        <div class="row">
            <div class="col-md-12 sidebar_heading text-center mb-2">
                <h1 class="h3  mb-0 folot-left headerTitle">{{\App\CPU\translate('contact_us')}}</h1>
            </div>
        </div>
    </div>

    <!-- Split section: Map + Contact form-->
    <div class="container rtl" style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};">
        <div class="row no-gutters py-5">
            <div class="col-lg-6 iframe-full-height-wrap ">
                {{-- <img class="for-contac-image" src="{{asset("public/assets/front-end/png/contact.png")}}" alt=""> --}}
                <center><h2><b><u><p >BuyMaster E-Basket Technologies</p></u></b></h2></center><br>
                <center><h3><b><u><p >Address</u> </b></h3> 
                <h5><b>4/31 , Bharathi Nagar,  <br> Kuruvimedu, Sankaraperi, <br>Thoothukudi - 628002</b></h5></p></center>
                <center><h3><b><u><p >Phone</u>  </b></h3>
                    <h5><b>9087606983</b></h5></p></center>
                <center><h3><b><u><p >Location</u>  </b></h3></center><br>
                {{-- <center><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3942.9168976739265!2d78.13889191478498!3d8.793877993684145!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xa8c9e268744abe53!2zOMKwNDcnMzguMCJOIDc4wrAwOCcyNy45IkU!5e0!3m2!1sen!2sin!4v1654185465557!5m2!1sen!2sin" width="600" height="240" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe></p></center><br> --}}
            </div>
            <div class="col-lg-6">
                <div class="card">
                    <div class="card-body for-send-message">
                        <h2 class="h4 mb-4 text-center font-semibold text-black">{{\App\CPU\translate('send_us_a_message')}}</h2>
                        <form action="{{route('contact.store')}}" method="POST" id="getResponse">
                            @csrf
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label >{{\App\CPU\translate('your_name')}}</label>
                                        <input class="form-control name" name="name" type="text"
                                               value="{{ old('name') }}" placeholder="John Doe" required>

                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="cf-email">{{\App\CPU\translate('email_address')}}</label>
                                        <input class="form-control email" name="email" type="email"
                                               value="{{ old('email') }}"
                                               placeholder="johndoe@email.com" required >

                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="cf-phone">{{\App\CPU\translate('your_phone')}}</label>
                                        <input class="form-control mobile_number"  type="text" name="mobile_number"
                                               value="{{ old('mobile_number') }}"  placeholder="{{\App\CPU\translate('Contact Number')}}" required>

                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="cf-subject">{{\App\CPU\translate('Subject')}}:</label>
                                        <input class="form-control subject" type="text" name="subject"
                                               value="{{ old('subject') }}"   placeholder="{{\App\CPU\translate('Short title')}}" required>

                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="cf-message">{{\App\CPU\translate('Message')}}</label>
                                        <textarea class="form-control message" name="message"   rows="6" required>{{ old('subject') }}</textarea>
                                    </div>
                                </div>
                            </div>
                            {{-- recaptcha --}}
                            @php($recaptcha = \App\CPU\Helpers::get_business_settings('recaptcha'))
                            @if(isset($recaptcha) && $recaptcha['status'] == 1)
                                <div id="recaptcha_element" class="w-100" data-type="image"></div>
                                <br/>
                            @else
                                <div class="row p-2">
                                    <div class="col-6 pr-0">
                                        <input type="text" class="form-control form-control-lg border-0" name="default_captcha_value" value=""
                                               placeholder="{{\App\CPU\translate('Enter captcha value')}}" autocomplete="off">
                                    </div>
                                    <div class="col-6 input-icons rounded">
                                        <a onclick="javascript:re_captcha();">
                                            <img src="{{ URL('/contact/code/captcha/1') }}" class="input-field __h-40" id="default_recaptcha_id">
                                            <i class="tio-refresh icon"></i>
                                        </a>
                                    </div>
                                </div>
                            @endif
                            <div class=" ">
                                <button class="btn btn--primary" type="submit" >{{\App\CPU\translate('send')}}</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection


@push('script')
{{-- recaptcha scripts start --}}
@if(isset($recaptcha) && $recaptcha['status'] == 1)
    <script type="text/javascript">
        var onloadCallback = function () {
            grecaptcha.render('recaptcha_element', {
                'sitekey': '{{ \App\CPU\Helpers::get_business_settings('recaptcha')['site_key'] }}'
            });
        };
    </script>
    <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async
            defer></script>
    <script>
        $("#getResponse").on('submit', function (e) {
            var response = grecaptcha.getResponse();

            if (response.length === 0) {
                e.preventDefault();
                toastr.error("{{\App\CPU\translate('Please check the recaptcha')}}");
            }
        });
    </script>
@else
<script type="text/javascript">
    function re_captcha() {
        $url = "{{ URL('/contact/code/captcha') }}";
        $url = $url + "/" + Math.random();
        document.getElementById('default_recaptcha_id').src = $url;
        console.log('url: '+ $url);
    }
</script>
@endif
{{-- recaptcha scripts end --}}
@endpush

