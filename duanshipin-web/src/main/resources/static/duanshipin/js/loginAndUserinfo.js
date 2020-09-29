//登录，修改密码
var dialogOne = document.getElementById('dialog-one');
var dialogTwo = document.getElementById('dialog-two');
var tabsOne = document.getElementById('tabs_one');
var tabsTwo = document.getElementById('tabs_two');
var bar = document.getElementById('tabs-bar');
var dialogFormUserinfoBtnSave = document.getElementById('dialog-form-userinfo-btn-save')
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

document.getElementById('dialog-form-btn-save').onclick = function () {
    var oldPassword = document.getElementById('oldPassword').value
    var newPassword = document.getElementById('newPassword').value
    var newAgainPassword = document.getElementById('newAgainPassword').value
    if (newPassword != newAgainPassword) {
        Toast('新密码不一致', 1000)
    }
    ajax({
        url: "/api/admin/changePassword",
        type: 'GET',
        data: {
            oldPassword: oldPassword,
            newPassword: newPassword
        },
        timeout: 10000,
        success: function (data) {
            let json = JSON.parse(data)
            if (json.code === 200) {
                document.getElementById('dialog_userinfo_wrapper').style.display = 'none';
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
dialogFormUserinfoBtnSave.onclick = function () {
    var phone = document.getElementById('dialog-userinfo-phone').value
    if (phone == null || phone.length == 0){
        Toast('参数不能为空',1000)
    }else{
        ajax({
            url: "/api/admin/update",
            type: 'post',
            data: {
                phone: phone
            },
            dataType: 'json',
            timeout: 10000,
            contentType: "application/json",
            success: function (data) {
                let json = JSON.parse(data)
                if (json.code === 200) {
                    document.getElementById('dialog_userinfo_wrapper').style.display = 'none';
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
}