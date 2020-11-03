//请求的类型
var type = 1;
//显示的页面下标
var pageIndex = 1;
//每一页显示的条目
var pageSize = 10;
// 正在选中的按钮
var isSelectBtn;
//是否有下一页
var hasNextPage;
//是否有上一页
var hasPreviousPage;

// 上线的点击事件
let btnOnline = document.getElementById('online');
let btnDraf = document.getElementById('draf');
let btnRecycleBin = document.getElementById('recycle_bin');
let btnRecommend = document.getElementById('recommend');
// 各个按钮显示的controller
let drafcontroll = document.getElementById('controll_draf');
let onlineControll = document.getElementById('controll_online');
let recycleControll = document.getElementById('controll_recycle_bin');
let recommendContrll = document.getElementById('controll_recommend');

isSelectBtn = btnOnline;


//初始化
function init() {
    // 把页面所在左边的item设置为选中
    $('#left_item_one').css('backgroundColor', '#191d26');
    $('#left_item_one_a').css('color', '#fff');
    $('#item_one_one').css('borderLeft', '3px solid #44c9a8');
    $('#left_item_one_img').css('backgroundImage', "url('/duanshipin/img/video_content_h.png')");
    //运营池或者用户池的按钮
    $('#user_video_pool').css({'backgroundColor': '#fff', 'color': '#333', 'border': '1px solid #dcdfe6'});
    $('#operate_video_pool').css({'backgroundColor': '#44c9a8', 'color': '#fff', 'borderWidth': '0px'});

    // 一进入界面显示上线的按钮的controller
    $('#controll_online').show();

}

function btnToOnline() {
    btnCommon(isSelectBtn);
    btnPre(btnOnline);
    isSelectBtn = btnOnline;
    onlineControll.style.display = 'block';
    drafcontroll.style.display = 'none';
    recycleControll.style.display = 'none';
    recommendContrll.style.display = 'none';
    type = 1;
    getAlbumList();
}

//草稿的点击事件
function btnToDraf() {
    btnCommon(isSelectBtn);
    btnPre(btnDraf);
    isSelectBtn = btnDraf;
    drafcontroll.style.display = 'block';
    onlineControll.style.display = 'none';
    recycleControll.style.display = 'none';
    recommendContrll.style.display = 'none';
    type = 2;
    getAlbumList();
}

function btnToRecycleBin() {
    btnCommon(isSelectBtn);
    btnPre(btnRecycleBin);
    isSelectBtn = btnRecycleBin;
    drafcontroll.style.display = 'none';
    onlineControll.style.display = 'none';
    recycleControll.style.display = 'block';
    recommendContrll.style.display = 'none';
    type = 3;
    getAlbumList();
}

function btnToRecommend() {
    btnCommon(isSelectBtn);
    btnPre(btnRecommend);
    isSelectBtn = btnRecommend;
    drafcontroll.style.display = 'none';
    onlineControll.style.display = 'none';
    recycleControll.style.display = 'none';
    recommendContrll.style.display = 'block';
    type = 4;
    getAlbumList();
}

