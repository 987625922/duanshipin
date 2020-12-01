var currentPage = 1
var pageSize = 10

function initView() {
// 把页面所在左边的item设置为选中
    document.getElementById('left_item_two').style.backgroundColor = '#191d26';
    document.getElementById('left_item_two_a').style.color = '#fff';
    document.getElementById('left_item_two_img').style.backgroundImage = "url('/duanshipin/img/per_p.png')";
    document.getElementById('item_one_one').style.borderLeft = '3px solid #44c9a8';
//页码选择器
    var pageSelect = document.getElementById('page_select');
    pageSelect.style.display = 'none'
}

function getAdmins() {
    ajax({
        url: "/api/admin/getAdminsByPage",
        type: 'get',
        data: {
            currentPage: currentPage,
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

function dealTable(json) {
    let htmlStr = '';
    htmlStr += '<table class="content_table"><thead><tr>' +
        '                        <th>' +
        '                            <input type="checkbox" name="" id="" class="table_checkbox"/>' +
        '                        </th>' +
        '                        <th>' +
        '                            <span class="table_th">用户ID</span>' +
        '                        </th>' +
        '                        <th>' +
        '                            <span class="table_th">用户昵称</span>' +
        '                        </th>' +
        '                        <th>' +
        '                            <span class="table_th">用户签名</span>' +
        '                        </th>' +
        '                        <th>' +
        '                            <span class="table_th" style="text-align: center">用户头像</span>' +
        '                        </th>' +
        '                        <th>' +
        '                            <span class="table_th">作品量</span>' +
        '                        </th>' +
        '                        <th>' +
        '                            <span class="table_th">粉丝量</span>' +
        '                        </th>' +
        '                        <th>' +
        '                            <span class="table_th">注册时间</span>' +
        '                        </th>' +
        '                        <th  style="text-align: center">' +
        '                            <span class="table_th">操作</span>' +
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
        let updateTime = new Date(Date.parse(bean.lastUpdateTime));
        let formatTime = dateFormat("YYYY-mm-dd HH:MM", updateTime);
        htmlStr += '<tr><td>' +
            ' <input type="checkbox" class="table_checkbox" name="id-select-group" value="' + bean.id + '"/>' +
            '                        </td>' +
            '                        <td>' +
            '                        <span class="table_id">' + bean.id + '</span>' +
            '                        </td>' +
            '                        <td>' +
            '                            <span class="table_title">' + bean.userName + '</span>' +
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
            '                            <span>' + bean.currentMun + '</span>' +
            '                        </td>' +
            '                        <td>' +
            '                            <span class="table_time">' + bean.updateAdminName + '</span>' +
            '                        </td>' +
            '                        <td>' +
            '                            <span class="table_user">' + formatTime + '</span>' +
            '                        </td>' +
            '                        <td>'
        htmlStr += '                            <div class="table_content_controll"><a href="/views/user/userManageInfo?id=' + bean.id + '">管理</a>' +
            '                                    <a href="/views/user/userVideoManage?id=' + bean.id + '">作品</a>' +
            '                            </div>'
        htmlStr += '                        </td></tr>'
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