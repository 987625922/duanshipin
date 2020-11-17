var oneTagPageIndex = 1
var oneTagPageSize = 10
var dialogIsLoad = false;
var twoDialogIsLoad = false
var oneTagIndex
var twoTagPageIndex = 1
var twoSelectIndexs = new Array()
var twoSelectParentIds = ""

var threeDialogIsLoad = false;
var threeTagPageIndex = 1;
var threeSelectIndexs = new Array()
var threeSelectParentIds = ""

var robotPageIndex = 1
var robotDialogIsLoad = false;
//需要更新的id
var id

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
    var cover = $("#img-file")[0].files[0]
    formData.append("id", id);
    formData.append("title", $("#form-title").val());
    formData.append("introduction", $("#input-intro").val());
    if (cover != undefined) {
        formData.append("cover", cover);
    }
    formData.append("totalMun", $("#total-mun").val());
    formData.append("director", $("#director").val());
    formData.append("performer", $("#director").val());
    formData.append("isComplete", $("input[name='isEnd']:checked").val());
    formData.append("isBlockSearch", $("input[name='isSelect']:checked").val());
    formData.append("oneClassTagId", $('#div-select-value').attr('value'))
    formData.append("twoClassTagIds", twoSelectParentIds);
    formData.append("threeClassTagIds", threeSelectParentIds);
    formData.append("publishAdminId", $('#robotId').attr('name'))
    $.ajax({
        url: '/api/album/update',
        type: 'post',
        data: formData,
        processData: false,
        contentType: false,
        success: function (msg) {
            window.history.back(-1);
        }
    });
}

function robotBeSelect(dom) {
    $('#robot-tag-dialog').hide();
    $('#dialog-wrapper').hide();
    $('#robotId').attr('value', dom.innerHTML).attr('name', dom.getAttribute("value"));
}