function toRecommend() {
    var selectStr = '';
    var selectGroup = $("input:checkbox[name='id-select-group']:checked").map(function (index, elem) {
        return $(elem).val();
    });
    for (let i = 0; i < selectGroup.length; i++) {
        if (i == 0) {
            selectStr += selectGroup[i];
        } else {
            selectStr = selectStr+',' + selectGroup[i];
        }
    }
    ajax({
        url: "/api/album/recommendForids",
        type: 'get',
        data: {
            ids: selectStr,
        },
        dataType: 'json',
        timeout: 10000,
        contentType: "application/json",
        success: function (data) {
            let json = JSON.parse(data);
            if (json.code == 200) {
                getAlbumList()
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

function toOnline() {
    var selectStr = '';
    var selectGroup = $("input:checkbox[name='id-select-group']:checked").map(function (index, elem) {
        return $(elem).val();
    });
    for (let i = 0; i < selectGroup.length; i++) {
        if (i == 0) {
            selectStr += selectGroup[i];
        } else {
            selectStr = selectStr+',' + selectGroup[i];
        }
    }
    ajax({
        url: "/api/album/onlineForids",
        type: 'get',
        data: {
            ids: selectStr,
        },
        dataType: 'json',
        timeout: 10000,
        contentType: "application/json",
        success: function (data) {
            let json = JSON.parse(data);
            if (json.code == 200) {
                getAlbumList()
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

function toRecycler() {
    var selectStr = '';
    var selectGroup = $("input:checkbox[name='id-select-group']:checked").map(function (index, elem) {
        return $(elem).val();
    });
    for (let i = 0; i < selectGroup.length; i++) {
        if (i == 0) {
            selectStr += selectGroup[i];
        } else {
            selectStr = selectStr+',' + selectGroup[i];
        }
    }
    ajax({
        url: "/api/album/recyclerForids",
        type: 'get',
        data: {
            ids: selectStr,
        },
        dataType: 'json',
        timeout: 10000,
        contentType: "application/json",
        success: function (data) {
            let json = JSON.parse(data);
            if (json.code == 200) {
                getAlbumList()
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
    var selectTitle;
    var selectId;
    if (type == 1) {
        selectTitle = $('#online-select-title').val()
        selectId = $('#online-select-id').val()
    } else if (type == 2) {
        selectTitle = $('#draf-select-title').val()
        selectId = $('#draf-select-id').val()
    } else if (type == 3) {
        selectTitle = $('#recycle-select-title').val()
        selectId = $('#recycle-select-id').val()
    } else if (type == 4) {
        selectTitle = $('#recommend-select-title').val()
        selectId = $('#recommend-select-id').val()
    }
    if (selectTitle == null && selectId == null) {
        Toast('搜索条件不能为空', 1000);
        return
    }
    pageIndex = 1;
    ajax({
        url: "/api/album/select",
        type: 'get',
        data: {
            title: selectTitle,
            id: selectId,
            pageIndex:pageIndex,
            pageSize:pageSize,
            type:type,
            isUserPublish:0
        },
        dataType: 'json',
        timeout: 10000,
        contentType: "application/json",
        success: function (data) {
            let json = JSON.parse(data);
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

//把view改成按下按钮的颜色
function btnPre(dom) {
    dom.style.borderWidth = '0px';
    dom.style.backgroundColor = '#44c9a8';
    dom.style.color = '#fff';
}

//把view改成普通颜色
function btnCommon(dom) {
    dom.style.border = '1px solid #dcdfe6';
    dom.style.backgroundColor = '#fff';
    dom.style.color = '#333';
}

function getAlbumList() {
    ajax({
        url: "/api/album/list",
        type: 'post',
        data: {
            pageIndex: pageIndex,
            pageSize: pageSize,
            type: type,
            isUserPublish:0
        },
        dataType: 'json',
        timeout: 10000,
        contentType: "application/json",
        success: function (data) {
            let json = JSON.parse(data);
            if (json.code === 200) {
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
    let htmlStr = '';
    htmlStr += '<table class="content_table"><thead><tr>' +
        '                        <th>' +
        '                            <input type="checkbox" name="" id="" class="table_checkbox"/>' +
        '                        </th>' +
        '                        <th>' +
        '                            <span class="table_th"> 专辑ID </span>' +
        '                        </th>' +
        '                        <th>' +
        '                            <span class="table_th"> 专辑标题 </span>' +
        '                        </th>' +
        '                        <th>' +
        '                            <span class="table_th"> 专辑简介 </span>' +
        '                        </th>' +
        '                        <th>' +
        '                            <span class="table_th" style="text-align: center"> 缩略图 </span>' +
        '                        </th>' +
        '                        <th>' +
        '                            <span class="table_th"> 总集/已更新 </span>' +
        '                        </th>' +
        '                        <th>' +
        '                            <span class="table_th"> 最后操作时间 </span>' +
        '                        </th>' +
        '                        <th>' +
        '                            <span class="table_th"> 操作人 </span>' +
        '                        </th>' +
        '                        <th  style="text-align: center">' +
        '                            <span class="table_th"> 操作 </span>' +
        '                        </th>' +
        '                    </tr></thead>';

    if (json.data.list.length > 6) {
        htmlStr += '<tbody style="display: block;height: 430px;overflow-y: scroll;">';
    } else if (json.data.list.length == 0) {
        htmlStr += '<tbody style="display:block;height: 5px;">';
    } else {
        htmlStr += '<tbody style="height: 5px;">';
    }
    for (let i = 0; i < json.data.list.length; i++) {
        let bean = json.data.list[i];
        let updateTime = new Date(Date.parse(bean.updateTime));
        let formatTime = dateFormat("YYYY-mm-dd HH:MM", updateTime);
        htmlStr += '<tr><td>' +
            ' <input type="checkbox" class="table_checkbox" name="id-select-group" value="' + bean.id + '"/>' +
            '                        </td>' +
            '                        <td>' +
            '                        <span class="table_id">' + bean.id + '</span>' +
            '                        </td>' +
            '                        <td>' +
            '                            <span class="table_title">' + bean.title + '</span>' +
            '                        </td>';
        if (bean.introduction != null) {
            htmlStr += '<td>' +
                '                        <span class="table_introducation">' + bean.introduction + '</span>' +
                '                        </td>'
        } else {
            htmlStr += '<td>' +
                '                        <span class="table_introducation">空</span>' +
                '                        </td>'
        }
        // if (bean.imgSrc == null) {
        //     htmlStr += '                        <td>' +
        //         '                            <img alt="" src="/duanshipin/img/default.jpg" class="table_content_img"/>' +
        //         '                        </td>'
        // } else {
            htmlStr += '                        <td>' +
                '                            <img alt="" src="/resource/image/' + bean.imgSrc + '" class="table_content_img"/>' +
                '                        </td>'
        // }
        htmlStr += '                        <td>' +
            '                            <span>' + bean.currentMun + '</span><span>/</span><span>' + bean.totalMun + '</span>' +
            '                        </td>' +
            '                        <td>' +
            '                            <span class="table_time">' + formatTime + '</span>' +
            '                        </td>' +
            '                        <td>' +
            '                            <span class="table_user">' + bean.updateAdminName + '</span>' +
            '                        </td>' +
            '                        <td>' +
            '                            <div class="table_content_controll">' +
            '                                    <a href="/views/content/publishAlbum">修改专辑</a>' +
            '                                    <a href="/views/content/albumVideoManager">视频管理</a>' +
            '                                    <a href="/views/content/albumpreview">专辑预览</a>' +
            '                            </div>' +
            '                        </td></tr>'
    }
    htmlStr += '</tbody></table>';
    $('#table-content').html(htmlStr);
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
                    liStr += '<li onclick="getSpecialAlbumList(type,' + (i + 1) + ',pageSize)">' + json.data.navigatepageNums[i] + '</li>'
                }
            }
        } else {
            if (json.data.prePage == 0 || json.data.prePage == 1 || json.data.prePage == 2) {
                for (var i = 0; i < json.data.navigatepageNums.length; i++) {
                    if (i <= 3) {
                        if (i == json.data.prePage) {
                            liStr += '<li style="background-color:#44c9a8;color: #fff;">' + json.data.navigatepageNums[i] + '</li>'
                        } else {
                            liStr += '<li onclick="getSpecialAlbumList(type,' + (i + 1) + ',pageSize)">' + json.data.navigatepageNums[i] + '</li>'
                        }
                    }
                }
                liStr += '<li>...</li>'
                liStr += '<li onclick="getSpecialAlbumList(type,' + json.data.pages + ',pageSize)">' + json.data.pages + '</li>'
            } else {
                liStr += '<li onclick="getSpecialAlbumList(type,1,pageSize)">1</li>'
                liStr += '<li>...</li>'
                if (json.data.pages - (json.data.prePage + 2) >= 3) {
                    liStr += '<li onclick="getSpecialAlbumList(type,' + json.data.prePage + ',pageSize)">' + json.data.prePage + '</li>'
                    liStr += '<li style="background-color:#44c9a8;color: #fff;">' + (json.data.prePage + 1) + '</li>'
                    liStr += '<li onclick="getSpecialAlbumList(type,' + (json.data.prePage + 2) + ',pageSize)">' + (json.data.prePage + 2) + '</li>'
                    liStr += '<li>...</li>'
                    liStr += '<li onclick="getSpecialAlbumList(type,' + (json.data.pages) + ',pageSize)">' + (json.data.pages) + '</li>'
                } else {
                    for (var i = 4; i >= 0; i--) {
                        if ((json.data.pages - i) == (json.data.prePage + 1)) {
                            liStr += '<li style="background-color:#44c9a8;color: #fff;">' +(json.data.prePage + 1) + '</li>'
                        } else {
                            liStr += '<li onclick="getSpecialAlbumList(type,' + (json.data.pages - i) + ',pageSize)">' + (json.data.pages - i) + '</li>'
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

function getSpecialAlbumList(_type, _pageIndex, _pageSize) {
    type = _type;
    pageIndex = _pageIndex;
    pageSize = _pageSize;
    getAlbumList();
}

function previousPage() {
    if (hasPreviousPage == true) {
        pageIndex = pageIndex - 1;
        getAlbumList();
    } else {
        Toast('没有上一页', 1000);
    }
}

function nextPage() {
    if (hasNextPage == true) {
        pageIndex = pageIndex + 1;
        getAlbumList();
    } else {
        Toast('没有下一页', 1000);
    }
}