// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery
//= require popper
//= require jquery.turbolinks


//= require jasny-bootstrap.min
//= require jquery-ui/widget
//= require jquery-ui/position
//= require jquery-ui/widgets/autocomplete
//= require jquery-ui/widgets/menu
//= require jquery-ui/widgets/selectmenu
//= require jquery-ui/core
//= require conversations
//= require vendorapps
//= require smoothscroll.min.js
//= require rails-ujs
//= require turbolinks
//= require smoothscroll.min.js
$(window).resize(function() {
    if ($(window).width() > 991) {
        // removes all the additions that we made for the sidebar wrapper only if the screen is bigger than 991px
        $('.sidebar-wrapper').find($('#side-search')).remove();
        $('.sidebar-wrapper').find('.nav-mobile-menu').remove();
    }

})


$(document).on('click', '#property-submit', function(event) {

  });
$(document).on('click', '.submit', function(event) {
  $(this).closest('form').submit();
  });
  var i = 1;
$(document).on('click', '.new-form', function(event) {
    event.preventDefault();
    var formArray = ['#about_id',  '#account_id', '#address_id', '#link_group_id'];
    var linkArray = ['<a href="#about"  class="btn btn-finish btn-fill bg-hudson btn-wd"  >Next</a>',  '<a href="#account"  class="btn btn-finish btn-fill bg-hudson btn-wd"  >Next</a>', '<a href="#account"  class="btn btn-finish btn-fill bg-hudson btn-wd"  >Next</a>', '#link_group_id<a href="#account"  class="btn btn-finish btn-fill bg-hudson btn-wd"  >Next</a>', '<a href="#group"  class="btn btn-finish btn-fill bg-hudson btn-wd"  >Next</a>'];
    var link = $(formArray[i]).click();
    $(this).remove();
     $('.c-form-foot').append(formArray[i]);
       $(formArray[i]).click();
    i++
  });


$(document).on('turbolinks:load', function() {

  $(document).on('click', '.wiz-close', function(event) {
    clsoeWiz();
  });

var clsoeWiz = function(){
             // $("[data-dismiss=modal]").trigger({ type: "click" });
              $('#contact-form-wiz').hide();

              $('#form-modal').modal('hide');
               $('#form-modal').removeClass('modal');


//hide the modal

$('body').removeClass('modal-open');
//modal-open class is added on body so it has to be removed
$('body').removeClass('modal-backdrop');
$('.modal-backdrop').remove();
}

if (history && history.pushState) {
  $(function() {
     $(document).on('click', 'a[data-remote=true], .pagination a', function(e) {
      $.getScript(this.href);
      history.pushState(null, document.title, this.href);
      e.preventDefault();
    });

    $(window).bind("popstate", function() {
      $.getScript(location.href);

})
     });
}
$('[href*="#section_"]').on('click', function() {

        // Close collapsed navbar on click
        navbarCollapse.collapse('hide');

        // Smooths scroll to anchor
        if ( location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname ) {

            var target = $(this.hash);
            target = target.length ? target : $('[name=' + this.hash.slice(1) +']');

            if (target.length) {
                $('html, body').animate({
                    scrollTop: target.offset().top - 80
                }, 1000);
                return false;
            }

        }
    });


 $('body').on('click', '.btn-back', function(event) {
     event.preventDefault();
    window.history.back();
     window.history.back();

 });


$('.select_u_picker').attr("data-actions-box", "true");
  var i = 1;

 $('body').on('click', '.btn-finish', function(event) {
  $('form').prop( "disabled", false );
  $(this).closest('form').submit();
 });

$('body').on('click', '#close-form', function(event) {
  document.location.reload(true);
});
   $('#contact_address').hide();

 var formArray = ['a[href="#about"]', 'a[href="#account"]', 'a[href="#address"]', 'a[href="#group"]'];
 var wizIndex = 1;
  $('body').on('click', '#btn_next', 'btn-form', function(event) {
    event.preventDefault();


    $('#contact_form').removeAttr("disabled");
    console.log('button clicked')
   if( moveToNext() === true) {
      var formData = getContactInputs();
     createFormSend(formData);
   }
});

var moveToNext = function(){
   $(formArray[wizIndex]).trigger( "click" );
  if (formArray[wizIndex] === 'a[href="#account"]' ) {
     $('#contacts_suffix').focus();
   } else if (formArray[wizIndex] === 'a[href="#address"]' ) {
       $('#contact_address').focus();
   }
    if (formArray[wizIndex] === 'a[href="#group"]' ) {
        wizIndex = 1;
      $('.btn_next').hide()
      $('.btn-finish').show()
     return true;
   }
  wizIndex++
}


$(document).keypress(function(e) {

    if(e.which == 13) {

       if (moveToNext() === true ){
        $(document).keypress(function(e) {

    if(e.which == 13) {
      $('#contact_form').removeAttr("disabled");
        var formData = getContactInputs();
     createFormSend(formData);

         }
});
        }
    }
});




var getContactInputs = function(){
   var user_ids = []

        $('.users-for-new-group').each(function(i) {
          if ($(this).is(':checked') &&  $(this).val() !== "") {
            user_ids[i] = $(this).val();
          }
        });
          var group_ids = []

        $('.groups-for-new-group').each(function(i) {
           if ($(this).is(':checked') &&  $(this).val() !== ""){
            group_ids[i] = $(this).val();
          }
        });
  var formData = { contact: {
            'name'              :   $('#contact_name').val(),
            'email'             :   $('#contact_email').val(),
            'company'           :   $('#contact_company').val(),
             'address'          :   $('#contact_address').val(),
            'cell'              :   $('#contact_cell').val(),
            'county'            :   $('#contact_county').val(),
             'state'            :   $('#contact_state').val(),
            'country'           :   $('#contact_county').val(),
            'postal_code'       :   $('#contact_postal_code').val(),
             'notes'            :   $('#contact_notes').val(),
            'city'              :   $('#contact_city').val(),
            'street_num'        :   $('#contact_street_num').val(),
             'strret_name'      :   $('#contact_strret_name').val(),
            'prefix'            :   $('#contact_prefix').val(),
            'first_name'        :   $('#contact_first_name').val(),
             'middle_name'      :   $('#contact_middle_name').val(),
            'last_name'         :   $('#contact_last_name').val(),
            'suffix'            :   $('#contact_suffix').val(),
             'owns_cents'       :   $('#contact_owns_cents').val(),
            'year_of_Founding'  :   $('#contact_year_of_Founding').val(),
            'primary_industry'  :   $('#contact_primary_industry').val(),
             'web_address'      :   $('#contact_web_address').val(),
            'latitude'          :   $('#contact_latitude').val(),
            'longitude'         :   $('#contact_longitude').val(),
            'type'              :   $('#contact_type').val(),
            'facility_size'     :   $('#contact_facility_size').val(),
            'total_number_of_employees' :   $('#contact_facility_size').val(),
            'postion'           :   $('#contact_postion').val(),
            'sic'               :   $('#contact_sic').val(),
            'role'              :   $('#contact_role').val(),

           'group_id'           :     group_ids,
            'user_id'           :  user_ids,
            'verified'          :   $('#contact_verified').val()


        }

      }
      return formData;

}

  var u_s = true;
 $(document).on('click', '.toggle-contact ', function(event) {

  if (u_s === false) {



    var color = $(this).css("color");
    console.log(color);
    if (color === 'rgb(76, 175, 80)'){

     var formData = getContactInputs();
     showFormSend(formData);
     }
       $(this).css({
      color: '#fff'

    });
      u_s = true

  }else {

    $(this).css({
      color: '#4caf50'
    });
    $(this).text('Save    Contact');
    $(this).css( "padding-right", "60px");

      u_s = false

  }

});

var createFormSend = function(data){
  var url =  "/contacts/";
 $.ajax({
            url: url,
            method: "post",
            data: data,
            success: function(contact) {
           clsoeWiz();
                 $.notify({
                        title: "New Contact Added:",
                        message: contact.first_name + '"' + ' was successfuly added to the database'
                    });



            },
            error: function(err) {

                var errors = err.responseJSON;
                var error = errors.join(", ");

                if (error) {


                    $.notify({
                        title: '<strong>Heads up!</strong>',
                        message: error
                    }, {
                        type: 'danger'
                    });
                }
            }
        })


}

var showFormSend = function(data){
  var url =  "/contacts/"+$('#contact_id_hidden').val()+"/";
 $.ajax({
            url: url,
            method: "patch",
            data: data,
            success: function(contact) {





            },
            error: function(err) {

                var errors = err.responseJSON;
                var error = errors.join(", ");

                if (error) {


                    $.notify({
                        title: '<strong>Heads up!</strong>',
                        message: error
                    }, {
                        type: 'danger'
                    });
                }
            }
        })


}



$('body').on('click', '#pick-users-csv', function(event) {
event.preventDefault();
        var user_ids = []

        $('.users-for-new-group').each(function(i) {
            user_ids[i] = $(this).val();
        });
});


  //sort contact sub group
var groupGetId = '';
  $(document).on('click', '.get-group', function() {
     groupGetId = $('.get-group-id').val();

  });



  $(document).on('click', '.send-county', function() {

     var formData = {
            'group_id'              :   groupGetId ,
            'county'             :   $(this).text(),
          }

    $.ajax({
        type: 'get',
        url: 'contacts',
        data: formData

    });
  })
  var dataTable = $('.data-table').DataTable();
  var lastUrl = ''
  document.addEventListener("turbolinks:before-cache", function() {
  dataTable.destroy();
});

var contact_ids_prop_i  = 0;
var contact_class_p_name = ['.c1','.c2','.c3','.c4','.c5','.c6','.c7','.c8','.c9','.c10'];

var contact_class_prop = ['.contact1','.contact2','.contact3','.contact4','.contact5','.contact6','.contact7','.contact8','.contact9','.contact10'];
var contact_ids_prop = [];

$('.get-contacts').autocomplete({
        source: '/contacts/autocomplete',
        minLength: 3,
        select: function(event, ui) {
           contact_ids_prop[contact_ids_prop.length] = ui.item.id
           $(contact_class_prop[contact_ids_prop_i]).val(ui.item.id);


           $(contact_class_p_name[contact_ids_prop_i]).html( ui.item.value);
           contact_ids_prop_i ++;
        }
    });


    $('#query').autocomplete({
        source: '/contacts/autocomplete',
        minLength: 3,
        select: function(event, ui) {
            $('#query').val(ui.item.value);
            var uri = '/contacts/'+ui.item.id.toString();
            $('.c-s-form').attr('action', uri)
             $('#send-search').trigger( "click" );
        }
    });

keyUpArray = 0
$("#query").keyup(function(){
   keyUpArray++
   if (keyUpArray > 4) {
    $('#send-search').trigger( "click" );
    keyUpArray = 0
    }
});
 $('body').on('click', '.save-new-group', function(event) {
        console.log('button clicked')
        var inputs = document.querySelectorAll('ul input[type=checkbox]');
        var user_ids = []
        var i = 0;

        $('.users-for-new-group').each(function(i) {
            user_ids[i] = $(this).val();
        });


        var newGroup = $('input[name=new_group').val();
        console.log(newGroup);
        if ( newGroup === undefined || newGroup === '') {
           console.log(newGroup + "is in the block");
          newGroup = $('.g-name').val();
        }
        event.preventDefault();
        $.ajax({
            url: "/groups",
            method: "post",
            data: {group: { name: newGroup, user_ids: user_ids }},
            success: function(group) {
                console.log(group);
                if (group.id != null) {
                    var newOption = $('<option selected="true" value="' + group.id.toString() + '">' + group.name + '</option></select>');
                   if ( $(' p .text-danger'))
                    {$(' p .text-danger').detach();}
                    $('#new_group').addClass('has-success')


                    $.notify({
                        title: "New Group Added:",
                        message: 'The Group: ' + '"' + group.name + '"' + ' was successfuly created it is selected'
                    });

                    $('#contact_group_id').append(newOption);
                    $('.selectpicker').selectpicker('render');
                    $('input[name=new_group').val("");
                }
            },
            error: function(err) {

                var errors = err.responseJSON;
                var error = errors.join(", ");

                if (error) {
                    newGroup.next('.text-danger').detach();
                    $('#new_group').addClass('has-error')
                        .after('<p class="text-danger pt-2 mb-0">' + error + '</p>');
                    $.notify({
                        title: '<strong>Heads up!</strong>',
                        message: error
                    }, {
                        type: 'danger'
                    });
                }
            }
        })

    });
});




