// 账号密码框获取到焦点
function inputGetFocuse(){
    document.getElementById("div-login-form-u1").style.border = 'solid 1px #44c9a8'
}
// 账号密码框失去了焦点
function inputLoseFocuse(){
    document.getElementById("div-login-form-u1").style.border = 'solid 0px #44c9a8'
}
// 验证码框获取到焦点
function vcodeGetFocuse(){
    document.getElementById("input-form-login-vcode").style.border = 'solid 1px #999'
}
function vcodeLoseFocuse(){
    document.getElementById("input-form-login-vcode").style.border = 'solid 1px #d9d9d9'
}
function login(){
    document.getElementById('div-login-form-u4').style.display = 'block'
}