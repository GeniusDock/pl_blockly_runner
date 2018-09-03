$(document).ready(function () {
    $(".mu-kids-submit-button").html("<kids-submit-button></kids-submit-button>");
    $(".mu-kids-reset-button").html("<kids-reset-button></kids-reset-button>");
    $(".mu-kids-compass-rose")[0].hidden = true;
    $(".mu-kids-states").remove();

    var loadGeniusDockImg = function(){
        //create image to preload:
        var imgPreload = new Image();
        $(imgPreload).attr({
            src: "/genius_dock.png"
        });
        //check if the image is already loaded (cached):
        if (imgPreload.complete || imgPreload.readyState === 4) {

            //image loaded:
            //your code here to insert image into page
            $(".mu-kids-character img").attr("src","/genius_dock.png");

        } else {
            //go fetch the image:
            $(imgPreload).load("",null,function (response, status, xhr) {
                if (status == 'error') {

                    //image could not be loaded:

                } else {

                    //image loaded:
                    //your code here to insert image into page
                    $(".mu-kids-character img").attr("src","/genius_dock.png");
                    $(".capital-animation").attr("src","/genius_dock.png");
                }
            });
        }
    }; //Esta funcion la usaba para cargar la imagen a manopla antes de enviarla

    $(".mu-kids-character img").attr("src","https://i.imgur.com/E51jddY.png");
    $(".capital-animation").attr("src","https://i.imgur.com/E51jddY.png");

    $(".capital-animation").css({ 'width' : 'initial', 'margin-left' : 'initial','margin-top':'initial','margin-right':'3%' });

    $(".mu-kids-character img").css("margin-right","3%");

    $(".mu-kids-exercise .mu-kids-exercise-description").css('width','100%');


});