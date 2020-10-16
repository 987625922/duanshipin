//请求的类型
var type = 1;
//显示的页面下标
var pageIndex = 1;
//每一页显示的条目
var pageSize = 10;
//是否有下一页
var hasNextPage;
//是否有上一页
var hasPreviousPage;


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
    $('#item_two_one').css('borderLeft', '3px solid #44c9a8');
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

function getTagList() {
    ajax({
        url: "/api/tag/listForType",
        type: 'get',
        data: {
            pageIndex: pageIndex,
            pageSize: pageSize,
            type: type
        },
        dataType: 'json',
        timeout: 10000,
        contentType: "application/json",
        success: function (data) {
            var json = JSON.parse(data);
            if (json.code == 200) {
                var htmlStr = ''
                htmlStr += '<table class="content_table"><thead><tr>\n' +
                    '                        <th>\n' +
                    '                            <span class="table_id table_th">标签ID</span>\n' +
                    '                        </th>\n' +
                    '                        <th id="table-th-tags-one">\n' +
                    '                            <span class="table_title table_th">标签名</span>\n' +
                    '                        </th>\n' +
                    // '                        <th id="table-th-tags-two">\n' +
                    // '                            <span class="table_title table_th">二级标签</span>\n' +
                    // '                        </th>\n' +
                    // '                        <th id="table-th-tags-three">\n' +
                    // '                            <span class="table_title table_th">三级标签</span>\n' +
                    // '                        </th>\n' +
                    '                        <th>\n' +
                    '                            <span class="table_time table_th">最后操作时间</span>\n' +
                    '                        </th>\n' +
                    '                        <th>\n' +
                    '                            <span class="table_user table_th">操作人</span>\n' +
                    '                        </th>\n' +
                    '                        <th>\n' +
                    '                            <span class="table_controll table_th">操作</span>\n' +
                    '                        </th>\n' +
                    '                    </tr></thead>';
                if (json.data.list.length > 6) {
                    htmlStr += '<tbody style="display: block;height: 430px;overflow-y: scroll;">';
                } else if (json.data.list.length == 0) {
                    htmlStr += '<tbody style="display:block;height: 5px;">';
                } else {
                    htmlStr += '<tbody style="height: 5px;">';
                }
                for (var i = 0; i < json.data.list.length; i++) {
                    let bean = json.data.list[i];
                    htmlStr += '<tr>\n' +
                        '                        <td>\n' +
                        '                            <span class="table_id">' + bean.id + '</span>\n' +
                        '                        </td>\n' +
                        '                        <td id="table-td-tags-one">\n' +
                        '                            <span class="table_title">' + bean.name + '</span>\n' +
                        '                        </td>\n' +
                        // '                        <td id="table-td-tags-two">\n' +
                        // '                            <span class="table_title">二级标签</span>\n' +
                        // '                        </td>\n' +
                        // '                        <td id="table-td-tags-three">\n' +
                        // '                            <span class="table_title">三级标签</span>\n' +
                        // '                        </td>\n' +
                        '                        <td>\n' +
                        '                            <span class="table_time"> 2018-11-28 14:01:19 </span>\n' +
                        '                        </td>\n' +
                        '                        <td>\n' +
                        '                            <span class="table_user"> xxx@yy-inc.cn </span>\n' +
                        '                        </td>\n' +
                        '                        <td>\n' +
                        '                            <div class="table_content_controll">\n' +
                        '                                <a href="#">删除</a>\n' +
                        '                            </div>\n' +
                        '                        </td>\n' +
                        '                    </tr>'
                }
                htmlStr += '</tbody></table>';
                $('#content-table').html(htmlStr)
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

function addTag() {
    ajax({
        url: "/api/tag/add",
        type: 'post',
        data: {
            name: '测试一级标签',
            parentTagId: '-1',
            type: '1'
        },
        dataType: 'json',
        timeout: 10000,
        contentType: "application/json",
        success: function (data) {
            var json = JSON.parse(data);
            if (json.code == 200) {
                addDialogCancel()
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