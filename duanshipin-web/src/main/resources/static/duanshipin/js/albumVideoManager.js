var pageIndex = 1
var pageSize = 10
var type = 1
var albumId = 1

function getVideoList() {
    albumId = getUrlParam("id")
    ajax({
        url: "/api/video/getListByAlbumId",
        type: 'post',
        data: {
            currentPage: pageIndex,
            pageSize: pageSize,
            ablumId: albumId
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
        '                            <span class="table_th">视频ID</span>' +
        '                        </th>' +
        '                        <th>' +
        '                            <span class="table_th">视频标题</span>' +
        '                        </th>' +
        '                        <th>' +
        '                            <span class="table_th">视频简介</span>' +
        '                        </th>' +
        '                        <th>' +
        '                            <span class="table_th" style="text-align: center">缩略图</span>' +
        '                        </th>' +
        '                        <th>' +
        '                            <span class="table_th">基础数据</span>' +
        '                        </th>' +
        '                        <th>' +
        '                            <span class="table_th">最后操作时间</span>' +
        '                        </th>' +
        '                        <th>' +
        '                            <span class="table_th">操作人</span>' +
        '                        </th>' +
        '                    </tr></thead>';

    if (json.data.list.length > 6) {
        htmlStr += '<tbody style="display: block;height: 430px;' +
            'overflow-y: scroll;">';
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
        if (bean.imgSrc == null) {
            htmlStr += '                        <td>' +
                '                            <img alt="" src="/duanshipin/img/default.jpg" class="table_content_img"/>' +
                '                        </td>'
        } else {
            htmlStr += '                        <td>' +
                '                            <img alt="" src="' + bean.imgSrc + '" class="table_content_img"/>' +
                '                        </td>'
        }
        htmlStr += '                        <td>' +
            '                            <span>播放量：' + bean.numberOfPlays + '</span><br/>' +
            '<span>点赞量：' + bean.numberOfGoods + '</span>' +
            '                        </td>' +
            '                        <td>' +
            '                            <span class="table_time">' + formatTime + '</span>' +
            '                        </td>' +
            '                        <td>' +
            '                            <span class="table_user">' + bean.admin.userName + '</span>' +
            '                        </td>' +
            '</tr>'
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
                            liStr += '<li style="background-color:#44c9a8;color: #fff;">' + (json.data.prePage + 1) + '</li>'
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
    pageIndex = _pageIndex;
    pageSize = _pageSize;
    getVideoList();
}

function getUrlParam(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
    if (r != null) return unescape(r[2]);
    return null; //返回参数值
}

function toDelete() {
    var selectStr = '';
    var selectGroup = $("input:checkbox[name='id-select-group']:checked")
        .map(function (index, elem) {
            return $(elem).val();
        });
    for (let i = 0; i < selectGroup.length; i++) {
        if (i == 0) {
            selectStr += selectGroup[i];
        } else {
            selectStr = selectStr + ',' + selectGroup[i];
        }
    }
    ajax({
        url: "/api/video/deleteByAlbumAndVideoIds",
        type: 'get',
        data: {
            videoIds: selectStr,
            albumId: albumId
        },
        dataType: 'json',
        timeout: 10000,
        contentType: "application/json",
        success: function (data) {
            let json = JSON.parse(data);
            if (json.code == 200) {
                getVideoList()
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
    pageIndex = 1;
    ajax({
        url: "/api/video/selectForPageByalbumId",
        type: 'get',
        data: {
            title: $('#select-title').val(),
            albumId: albumId,
            videoId: $('#select-id').val(),
            currentPage: pageIndex,
            pageSize: pageSize
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

function addDialogShow() {
    $("#dialog_loginout_wrapper").show()
    getDialogVideoList()
}

var dialogPageIndex = 1
var dialogPageSize = 5

function getDialogVideoList() {
    ajax({
        url: "/api/video/list",
        type: 'post',
        data: {
            currentPage: dialogPageIndex,
            pageSize: dialogPageSize
        },
        dataType: 'json',
        timeout: 10000,
        contentType: "application/json",
        success: function (data) {
            let json = JSON.parse(data);
            if (json.code === 200) {
                dealDialog(json)
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

function dealDialog(json) {
    let htmlStr = '';
    htmlStr += '<table class="content_table"><thead><tr>';
    htmlStr += '                          <th>  <span class="table_th">视频ID</span>' +
        '                        </th>' +
        '                        <th>' +
        '                            <span class="table_th">视频标题</span>' +
        '                        </th><th>' +
        '                            <span class="table_th">操作</span>' +
        '                        </th>';
    htmlStr += '</tr></thead>'
    for (var i = 0; i < json.data.list.length; i++) {
        var isShowAdd = true
        htmlStr += '<tr>'
        htmlStr += '<td>'
        htmlStr += json.data.list[i].id
        htmlStr += '</td>'
        htmlStr += '<td>'
        htmlStr += json.data.list[i].title
        htmlStr += '</td>'
        if (isShowAdd) {
            htmlStr += '<td>'
            htmlStr += '<span>添加</span>'
            htmlStr += '</td>'
        } else {
            htmlStr += '<td>'
            htmlStr += '<span>移除</span>'
            htmlStr += '</td>'
        }
        htmlStr += '</tr>'
    }
    htmlStr += '</table>'
    $('#dialog-content').html(htmlStr);

    if (json.data.pages > 1) {
        $('#dialog_page_select').show();
        var liStr = '';
        if (json.data.pages <= 7) {
            for (var i = 0; i < json.data.navigatepageNums.length; i++) {
                if (i == json.data.prePage) {
                    liStr += '<li style="background-color:#44c9a8;color: #fff;">' + json.data.navigatepageNums[i] + '</li>'
                } else {
                    liStr += '<li onclick="getSpaceDialogVideoList(type,' + (i + 1) + ',pageSize)">' + json.data.navigatepageNums[i] + '</li>'
                }
            }
        } else {
            if (json.data.prePage == 0 || json.data.prePage == 1 || json.data.prePage == 2) {
                for (var i = 0; i < json.data.navigatepageNums.length; i++) {
                    if (i <= 3) {
                        if (i == json.data.prePage) {
                            liStr += '<li style="background-color:#44c9a8;color: #fff;">' + json.data.navigatepageNums[i] + '</li>'
                        } else {
                            liStr += '<li onclick="getSpaceDialogVideoList(type,' + (i + 1) + ',pageSize)">' + json.data.navigatepageNums[i] + '</li>'
                        }
                    }
                }
                liStr += '<li>...</li>'
                liStr += '<li onclick="getSpaceDialogVideoList(type,' + json.data.pages + ',pageSize)">' + json.data.pages + '</li>'
            } else {
                liStr += '<li onclick="getSpaceDialogVideoList(type,1,pageSize)">1</li>'
                liStr += '<li>...</li>'
                if (json.data.pages - (json.data.prePage + 2) >= 3) {
                    liStr += '<li onclick="getSpaceDialogVideoList(type,' + json.data.prePage + ',pageSize)">' + json.data.prePage + '</li>'
                    liStr += '<li style="background-color:#44c9a8;color: #fff;">' + (json.data.prePage + 1) + '</li>'
                    liStr += '<li onclick="getSpaceDialogVideoList(type,' + (json.data.prePage + 2) + ',pageSize)">' + (json.data.prePage + 2) + '</li>'
                    liStr += '<li>...</li>'
                    liStr += '<li onclick="getSpaceDialogVideoList(type,' + (json.data.pages) + ',pageSize)">' + (json.data.pages) + '</li>'
                } else {
                    for (var i = 4; i >= 0; i--) {
                        if ((json.data.pages - i) == (json.data.prePage + 1)) {
                            liStr += '<li style="background-color:#44c9a8;color: #fff;">' + (json.data.prePage + 1) + '</li>'
                        } else {
                            liStr += '<li onclick="getSpaceDialogVideoList(type,' + (json.data.pages - i) + ',pageSize)">' + (json.data.pages - i) + '</li>'
                        }
                    }
                }
            }
        }
        $('#dialog_page_select_ul').html(liStr);
    } else {
        $('#dialog_page_select').hide();
    }
}

function getSpaceDialogVideoList(_type, _pageIndex, _pageSize) {
    dialogPageIndex = _pageIndex
    getDialogVideoList()
}