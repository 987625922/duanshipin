// 把页面所在左边的item设置为选中
document.getElementById('left_item_six').style.backgroundColor = '#191d26';
document.getElementById('left_item_six_a').style.color = '#fff';
document.getElementById('left_item_six_img').style.backgroundImage = "url('/duanshipin/img/sys_h.png')";
document.getElementById('left-six').style.borderLeft = '3px solid #44c9a8';
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
// 上线的点击事件
var btnOnline = document.getElementById('online');
var btnDraf = document.getElementById('draf');
// 各个按钮显示的controller
var tobereview = document.getElementById('to-be-reviewed');
var failedReview = document.getElementById('failed-review');
// 回收站table里的控制和其他按钮不一样，要单独分开处理
var tableControllerOne = document.getElementById('table_controll_one');
var tableControllerTwo = document.getElementById('table_controll_two');
// 表格中审核拒绝要显示的item
var tableReviewFaileReason = document.getElementById('table-review-faile-reason');
var tableReviewFaileReasonTd = document.getElementById('table-review-faile-reason-td');
// 正在选中的按钮
// 一进入界面显示上线的按钮的controller
tobereview.style.display = 'block'
tableControllerOne.style.display = 'block';
tableControllerTwo.style.display = 'none';
tableReviewFaileReason.style.display = 'none'
tableReviewFaileReasonTd.style.display = 'none'

videoPoolDom.onclick = function () {
    btnCommon(userVideoPoolDom);
    btnPre(videoPoolDom);
    tobereview.style.display = 'block';
    failedReview.style.display = 'none';

    tableControllerOne.style.display = 'block';
    tableControllerTwo.style.display = 'none';


    tableReviewFaileReason.style.display = 'block'
    tableReviewFaileReasonTd.style.display = 'table-cell'
}
userVideoPoolDom.onclick = function () {
    btnCommon(videoPoolDom);
    btnPre(userVideoPoolDom);
    tobereview.style.display = 'none';
    failedReview.style.display = 'block';

    tableControllerOne.style.display = 'none';
    tableControllerTwo.style.display = 'block';

    tableReviewFaileReason.style.display = 'none'
    tableReviewFaileReasonTd.style.display = 'none'
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