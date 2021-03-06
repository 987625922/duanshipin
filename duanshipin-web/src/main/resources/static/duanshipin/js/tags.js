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
//dialog参数
var dialogPageIndex = 1;
var dialogPageSize = 10;
var dialogIsLoad = false;

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
    type = 1
    pageIndex = 1
    getTagList()
}

function twoTagsClick() {
    btnCommon(selectClick);
    btnPre(tagsTwo);
    selectClick = tagsTwo;
    type = 2
    pageIndex = 1
    getTagList()
}

function threeTagsClick() {
    btnCommon(selectClick);
    btnPre(tagsThree);
    selectClick = tagsThree;
    type = 3
    pageIndex = 1
    getTagList()
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

function getSpecialAlbumList(_pageIndex, _pageSize) {
    pageIndex = _pageIndex;
    pageSize = _pageSize;
    getTagList();
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
                dealTable(json)
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

function dealTable(json) {
    var htmlStr = ''
    htmlStr += '<table class="content_table"><thead><tr>\n' +
        '                        <th class="frist-item">\n' +
        '                            <span>标签ID</span>\n' +
        '                        </th>\n' +
        '                        <th id="table-th-tags-one">\n' +
        '                            <span class="table_th">标签名</span>\n' +
        '                        </th>\n';
    if (type == 2) {
        htmlStr += '                        <th>' +
            '                            <span class="table_th">一级标签</span>' +
            '                        </th>'
    }
    if (type == 3) {
        htmlStr += '                        <th>' +
            '                            <span class="table_th">二级标签</span>' +
            '                        </th>'
    }
    htmlStr += '                        <th>\n' +
        '                            <span class="table_th">最后操作时间</span>\n' +
        '                        </th>\n' +
        '                        <th>\n' +
        '                            <span class="table_th">操作人</span>\n' +
        '                        </th>\n' +
        '                        <th>\n' +
        '                            <span class="table_th">操作</span>\n' +
        '                        </th>\n' +
        '                    </tr></thead>';
    if (json.data.list.length > 6) {
        htmlStr += '<tbody style="display:block;height: 430px;overflow-y: scroll;">';
    } else if (json.data.list.length == 0) {
        htmlStr += '<tbody style="display:block;height: 5px;">';
    } else {
        htmlStr += '<tbody style="height: 5px;">';
    }
    for (var i = 0; i < json.data.list.length; i++) {
        let bean = json.data.list[i];
        let updateTime = new Date(Date.parse(bean.updateTime));
        let formatTime = dateFormat("YYYY-mm-dd HH:MM", updateTime);
        htmlStr += '<tr>' +
            '                        <td class="frist-item">' +
            '                            <span>' + bean.id + '</span>' +
            '                        </td>' +
            '                        <td>' +
            '                            <span  class="table_th">' + bean.name + '</span>' +
            '                        </td>';
        if (type == 2) {
            htmlStr += '                        <td>' +
                '                            <span class="table_th">' + bean.parentTagName + '</span>' +
                '                        </td>'
        }
        if (type == 3) {
            htmlStr += '                        <td>' +
                '                            <span class="table_th">' + bean.parentTagName + '</span>' +
                '                        </td>'
        }
        // '                        <td id="table-td-tags-three">\n' +
        // '                            <span class="table_title">三级标签</span>\n' +
        // '                        </td>\n' +
        htmlStr += '                        <td>' +
            '                            <span  class="table_th">' + formatTime + '</span>' +
            '                        </td>' +
            '                        <td>' +
            '                            <span  class="table_th">' + bean.updateAdminName + '</span>' +
            '                        </td>' +
            '                        <td>' +
            '                            <div>' +
            '                                <span style="cursor: pointer;" onclick="delectItem(' + bean.id + ')">删除</span>' +
            '                            </div>' +
            '                        </td>' +
            '                    </tr>'
    }
    htmlStr += '</tbody></table>';
    $('#table-content').html(htmlStr)
    hasNextPage = json.data.hasNextPage;
    hasPreviousPage = json.data.hasPreviousPage;
    if (json.data.pages > 1) {
        $('#page_select').show();
        $("#page-total-mun").html(json.data.total);
        $("#page-size").html(pageSize);
        var liStr = '';
        if (json.data.pages <= 7) {
            for (var i = 0; i < json.data.navigatepageNums.length; i++) {
                if (i == json.data.prePage) {
                    liStr += '<li style="background-color:#44c9a8;color: #fff;">' + json.data.navigatepageNums[i] + '</li>'
                } else {
                    liStr += '<li onclick="getSpecialAlbumList(' + (i + 1) + ',pageSize)">' + json.data.navigatepageNums[i] + '</li>'
                }
            }
        } else {
            if (json.data.prePage == 0 || json.data.prePage == 1 || json.data.prePage == 2) {
                for (var i = 0; i < json.data.navigatepageNums.length; i++) {
                    if (i <= 3) {
                        if (i == json.data.prePage) {
                            liStr += '<li style="background-color:#44c9a8;color: #fff;">' + json.data.navigatepageNums[i] + '</li>'
                        } else {
                            liStr += '<li onclick="getSpecialAlbumList(' + (i + 1) + ',pageSize)">' + json.data.navigatepageNums[i] + '</li>'
                        }
                    }
                }
                liStr += '<li>...</li>'
                liStr += '<li onclick="getSpecialAlbumList(' + json.data.pages + ',pageSize)">' + json.data.pages + '</li>'
            } else {
                liStr += '<li onclick="getSpecialAlbumList(1,pageSize)">1</li>'
                liStr += '<li>...</li>'
                if (json.data.pages - (json.data.prePage + 2) >= 3) {
                    liStr += '<li onclick="getSpecialAlbumList(' + json.data.prePage + ',pageSize)">' + json.data.prePage + '</li>'
                    liStr += '<li style="background-color:#44c9a8;color: #fff;">' + (json.data.prePage + 1) + '</li>'
                    liStr += '<li onclick="getSpecialAlbumList(' + (json.data.prePage + 2) + ',pageSize)">' + (json.data.prePage + 2) + '</li>'
                    liStr += '<li>...</li>'
                    liStr += '<li onclick="getSpecialAlbumList(' + (json.data.pages) + ',pageSize)">' + (json.data.pages) + '</li>'
                } else {
                    for (var i = 4; i >= 0; i--) {
                        if ((json.data.pages - i) == (json.data.prePage + 1)) {
                            liStr += '<li style="background-color:#44c9a8;color: #fff;">' + (json.data.prePage + 1) + '</li>'
                        } else {
                            liStr += '<li onclick="getSpecialAlbumList(' + (json.data.pages - i) + ',pageSize)">' + (json.data.pages - i) + '</li>'
                        }
                    }
                }
            }
        }
        $('#page_select_ul').html(liStr);
    } else {
        $('#page_select').hide();
    }
}

function addTag() {
    var _type = type
    if ($('#select-item_value').attr('value') == "-1") {
        _type = 1
    }
    ajax({
        url: "/api/tag/add",
        type: 'post',
        data: {
            name: $('#input-intro').val(),
            parentTagId: $('#select-item_value').attr('value'),
            type: _type
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

function select() {
    pageIndex = 1
    ajax({
        url: "/api/tag/select",
        type: 'post',
        data: {
            pageIndex: pageIndex,
            pageSize: pageSize,
            type: type,
            name: $('#select-name').val()
        },
        dataType: 'json',
        timeout: 10000,
        contentType: "application/json",
        success: function (data) {
            var json = JSON.parse(data);
            if (json.code == 200) {
                dealTable(json)
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

function delectItem(id) {
    ajax({
        url: "/api/tag/delete",
        type: 'get',
        data: {
            id: id
        },
        dataType: 'json',
        timeout: 10000,
        contentType: "application/json",
        success: function (data) {
            var json = JSON.parse(data);
            if (json.code == 200) {
                getTagList()
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
    dialogIsLoad = false;
    $('#dialog_loginout_wrapper').show();
}

function addDialogCancel() {
    $('#dialog_loginout_wrapper').hide();
    getTagList()
}

function dialogGetList() {
    if (type == 1) {
        return
    }
    if (dialogIsLoad) {
        $('#select_list').show();
        return
    }
    dialogIsLoad = true;
    dialogPageIndex = 1;
    ajax({
        url: "/api/tag/listForType",
        type: 'get',
        data: {
            pageIndex: dialogPageIndex,
            pageSize: dialogPageSize,
            type: type - 1
        },
        dataType: 'json',
        timeout: 10000,
        contentType: "application/json",
        success: function (data) {
            var json = JSON.parse(data);
            if (json.code == 200) {
                $('#select_list').show();
                if (dialogPageIndex == 1) {
                    let htmlStr = '';
                    for (let i = 0; i < json.data.list.length; i++) {
                        htmlStr += '<div class="select_font" value="'
                            + json.data.list[i].id + '" onclick="selectItemOnclick(this)">' + json.data.list[i].name + '</div>'
                    }
                    $('#select_item').html(htmlStr);
                } else {
                    let htmlStr = '';
                    for (let i = 0; i < json.data.list.length; i++) {
                        htmlStr += '<div class="select_font" value="'
                            + json.data.list[i].id + '" onclick="selectItemOnclick(this)">' + json.data.list[i].name + '</div>'
                    }
                    $('#select_item').append(htmlStr);
                }
                dialogPageIndex++;
                if (json.data.list.length >= pageSize) {
                    dropload();
                } else {
                    $('#select_list').css("overflow-y", "hidden")
                }
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

function dropload() {
    // dropload
    var dropload = $('.inner').dropload({
        domUp: {
            domClass: 'dropload-up',
            domRefresh: '<div class="dropload-refresh">↓下拉刷新</div>',
            domUpdate: '<div class="dropload-update">↑释放更新</div>',
            domLoad: '<div class="dropload-load"><span class="loading"></span>加载中...</div>'
        },
        domDown: {
            domClass: 'dropload-down',
            domRefresh: '<div class="dropload-refresh">↑上拉加载更多</div>',
            domLoad: '<div class="dropload-load"><span class="loading"></span>加载中...</div>',
            domNoData: '<div class="dropload-noData">暂无数据</div>'
        },
        loadUpFn: function (me) {
            dropload.resetload()
        },
        loadDownFn: function (me) {
            console.log(dialogPageIndex)
            ajax({
                url: "/api/tag/listForType",
                type: 'get',
                data: {
                    pageIndex: dialogPageIndex,
                    pageSize: dialogPageSize,
                    type: type
                },
                dataType: 'json',
                timeout: 10000,
                contentType: "application/json",
                success: function (data) {
                    var json = JSON.parse(data);
                    if (json.code == 200) {
                        $('#select_list').show();
                        dropload.resetload();
                        if (!json.data.hasNextPage) {
                            // 锁定
                            dropload.lock();
                            $('.dropload-down').hide();
                        }
                        if (dialogPageIndex == 1) {
                            let htmlStr = '<div value="-1" onclick="selectItemOnclick(this)">根目录</div>';
                            for (let i = 0; i < json.data.list.length; i++) {
                                htmlStr += '<div class="select_font" value="'
                                    + json.data.list[i].id + '" onclick="selectItemOnclick(this)">' + json.data.list[i].name + '</div>'
                            }
                            $('#select_item').html(htmlStr);
                        } else {
                            let htmlStr = '';
                            for (let i = 0; i < json.data.list.length; i++) {
                                htmlStr += '<div class="select_font" value="'
                                    + json.data.list[i].id + '" onclick="selectItemOnclick(this)">' + json.data.list[i].name + '</div>'
                            }
                            $('#select_item').append(htmlStr);
                        }
                        dialogPageIndex++;
                    } else {
                        console.log(json.msg);
                        Toast(json.msg, 1000);
                        dropload.resetload()
                    }
                },
                //异常处理
                error: function (e) {
                    console.log(e);
                    dropload.resetload()
                }
            })
        }
    });
}


function selectItemOnclick(dom) {
    $('#select_list').hide();
    $('#select-item_value').html(dom.innerHTML).attr('value', dom.getAttribute("value"));
}

function dialogSelect() {

}

function createTags() {

}