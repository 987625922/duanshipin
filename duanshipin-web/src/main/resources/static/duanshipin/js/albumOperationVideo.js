// 把页面所在左边的item设置为选中
document.getElementById('left_item_one').style.backgroundColor = '#191d26';
document.getElementById('left_item_one_a').style.color = '#fff';
document.getElementById('left_item_one_img').style.backgroundImage = "url('/duanshipin/img/video_content_h.png')";
document.getElementById('item_one_one').style.borderLeft = '3px solid #44c9a8';
//运营池或者用户池的按钮
var videoPoolDom = document.getElementById('user_video_pool');
videoPoolDom.style.backgroundColor = '#fff'
videoPoolDom.style.color = '#333'
videoPoolDom.style.border = '1px solid #dcdfe6'
var userVideoPoolDom = document.getElementById('operate_video_pool');
userVideoPoolDom.style.backgroundColor = '#44c9a8';
userVideoPoolDom.style.color = '#fff';
userVideoPoolDom.style.borderWidth = '0px';
//页码选择器
var pageSelect = document.getElementById('page_select');
pageSelect.style.display = 'none'
// 一进入界面显示上线的按钮的controller
document.getElementById('controll_online').style.display = 'block'
// 上线的点击事件
var btnOnline = document.getElementById('online');
var btnDraf = document.getElementById('draf');
var btnRecycleBin = document.getElementById('recycle_bin');
var btnRecommend = document.getElementById('recommend');
// 各个按钮显示的controller
var drafcontroll = document.getElementById('controll_draf');
var onlineControll = document.getElementById('controll_online');
var recycleControll = document.getElementById('controll_recycle_bin');
var recommendContrll = document.getElementById('controll_recommend');
// 回收站table里的控制和其他按钮不一样，要单独分开处理
var tableControllerOne = document.getElementsByName('table_controll_one');
var tableControllerTwo = document.getElementsByName('table_controll_two');
//刷新按钮
var onlineFresh = document.getElementById('online-fresh');
// 正在选中的按钮
var isSelectBtn = btnOnline;
btnOnline.onclick = function () {
    btnCommon(isSelectBtn);
    btnPre(btnOnline);
    isSelectBtn = btnOnline;
    onlineControll.style.display = 'block'
    drafcontroll.style.display = 'none'
    recycleControll.style.display = 'none'
    recommendContrll.style.display = 'none'

    tableControllerOne.style.display = 'block';
    tableControllerTwo.style.display = 'none';
}
//草稿的点击事件
btnDraf.onclick = function () {
    btnCommon(isSelectBtn);
    btnPre(btnDraf);
    isSelectBtn = btnDraf;
    drafcontroll.style.display = 'block';
    onlineControll.style.display = 'none';
    recycleControll.style.display = 'none';
    recommendContrll.style.display = 'none';
    for (let i = 0; i < tableControllerOne.length; i++) {
        tableControllerOne[i].style.display = 'block'
    }
    for (let i = 0; i < tableControllerTwo.length; i++) {
        tableControllerTwo[i].style.display = 'none'
    }
};
btnRecycleBin.onclick = function () {
    btnCommon(isSelectBtn);
    btnPre(btnRecycleBin);
    isSelectBtn = btnRecycleBin;
    drafcontroll.style.display = 'none'
    onlineControll.style.display = 'none'
    recycleControll.style.display = 'block'
    recommendContrll.style.display = 'none'
    tableControllerOne.style.display = 'none'
    tableControllerTwo.style.display = 'block'
}
btnRecommend.onclick = function () {
    btnCommon(isSelectBtn);
    btnPre(btnRecommend);
    isSelectBtn = btnRecommend;
    drafcontroll.style.display = 'none'
    onlineControll.style.display = 'none'
    recycleControll.style.display = 'none'
    recommendContrll.style.display = 'block'
    tableControllerOne.style.display = 'block'
    tableControllerTwo.style.display = 'none'
};
onlineFresh.onclick = function () {
    getAlbumList();
}

//把view改成按下按钮的颜色
function btnPre(dom) {
    dom.style.borderWidth = '0px';
    dom.style.backgroundColor = '#44c9a8'
    dom.style.color = '#fff'
}

