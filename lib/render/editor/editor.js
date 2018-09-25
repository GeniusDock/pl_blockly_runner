$(document).ready(function () {
    $(".mu-kids-submit-button").html("<kids-submit-button></kids-submit-button>");
    $(".mu-kids-reset-button").html("<kids-reset-button></kids-reset-button>");
    $(".mu-kids-compass-rose")[0].hidden = true;
    $(".mu-kids-states").remove();

    $(".mu-kids-character-speech-bubble").append("<div class='mu-kids-result-box'></div>");

    $(".mu-kids-character img").attr("src","https://i.imgur.com/E51jddY.png");
    $(".capital-animation").attr("src","https://i.imgur.com/E51jddY.png");


    $(".capital-animation").css({ 'width' : 'initial', 'margin-left' : 'initial','margin-top':'initial','margin-right':'3%' });

    $(".mu-kids-character img").css("margin-right","3%");

    $(".mu-kids-exercise .mu-kids-exercise-description").css('width','100%');

    $(".submission-result-error-body-description li")[0].innerHTML = "Revisá que tu solución no contenga huecos ni espacios en blanco";

    window.onerror = function (message) {
        if(message.includes("getFieldValue")){
            mumuki.kids.showResult({status: 'aborted'});
        }
        return true;
    }
});
