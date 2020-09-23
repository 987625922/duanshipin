//验证码
var captchaKey;

// 账号密码框获取到焦点
function inputGetFocuse() {
    document.getElementById("div-login-form-u1").style.border = 'solid 1px #44c9a8'
}

// 账号密码框失去了焦点
function inputLoseFocuse() {
    document.getElementById("div-login-form-u1").style.border = 'solid 0px #44c9a8'
}

// 验证码框获取到焦点
function vcodeGetFocuse() {
    document.getElementById("inputVcode").style.border = 'solid 1px #999'
}

function vcodeLoseFocuse() {
    document.getElementById("inputVcode").style.border = 'solid 1px #d9d9d9'
}
function captcha() {
    var imgCaptcha = document.getElementById('img-captcha')

    ajax({
        url: "/api/captcha",
        type: 'get',
        dataType: 'json',
        timeout: 10000,
        contentType: "application/json",
        success: function (data) {
            let json = JSON.parse(data)
            if (json.code === 200) {
                imgCaptcha.setAttribute('src',json.data.imageBase64);
                captchaKey = json.data.key
            } else {
                console.log(json.msg);
                Toast(json.msg, 1000)
            }
        },
        //异常处理
        error: function (e) {
            console.log(e);
        }
    })
}

//登录
function login() {
    var accountDom = document.getElementById('inputAccount');
    var passwordDom = document.getElementById('inputPassword');
    var vCodeDom = document.getElementById('inputVcode');

    ajax({
        url: "/api/login",
        type: 'post',
        data: {
            account: accountDom.value,
            password: passwordDom.value,
            verifyCode: vCodeDom.value,
            verifyKey:captchaKey,
            rememberMe: true
        },
        dataType: 'json',
        timeout: 10000,
        contentType: "application/json",
        success: function (data) {
            let json = JSON.parse(data)
            if (json.code === 200) {
                self.location.href = '/views/index';
            } else {
                console.log(json.msg);
                Toast(json.msg, 1000)
            }
        },
        //异常处理
        error: function (e) {
            console.log(e);
        }
    })
}