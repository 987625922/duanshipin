// 把页面所在左边的item设置为选中
document.getElementById('left_item_five').style.backgroundColor = '#191d26';
document.getElementById('left_item_five_a').style.color = '#fff';
document.getElementById('left_item_five_img').style.backgroundImage = "url('../../../static/img/customer_service_p.png')";
document.getElementById('left-three').style.borderLeft = '3px solid #44c9a8';
//页码选择器
var pageSelect = document.getElementById('page_select');
pageSelect.style.display = 'none';
// 上线的点击事件
var btnUntreated = document.getElementById('btn-untreated');
var btnReview = document.getElementById('btn-review');
var btnHandle = document.getElementById('btn-handle');
var btnIgnore = document.getElementById('btn-ignore');
btnPre(btnUntreated);
btnCommon(btnReview);
btnCommon(btnHandle);
btnCommon(btnIgnore);
// 各个按钮显示的controller
var untreatedControl = document.getElementById('untreated-control');
var reviewControl = document.getElementById('review-control');
var handleControl = document.getElementById('handle-control');
var ignoreControl = document.getElementById('ignore-control');
//切换时table显示和隐藏的item
var tableOneTh = document.getElementById('table-one-th');
var tableOneTd = document.getElementById('table-one-td');
var tableTwoTh = document.getElementById('table-two-th');
var tableTwoTd = document.getElementById('table-two-td');
//table的item
var czsjItemTh = document.getElementById('table-czsj-th');
var czsjItemTd = document.getElementById('table-czsj-td');
var czrItemTh = document.getElementById('table-czr-th');
var czrItemTd = document.getElementById('table-czr-td');
var hlsjItemTh = document.getElementById('table-hlsj-th');
var hlsjItemTd = document.getElementById('table-hlsj-td');
var hlrItemTh = document.getElementById('table-hlr-th');
var hlrItemTd = document.getElementById('table-hlr-td');
var fksjItemTh = document.getElementById('table-fksj-th');
var fksjItemTd = document.getElementById('table-fksj-td');
//table操作的显示和隐藏
var tableControlOne = document.getElementById('table_controll_one');
var tableControlTwo = document.getElementById('table_controll_two');
var tableControlThree = document.getElementById('table_controll_three');
var tableControlFour = document.getElementById('table_controll_four');
// 正在选中的按钮
// 一进入界面显示上线的按钮的controller
untreatedControl.style.display = 'block';
reviewControl.style.display = 'none';
handleControl.style.display = 'none';
ignoreControl.style.display = 'none';

fksjItemTd.style.display = 'table-cell';
fksjItemTh.style.display = 'table-cell';

tableControlOne.style.display = 'block';
tableControlTwo.style.display = 'none';
tableControlThree.style.display = 'none';
tableControlFour.style.display = 'none';

czsjItemTh.style.display = 'none';
czsjItemTd.style.display = 'none';
czrItemTh.style.display = 'none';
czrItemTd.style.display = 'none';

hlsjItemTh.style.display = 'none';
hlsjItemTd.style.display = 'none';
hlrItemTh.style.display = 'none';
hlrItemTd.style.display = 'none';

fksjItemTd.style.display = 'table-cell';
fksjItemTh.style.display = 'block';

var selectBtn = btnUntreated
btnUntreated.onclick = function () {
    btnCommon(selectBtn);
    btnPre(btnUntreated);
    selectBtn = btnUntreated;

    untreatedControl.style.display = 'block';
    reviewControl.style.display = 'none';
    handleControl.style.display = 'none';
    ignoreControl.style.display = 'none';

    czsjItemTh.style.display = 'none';
    czsjItemTd.style.display = 'none';
    czrItemTh.style.display = 'none';
    czrItemTd.style.display = 'none';

    hlsjItemTh.style.display = 'none';
    hlsjItemTd.style.display = 'none';
    hlrItemTh.style.display = 'none';
    hlrItemTd.style.display = 'none';

    fksjItemTd.style.display = 'table-cell';
    fksjItemTh.style.display = 'table-cell';

    tableControlOne.style.display = 'block';
    tableControlTwo.style.display = 'none';
    tableControlThree.style.display = 'none';
    tableControlFour.style.display = 'none';
}
btnReview.onclick = function () {
    btnCommon(selectBtn);
    btnPre(btnReview);
    selectBtn = btnReview;

    untreatedControl.style.display = 'none';
    reviewControl.style.display = 'block';
    handleControl.style.display = 'none'
    ignoreControl.style.display = 'none';

    czsjItemTh.style.display = 'table-cell';
    czsjItemTd.style.display = 'table-cell';
    czrItemTh.style.display = 'table-cell';
    czrItemTd.style.display = 'table-cell';

    hlsjItemTh.style.display = 'none';
    hlsjItemTd.style.display = 'none';
    hlrItemTh.style.display = 'none';
    hlrItemTd.style.display = 'none';

    fksjItemTd.style.display = 'none';
    fksjItemTh.style.display = 'none';

    tableControlOne.style.display = 'none';
    tableControlTwo.style.display = 'block';
    tableControlThree.style.display = 'none';
    tableControlFour.style.display = 'none';
}
btnHandle.onclick = function () {
    btnCommon(selectBtn);
    btnPre(btnHandle);
    selectBtn = btnHandle;

    untreatedControl.style.display = 'none';
    reviewControl.style.display = 'none';
    handleControl.style.display = 'block'
    ignoreControl.style.display = 'none';

    czsjItemTh.style.display = 'table-cell';
    czsjItemTd.style.display = 'table-cell';
    czrItemTh.style.display = 'table-cell';
    czrItemTd.style.display = 'table-cell';

    hlsjItemTh.style.display = 'none';
    hlsjItemTd.style.display = 'none';
    hlrItemTh.style.display = 'none';
    hlrItemTd.style.display = 'none';

    fksjItemTd.style.display = 'none';
    fksjItemTh.style.display = 'none';

    tableControlOne.style.display = 'none';
    tableControlTwo.style.display = 'none';
    tableControlThree.style.display = 'block';
    tableControlFour.style.display = 'none';
}
btnIgnore.onclick = function () {
    btnCommon(selectBtn);
    btnPre(btnIgnore);
    selectBtn = btnIgnore;

    untreatedControl.style.display = 'none';
    reviewControl.style.display = 'none';
    handleControl.style.display = 'none'
    ignoreControl.style.display = 'block';

    czsjItemTh.style.display = 'none';
    czsjItemTd.style.display = 'none';
    czrItemTh.style.display = 'none';
    czrItemTd.style.display = 'none';

    hlsjItemTh.style.display = 'table-cell';
    hlsjItemTd.style.display = 'table-cell';
    hlrItemTh.style.display = 'table-cell';
    hlrItemTd.style.display = 'table-cell';

    fksjItemTd.style.display = 'none';
    fksjItemTh.style.display = 'none';

    tableControlOne.style.display = 'none';
    tableControlTwo.style.display = 'none';
    tableControlThree.style.display = 'none';
    tableControlFour.style.display = 'block';
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