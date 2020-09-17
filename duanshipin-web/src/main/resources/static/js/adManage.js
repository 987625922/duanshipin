// 把页面所在左边的item设置为选中
document.getElementById('left_item_four').style.backgroundColor = '#191d26';
document.getElementById('left_item_four_a').style.color = '#fff';
document.getElementById('left_item_four_img').style.backgroundImage = "url('../../../static/img/app_h.png')";
document.getElementById('left-one').style.borderLeft = '3px solid #44c9a8';
// 上线的点击事件
var btnOnline = document.getElementById('online');
var btnDraf = document.getElementById('draf');
var btnRecycle = document.getElementById('recycle-bin')
//运营池或者用户池的按钮
btnCommon(btnDraf)
btnCommon(btnRecycle)
btnPre(btnOnline)

//页码选择器
var pageSelect = document.getElementById('page_select');
pageSelect.style.display = 'none'
// 各个按钮显示的controller
var controll_online = document.getElementById('controll_online');
var controll_draf = document.getElementById('controll_draf');
var controll_recycle = document.getElementById('controll_recycle');
// 回收站table里的控制和其他按钮不一样，要单独分开处理
var tableControlItemTd = document.getElementById('table-control-item-td')
var tableControlItemTh = document.getElementById('table-control-item-th')
var table_controll_one = document.getElementById('table_controll_one')
// 正在选中的按钮
// 一进入界面显示上线的按钮的controller
controll_online.style.display = 'block';
table_controll_one.style.display = 'block'
var selectBtn = btnOnline;
btnOnline.onclick = function () {
    btnCommon(selectBtn);
    btnPre(btnOnline);
    selectBtn = btnOnline;

    controll_online.style.display = 'block';
    controll_draf.style.display = 'none';
    controll_recycle.style.display = 'none';

    tableControlItemTd.style.display = 'table-cell'
    tableControlItemTh.style.display = 'table-cell'
}
btnDraf.onclick = function () {
    btnCommon(selectBtn);
    btnPre(btnDraf);
    selectBtn = btnDraf;

    controll_online.style.display = 'none';
    controll_draf.style.display = 'block';
    controll_recycle.style.display = 'none';

    tableControlItemTd.style.display = 'table-cell'
    tableControlItemTh.style.display = 'table-cell'

}
btnRecycle.onclick = function () {
    btnCommon(selectBtn);
    btnPre(btnRecycle);
    selectBtn = btnRecycle;

    controll_online.style.display = 'none';
    controll_draf.style.display = 'none';
    controll_recycle.style.display = 'block';

    tableControlItemTd.style.display = 'none'
    tableControlItemTh.style.display = 'none'

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