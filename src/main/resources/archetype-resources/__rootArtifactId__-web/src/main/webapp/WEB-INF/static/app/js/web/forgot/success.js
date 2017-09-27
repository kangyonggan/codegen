$(function () {
    document.title = "密码找回成功";

    var $btn = $("#to-login");
    var time = 5;

    var t = setInterval(function () {
        time--;
        $btn.html("去登录(" + time + "s)");
        if (time == 0) {
            clearInterval(t);
            window.location.href = ctx + "/user#index";
        }
    }, 1000)
});

