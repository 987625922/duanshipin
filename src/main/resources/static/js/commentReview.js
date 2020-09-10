// 把页面所在左边的item设置为选中
document.getElementById('left_item_three').style.backgroundColor = '#191d26';
document.getElementById('left_item_three_a').style.color = '#fff';
document.getElementById('left_item_three_img').style.backgroundImage = "url('../../../static/img/ev_h.png')";
document.getElementById('left-five').style.borderLeft = '3px solid #44c9a8';
// 各个按钮显示的controller
var topSecondReview = document.getElementById('top-second-review');
var reviewSuccess = document.getElementById('review-success');
var failedReview = document.getElementById('review-faile');
//运营池或者用户池的按钮
btnPre(topSecondReview)
btnCommon(reviewSuccess)
btnCommon(failedReview)
//页码选择器
var pageSelect = document.getElementById('page_select');
pageSelect.style.display = 'none'
// 上线的点击事件
var reviewControl = document.getElementById('top-second-review-control');
var reviewSuccessControl = document.getElementById('review-success-control');
var reviewFaileControl = document.getElementById('review-faile-control');
// 回收站table里的控制和其他按钮不一样，要单独分开处理
var tableControllerOne = document.getElementById('table_controll_one');
// table的操作item是否显示
var tableControlTd = document.getElementById('table-control-td')
var tableControlTh = document.getElementById('table-control-th')

// 正在选中的按钮
// 一进入界面显示上线的按钮的controller
reviewControl.style.display = 'block'
tableControllerOne.style.display = 'block';

var selectBtn = topSecondReview;
topSecondReview.onclick = function () {
    btnCommon(selectBtn);
    btnPre(topSecondReview);

    selectBtn = topSecondReview;

    reviewControl.style.display = 'block';
    reviewSuccessControl.style.display = 'none';
    reviewFaileControl.style.display = 'none';

    tableControllerOne.style.display = 'block';

    tableControlTd.style.display = 'table-cell';
    tableControlTh.style.display = 'block';
}
reviewSuccess.onclick = function () {
    btnCommon(selectBtn);
    btnPre(reviewSuccess);

    selectBtn = reviewSuccess;

    reviewControl.style.display = 'none';
    reviewSuccessControl.style.display = 'block';
    reviewFaileControl.style.display = 'none';

    tableControllerOne.style.display = 'none';


    tableControlTd.style.display = 'none';
    tableControlTh.style.display = 'none';
}
failedReview.onclick = function () {
    btnCommon(selectBtn);
    btnPre(failedReview);

    selectBtn = failedReview;

    reviewControl.style.display = 'none';
    reviewSuccessControl.style.display = 'none';
    reviewFaileControl.style.display = 'block';

    tableControllerOne.style.display = 'none';


    tableControlTd.style.display = 'none';
    tableControlTh.style.display = 'none';
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