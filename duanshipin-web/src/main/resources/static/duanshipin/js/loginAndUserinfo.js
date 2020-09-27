//登录，修改密码
var dialogOne = document.getElementById('dialog-one');
var dialogTwo = document.getElementById('dialog-two');
var tabsOne = document.getElementById('tabs_one');
var tabsTwo = document.getElementById('tabs_two');
var bar = document.getElementById('tabs-bar');
tabsOne.style.color = '#44c9a8';
dialogTwo.style.display = 'none';

// 切换到dialog的第一个内容
document.getElementById('tabs_one').onclick = function () {
    dialogOne.style.display = 'block';
    tabsOne.style.color = '#44c9a8';
    tabsTwo.style.color = '#303133';
    dialogTwo.style.display = 'none';
    bar.style.transform = 'translateX(20px)';
}
// 切换到dialog的第二个内容
document.getElementById('tabs_two').onclick = function () {
    dialogOne.style.display = 'none';
    tabsOne.style.color = '#303133';
    tabsTwo.style.color = '#44c9a8';
    dialogTwo.style.display = 'block';
    bar.style.transform = 'translateX(98px)';
}
document.getElementById('dialog-form-btn-cancel').onclick = function () {
    document.getElementById('dialog_userinfo_wrapper').style.display = 'none';
}
document.getElementById('dialog-form-userinfo-btn-cancel').onclick = function () {
    document.getElementById('dialog_userinfo_wrapper').style.display = 'none';
}
document.getElementById('account').onclick = function () {
    document.getElementById('dialog_userinfo_wrapper').style.display = 'block';
}
document.getElementById('loginout').onclick = function () {
    document.getElementById('dialog_loginout_wrapper').style.display = 'block';
}
document.getElementById('dialog_loginout_cancel').onclick = function () {
    document.getElementById('dialog_loginout_wrapper').style.display = 'none';
}