// 把页面所在左边的item设置为选中
document.getElementById('left_item_five').style.backgroundColor = '#191d26';
document.getElementById('left_item_five_a').style.color = '#fff';
document.getElementById('left_item_five_img').style.backgroundImage = "url('/duanshipin/img/customer_service_p.png')";
document.getElementById('left-one').style.borderLeft = '3px solid #44c9a8';
// 上线的点击事件
var operate_video_pool = document.getElementById('operate_video_pool');
var user_video_pool = document.getElementById('user_video_pool');
btnCommon(user_video_pool);
btnPre(operate_video_pool);
//页码选择器
var pageSelect = document.getElementById('page_select');
pageSelect.style.display = 'none';
// 各个按钮显示的controller
var untreatedControl = document.getElementById('untreated-control');
var disposedControl = document.getElementById('disposed-control');
//切换时table显示和隐藏的item
var tableOneTh = document.getElementById('table-one-th')
var tableOneTd = document.getElementById('table-one-td')
var tableTwoTh = document.getElementById('table-two-th')
var tableTwoTd = document.getElementById('table-two-td')
// 正在选中的按钮
// 一进入界面显示上线的按钮的controller
untreatedControl.style.display = 'block';
disposedControl.style.display = 'none';
tableOneTh.style.display = 'none';
tableOneTd.style.display = 'none';

operate_video_pool.onclick = function () {
    btnCommon(user_video_pool);
    btnPre(operate_video_pool);
    untreatedControl.style.display = 'block';
    disposedControl.style.display = 'none';

    tableOneTh.style.display = 'none';
    tableOneTd.style.display = 'none';
    tableTwoTh.style.display = 'block';
    tableTwoTd.style.display = 'block';
}
user_video_pool.onclick = function () {
    btnCommon(operate_video_pool);
    btnPre(user_video_pool);
    untreatedControl.style.display = 'none';
    disposedControl.style.display = 'block';

    tableOneTh.style.display = 'block';
    tableOneTd.style.display = 'table-cell';
    tableTwoTh.style.display = 'none';
    tableTwoTd.style.display = 'none';
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