new WOW().init();
document.addEventListener("DOMContentLoaded", function() {
    particlesJS("particles-js", {
        particles: {
            number: {
                value: 30,
                limit: 30,
                density: {
                    enable: !0,
                    value_area: 800
                }
            },
            color: {
                value: "#fff"
            },
            shape: {
                type: "polygon",
                stroke: {
                    width: 0,
                    color: "#fff"
                },
                polygon: {
                    nb_sides: 5
                },
                image: {
                    src: "img/github.svg",
                    width: 100,
                    height: 100
                }
            },
            opacity: {
                value: .5,
                random: !1,
                anim: {
                    enable: !1,
                    speed: 1,
                    opacity_min: .1,
                    sync: !1
                }
            },
            size: {
                value: 3,
                random: !0,
                anim: {
                    enable: !1,
                    speed: 19.18081918081918,
                    size_min: .1,
                    sync: !1
                }
            },
            line_linked: {
                enable: !0,
                distance: 150,
                color: "#fff",
                opacity: .4,
                width: 1
            },
            move: {
                enable: !0,
                speed: 4,
                direction: "none",
                random: !0,
                straight: !1,
                out_mode: "out",
                bounce: !1,
                attract: {
                    enable: !1,
                    rotateX: 600,
                    rotateY: 1200
                }
            },
            nb: 80
        },
        interactivity: {
            detect_on: "window",
            events: {
                onhover: {
                    enable: !1,
                    mode: "grab"
                },
                onclick: {
                    enable: !0,
                    mode: "push"
                },
                resize: !0
            },
            modes: {
                grab: {
                    distance: 400,
                    line_linked: {
                        opacity: 1
                    }
                },
                bubble: {
                    distance: 400,
                    size: 40,
                    duration: 2,
                    opacity: 8,
                    speed: 3
                },
                repulse: {
                    distance: 200,
                    duration: .4
                },
                push: {
                    particles_nb: 4
                },
                remove: {
                    particles_nb: 2
                }
            }
        },
        retina_detect: !0
    })
}, !1);
$(document).ready(function() {
    /*$(window).scroll(function() {
        var top_of_element = $("#facultyBoard").offset().top;
        
        var bottom_of_element = $("#facultyBoard").offset().top + $("#facultyBoard").outerHeight();
        var bottom_of_screen = $(window).scrollTop() + window.innerHeight;
        var top_of_screen = $(window).scrollTop();
        console.log($("#facultyBoard").height(), top_of_element, bottom_of_screen)
        if((top_of_screen < top_of_element) && (bottom_of_screen > bottom_of_element)){
            // The element is visible, do something
            $("#facultyBoard").addClass('sticky')
            console.log("visible")
        }
        else {
            $("#facultyBoard").removeClass('sticky')
            // The element is not visible, do something else
        }
    });*/
    $(".scrollTo").on('click', function(e) {

       // prevent default anchor click behavior
       e.preventDefault();

       // store hash
       var hash = this.hash;

       // animate
       $('html, body').animate({
           scrollTop: $(hash).offset().top - 20
         }, 300);
    });

    $(".scrollToAbout").on('click', function(e) {

       // prevent default anchor click behavior
       e.preventDefault();

       // store hash
       var hash = this.hash;

       // animate
       $('html, body').animate({
           scrollTop: $(hash).offset().top - $('nav').height()
         }, 300);
    });

    $(".list-group .list-group-item").click(function(e) {
       $(".list-group .list-group-item").removeClass("active");
       $(e.target).addClass("active");
    });


});