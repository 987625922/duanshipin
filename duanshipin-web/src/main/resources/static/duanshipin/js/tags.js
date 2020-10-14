//页码选择器
$('#page_select').hide();
const tagsOne = document.getElementById('tags-one');
const tagsTwo = document.getElementById('tags-two');
const tagsThree = document.getElementById('tags-three');
let selectClick = tagsOne;


function initView() {
    // 把页面所在左边的item设置为选中
    $('#left_item_one').css('backgroundColor', '#191d26');
    $('#left_item_one_a').css('color', '#fff');
    $('#item_one_one').css('borderLeft', '3px solid #44c9a8');
    $('#left_item_one_img').css('backgroundImage', "url('/duanshipin/img/video_content_h.png')");
}

function oneTagsClick() {
    btnCommon(selectClick);
    btnPre(tagsOne);
    selectClick = tagsOne;
}

function twoTagsClick() {
    btnCommon(selectClick);
    btnPre(tagsTwo);
    selectClick = tagsTwo;
}

function threeTagsClick() {
    btnCommon(selectClick);
    btnPre(tagsThree);
    selectClick = tagsThree;
}

//把view改成按下按钮的颜色
function btnPre(dom) {
    dom.style.border = '1px solid #44c9a8'
    dom.style.backgroundColor = '#44c9a8'
    dom.style.color = '#fff'
}

//把view改成普通颜色
function btnCommon(dom) {
    dom.style.border = '1px solid #dcdfe6';
    dom.style.backgroundColor = '#fff'
    dom.style.color = '#333'
}

// 返回选择的btn的下标
// 一级标签为 1
// 二级标签为 2
// 三级标签为 3
function getSelectIndex() {
    if (selectClick == tagsOne) {
        return 1
    } else if (selectClick == tagsTwo) {
        return 2
    } else if (selectClick == tagsThree) {
        return 3
    }
}

function showAddDialog() {
    if (getSelectIndex() == 1) {
        document.getElementById('dialog-content').innerText = '一级标签名称：'
    } else if (getSelectIndex() == 2) {
        document.getElementById('dialog-content').innerText = '二级标签名称：'
    } else if (getSelectIndex() == 3) {
        document.getElementById('dialog-content').innerText = '三级标签名称：'
    }
    $('#dialog_loginout_wrapper').show();
    dialogSelect();
}

function addDialogCancel() {
    $('#dialog_loginout_wrapper').hide();
}

function dialogSelect() {
    let htmlStr = '<option class="select_font" value="-1">根目录</option>';
    $('#dialog_select').html(htmlStr);
}
function createTags() {
    
}