function getRobotAdminList() {
    $("#dialog-wrapper").show()
    if (robotDialogIsLoad) {
        $('#robot-tag-dialog').show();
        return
    }
    robotDialogIsLoad = true
    robotPageIndex = 1
    ajax({
        url: "/api/admin/getByIsRobot",
        type: 'get',
        data: {
            pageIndex: robotPageIndex,
            pageSize: oneTagPageSize,
            isRobot: 1
        },
        dataType: 'json',
        timeout: 10000,
        contentType: "application/json",
        success: function (data) {
            var json = JSON.parse(data);
            if (json.code == 200) {
                $('#robot-tag-dialog').show();
                if (robotPageIndex == 1) {
                    let htmlStr = '';
                    for (let i = 0; i < json.data.list.length; i++) {
                        htmlStr += '<div class="select_font" value="'
                            + json.data.list[i].id + '" onclick="robotBeSelect(this)">' + json.data.list[i].userName + '</div>'
                    }
                    $('#robot-select_item').html(htmlStr);
                } else {
                    let htmlStr = '';
                    for (let i = 0; i < json.data.list.length; i++) {
                        htmlStr += '<div class="select_font" value="'
                            + json.data.list[i].id + '" onclick="robotBeSelect(this)">' + json.data.list[i].userName + '</div>'
                    }
                    $('#robot-select_item').append(htmlStr);
                }
                robotPageIndex++;
                if (json.data.list.length >= oneTagPageSize) {
                    robotDropload();
                } else {
                    $('#robot-select_item').css("overflow-y", "hidden")
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

function robotDropload() {
    // dropload
    var dropload = $('.robot-inner').dropload({
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
                url: "/api/admin/getByIsRobot",
                type: 'get',
                data: {
                    pageIndex: robotPageIndex,
                    pageSize: oneTagPageSize,
                    isRobot: 1
                },
                dataType: 'json',
                timeout: 10000,
                contentType: "application/json",
                success: function (data) {
                    var json = JSON.parse(data);
                    if (json.code == 200) {
                        $('#robot-select_list').show();
                        if (!json.data.hasNextPage) {
                            // 锁定
                            dropload.noData();
                            dropload.lock();
                            $('.dropload-down').hide();
                        }
                        if (robotPageIndex == 1) {
                            let htmlStr = '';
                            for (let i = 0; i < json.data.list.length; i++) {
                                htmlStr += '<div class="select_font" value="'
                                    + json.data.list[i].id + '" onclick="robotBeSelect(this)">' + json.data.list[i].userName + '</div>'
                            }
                            $('#robot-select_item').html(htmlStr);
                        } else {
                            let htmlStr = '';
                            for (let i = 0; i < json.data.list.length; i++) {
                                htmlStr += '<div class="select_font" value="'
                                    + json.data.list[i].id + '" onclick="robotBeSelect(this)">' + json.data.list[i].userName + '</div>'
                            }
                            $('#robot-select_item').append(htmlStr);
                        }
                        robotPageIndex++;
                        dropload.resetload()
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
                let htmlStr = '';
                for (let i = 0; i < json.data.list.length; i++) {
                    if (json.data.list[i].id == oneTagIndex) {
                        htmlStr += '<div class="select_font" value="'
                            + json.data.list[i].id + '" onclick="selectItemOnclick(this)" style="color: #44c9a8;">' + json.data.list[i].name + '</div>'
                    } else {
                        htmlStr += '<div class="select_font" value="'
                            + json.data.list[i].id + '" onclick="selectItemOnclick(this)">' + json.data.list[i].name + '</div>'
                    }
                }
                if (oneTagPageIndex == 1) {
                    $('#select_item').html(htmlStr);
                } else {
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
                        if (!json.data.hasNextPage) {
                            // 锁定
                            dropload.noData();
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
                                if (json.data.list[i].id == oneTagIndex) {
                                    htmlStr += '<div class="select_font" value="'
                                        + json.data.list[i].id + '" onclick="selectItemOnclick(this)" style="color: #44c9a8;">' + json.data.list[i].name + '</div>'
                                } else {
                                    htmlStr += '<div class="select_font" value="'
                                        + json.data.list[i].id + '" onclick="selectItemOnclick(this)">' + json.data.list[i].name + '</div>'
                                }
                            }
                            $('#select_item').append(htmlStr);
                        }
                        oneTagPageIndex++;
                        dropload.resetload()
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
    dom.style.color = "#44c9a8"
}

function enterTwoTag() {
    $('#dialog-wrapper').hide();
    $('#two-tag-dialog').hide();
    var str = ""
    for (var i = 0; i < twoSelectIndexs.length; i++) {
        console.log(twoSelectIndexs[i])
        if (i == 0) {
            str += twoSelectIndexs[i].name
            twoSelectParentIds += twoSelectIndexs[i].id
        } else {
            str += " / " + twoSelectIndexs[i].name
            twoSelectParentIds += "," + twoSelectIndexs[i].id
        }
    }
    $('#div-select-value-two-tag').html(str);
}

function selectTwoTagItemOnclick(dom) {
    for (var i in twoSelectIndexs) {
        if (twoSelectIndexs[i].id == dom.getAttribute("value")) {
            const index = twoSelectIndexs.indexOf(twoSelectIndexs[i])
            twoSelectIndexs.splice(index, 1)
            dom.style.color = "#606266"
            console.log(twoSelectIndexs + "  " + dom.getAttribute("value"))
            return
        }
    }
    var tagBean = createTwoTag(dom.getAttribute("value"), dom.innerHTML);
    twoSelectIndexs.push(tagBean)
    console.log(twoSelectIndexs + "  " + dom.getAttribute("value"))
    dom.style.color = "#44c9a8"
    // $('#two-tag-dialog').hide();
    // $('#dialog-wrapper').hide();
    // $('#div-select-value-two-tag').html(dom.innerHTML).attr('value', dom.getAttribute("value"));
}

function selectThreeTagItemOnclick(dom) {
    for (var i in threeSelectIndexs) {
        if (threeSelectIndexs[i].id == dom.getAttribute("value")) {
            const index = threeSelectIndexs.indexOf(threeSelectIndexs[i])
            threeSelectIndexs.splice(index, 1)
            dom.style.color = "#606266"
            console.log(threeSelectIndexs + "  " + dom.getAttribute("value"))
            return
        }
    }
    var tagBean = createTwoTag(dom.getAttribute("value"), dom.innerHTML);
    threeSelectIndexs.push(tagBean)
    console.log(threeSelectIndexs + "  " + dom.getAttribute("value"))
    dom.style.color = "#44c9a8"
}

function enterThreeTag() {
    $('#dialog-wrapper').hide();
    $('#three-tag-dialog').hide();
    var str = ""
    threeSelectParentIds = ""
    for (var i = 0; i < threeSelectIndexs.length; i++) {
        if (i == 0) {
            str += threeSelectIndexs[i].name
            threeSelectParentIds += threeSelectIndexs[i].id
        } else {
            str += " / " + threeSelectIndexs[i].name
            threeSelectParentIds += "," + threeSelectIndexs[i].id
        }
    }
    console.log(threeSelectParentIds);
    $('#div-select-value-three-tag').html(str);
}


function getThreeTagList() {
    $("#dialog-wrapper").show()
    if (threeDialogIsLoad) {
        $('#three-tag-dialog').show();
        return
    }
    threeDialogIsLoad = true;
    threeTagPageIndex = 1;
    ajax({
        url: "/api/tag/selectByMoreParentId",
        type: 'get',
        data: {
            pageIndex: threeTagPageIndex,
            pageSize: oneTagPageSize,
            type: 3,
            parentIds: twoSelectParentIds
        },
        dataType: 'json',
        timeout: 10000,
        contentType: "application/json",
        success: function (data) {
            var json = JSON.parse(data);
            if (json.code == 200) {
                $('#three-tag-dialog').show();
                if (threeTagPageIndex == 1) {
                    let htmlStr = '';
                    for (let i = 0; i < json.data.list.length; i++) {
                        if (threeTagIsSelect(json.data.list[i].id)) {
                            htmlStr += '<div class="select_font" value="'
                                + json.data.list[i].id + '" style="color: #44c9a8;" onclick="selectThreeTagItemOnclick(this)">' + json.data.list[i].name + '</div>'
                        } else {
                            htmlStr += '<div class="select_font" value="'
                                + json.data.list[i].id + '" onclick="selectThreeTagItemOnclick(this)">' + json.data.list[i].name + '</div>'
                        }
                    }
                    $('#three-select_item').html(htmlStr);
                } else {
                    let htmlStr = '';
                    for (let i = 0; i < json.data.list.length; i++) {
                        if (threeTagIsSelect(json.data.list[i].id)) {
                            htmlStr += '<div class="select_font" value="'
                                + json.data.list[i].id + '" style="color: #44c9a8;" onclick="selectThreeTagItemOnclick(this)">' + json.data.list[i].name + '</div>'
                        } else {
                            htmlStr += '<div class="select_font" value="'
                                + json.data.list[i].id + '" onclick="selectThreeTagItemOnclick(this)">' + json.data.list[i].name + '</div>'
                        }
                    }
                    $('#three-select_item').append(htmlStr);
                }
                twoTagPageIndex++;
                if (json.data.list.length >= oneTagPageSize) {
                    threeDropload()
                } else {
                    $('#three-select_list').css("overflow-y", "hidden")
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

function twoTagIsSelect(id) {
    for (let j = 0; j < twoSelectIndexs.length; j++) {
        if (twoSelectIndexs[j].id == id) {
            return true
        }
    }
    return false
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
                        if (twoTagIsSelect(json.data.list[i].id)) {
                            htmlStr += '<div class="select_font" value="'
                                + json.data.list[i].id + '" style="color: #44c9a8;" onclick="selectTwoTagItemOnclick(this)">' + json.data.list[i].name + '</div>'
                        } else {
                            htmlStr += '<div class="select_font" value="'
                                + json.data.list[i].id + '" onclick="selectTwoTagItemOnclick(this)">' + json.data.list[i].name + '</div>'
                        }
                    }
                    $('#two-select_item').html(htmlStr);
                } else {
                    let htmlStr = '';
                    for (let i = 0; i < json.data.list.length; i++) {
                        if (twoTagIsSelect(json.data.list[i].id)) {
                            htmlStr += '<div class="select_font" value="'
                                + json.data.list[i].id + '" style="color: #44c9a8;" onclick="selectTwoTagItemOnclick(this)">' + json.data.list[i].name + '</div>'
                        } else {
                            htmlStr += '<div class="select_font" value="'
                                + json.data.list[i].id + '" onclick="selectTwoTagItemOnclick(this)">' + json.data.list[i].name + '</div>'
                        }
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
    $('#two-tag-dialog').hide();
    $('#three-tag-dialog').hide();
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
                        console.log(json.data.hasNextPage)
                        if (!json.data.hasNextPage) {
                            // 锁定
                            dropload.noData();
                            dropload.lock();
                            $('.dropload-down').hide();
                        }
                        if (twoTagPageIndex == 1) {
                            let htmlStr = '<div value="-1" onclick="selectTwoTagItemOnclick(this)">根目录</div>';
                            for (let i = 0; i < json.data.list.length; i++) {
                                if (twoTagIsSelect(json.data.list[i].id)) {
                                    htmlStr += '<div class="select_font" value="'
                                        + json.data.list[i].id + '" style="color: #44c9a8;" onclick="selectTwoTagItemOnclick(this)">' + json.data.list[i].name + '</div>'
                                } else {
                                    htmlStr += '<div class="select_font" value="'
                                        + json.data.list[i].id + '" onclick="selectTwoTagItemOnclick(this)">' + json.data.list[i].name + '</div>'
                                }
                            }
                            $('#two-select_item').html(htmlStr);
                        } else {
                            let htmlStr = '';
                            for (let i = 0; i < json.data.list.length; i++) {
                                if (twoTagIsSelect(json.data.list[i].id)) {
                                    htmlStr += '<div class="select_font" value="'
                                        + json.data.list[i].id + '" style="color: #44c9a8;" onclick="selectTwoTagItemOnclick(this)">' + json.data.list[i].name + '</div>'
                                } else {
                                    htmlStr += '<div class="select_font" value="'
                                        + json.data.list[i].id + '" onclick="selectTwoTagItemOnclick(this)">' + json.data.list[i].name + '</div>'
                                }
                            }
                            $('#two-select_item').append(htmlStr);
                        }
                        twoTagPageIndex++;
                        dropload.resetload()
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

function threeTagIsSelect(id) {
    for (let j = 0; j < threeSelectIndexs.length; j++) {
        if (threeSelectIndexs[j].id == id) {
            return true
        }
    }
    return false
}


function threeDropload() {
    // dropload
    var dropload = $('.three-inner').dropload({
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
                    pageIndex: threeTagPageIndex,
                    pageSize: oneTagPageSize,
                    type: 3,
                    parentIds: twoSelectParentIds
                },
                dataType: 'json',
                timeout: 10000,
                contentType: "application/json",
                success: function (data) {
                    var json = JSON.parse(data);
                    if (json.code == 200) {
                        $('#three-select_list').show();
                        console.log(json.data.hasNextPage)
                        if (!json.data.hasNextPage) {
                            // 锁定
                            dropload.noData();
                            dropload.lock();
                            $('.dropload-down').hide();
                        }
                        if (threeTagPageIndex == 1) {
                            let htmlStr = '<div value="-1" onclick="selectThreeTagItemOnclick(this)">根目录</div>';
                            for (let i = 0; i < json.data.list.length; i++) {
                                if (threeTagIsSelect(json.data.list[i].id)) {
                                    htmlStr += '<div class="select_font" value="'
                                        + json.data.list[i].id + '" style="color: #44c9a8;" onclick="selectThreeTagItemOnclick(this)">' + json.data.list[i].name + '</div>'

                                } else {
                                    htmlStr += '<div class="select_font" value="'
                                        + json.data.list[i].id + '" onclick="selectThreeTagItemOnclick(this)">' + json.data.list[i].name + '</div>'
                                }
                            }
                            $('#three-select_item').html(htmlStr);
                        } else {
                            let htmlStr = '';
                            for (let i = 0; i < json.data.list.length; i++) {
                                if (threeTagIsSelect(json.data.list[i].id)) {
                                    htmlStr += '<div class="select_font" value="'
                                        + json.data.list[i].id + '" style="color: #44c9a8;" onclick="selectThreeTagItemOnclick(this)">' + json.data.list[i].name + '</div>'

                                } else {
                                    htmlStr += '<div class="select_font" value="'
                                        + json.data.list[i].id + '" onclick="selectThreeTagItemOnclick(this)">' + json.data.list[i].name + '</div>'
                                }
                            }
                            $('#three-select_item').append(htmlStr);
                        }
                        threeTagPageIndex++;
                        dropload.resetload()
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

function createTwoTag(id, title) {
    var bean = new Object;
    bean.id = id;
    bean.name = title;
    return bean;
}

function init() {
    id = getUrlParam("id")
    console.log(id)
    ajax({
        url: "/api/video/getInfoById",
        type: 'get',
        data: {
            id: id
        },
        dataType: 'json',
        timeout: 10000,
        contentType: "application/json",
        success: function (data) {
            console.log("json详情：" + data)
            var json = JSON.parse(data);
            if (json.code == 200) {
                $("#form-title").val(json.data.title)
                $("#input-intro").val(json.data.introduction)
                if (data.imgSrc) {
                    $("#show").attr('src', json.data.imgSrc)
                } else {
                    $("#show").attr('src', '/duanshipin/img/default.jpg')
                }
                if (data.isComplete == 1) {
                    $("input[name='isEnd']").eq(0).attr('checked', true);
                } else {
                    $("input[name='isEnd']").eq(1).attr('checked', true);
                }
                if (data.isBlockSearch == 1) {
                    $("input[name='isSelect']").eq(0).attr('checked', true);
                } else {
                    $("input[name='isSelect']").eq(1).attr('checked', true);
                }
                $("#total-mun").val(json.data.totalMun)
                $("#director").val(json.data.director)
                $("#performer").val(json.data.performer)
                getTagById(json.data.oneClassTagId)
                getTagsByIds(json.data.twoClassTagIds, 1)
                getTagsByIds(json.data.threeClassTagIds, 2)
                getAlbumById(json.data.publishAdminId)
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

function getUrlParam(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
    if (r != null) return unescape(r[2]);
    return null; //返回参数值
}

function getTagById(id) {
    ajax({
        url: "/api/tag/getInfoById",
        type: 'get',
        data: {
            id: id
        },
        dataType: 'json',
        timeout: 10000,
        contentType: "application/json",
        success: function (data) {
            console.log("onetag json详情：" + data)
            var json = JSON.parse(data);
            if (json.code == 200) {
                oneTagIndex = json.data.id
                $('#div-select-value').html(json.data.name).attr('value', json.data.id);
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

function getTagsByIds(ids, index) {
    ajax({
        url: "/api/tag/getTagsByIds",
        type: 'get',
        data: {
            ids: ids
        },
        dataType: 'json',
        timeout: 10000,
        contentType: "application/json",
        success: function (data) {
            console.log("onetag json详情：" + data)
            var json = JSON.parse(data);
            if (json.code == 200) {

                var str
                if (index == 1) {
                    twoSelectIndexs.splice(0, twoSelectIndexs.length);
                    for (var i = 0; i < json.data.length; i++) {
                        twoSelectIndexs.push(json.data[i])
                        console.log("two class array length " + twoSelectIndexs.length)
                        if (i == 0) {
                            str = json.data[i].name
                            twoSelectParentIds += json.data[i].id
                        } else {
                            str += " / " + json.data[i].name
                            twoSelectParentIds += "," + json.data[i].id
                        }
                    }
                    $('#div-select-value-two-tag').html(str);

                } else if (index == 2) {
                    threeSelectIndexs.splice(0, threeSelectIndexs.length);
                    for (var i = 0; i < json.data.length; i++) {
                        threeSelectIndexs.push(json.data[i])
                        if (i == 0) {
                            str = json.data[i].name
                            threeSelectParentIds += json.data[i].id
                        } else {
                            str += " / " + json.data[i].name
                            threeSelectParentIds += "," + json.data[i].id
                        }
                    }
                    $('#div-select-value-three-tag').html(str);
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

function getAlbumById(id) {
    ajax({
        url: "/api/admin/getAdminById",
        type: 'get',
        data: {
            id: id
        },
        dataType: 'json',
        timeout: 10000,
        contentType: "application/json",
        success: function (data) {
            console.log("onetag json详情：" + data)
            var json = JSON.parse(data);
            if (json.code == 200) {
                $('#robotId').attr('value', json.data.userName).attr('name', json.data.id);
                json.data.list[i].userName
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

function back() {
    window.history.back(-1);
}
