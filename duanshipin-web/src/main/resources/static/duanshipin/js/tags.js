// 把页面所在左边的item设置为选中
document.getElementById('left_item_one').style.backgroundColor = '#191d26';
document.getElementById('left_item_one_a').style.color = '#fff';
document.getElementById('left_item_one_img').style.backgroundImage = "url('/duanshipin/img/video_content_h.png')";
document.getElementById('item_two_one').style.borderLeft = '3px solid #44c9a8';
//页码选择器
var pageSelect = document.getElementById('page_select');
pageSelect.style.display = 'none'
var tagsOne = document.getElementById('tags-one')
var tagsTwo = document.getElementById('tags-two')
var tagsThree = document.getElementById('tags-three')
var selectClick = tagsOne

// var tdTagsOne = document.getElementById('table-td-tags-one')
// var tdTagsTwo = document.getElementById('table-td-tags-two')
// var tdTagsThree = document.getElementById('table-td-tags-three')
// var thTagsOne = document.getElementById('table-th-tags-one')
// var thTagsTwo = document.getElementById('table-th-tags-two')
// var thTagsThree = document.getElementById('table-th-tags-three')

// tdTagsTwo.style.display = 'none'
// tdTagsThree.style.display = 'none'
// thTagsTwo.style.display = 'none'
// thTagsThree.style.display = 'none'
function oneTagsClick() {
    btnCommon(selectClick)
    btnPre(tagsOne)
    selectClick = tagsOne
    // tdTagsOne.style.display = 'block'
    // thTagsOne.style.display = 'block'
    // tdTagsTwo.style.display = 'none'
    // tdTagsThree.style.display = 'none'
    // thTagsTwo.style.display = 'none'
    // thTagsThree.style.display = 'none'
}
function twoTagsClick() {
    btnCommon(selectClick)
    btnPre(tagsTwo)
    selectClick = tagsTwo
    // tdTagsOne.style.display = 'block'
    // thTagsOne.style.display = 'block'
    // tdTagsTwo.style.display = 'block'
    // tdTagsThree.style.display = 'block'
    // thTagsTwo.style.display = 'none'
    // thTagsThree.style.display = 'none'
}
function threeTagsClick() {
    btnCommon(selectClick)
    btnPre(tagsThree)
    selectClick = tagsThree
    // tdTagsOne.style.display = 'block'
    // thTagsOne.style.display = 'block'
    // tdTagsTwo.style.display = 'block'
    // tdTagsThree.style.display = 'block'
    // thTagsTwo.style.display = 'block'
    // thTagsThree.style.display = 'block'
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