$(document).on('turbolinks:load', function() {
    /*! =========================================================
     *
     * Material Dashboard PRO - V1.2.1
     *
     * =========================================================
     *
     * Copyright 2016 Creative Tim (http://www.creative-tim.com/product/material-dashboard-pro)
     *
     *
     *                       _oo0oo_
     *                      o8888888o
     *                      88" . "88
     *                      (| -_- |)
     *                      0\  =  /0
     *                    ___/`---'\___
     *                  .' \|     |// '.
     *                 / \|||  :  |||// \
     *                / _||||| -:- |||||- \
     *               |   | \\  -  /// |   |
     *               | \_|  ''\---/''  |_/ |
     *               \  .-\__  '-'  ___/-. /
     *             ___'. .'  /--.--\  `. .'___
     *          ."" '<  `.___\_<|>_/___.' >' "".
     *         | | :  `- \`.;`\ _ /`;.`/ - ` : | |
     *         \  \ `_.   \_ __\ /__ _/   .-` /  /
     *     =====`-.____`.___ \_____/___.-`___.-'=====
     *                       `=---='
     *
     *     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     *
     *               Buddha Bless:  "No Bugs"
     *
     * ========================================================= */

    (function() {
        isWindows = navigator.platform.indexOf('Win') > -1 ? true : false;

        if (isWindows && !$('body').hasClass('sidebar-mini')) {
            // if we are on windows OS we activate the perfectScrollbar function
            $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar();

            $('html').addClass('perfect-scrollbar-on');
        } else {
            $('html').addClass('perfect-scrollbar-off');
        }
    })();

    var breakCards = true;

    var searchVisible = 0;
    var transparent = true;

    var transparentDemo = true;
    var fixedTop = false;

    var mobile_menu_visible = 0,
        mobile_menu_initialized = false,
        toggle_initialized = false,
        bootstrap_nav_initialized = false;

    var seq = 0,
        delays = 80,
        durations = 500;
    var seq2 = 0,
        delays2 = 80,
        durations2 = 500;


    $(document).ready(function() {

        $('body').bootstrapMaterialDesign();

        $sidebar = $('.sidebar');

        md.initSidebarsCheck();

        // if ($('body').hasClass('sidebar-mini')) {
        //     md.misc.sidebar_mini_active = true;
        // }

        window_width = $(window).width();

        // check if there is an image set for the sidebar's background
        md.checkSidebarImage();

        md.initMinimizeSidebar();

        //    Activate bootstrap-select
        if ($(".selectpicker").length != 0) {
            $(".selectpicker").selectpicker();
        }

        //  Activate the tooltips
        $('[rel="tooltip"]').tooltip();

        //Activate tags
        // we style the badges with our colors
        var tagClass = $('.tagsinput').data('color');

        if ($(".tagsinput").length != 0) {
            $('.tagsinput').tagsinput();
        }

        $('.bootstrap-tagsinput').addClass('' + tagClass + '-badge');

        //    Activate bootstrap-select
        $(".select").dropdown({
            "dropdownClass": "dropdown-menu",
            "optionClass": ""
        });

        $('.form-control').on("focus", function() {
            $(this).parent('.input-group').addClass("input-group-focus");
        }).on("blur", function() {
            $(this).parent(".input-group").removeClass("input-group-focus");
        });


        if (breakCards == true) {
            // We break the cards headers if there is too much stress on them :-)
            $('[data-header-animation="true"]').each(function() {
                var $fix_button = $(this)
                var $card = $(this).parent('.card');

                $card.find('.fix-broken-card').click(function() {
                    console.log(this);
                    var $header = $(this).parent().parent().siblings('.card-header, .card-header-image');

                    $header.removeClass('hinge').addClass('fadeInDown');

                    $card.attr('data-count', 0);

                    setTimeout(function() {
                        $header.removeClass('fadeInDown animate');
                    }, 480);
                });

                $card.mouseenter(function() {
                    var $this = $(this);
                    hover_count = parseInt($this.attr('data-count'), 10) + 1 || 0;
                    $this.attr("data-count", hover_count);

                    if (hover_count >= 20) {
                        $(this).children('.card-header, .card-header-image').addClass('hinge animated');
                    }
                });
            });
        }

        // remove class has-error for checkbox validation
        $('input[type="checkbox"][required="true"], input[type="radio"][required="true"]').on('click', function() {
            if ($(this).hasClass('error')) {
                $(this).closest('div').removeClass('has-error');
            }
        });

    });

    $(document).on('click', '.navbar-toggler', function() {
        $toggle = $(this);

        if (mobile_menu_visible == 1) {
            $('html').removeClass('nav-open');

            $('.close-layer').remove();
            setTimeout(function() {
                $toggle.removeClass('toggled');
            }, 400);

            mobile_menu_visible = 0;
        } else {
            setTimeout(function() {
                $toggle.addClass('toggled');
            }, 430);

            var $layer = $('<div class="close-layer"></div>');

            if ($('body').find('.main-panel').length != 0) {
                $layer.appendTo(".main-panel");

            } else if (($('body').hasClass('off-canvas-sidebar'))) {
                $layer.appendTo(".wrapper-full-page");
            }

            setTimeout(function() {
                $layer.addClass('visible');
            }, 100);

            $layer.click(function() {
                $('html').removeClass('nav-open');
                mobile_menu_visible = 0;

                $layer.removeClass('visible');

                setTimeout(function() {
                    $layer.remove();
                    $toggle.removeClass('toggled');

                }, 400);
            });

            $('html').addClass('nav-open');
            mobile_menu_visible = 1;

        }

    });

    // activate collapse right menu when the windows is resized
    $(window).resize(function() {
        md.initSidebarsCheck();

        // reset the seq for charts drawing animations
        seq = seq2 = 0;

        setTimeout(function() {
            demo.initDashboardPageCharts();
        }, 500);
    });

    md = {
        misc: {
            navbar_menu_visible: 0,
            active_collapse: true,
            disabled_collapse_init: 0,
        },

        checkSidebarImage: function() {
            $sidebar = $('.sidebar');
            image_src = $sidebar.data('image');

            if (image_src !== undefined) {
                sidebar_container = '<div class="sidebar-background" style="background-image: url(' + image_src + ') "/>';
                $sidebar.append(sidebar_container);
            }
        },

        initFormExtendedDatetimepickers: function() {
            $('.datetimepicker').datetimepicker({
                icons: {
                    time: "fa fa-clock-o",
                    date: "fa fa-calendar",
                    up: "fa fa-chevron-up",
                    down: "fa fa-chevron-down",
                    previous: 'fa fa-chevron-left',
                    next: 'fa fa-chevron-right',
                    today: 'fa fa-screenshot',
                    clear: 'fa fa-trash',
                    close: 'fa fa-remove'
                }
            });

            $('.datepicker').datetimepicker({
                format: 'MM/DD/YYYY',
                icons: {
                    time: "fa fa-clock-o",
                    date: "fa fa-calendar",
                    up: "fa fa-chevron-up",
                    down: "fa fa-chevron-down",
                    previous: 'fa fa-chevron-left',
                    next: 'fa fa-chevron-right',
                    today: 'fa fa-screenshot',
                    clear: 'fa fa-trash',
                    close: 'fa fa-remove'
                }
            });

            $('.timepicker').datetimepicker({
                //          format: 'H:mm',    // use this format if you want the 24hours timepicker
                format: 'h:mm A', //use this format if you want the 12hours timpiecker with AM/PM toggle
                icons: {
                    time: "fa fa-clock-o",
                    date: "fa fa-calendar",
                    up: "fa fa-chevron-up",
                    down: "fa fa-chevron-down",
                    previous: 'fa fa-chevron-left',
                    next: 'fa fa-chevron-right',
                    today: 'fa fa-screenshot',
                    clear: 'fa fa-trash',
                    close: 'fa fa-remove'

                }
            });
        },


        initSliders: function() {
            // Sliders for demo purpose
            var slider = document.getElementById('sliderRegular');

            noUiSlider.create(slider, {
                start: 40,
                connect: [true, false],
                range: {
                    min: 0,
                    max: 100
                }
            });

            var slider2 = document.getElementById('sliderDouble');

            noUiSlider.create(slider2, {
                start: [20, 60],
                connect: true,
                range: {
                    min: 0,
                    max: 100
                }
            });
        },

        initSidebarsCheck: function() {
            if ($(window).width() <= 991) {
                if ($sidebar.length != 0) {
                    md.initRightMenu();
                }
            }
        },

        initMinimizeSidebar: function() {

            $('#minimizeSidebar').click(function() {
                var $btn = $(this);

                if (md.misc.sidebar_mini_active == true) {
                    $('body').removeClass('sidebar-mini');
                    md.misc.sidebar_mini_active = false;
                } else {
                    $('body').addClass('sidebar-mini');
                    md.misc.sidebar_mini_active = true;
                }

                // we simulate the window Resize so the charts will get updated in realtime.
                var simulateWindowResize = setInterval(function() {
                    window.dispatchEvent(new Event('resize'));
                }, 180);

                // we stop the simulation of Window Resize after the animations are completed
                setTimeout(function() {
                    clearInterval(simulateWindowResize);
                }, 1000);
            });
        },

        checkScrollForTransparentNavbar: debounce(function() {
            if ($(document).scrollTop() > 260) {
                if (transparent) {
                    transparent = false;
                    $('.navbar-color-on-scroll').removeClass('navbar-transparent');
                }
            } else {
                if (!transparent) {
                    transparent = true;
                    $('.navbar-color-on-scroll').addClass('navbar-transparent');
                }
            }
        }, 17),


        initRightMenu: debounce(function() {
            $sidebar_wrapper = $('.sidebar-wrapper');

            if (!mobile_menu_initialized) {
                $navbar = $('nav').find('.navbar-collapse').children('.navbar-nav');

                mobile_menu_content = '';

                nav_content = $navbar.html();

                nav_content = '<ul class="nav navbar-nav nav-mobile-menu">' + nav_content + '</ul>';

                navbar_form = $('nav').find('.navbar-form').get(0).outerHTML;

                $sidebar_nav = $sidebar_wrapper.find(' > .nav');

                // insert the navbar form before the sidebar list
                $nav_content = $(nav_content);
                $navbar_form = $(navbar_form);
                $nav_content.insertBefore($sidebar_nav);
                $navbar_form.insertBefore($nav_content);

                $(".sidebar-wrapper .dropdown .dropdown-menu > li > a").click(function(event) {
                    event.stopPropagation();

                });

                // simulate resize so all the charts/maps will be redrawn
                window.dispatchEvent(new Event('resize'));

                mobile_menu_initialized = true;
            } else {
                if ($(window).width() > 991) {
                    // reset all the additions that we made for the sidebar wrapper only if the screen is bigger than 991px
                    $sidebar_wrapper.find('.navbar-form').remove();
                    $sidebar_wrapper.find('.nav-mobile-menu').remove();

                    mobile_menu_initialized = false;
                }
            }
        }, 200),


        // initBootstrapNavbarMenu: debounce(function(){
        //
        //     if(!bootstrap_nav_initialized){
        //         $navbar = $('nav').find('.navbar-collapse').first().clone(true);
        //
        //         nav_content = '';
        //         mobile_menu_content = '';
        //
        //         //add the content from the regular header to the mobile menu
        //         $navbar.children('ul').each(function(){
        //             content_buff = $(this).html();
        //             nav_content = nav_content + content_buff;
        //         });
        //
        //         nav_content = '<ul class="nav nav-mobile-menu">' + nav_content + '</ul>';
        //
        //         $navbar.html(nav_content);
        //         $navbar.addClass('off-canvas-sidebar');
        //
        //         // append it to the body, so it will come from the right side of the screen
        //         $('body').append($navbar);
        //
        //         $toggle = $('.navbar-toggle');
        //
        //         $navbar.find('a').removeClass('btn btn-round btn-default');
        //         $navbar.find('button').removeClass('btn-round btn-fill btn-info btn-primary btn-success btn-danger btn-warning btn-neutral');
        //         $navbar.find('button').addClass('btn-simple btn-block');
        //
        //         bootstrap_nav_initialized = true;
        //     }
        // }, 500),

        startAnimationForLineChart: function(chart) {

            chart.on('draw', function(data) {
                if (data.type === 'line' || data.type === 'area') {
                    data.element.animate({
                        d: {
                            begin: 600,
                            dur: 700,
                            from: data.path.clone().scale(1, 0).translate(0, data.chartRect.height()).stringify(),
                            to: data.path.clone().stringify(),
                            easing: Chartist.Svg.Easing.easeOutQuint
                        }
                    });
                } else if (data.type === 'point') {
                    seq++;
                    data.element.animate({
                        opacity: {
                            begin: seq * delays,
                            dur: durations,
                            from: 0,
                            to: 1,
                            easing: 'ease'
                        }
                    });
                }
            });

            seq = 0;
        },
        startAnimationForBarChart: function(chart) {

            chart.on('draw', function(data) {
                if (data.type === 'bar') {
                    seq2++;
                    data.element.animate({
                        opacity: {
                            begin: seq2 * delays2,
                            dur: durations2,
                            from: 0,
                            to: 1,
                            easing: 'ease'
                        }
                    });
                }
            });

            seq2 = 0;
        }
    }


    // Returns a function, that, as long as it continues to be invoked, will not
    // be triggered. The function will be called after it stops being called for
    // N milliseconds. If `immediate` is passed, trigger the function on the
    // leading edge, instead of the trailing.

    function debounce(func, wait, immediate) {
        var timeout;
        return function() {
            var context = this,
                args = arguments;
            clearTimeout(timeout);
            timeout = setTimeout(function() {
                timeout = null;
                if (!immediate) func.apply(context, args);
            }, wait);
            if (immediate && !timeout) func.apply(context, args);
        };
    };
    $().ready(function() {
        $sidebar = $('.sidebar');
        $sidebar_img_container = $sidebar.find('.sidebar-background');

        $full_page = $('.full-page');

        $sidebar_responsive = $('body > .navbar-collapse');

        window_width = $(window).width();

        fixed_plugin_open = $('.sidebar .sidebar-wrapper .nav li.active a p').html();

        if (window_width > 767 && fixed_plugin_open == 'Dashboard') {
            if ($('.fixed-plugin .dropdown').hasClass('show-dropdown')) {
                $('.fixed-plugin .dropdown').addClass('open');
            }

        }

        $('.fixed-plugin a').click(function(event) {
            // Alex if we click on switch, stop propagation of the event, so the dropdown will not be hide, otherwise we set the  section active
            if ($(this).hasClass('switch-trigger')) {
                if (event.stopPropagation) {
                    event.stopPropagation();
                } else if (window.event) {
                    window.event.cancelBubble = true;
                }
            }
        });

        $('.fixed-plugin .active-color span').click(function() {
            $full_page_background = $('.full-page-background');

            $(this).siblings().removeClass('active');
            $(this).addClass('active');

            var new_color = $(this).data('color');

            if ($sidebar.length != 0) {
                $sidebar.attr('data-color', new_color);
            }

            if ($full_page.length != 0) {
                $full_page.attr('filter-color', new_color);
            }

            if ($sidebar_responsive.length != 0) {
                $sidebar_responsive.attr('data-color', new_color);
            }
        });

        $('.fixed-plugin .background-color span').click(function() {
            $(this).siblings().removeClass('active');
            $(this).addClass('active');

            var new_color = $(this).data('color');

            if ($sidebar.length != 0) {
                $sidebar.attr('data-background-color', new_color);
            }
        });

        $('.fixed-plugin .img-holder').click(function() {
            $full_page_background = $('.full-page-background');

            $(this).parent('li').siblings().removeClass('active');
            $(this).parent('li').addClass('active');


            var new_image = $(this).find("img").attr('src');

            if ($sidebar_img_container.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
                $sidebar_img_container.fadeOut('fast', function() {
                    $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
                    $sidebar_img_container.fadeIn('fast');
                });
            }

            if ($full_page_background.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
                var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

                $full_page_background.fadeOut('fast', function() {
                    $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
                    $full_page_background.fadeIn('fast');
                });
            }

            if ($('.switch-sidebar-image input:checked').length == 0) {
                var new_image = $('.fixed-plugin li.active .img-holder').find("img").attr('src');
                var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

                $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
                $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
            }

            if ($sidebar_responsive.length != 0) {
                $sidebar_responsive.css('background-image', 'url("' + new_image + '")');
            }
        });

        $('.switch-sidebar-image input').change(function() {
            $full_page_background = $('.full-page-background');

            $input = $(this);

            if ($input.is(':checked')) {
                if ($sidebar_img_container.length != 0) {
                    $sidebar_img_container.fadeIn('fast');
                    $sidebar.attr('data-image', '#');
                }

                if ($full_page_background.length != 0) {
                    $full_page_background.fadeIn('fast');
                    $full_page.attr('data-image', '#');
                }

                background_image = true;
            } else {
                if ($sidebar_img_container.length != 0) {
                    $sidebar.removeAttr('data-image');
                    $sidebar_img_container.fadeOut('fast');
                }

                if ($full_page_background.length != 0) {
                    $full_page.removeAttr('data-image', '#');
                    $full_page_background.fadeOut('fast');
                }

                background_image = false;
            }
        });

        $('.switch-sidebar-mini input').change(function() {
            $body = $('body');

            $input = $(this);

            if (md.misc.sidebar_mini_active == true) {
                $('body').removeClass('sidebar-mini');
                md.misc.sidebar_mini_active = false;

                $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar();

            } else {

                $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar('destroy');

                setTimeout(function() {
                    $('body').addClass('sidebar-mini');

                    md.misc.sidebar_mini_active = true;
                }, 300);
            }

            // we simulate the window Resize so the charts will get updated in realtime.
            var simulateWindowResize = setInterval(function() {
                window.dispatchEvent(new Event('resize'));
            }, 180);

            // we stop the simulation of Window Resize after the animations are completed
            setTimeout(function() {
                clearInterval(simulateWindowResize);
            }, 1000);

        });


    });

    var demo = {

        initContactUsMap: function() {
            var myLatlng = new google.maps.LatLng(44.433530, 26.093928);
            var mapOptions = {
                zoom: 14,
                center: myLatlng,
                styles: [{
                    "featureType": "water",
                    "stylers": [{
                        "saturation": 43
                    }, {
                        "lightness": -11
                    }, {
                        "hue": "#0088ff"
                    }]
                }, {
                    "featureType": "road",
                    "elementType": "geometry.fill",
                    "stylers": [{
                        "hue": "#ff0000"
                    }, {
                        "saturation": -100
                    }, {
                        "lightness": 99
                    }]
                }, {
                    "featureType": "road",
                    "elementType": "geometry.stroke",
                    "stylers": [{
                        "color": "#808080"
                    }, {
                        "lightness": 54
                    }]
                }, {
                    "featureType": "landscape.man_made",
                    "elementType": "geometry.fill",
                    "stylers": [{
                        "color": "#ece2d9"
                    }]
                }, {
                    "featureType": "poi.park",
                    "elementType": "geometry.fill",
                    "stylers": [{
                        "color": "#ccdca1"
                    }]
                }, {
                    "featureType": "road",
                    "elementType": "labels.text.fill",
                    "stylers": [{
                        "color": "#767676"
                    }]
                }, {
                    "featureType": "road",
                    "elementType": "labels.text.stroke",
                    "stylers": [{
                        "color": "#ffffff"
                    }]
                }, {
                    "featureType": "poi",
                    "stylers": [{
                        "visibility": "off"
                    }]
                }, {
                    "featureType": "landscape.natural",
                    "elementType": "geometry.fill",
                    "stylers": [{
                        "visibility": "on"
                    }, {
                        "color": "#b8cb93"
                    }]
                }, {
                    "featureType": "poi.park",
                    "stylers": [{
                        "visibility": "on"
                    }]
                }, {
                    "featureType": "poi.sports_complex",
                    "stylers": [{
                        "visibility": "on"
                    }]
                }, {
                    "featureType": "poi.medical",
                    "stylers": [{
                        "visibility": "on"
                    }]
                }, {
                    "featureType": "poi.business",
                    "stylers": [{
                        "visibility": "simplified"
                    }]
                }],
                scrollwheel: false, //we disable de scroll over the map, it is a really annoing when you scroll through page
            };
            var map = new google.maps.Map(document.getElementById("contactUsMap"), mapOptions);

            var marker = new google.maps.Marker({
                position: myLatlng,
                title: "Hello World!"
            });
            marker.setMap(map);
        },

        initContactUs2Map: function() {
            var lat = 44.433530;
            var long = 26.093928;

            var centerLong = long - 0.025;

            var myLatlng = new google.maps.LatLng(lat, long);
            var centerPosition = new google.maps.LatLng(lat, centerLong);

            var mapOptions = {
                zoom: 14,
                center: centerPosition,
                styles: [{
                    "featureType": "water",
                    "stylers": [{
                        "saturation": 43
                    }, {
                        "lightness": -11
                    }, {
                        "hue": "#0088ff"
                    }]
                }, {
                    "featureType": "road",
                    "elementType": "geometry.fill",
                    "stylers": [{
                        "hue": "#ff0000"
                    }, {
                        "saturation": -100
                    }, {
                        "lightness": 99
                    }]
                }, {
                    "featureType": "road",
                    "elementType": "geometry.stroke",
                    "stylers": [{
                        "color": "#808080"
                    }, {
                        "lightness": 54
                    }]
                }, {
                    "featureType": "landscape.man_made",
                    "elementType": "geometry.fill",
                    "stylers": [{
                        "color": "#ece2d9"
                    }]
                }, {
                    "featureType": "poi.park",
                    "elementType": "geometry.fill",
                    "stylers": [{
                        "color": "#ccdca1"
                    }]
                }, {
                    "featureType": "road",
                    "elementType": "labels.text.fill",
                    "stylers": [{
                        "color": "#767676"
                    }]
                }, {
                    "featureType": "road",
                    "elementType": "labels.text.stroke",
                    "stylers": [{
                        "color": "#ffffff"
                    }]
                }, {
                    "featureType": "poi",
                    "stylers": [{
                        "visibility": "off"
                    }]
                }, {
                    "featureType": "landscape.natural",
                    "elementType": "geometry.fill",
                    "stylers": [{
                        "visibility": "on"
                    }, {
                        "color": "#b8cb93"
                    }]
                }, {
                    "featureType": "poi.park",
                    "stylers": [{
                        "visibility": "on"
                    }]
                }, {
                    "featureType": "poi.sports_complex",
                    "stylers": [{
                        "visibility": "on"
                    }]
                }, {
                    "featureType": "poi.medical",
                    "stylers": [{
                        "visibility": "on"
                    }]
                }, {
                    "featureType": "poi.business",
                    "stylers": [{
                        "visibility": "simplified"
                    }]
                }],
                scrollwheel: false, //we disable de scroll over the map, it is a really annoing when you scroll through page
            };
            var map = new google.maps.Map(document.getElementById("contactUs2Map"), mapOptions);

            var marker = new google.maps.Marker({
                position: myLatlng,
                title: "Hello World!"
            });
            marker.setMap(map);
        },

        presentationAnimations: function() {
            $(function() {

                var $window = $(window),
                    isTouch = Modernizr.touch;

                if (isTouch) {
                    $('.add-animation').addClass('animated');
                }

                $window.on('scroll', revealAnimation);

                function revealAnimation() {
                    // Showed...
                    $(".add-animation:not(.animated)").each(function() {
                        var $this = $(this),
                            offsetTop = $this.offset().top,
                            scrolled = $window.scrollTop(),
                            win_height_padded = $window.height();
                        if (scrolled + win_height_padded > offsetTop) {
                            $this.addClass('animated');
                        }
                    });
                    // Hidden...
                    $(".add-animation.animated").each(function(index) {
                        var $this = $(this),
                            offsetTop = $this.offset().top;
                        scrolled = $window.scrollTop(),
                            windowHeight = $window.height();

                        win_height_padded = windowHeight * 0.8;
                        if (scrolled + win_height_padded < offsetTop) {
                            $(this).removeClass('animated')
                        }
                    });
                }

                revealAnimation();
            });

        },


        initPickColor: function() {
            $('.pick-class-label').click(function() {
                var new_class = $(this).attr('new-class');
                var old_class = $('#display-buttons').attr('data-class');
                var display_div = $('#display-buttons');
                if (display_div.length) {
                    var display_buttons = display_div.find('.btn');
                    display_buttons.removeClass(old_class);
                    display_buttons.addClass(new_class);
                    display_div.attr('data-class', new_class);
                }
            });
        },

        checkFullPageBackgroundImage: function() {
            $page = $('.full-page');
            image_src = $page.data('image');

            if (image_src !== undefined) {
                image_container = '<div class="full-page-background" style="background-image: url(' + image_src + ') "/>'
                $page.append(image_container);
            }
        },

        initMaterialWizard: function() {
            // Code for the Validator
            var $validator = $('.card-wizard form').validate({
                rules: {
                    firstname: {
                        required: true,
                        minlength: 3
                    },
                    lastname: {
                        required: true,
                        minlength: 3
                    },
                    email: {
                        required: true,
                        minlength: 3,
                    }
                },

                errorPlacement: function(error, element) {
                    $(element).parent('div').addClass('has-danger');
                }
            });

            // Wizard Initialization
            $('.card-wizard').bootstrapWizard({
                'tabClass': 'nav nav-pills',
                'nextSelector': '.btn-next',
                'previousSelector': '.btn-previous',

                onNext: function(tab, navigation, index) {
                    var $valid = $('.card-wizard form').valid();
                    if (!$valid) {
                        $validator.focusInvalid();
                        return false;
                    }
                },

                onInit: function(tab, navigation, index) {
                    //check number of tabs and fill the entire row
                    var $total = navigation.find('li').length;
                    var $wizard = navigation.closest('.card-wizard');

                    $first_li = navigation.find('li:first-child a').html();
                    $moving_div = $('<div class="moving-tab">' + $first_li + '</div>');
                    $('.card-wizard .wizard-navigation').append($moving_div);

                    refreshAnimation($wizard, index);

                    $('.moving-tab').css('transition', 'transform 0s');
                },

                onTabClick: function(tab, navigation, index) {
                    var $valid = $('.card-wizard form').valid();

                    if (!$valid) {
                        return false;
                    } else {
                        return true;
                    }
                },

                onTabShow: function(tab, navigation, index) {
                    var $total = navigation.find('li').length;
                    var $current = index + 1;

                    var $wizard = navigation.closest('.card-wizard');

                    // If it's the last tab then hide the last button and show the finish instead
                    if ($current >= $total) {
                        $($wizard).find('.btn-next').hide();
                        $($wizard).find('.btn-finish').show();
                    } else {
                        $($wizard).find('.btn-next').show();
                        $($wizard).find('.btn-finish').hide();
                    }

                    button_text = navigation.find('li:nth-child(' + $current + ') a').html();

                    setTimeout(function() {
                        $('.moving-tab').text(button_text);
                    }, 150);

                    var checkbox = $('.footer-checkbox');

                    if (!index == 0) {
                        $(checkbox).css({
                            'opacity': '0',
                            'visibility': 'hidden',
                            'position': 'absolute'
                        });
                    } else {
                        $(checkbox).css({
                            'opacity': '1',
                            'visibility': 'visible'
                        });
                    }

                    refreshAnimation($wizard, index);
                }
            });


            // Prepare the preview for profile picture
            $("#wizard-picture").change(function() {
                readURL(this);
            });

            $('[data-toggle="wizard-radio"]').click(function() {
                wizard = $(this).closest('.card-wizard');
                wizard.find('[data-toggle="wizard-radio"]').removeClass('active');
                $(this).addClass('active');
                $(wizard).find('[type="radio"]').removeAttr('checked');
                $(this).find('[type="radio"]').attr('checked', 'true');
            });

            $('[data-toggle="wizard-checkbox"]').click(function() {
                if ($(this).hasClass('active')) {
                    $(this).removeClass('active');
                    $(this).find('[type="checkbox"]').removeAttr('checked');
                } else {
                    $(this).addClass('active');
                    $(this).find('[type="checkbox"]').attr('checked', 'true');
                }
            });

            $('.set-full-height').css('height', 'auto');

            //Function to show image before upload

            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function(e) {
                        $('#wizardPicturePreview').attr('src', e.target.result).fadeIn('slow');
                    }
                    reader.readAsDataURL(input.files[0]);
                }
            }

            $(window).resize(function() {
                $('.card-wizard').each(function() {
                    $wizard = $(this);

                    index = $wizard.bootstrapWizard('currentIndex');
                    refreshAnimation($wizard, index);

                    $('.moving-tab').css({
                        'transition': 'transform 0s'
                    });
                });
            });

            function refreshAnimation($wizard, index) {
                $total = $wizard.find('.nav li').length;
                $li_width = 100 / $total;

                total_steps = $wizard.find('.nav li').length;
                move_distance = $wizard.width() / total_steps;
                index_temp = index;
                vertical_level = 0;

                mobile_device = $(document).width() < 600 && $total > 3;

                if (mobile_device) {
                    move_distance = $wizard.width() / 2;
                    index_temp = index % 2;
                    $li_width = 50;
                }

                $wizard.find('.nav li').css('width', $li_width + '%');

                step_width = move_distance;
                move_distance = move_distance * index_temp;

                $current = index + 1;

                if ($current == 1 || (mobile_device == true && (index % 2 == 0))) {
                    move_distance -= 8;
                } else if ($current == total_steps || (mobile_device == true && (index % 2 == 1))) {
                    move_distance += 8;
                }

                if (mobile_device) {
                    vertical_level = parseInt(index / 2);
                    vertical_level = vertical_level * 38;
                }

                $wizard.find('.moving-tab').css('width', step_width);
                $('.moving-tab').css({
                    'transform': 'translate3d(' + move_distance + 'px, ' + vertical_level + 'px, 0)',
                    'transition': 'all 0.5s cubic-bezier(0.29, 1.42, 0.79, 1)'

                });
            }
        },


        initDocumentationCharts: function() {
            if ($('#dailySalesChart').length != 0 && $('#websiteViewsChart').length != 0) {
                /* ----------==========     Daily Sales Chart initialization For Documentation    ==========---------- */

                dataDailySalesChart = {
                    labels: ['M', 'T', 'W', 'T', 'F', 'S', 'S'],
                    series: [
                        [12, 17, 7, 17, 23, 18, 38]
                    ]
                };

                optionsDailySalesChart = {
                    lineSmooth: Chartist.Interpolation.cardinal({
                        tension: 0
                    }),
                    low: 0,
                    high: 50, // creative tim: we recommend you to set the high sa the biggest value + something for a better look
                    chartPadding: {
                        top: 0,
                        right: 0,
                        bottom: 0,
                        left: 0
                    },
                }

                var dailySalesChart = new Chartist.Line('#dailySalesChart', dataDailySalesChart, optionsDailySalesChart);

                var animationHeaderChart = new Chartist.Line('#websiteViewsChart', dataDailySalesChart, optionsDailySalesChart);
            }
        },

        initCharts: function() {
            if ($('#roundedLineChart').length != 0 && $('#straightLinesChart').length != 0 && $('#colouredRoundedLineChart').length != 0 && $('#colouredBarsChart').length != 0 && $('#simpleBarChart').length != 0 && $('#multipleBarsChart').length != 0) {
                /* ----------==========    Rounded Line Chart initialization    ==========---------- */

                dataRoundedLineChart = {
                    labels: ['M', 'T', 'W', 'T', 'F', 'S', 'S'],
                    series: [
                        [12, 17, 7, 17, 23, 18, 38]
                    ]
                };

                optionsRoundedLineChart = {
                    lineSmooth: Chartist.Interpolation.cardinal({
                        tension: 10
                    }),
                    axisX: {
                        showGrid: false,
                    },
                    low: 0,
                    high: 50, // creative tim: we recommend you to set the high sa the biggest value + something for a better look
                    chartPadding: {
                        top: 0,
                        right: 0,
                        bottom: 0,
                        left: 0
                    },
                    showPoint: false
                }

                var RoundedLineChart = new Chartist.Line('#roundedLineChart', dataRoundedLineChart, optionsRoundedLineChart);

                md.startAnimationForLineChart(RoundedLineChart);


                /*  **************** Straight Lines Chart - single line with points ******************** */

                dataStraightLinesChart = {
                    labels: ['\'07', '\'08', '\'09', '\'10', '\'11', '\'12', '\'13', '\'14', '\'15'],
                    series: [
                        [10, 16, 8, 13, 20, 15, 20, 34, 30]
                    ]
                };

                optionsStraightLinesChart = {
                    lineSmooth: Chartist.Interpolation.cardinal({
                        tension: 0
                    }),
                    low: 0,
                    high: 50, // creative tim: we recommend you to set the high sa the biggest value + something for a better look
                    chartPadding: {
                        top: 0,
                        right: 0,
                        bottom: 0,
                        left: 0
                    },
                    classNames: {
                        point: 'ct-point ct-white',
                        line: 'ct-line ct-white'
                    }
                }

                var straightLinesChart = new Chartist.Line('#straightLinesChart', dataStraightLinesChart, optionsStraightLinesChart);

                md.startAnimationForLineChart(straightLinesChart);


                /*  **************** Coloured Rounded Line Chart - Line Chart ******************** */


                dataColouredRoundedLineChart = {
                    labels: ['\'06', '\'07', '\'08', '\'09', '\'10', '\'11', '\'12', '\'13', '\'14', '\'15'],
                    series: [
                        [287, 480, 290, 554, 690, 690, 500, 752, 650, 900, 944]
                    ]
                };

                optionsColouredRoundedLineChart = {
                    lineSmooth: Chartist.Interpolation.cardinal({
                        tension: 10
                    }),
                    axisY: {
                        showGrid: true,
                        offset: 40
                    },
                    axisX: {
                        showGrid: false,
                    },
                    low: 0,
                    high: 1000,
                    showPoint: true,
                    height: '300px'
                };


                var colouredRoundedLineChart = new Chartist.Line('#colouredRoundedLineChart', dataColouredRoundedLineChart, optionsColouredRoundedLineChart);

                md.startAnimationForLineChart(colouredRoundedLineChart);


                /*  **************** Coloured Rounded Line Chart - Line Chart ******************** */


                dataColouredBarsChart = {
                    labels: ['\'06', '\'07', '\'08', '\'09', '\'10', '\'11', '\'12', '\'13', '\'14', '\'15'],
                    series: [
                        [287, 385, 490, 554, 586, 698, 695, 752, 788, 846, 944],
                        [67, 152, 143, 287, 335, 435, 437, 539, 542, 544, 647],
                        [23, 113, 67, 190, 239, 307, 308, 439, 410, 410, 509]
                    ]
                };

                optionsColouredBarsChart = {
                    lineSmooth: Chartist.Interpolation.cardinal({
                        tension: 10
                    }),
                    axisY: {
                        showGrid: true,
                        offset: 40
                    },
                    axisX: {
                        showGrid: false,
                    },
                    low: 0,
                    high: 1000,
                    showPoint: true,
                    height: '300px'
                };


                var colouredBarsChart = new Chartist.Line('#colouredBarsChart', dataColouredBarsChart, optionsColouredBarsChart);

                md.startAnimationForLineChart(colouredBarsChart);



                /*  **************** Public Preferences - Pie Chart ******************** */

                var dataPreferences = {
                    labels: ['62%', '32%', '6%'],
                    series: [62, 32, 6]
                };

                var optionsPreferences = {
                    height: '230px'
                };

                Chartist.Pie('#chartPreferences', dataPreferences, optionsPreferences);

                /*  **************** Simple Bar Chart - barchart ******************** */

                var dataSimpleBarChart = {
                    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'Mai', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                    series: [
                        [542, 443, 320, 780, 553, 453, 326, 434, 568, 610, 756, 895]
                    ]
                };

                var optionsSimpleBarChart = {
                    seriesBarDistance: 10,
                    axisX: {
                        showGrid: false
                    }
                };

                var responsiveOptionsSimpleBarChart = [
                    ['screen and (max-width: 640px)', {
                        seriesBarDistance: 5,
                        axisX: {
                            labelInterpolationFnc: function(value) {
                                return value[0];
                            }
                        }
                    }]
                ];

                var simpleBarChart = Chartist.Bar('#simpleBarChart', dataSimpleBarChart, optionsSimpleBarChart, responsiveOptionsSimpleBarChart);

                //start animation for the Emails Subscription Chart
                md.startAnimationForBarChart(simpleBarChart);


                var dataMultipleBarsChart = {
                    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'Mai', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                    series: [
                        [542, 443, 320, 780, 553, 453, 326, 434, 568, 610, 756, 895],
                        [412, 243, 280, 580, 453, 353, 300, 364, 368, 410, 636, 695]
                    ]
                };

                var optionsMultipleBarsChart = {
                    seriesBarDistance: 10,
                    axisX: {
                        showGrid: false
                    },
                    height: '300px'
                };

                var responsiveOptionsMultipleBarsChart = [
                    ['screen and (max-width: 640px)', {
                        seriesBarDistance: 5,
                        axisX: {
                            labelInterpolationFnc: function(value) {
                                return value[0];
                            }
                        }
                    }]
                ];

                var multipleBarsChart = Chartist.Bar('#multipleBarsChart', dataMultipleBarsChart, optionsMultipleBarsChart, responsiveOptionsMultipleBarsChart);

                //start animation for the Emails Subscription Chart
                md.startAnimationForBarChart(multipleBarsChart);
            }

        },

        initDashboardPageCharts: function() {

            if ($('#dailySalesChart').length != 0 || $('#completedTasksChart').length != 0 || $('#websiteViewsChart').length != 0) {
                /* ----------==========     Daily Sales Chart initialization    ==========---------- */

                dataDailySalesChart = {
                    labels: ['M', 'T', 'W', 'T', 'F', 'S', 'S'],
                    series: [
                        [12, 17, 7, 17, 23, 18, 38]
                    ]
                };

                optionsDailySalesChart = {
                    lineSmooth: Chartist.Interpolation.cardinal({
                        tension: 0
                    }),
                    low: 0,
                    high: 50, // creative tim: we recommend you to set the high sa the biggest value + something for a better look
                    chartPadding: {
                        top: 0,
                        right: 0,
                        bottom: 0,
                        left: 0
                    },
                }

                var dailySalesChart = new Chartist.Line('#dailySalesChart', dataDailySalesChart, optionsDailySalesChart);

                md.startAnimationForLineChart(dailySalesChart);



                /* ----------==========     Completed Tasks Chart initialization    ==========---------- */

                dataCompletedTasksChart = {
                    labels: ['12p', '3p', '6p', '9p', '12p', '3a', '6a', '9a'],
                    series: [
                        [230, 750, 450, 300, 280, 240, 200, 190]
                    ]
                };

                optionsCompletedTasksChart = {
                    lineSmooth: Chartist.Interpolation.cardinal({
                        tension: 0
                    }),
                    low: 0,
                    high: 1000, // creative tim: we recommend you to set the high sa the biggest value + something for a better look
                    chartPadding: {
                        top: 0,
                        right: 0,
                        bottom: 0,
                        left: 0
                    }
                }

                var completedTasksChart = new Chartist.Line('#completedTasksChart', dataCompletedTasksChart, optionsCompletedTasksChart);

                // start animation for the Completed Tasks Chart - Line Chart
                md.startAnimationForLineChart(completedTasksChart);


                /* ----------==========     Emails Subscription Chart initialization    ==========---------- */

                var dataWebsiteViewsChart = {
                    labels: ['J', 'F', 'M', 'A', 'M', 'J', 'J', 'A', 'S', 'O', 'N', 'D'],
                    series: [
                        [542, 443, 320, 780, 553, 453, 326, 434, 568, 610, 756, 895]

                    ]
                };
                var optionsWebsiteViewsChart = {
                    axisX: {
                        showGrid: false
                    },
                    low: 0,
                    high: 1000,
                    chartPadding: {
                        top: 0,
                        right: 5,
                        bottom: 0,
                        left: 0
                    }
                };
                var responsiveOptions = [
                    ['screen and (max-width: 640px)', {
                        seriesBarDistance: 5,
                        axisX: {
                            labelInterpolationFnc: function(value) {
                                return value[0];
                            }
                        }
                    }]
                ];
                var websiteViewsChart = Chartist.Bar('#websiteViewsChart', dataWebsiteViewsChart, optionsWebsiteViewsChart, responsiveOptions);

                //start animation for the Emails Subscription Chart
                md.startAnimationForBarChart(websiteViewsChart);
            }
        },

        showSwal: function(type) {
            if (type == 'basic') {
                swal({
                    title: "Here's a message!",
                    buttonsStyling: false,
                    confirmButtonClass: "btn btn-success"
                }).catch(swal.noop)

            } else if (type == 'title-and-text') {
                swal({
                    title: "Here's a message!",
                    text: "It's pretty, isn't it?",
                    buttonsStyling: false,
                    confirmButtonClass: "btn btn-info"
                }).catch(swal.noop)

            } else if (type == 'success-message') {
                swal({
                    title: "Good job!",
                    text: "You clicked the button!",
                    buttonsStyling: false,
                    confirmButtonClass: "btn btn-success",
                    type: "success"
                }).catch(swal.noop)

            } else if (type == 'warning-message-and-confirmation') {
                swal({
                    title: 'Are you sure?',
                    text: "You won't be able to revert this!",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonClass: 'btn btn-success',
                    cancelButtonClass: 'btn btn-danger',
                    confirmButtonText: 'Yes, delete it!',
                    buttonsStyling: false
                }).then(function() {
                    swal({
                        title: 'Deleted!',
                        text: 'Your file has been deleted.',
                        type: 'success',
                        confirmButtonClass: "btn btn-success",
                        buttonsStyling: false
                    })
                }).catch(swal.noop)
            } else if (type == 'warning-message-and-cancel') {
                swal({
                    title: 'Are you sure?',
                    text: 'You will not be able to recover this imaginary file!',
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'Yes, delete it!',
                    cancelButtonText: 'No, keep it',
                    confirmButtonClass: "btn btn-success",
                    cancelButtonClass: "btn btn-danger",
                    buttonsStyling: false
                }).then(function() {
                    swal({
                        title: 'Deleted!',
                        text: 'Your imaginary file has been deleted.',
                        type: 'success',
                        confirmButtonClass: "btn btn-success",
                        buttonsStyling: false
                    }).catch(swal.noop)
                }, function(dismiss) {
                    // dismiss can be 'overlay', 'cancel', 'close', 'esc', 'timer'
                    if (dismiss === 'cancel') {
                        swal({
                            title: 'Cancelled',
                            text: 'Your imaginary file is safe :)',
                            type: 'error',
                            confirmButtonClass: "btn btn-info",
                            buttonsStyling: false
                        }).catch(swal.noop)
                    }
                })

            } else if (type == 'custom-html') {
                swal({
                    title: 'HTML example',
                    buttonsStyling: false,
                    confirmButtonClass: "btn btn-success",
                    html: 'You can use <b>bold text</b>, ' +
                        '<a href="http://github.com">links</a> ' +
                        'and other HTML tags'
                }).catch(swal.noop)

            } else if (type == 'auto-close') {
                swal({
                    title: "Auto close alert!",
                    text: "I will close in 2 seconds.",
                    timer: 2000,
                    showConfirmButton: false
                }).catch(swal.noop)
            } else if (type == 'input-field') {
                swal({
                    title: 'Input something',
                    html: '<div class="form-group">' +
                        '<input id="input-field" type="text" class="form-control" />' +
                        '</div>',
                    showCancelButton: true,
                    confirmButtonClass: 'btn btn-success',
                    cancelButtonClass: 'btn btn-danger',
                    buttonsStyling: false
                }).then(function(result) {
                    swal({
                        type: 'success',
                        html: 'You entered: <strong>' +
                            $('#input-field').val() +
                            '</strong>',
                        confirmButtonClass: 'btn btn-success',
                        buttonsStyling: false

                    })
                }).catch(swal.noop)
            }
        },

        initVectorMap: function() {
            var mapData = {
                "AU": 760,
                "BR": 550,
                "CA": 120,
                "DE": 1300,
                "FR": 540,
                "GB": 690,
                "GE": 200,
                "IN": 200,
                "RO": 600,
                "RU": 300,
                "US": 2920,
            };

            $('#worldMap').vectorMap({
                map: 'world_mill_en',
                backgroundColor: "transparent",
                zoomOnScroll: false,
                regionStyle: {
                    initial: {
                        fill: '#e4e4e4',
                        "fill-opacity": 0.9,
                        stroke: 'none',
                        "stroke-width": 0,
                        "stroke-opacity": 0
                    }
                },

                series: {
                    regions: [{
                        values: mapData,
                        scale: ["#AAAAAA", "#444444"],
                        normalizeFunction: 'polynomial'
                    }]
                },
            });
        },

        initGoogleMaps: function() {
            var myLatlng = new google.maps.LatLng(40.748817, -73.985428);
            var mapOptions = {
                zoom: 13,
                center: myLatlng,
                scrollwheel: false, //we disable de scroll over the map, it is a really annoing when you scroll through page
                styles: [{
                    "featureType": "water",
                    "stylers": [{
                        "saturation": 43
                    }, {
                        "lightness": -11
                    }, {
                        "hue": "#0088ff"
                    }]
                }, {
                    "featureType": "road",
                    "elementType": "geometry.fill",
                    "stylers": [{
                        "hue": "#ff0000"
                    }, {
                        "saturation": -100
                    }, {
                        "lightness": 99
                    }]
                }, {
                    "featureType": "road",
                    "elementType": "geometry.stroke",
                    "stylers": [{
                        "color": "#808080"
                    }, {
                        "lightness": 54
                    }]
                }, {
                    "featureType": "landscape.man_made",
                    "elementType": "geometry.fill",
                    "stylers": [{
                        "color": "#ece2d9"
                    }]
                }, {
                    "featureType": "poi.park",
                    "elementType": "geometry.fill",
                    "stylers": [{
                        "color": "#ccdca1"
                    }]
                }, {
                    "featureType": "road",
                    "elementType": "labels.text.fill",
                    "stylers": [{
                        "color": "#767676"
                    }]
                }, {
                    "featureType": "road",
                    "elementType": "labels.text.stroke",
                    "stylers": [{
                        "color": "#ffffff"
                    }]
                }, {
                    "featureType": "poi",
                    "stylers": [{
                        "visibility": "off"
                    }]
                }, {
                    "featureType": "landscape.natural",
                    "elementType": "geometry.fill",
                    "stylers": [{
                        "visibility": "on"
                    }, {
                        "color": "#b8cb93"
                    }]
                }, {
                    "featureType": "poi.park",
                    "stylers": [{
                        "visibility": "on"
                    }]
                }, {
                    "featureType": "poi.sports_complex",
                    "stylers": [{
                        "visibility": "on"
                    }]
                }, {
                    "featureType": "poi.medical",
                    "stylers": [{
                        "visibility": "on"
                    }]
                }, {
                    "featureType": "poi.business",
                    "stylers": [{
                        "visibility": "simplified"
                    }]
                }]

            }
            var map = new google.maps.Map(document.getElementById("map"), mapOptions);

            var marker = new google.maps.Marker({
                position: myLatlng,
                title: "Hello World!"
            });

            // To add the marker to the map, call setMap();
            marker.setMap(map);
        },

        initSmallGoogleMaps: function() {

            // Regular Map
            var myLatlng = new google.maps.LatLng(40.748817, -73.985428);
            var mapOptions = {
                zoom: 8,
                center: myLatlng,
                scrollwheel: false, //we disable de scroll over the map, it is a really annoing when you scroll through page
            }

            var map = new google.maps.Map(document.getElementById("regularMap"), mapOptions);

            var marker = new google.maps.Marker({
                position: myLatlng,
                title: "Regular Map!"
            });

            marker.setMap(map);


            // Custom Skin & Settings Map
            var myLatlng = new google.maps.LatLng(40.748817, -73.985428);
            var mapOptions = {
                zoom: 13,
                center: myLatlng,
                scrollwheel: false, //we disable de scroll over the map, it is a really annoing when you scroll through page
                disableDefaultUI: true, // a way to quickly hide all controls
                zoomControl: true,
                styles: [{
                    "featureType": "water",
                    "stylers": [{
                        "saturation": 43
                    }, {
                        "lightness": -11
                    }, {
                        "hue": "#0088ff"
                    }]
                }, {
                    "featureType": "road",
                    "elementType": "geometry.fill",
                    "stylers": [{
                        "hue": "#ff0000"
                    }, {
                        "saturation": -100
                    }, {
                        "lightness": 99
                    }]
                }, {
                    "featureType": "road",
                    "elementType": "geometry.stroke",
                    "stylers": [{
                        "color": "#808080"
                    }, {
                        "lightness": 54
                    }]
                }, {
                    "featureType": "landscape.man_made",
                    "elementType": "geometry.fill",
                    "stylers": [{
                        "color": "#ece2d9"
                    }]
                }, {
                    "featureType": "poi.park",
                    "elementType": "geometry.fill",
                    "stylers": [{
                        "color": "#ccdca1"
                    }]
                }, {
                    "featureType": "road",
                    "elementType": "labels.text.fill",
                    "stylers": [{
                        "color": "#767676"
                    }]
                }, {
                    "featureType": "road",
                    "elementType": "labels.text.stroke",
                    "stylers": [{
                        "color": "#ffffff"
                    }]
                }, {
                    "featureType": "poi",
                    "stylers": [{
                        "visibility": "off"
                    }]
                }, {
                    "featureType": "landscape.natural",
                    "elementType": "geometry.fill",
                    "stylers": [{
                        "visibility": "on"
                    }, {
                        "color": "#b8cb93"
                    }]
                }, {
                    "featureType": "poi.park",
                    "stylers": [{
                        "visibility": "on"
                    }]
                }, {
                    "featureType": "poi.sports_complex",
                    "stylers": [{
                        "visibility": "on"
                    }]
                }, {
                    "featureType": "poi.medical",
                    "stylers": [{
                        "visibility": "on"
                    }]
                }, {
                    "featureType": "poi.business",
                    "stylers": [{
                        "visibility": "simplified"
                    }]
                }]

            }

            var map = new google.maps.Map(document.getElementById("customSkinMap"), mapOptions);

            var marker = new google.maps.Marker({
                position: myLatlng,
                title: "Custom Skin & Settings Map!"
            });

            marker.setMap(map);



            // Satellite Map
            var myLatlng = new google.maps.LatLng(40.748817, -73.985428);
            var mapOptions = {
                zoom: 3,
                scrollwheel: false, //we disable de scroll over the map, it is a really annoing when you scroll through page
                center: myLatlng,
                mapTypeId: google.maps.MapTypeId.SATELLITE
            }

            var map = new google.maps.Map(document.getElementById("satelliteMap"), mapOptions);

            var marker = new google.maps.Marker({
                position: myLatlng,
                title: "Satellite Map!"
            });

            marker.setMap(map);


        },

        initFullCalendar: function() {
            $calendar = $('#fullCalendar');

            today = new Date();
            y = today.getFullYear();
            m = today.getMonth();
            d = today.getDate();

            $calendar.fullCalendar({
                viewRender: function(view, element) {
                    // We make sure that we activate the perfect scrollbar when the view isn't on Month
                    if (view.name != 'month') {
                        $(element).find('.fc-scroller').perfectScrollbar();
                    }
                },
                header: {
                    left: 'title',
                    center: 'month,agendaWeek,agendaDay',
                    right: 'prev,next,today'
                },
                defaultDate: today,
                selectable: true,
                selectHelper: true,
                views: {
                    month: { // name of view
                        titleFormat: 'MMMM YYYY'
                            // other view-specific options here
                    },
                    week: {
                        titleFormat: " MMMM D YYYY"
                    },
                    day: {
                        titleFormat: 'D MMM, YYYY'
                    }
                },

                select: function(start, end) {

                    // on select we show the Sweet Alert modal with an input
                    swal({
                        title: 'Create an Event',
                        html: '<div class="form-group">' +
                            '<input class="form-control" placeholder="Event Title" id="input-field">' +
                            '</div>',
                        showCancelButton: true,
                        confirmButtonClass: 'btn btn-success',
                        cancelButtonClass: 'btn btn-danger',
                        buttonsStyling: false
                    }).then(function(result) {

                        var eventData;
                        event_title = $('#input-field').val();

                        if (event_title) {
                            eventData = {
                                title: event_title,
                                start: start,
                                end: end
                            };
                            $calendar.fullCalendar('renderEvent', eventData, true); // stick? = true
                        }

                        $calendar.fullCalendar('unselect');

                    });
                },
                editable: true,
                eventLimit: true, // allow "more" link when too many events


                // color classes: [ event-blue | event-azure | event-green | event-orange | event-red ]
                events: [{
                    title: 'All Day Event',
                    start: new Date(y, m, 1),
                    className: 'event-default'
                }, {
                    id: 999,
                    title: 'Repeating Event',
                    start: new Date(y, m, d - 4, 6, 0),
                    allDay: false,
                    className: 'event-rose'
                }, {
                    id: 999,
                    title: 'Repeating Event',
                    start: new Date(y, m, d + 3, 6, 0),
                    allDay: false,
                    className: 'event-rose'
                }, {
                    title: 'Meeting',
                    start: new Date(y, m, d - 1, 10, 30),
                    allDay: false,
                    className: 'event-green'
                }, {
                    title: 'Lunch',
                    start: new Date(y, m, d + 7, 12, 0),
                    end: new Date(y, m, d + 7, 14, 0),
                    allDay: false,
                    className: 'event-red'
                }, {
                    title: 'Md-pro Launch',
                    start: new Date(y, m, d - 2, 12, 0),
                    allDay: true,
                    className: 'event-azure'
                }, {
                    title: 'Birthday Party',
                    start: new Date(y, m, d + 1, 19, 0),
                    end: new Date(y, m, d + 1, 22, 30),
                    allDay: false,
                    className: 'event-azure'
                }, {
                    title: 'Click for Creative Tim',
                    start: new Date(y, m, 21),
                    end: new Date(y, m, 22),
                    url: 'http://www.creative-tim.com/',
                    className: 'event-orange'
                }, {
                    title: 'Click for Google',
                    start: new Date(y, m, 21),
                    end: new Date(y, m, 22),
                    url: 'http://www.creative-tim.com/',
                    className: 'event-orange'
                }]
            });
        },

        showNotification: function(from, align) {
            type = ['', 'info', 'success', 'warning', 'danger', 'rose', 'primary'];

            color = Math.floor((Math.random() * 6) + 1);

            $.notify({
                icon: "notifications",
                message: "Welcome to <b>Material Dashboard</b> - a beautiful freebie for every web developer."

            }, {
                type: type[color],
                timer: 3000,
                placement: {
                    from: from,
                    align: align
                }
            });
        }

    }

 demo.initMaterialWizard();



});
