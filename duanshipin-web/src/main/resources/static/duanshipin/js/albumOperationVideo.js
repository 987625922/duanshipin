//请求的类型
var type = 2;
//每一页显示的条目
var pageSize = 10;

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
pageSelect.style.display = 'none';
// 一进入界面显示上线的按钮的controller
document.getElementById('controll_online').style.display = 'block';
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
//刷新按钮
var onlineFresh = document.getElementById('online-fresh');
// 正在选中的按钮
var isSelectBtn = btnOnline;
btnOnline.onclick = function () {
    btnCommon(isSelectBtn);
    btnPre(btnOnline);
    isSelectBtn = btnOnline;
    onlineControll.style.display = 'block';
    drafcontroll.style.display = 'none';
    recycleControll.style.display = 'none';
    recommendContrll.style.display = 'none';
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
};
btnRecycleBin.onclick = function () {
    btnCommon(isSelectBtn);
    btnPre(btnRecycleBin);
    isSelectBtn = btnRecycleBin;
    drafcontroll.style.display = 'none';
    onlineControll.style.display = 'none';
    recycleControll.style.display = 'block';
    recommendContrll.style.display = 'none';
};
btnRecommend.onclick = function () {
    btnCommon(isSelectBtn);
    btnPre(btnRecommend);
    isSelectBtn = btnRecommend;
    drafcontroll.style.display = 'none';
    onlineControll.style.display = 'none';
    recycleControll.style.display = 'none';
    recommendContrll.style.display = 'block';
};
onlineFresh.onclick = function () {
    getAlbumList();
}

//把view改成按下按钮的颜色
function btnPre(dom) {
    dom.style.borderWidth = '0px';
    dom.style.backgroundColor = '#44c9a8';
    dom.style.color = '#fff';
}

//把view改成普通颜色
function btnCommon(dom) {
    dom.style.border = '1px solid #dcdfe6';
    dom.style.backgroundColor = '#fff';
    dom.style.color = '#333';
}

function getAlbumList() {
    ajax({
        url: "/api/album/list",
        type: 'post',
        data: {
            pageIndex: 1,
            pageSize: 10,
            type: type
        },
        dataType: 'json',
        timeout: 10000,
        contentType: "application/json",
        success: function (data) {
            let json = JSON.parse(data);
            if (json.code === 200) {
                let htmlStr = '';
                htmlStr += '<table class="content_table"><thead><tr>' +
                    '                        <th>' +
                    '                            <input type="checkbox" name="" id="" class="table_checkbox"/>' +
                    '                        </th>' +
                    '                        <th>' +
                    '                            <span class="table_th"> 专辑ID </span>' +
                    '                        </th>' +
                    '                        <th>' +
                    '                            <span class="table_th"> 专辑标题 </span>' +
                    '                        </th>' +
                    '                        <th>' +
                    '                            <span class="table_th"> 专辑简介 </span>' +
                    '                        </th>' +
                    '                        <th>' +
                    '                            <span class="table_th" style="text-align: center"> 缩略图 </span>' +
                    '                        </th>' +
                    '                        <th>' +
                    '                            <span class="table_th"> 总集/已更新 </span>' +
                    '                        </th>' +
                    '                        <th>' +
                    '                            <span class="table_th"> 最后操作时间 </span>' +
                    '                        </th>' +
                    '                        <th>' +
                    '                            <span class="table_th"> 操作人 </span>' +
                    '                        </th>' +
                    '                        <th  style="text-align: center">' +
                    '                            <span class="table_th"> 操作 </span>' +
                    '                        </th>' +
                    '                    </tr></thead>';

                if (json.data.list.length > 6){
                    htmlStr += '<tbody style="display: block;height: 430px;overflow-y: scroll;">';
                } else {
                    htmlStr += '<tbody style="display: block;height: 5px;">';
                }
                for (let i = 0; i < json.data.list.length; i++) {
                    let bean = json.data.list[i];
                    let updateTime = new Date(Date.parse(bean.updateTime));
                    let formatTime = dateFormat("YYYY-mm-dd HH:MM", updateTime);
                    htmlStr += '<tr><td>' +
                        ' <input type="checkbox" class="table_checkbox"/>' +
                        '                        </td>' +
                        '                        <td>' +
                        '                        <span class="table_id">' + bean.id + '</span>' +
                        '                        </td>' +
                        '                        <td>' +
                        '                            <span class="table_title">' + bean.title + '</span>' +
                        '                        </td>';
                    if (bean.introduction != null) {
                        htmlStr += '<td>' +
                            '                        <span class="table_introducation">' + bean.introduction + '</span>' +
                            '                        </td>'
                    } else {
                        htmlStr += '<td>' +
                            '                        <span class="table_introducation">空</span>' +
                            '                        </td>'
                    }
                    if (bean.imgSrc == null) {
                        htmlStr += '                        <td>' +
                            '                            <img alt="" src="/duanshipin/img/default.jpg" class="table_content_img"/>' +
                            '                        </td>'
                    } else {
                        htmlStr += '                        <td>' +
                            '                            <img alt="" src="' + bean.imgSrc + '" class="table_content_img"/>' +
                            '                        </td>'
                    }
                    htmlStr += '                        <td>' +
                        '                            <span>' + bean.currentMun + '</span><span>/</span><span>' + bean.totalMun + '</span>' +
                        '                        </td>' +
                        '                        <td>' +
                        '                            <span class="table_time">' + formatTime + '</span>' +
                        '                        </td>' +
                        '                        <td>' +
                        '                            <span class="table_user">' + bean.updateAdminName + '</span>' +
                        '                        </td>' +
                        '                        <td>' +
                        '                            <div class="table_content_controll">' +
                        '                                    <a href="/views/content/publishAlbum">修改专辑</a>' +
                        '                                    <a href="/views/content/albumVideoManager">视频管理</a>' +
                        '                                    <a href="/views/content/albumpreview">专辑预览</a>' +
                        '                            </div>' +
                        '                        </td></tr>'
                }
                htmlStr += '</tbody></table>';
                $('#table-content').html(htmlStr);
                if (json.data.hasNextPage){
                    pageSelect.style.display = 'block';
                }else {
                    pageSelect.style.display = 'none';
                }
            } else {
                console.log(json.msg);
                Toast(json.msg, 1000);
            }
        },
        //异常处理
        error: function (e) {
            console.log(e);
        }
    })
}