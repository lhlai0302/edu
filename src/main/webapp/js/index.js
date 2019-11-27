$(document).ready(function(){

    $("#userId").focus(function () {
        $("#userId").css("background-color", "#31b0d5");
        $("#userId").css("color", "white");
    });
    $("#userPass").focus(function () {
        $("#userPass").css("background-color","#31b0d5");
        $("#userPass").css("color", "white");
    });

    $("#userId").blur(function () {
        $("#userId").css("background-color", "white");
        $("#userId").css("color", "black");
    });
    $("#userPass").blur(function () {
        $("#userPass").css("background-color", "white");
        $("#userPass").css("color", "black");
    });

});
