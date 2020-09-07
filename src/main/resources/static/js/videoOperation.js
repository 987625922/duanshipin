// 把页面所在左边的item设置为选中
document.getElementById('left_item_one').style.backgroundColor = '#191d26';
document.getElementById('left_item_one_a').style.color = '#fff';
document.getElementById('left_item_one_img').style.backgroundImage = "url('../../../static/img/video_content_h.png')";
document.getElementById('item_one_two').style.borderLeft = '3px solid #44c9a8';
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
document.getElementById('table_controll_one').style.display = 'block'
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
var tableControllerOne = document.getElementById('table_controll_one');
var tableControllerTwo = document.getElementById('table_controll_two');
var tableControllerThree = document.getElementById('table_controll_three');
// 正在选中的按钮
var isSelectBtn = btnOnline
btnOnline.onclick = function () {
    btnCommon(isSelectBtn);
    btnPre(btnOnline);
    isSelectBtn = btnOnline;
    onlineControll.style.display = 'block'
    drafcontroll.style.display = 'none'
    recycleControll.style.display = 'none'
    recommendContrll.style.display = 'none'
    tableControllerOne.style.display = 'block'
    tableControllerTwo.style.display = 'none'
    tableControllerThree.style.display = 'none'
}
//草稿的点击事件
btnDraf.onclick = function () {
    btnCommon(isSelectBtn);
    btnPre(btnDraf);
    isSelectBtn = btnDraf;
    drafcontroll.style.display = 'block'
    onlineControll.style.display = 'none'
    recycleControll.style.display = 'none'
    recommendContrll.style.display = 'none'
    tableControllerOne.style.display = 'none'
    tableControllerTwo.style.display = 'none'
    tableControllerThree.style.display = 'block'
}
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
    tableControllerThree.style.display = 'none'
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
    tableControllerThree.style.display = 'none'
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