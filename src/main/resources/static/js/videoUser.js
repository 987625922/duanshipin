// 把页面所在左边的item设置为选中
document.getElementById('left_item_one').style.backgroundColor = '#191d26';
document.getElementById('left_item_one_a').style.color = '#fff';
document.getElementById('left_item_one_img').style.backgroundImage = "url('../../../static/img/video_content_h.png')";
document.getElementById('item_one_two').style.borderLeft = '3px solid #44c9a8';
var videoPoolDom = document.getElementById('operate_video_pool');
videoPoolDom.style.backgroundColor = '#fff'
videoPoolDom.style.color = '#333'
videoPoolDom.style.border = '1px solid #dcdfe6'
var userVideoPoolDom = document.getElementById('user_video_pool');
userVideoPoolDom.style.backgroundColor = '#44c9a8';
userVideoPoolDom.style.color = '#fff';
userVideoPoolDom.style.borderWidth = '0px';
//页码选择器
var pageSelect = document.getElementById('page_select');
pageSelect.style.display = 'none'
// 一进入界面显示上线的按钮的controller
document.getElementById('controll_online').style.display = 'block'
// document.getElementById('table_controll_one').style.display = 'block'
// 上线的点击事件
var btnOnline = document.getElementById('online');
var btnOffline = document.getElementById('offline');
var btnDel = document.getElementById('del');
var btnRecommend = document.getElementById('recommend');
// 各个按钮显示的controller
var onlineControll = document.getElementById('controll_online');
var offlineControll = document.getElementById('controll_offline');
var delControll = document.getElementById('controll_del');
var recommendContrll = document.getElementById('controll_recommend');
// 回收站table里的控制和其他按钮不一样，要单独分开处理
var tableControllerOne = document.getElementById('table-content-controll-one');
var tableControllerTwo = document.getElementById('table-content-controll-two');
tableControllerOne.style.display = 'block'
// 正在选中的按钮
var isSelectBtn = btnOnline
btnOnline.onclick = function () {
    btnPre(btnOnline);
    btnCommon(isSelectBtn);
    isSelectBtn = btnOnline;
    onlineControll.style.display = 'block'
    offlineControll.style.display = 'none'
    delControll.style.display = 'none'
    recommendContrll.style.display = 'none'
    tableControllerOne.style.display = 'block'
    tableControllerTwo.style.display = 'none'
}
//草稿的点击事件
btnOffline.onclick = function () {
    btnPre(btnOffline);
    btnCommon(isSelectBtn);
    isSelectBtn = btnOffline;
    offlineControll.style.display = 'block'
    onlineControll.style.display = 'none'
    delControll.style.display = 'none'
    recommendContrll.style.display = 'none'
    tableControllerOne.style.display = 'block'
    tableControllerTwo.style.display = 'none'
}
btnDel.onclick = function () {
    btnPre(btnDel);
    btnCommon(isSelectBtn);
    isSelectBtn = btnDel;
    offlineControll.style.display = 'none'
    onlineControll.style.display = 'none'
    delControll.style.display = 'block'
    recommendContrll.style.display = 'none'
    tableControllerOne.style.display = 'none'
    tableControllerTwo.style.display = 'block'
}
btnRecommend.onclick = function () {
    btnPre(btnRecommend);
    btnCommon(isSelectBtn);
    isSelectBtn = btnRecommend;
    offlineControll.style.display = 'none'
    onlineControll.style.display = 'none'
    delControll.style.display = 'none'
    recommendContrll.style.display = 'block'
    tableControllerOne.style.display = 'block'
    tableControllerTwo.style.display = 'none'
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
