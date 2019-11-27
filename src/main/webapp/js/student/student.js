$(document).ready(function(){
    $(".ShowUserInfo").mouseover(function () {
        $("#UserInfo").css("display", "block");
    });
    $(".ShowUserInfo").mouseout(function () {
        $("#UserInfo").css("display", "none");
    });
});