//把view改成普通颜色
function btnCommon(dom) {
    dom.style.border = '1px solid #dcdfe6';
    dom.style.backgroundColor = '#fff'
    dom.style.color = '#333'
}

function getAlbumList() {
    let tr = document.getElementById('table-tr');
    let chile = document.createElement('tr');
    ajax({
        url: "/api/album/list",
        type: 'post',
        data: {
            pageIndex: 1,
            pageSize: 10,
            type: 2
        },
        dataType: 'json',
        timeout: 10000,
        contentType: "application/json",
        success: function (data) {
            let json = JSON.parse(data)
            if (json.code === 200) {
                //' + json.data.list[i].id + ' table-content
                console.log(json);
                var htmlStr = '<tr>\n' +
                    '                        <th>\n' +
                    '                            <input type="checkbox" name="" id="" class="table_checkbox"/>\n' +
                    '                        </th>\n' +
                    '                        <th>\n' +
                    '                            <span class="table_id table_th"> 专辑ID </span>\n' +
                    '                        </th>\n' +
                    '                        <th>\n' +
                    '                            <span class="table_title table_th"> 专辑标题 </span>\n' +
                    '                        </th>\n' +
                    '                        <th>\n' +
                    '                            <span class="table_introducation table_th"> 专辑简介 </span>\n' +
                    '                        </th>\n' +
                    '                        <th>\n' +
                    '                            <span class="table_img table_th"> 缩略图 </span>\n' +
                    '                        </th>\n' +
                    '                        <th>\n' +
                    '                            <span class="table_mun table_th"> 总集/已更新 </span>\n' +
                    '                        </th>\n' +
                    '                        <th>\n' +
                    '                            <span class="table_time table_th"> 最后操作时间 </span>\n' +
                    '                        </th>\n' +
                    '                        <th>\n' +
                    '                            <span class="table_user table_th"> 操作人 </span>\n' +
                    '                        </th>\n' +
                    '                        <th>\n' +
                    '                            <span class="table_controll table_th"> 操作 </span>\n' +
                    '                        </th>\n' +
                    '                    </tr>';
                for (let i = 0; i < json.data.list.length; i++) {
                    var bean = json.data.list[i];
                    htmlStr += '<tr><td>\n' +
                        ' <input type="checkbox" class="table_checkbox"/>\n' +
                        '                        </td>\n' +
                        '                        <td>\n' +
                        '                        <span class="table_id">' + bean.id + '</span>\n' +
                        '                        </td>\n' +
                        '                        <td>\n' +
                        '                            <span class="table_title">' + bean.title + '</span>\n' +
                        '                        </td>\n';
                    if (bean.introduction != null) {
                        htmlStr += '<td>\n' +
                            '                        <span class="table_introducation">' + bean.introduction + '</span>\n' +
                            '                        </td>\n'
                    } else {
                        htmlStr += '<td>\n' +
                            '                        <span class="table_introducation">空</span>\n' +
                            '                        </td>\n'
                    }
                    htmlStr += '                        <td>\n' +
                        '                            <img alt="" src="' + bean.imgSrc + '" class="table_content_img"/>\n' +
                        '                        </td>\n' +
                        '                        <td>\n' +
                        '                            <span>' + bean.currentMun + '</span><span>/</span><span>' + bean.totalMun + '</span>\n' +
                        '                        </td>\n' +
                        '                        <td>\n' +
                        '                            <span class="table_time">' + bean.updateTime + '</span>\n' +
                        '                        </td>\n' +
                        '                        <td>\n' +
                        '                            <span class="table_user">' + bean.updateAdminName + '</span>\n' +
                        '                        </td>\n' +
                        '                        <td>\n' +
                        '                            <div class="table_content_controll">\n' +
                        '                                <div name="table_controll_one">\n' +
                        '                                    <a href="/views/content/publishAlbum">修改专辑</a>\n' +
                        '                                    <a href="/views/content/albumVideoManager">视频管理</a>\n' +
                        '                                    <a href="/views/content/albumpreview">专辑预览</a>\n' +
                        '                                </div>\n' +
                        '                                <div name="table_controll_two">\n' +
                        '                                    <a href="#">还原</a>\n' +
                        '                                    <a href="#">预览</a>\n' +
                        '                                </div>\n' +
                        '                            </div>\n' +
                        '                        </td></tr>'
                }
                $('#table-content').html(htmlStr);
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