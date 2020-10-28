var oneTagPageIndex = 1
var oneTagPageSize = 10
var dialogIsLoad = false;
var twoDialogIsLoad = false
var twoTagPageIndex = 1

function changepic(obj) {
    //console.log(obj.files[0]);//这里可以获取上传文件的name
    var newsrc = getObjectURL(obj.files[0]);
    document.getElementById('show').src = newsrc;
}

//建立一個可存取到該file的url
function getObjectURL(file) {
    var url = null;
    // 下面函数执行的效果是一样的，只是需要针对不同的浏览器执行不同的 js 函数而已
    if (window.createObjectURL != undefined) { // basic
        url = window.createObjectURL(file);
    } else if (window.URL != undefined) { // mozilla(firefox)
        url = window.URL.createObjectURL(file);
    } else if (window.webkitURL != undefined) { // webkit or chrome
        url = window.webkitURL.createObjectURL(file);
    }
    return url;
}

function publishAlbum() {
    var formData = new FormData();
    formData.append("title", $("#form-title").val());
    formData.append("cover", $("#img-file")[0].files[0]);
    formData.append("totalMun", $("#total-mun").val());
    formData.append("director", $("#director").val());
    formData.append("performer", $("#director").val());
    formData.append("robotId", $("#robotId").val());
    formData.append("isComplete", $("input[name='isEnd']:checked").val());
    formData.append("type", $("input[name='isState']:checked").val());
    formData.append("isBlockSearch", $("input[name='isSelect']:checked").val());
    $.ajax({
        url: '/api/album/add',
        type: 'post',
        data: formData,
        processData: false,
        contentType: false,
        success: function (msg) {
            console.log(msg)
        }
    });
}

function dialogGetList() {
    $("#dialog-wrapper").show()
    if (dialogIsLoad) {
        $('#one-tag-dialog').show();
        return
    }
    dialogIsLoad = true;
    oneTagPageIndex = 1;
    ajax({
        url: "/api/tag/listForType",
        type: 'get',
        data: {
            pageIndex: oneTagPageIndex,
            pageSize: oneTagPageSize,
            type: 1
        },
        dataType: 'json',
        timeout: 10000,
        contentType: "application/json",
        success: function (data) {
            var json = JSON.parse(data);
            if (json.code == 200) {
                $('#one-tag-dialog').show();
                if (oneTagPageIndex == 1) {
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
                oneTagPageIndex++;
                if (json.data.list.length >= oneTagPageSize) {
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
            console.log(oneTagPageIndex)
            ajax({
                url: "/api/tag/listForType",
                type: 'get',
                data: {
                    pageIndex: oneTagPageIndex,
                    pageSize: oneTagPageSize,
                    type: 1
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
                        if (oneTagPageIndex == 1) {
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
                        oneTagPageIndex++;
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
    $('#one-tag-dialog').hide();
    $('#dialog-wrapper').hide();
    $('#div-select-value').html(dom.innerHTML).attr('value', dom.getAttribute("value"));
}

function selectTwoTagItemOnclick(dom) {
    $('#two-tag-dialog').hide();
    $('#dialog-wrapper').hide();
    $('#div-select-value-two-tag').html(dom.innerHTML).attr('value', dom.getAttribute("value"));
}

function getTwoTagList() {
    $("#dialog-wrapper").show()
    if (twoDialogIsLoad) {
        $('#two-tag-dialog').show();
        return
    }
    twoDialogIsLoad = true;
    twoTagPageIndex = 1;
    ajax({
        url: "/api/tag/selectByParentId",
        type: 'get',
        data: {
            pageIndex: twoTagPageIndex,
            pageSize: oneTagPageSize,
            type: 2,
            parentId: $('#div-select-value').attr('value')
        },
        dataType: 'json',
        timeout: 10000,
        contentType: "application/json",
        success: function (data) {
            var json = JSON.parse(data);
            if (json.code == 200) {
                $('#two-tag-dialog').show();
                if (twoTagPageIndex == 1) {
                    let htmlStr = '';
                    for (let i = 0; i < json.data.list.length; i++) {
                        htmlStr += '<div class="select_font" value="'
                            + json.data.list[i].id + '" onclick="selectTwoTagItemOnclick(this)">' + json.data.list[i].name + '</div>'
                    }
                    $('#two-select_item').html(htmlStr);
                } else {
                    let htmlStr = '';
                    for (let i = 0; i < json.data.list.length; i++) {
                        htmlStr += '<div class="select_font" value="'
                            + json.data.list[i].id + '" onclick="selectTwoTagItemOnclick(this)">' + json.data.list[i].name + '</div>'
                    }
                    $('#two-select_item').append(htmlStr);
                }
                twoTagPageIndex++;
                if (json.data.list.length >= oneTagPageSize) {
                    twoDropload()
                } else {
                    $('#two-select_list').css("overflow-y", "hidden")
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

function hideDialog() {
    $('#one-tag-dialog').hide();
    $('#dialog-wrapper').hide();
}

function twoDropload() {
    // dropload
    var dropload = $('.two-inner').dropload({
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
        loadUpFn: function () {
            dropload.resetload()
        },
        loadDownFn: function () {
            console.log(oneTagPageIndex)
            ajax({
                url: "/api/tag/selectByParentId",
                type: 'get',
                data: {
                    pageIndex: twoTagPageIndex,
                    pageSize: oneTagPageSize,
                    type: 2,
                    parentId: $('#div-select-value').attr('value')
                },
                dataType: 'json',
                timeout: 10000,
                contentType: "application/json",
                success: function (data) {
                    var json = JSON.parse(data);
                    if (json.code == 200) {
                        $('#two-select_list').show();
                        dropload.resetload();
                        if (!json.data.hasNextPage) {
                            // 锁定
                            dropload.lock();
                            $('.dropload-down').hide();
                        }
                        if (twoTagPageIndex == 1) {
                            let htmlStr = '<div value="-1" onclick="selectTwoTagItemOnclick(this)">根目录</div>';
                            for (let i = 0; i < json.data.list.length; i++) {
                                htmlStr += '<div class="select_font" value="'
                                    + json.data.list[i].id + '" onclick="selectTwoTagItemOnclick(this)">' + json.data.list[i].name + '</div>'
                            }
                            $('#two-select_item').html(htmlStr);
                        } else {
                            let htmlStr = '';
                            for (let i = 0; i < json.data.list.length; i++) {
                                htmlStr += '<div class="select_font" value="'
                                    + json.data.list[i].id + '" onclick="selectItemOnclick(this)">' + json.data.list[i].name + '</div>'
                            }
                            $('#two-select_item').append(htmlStr);
                        }
                        oneTagPageIndex++;
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