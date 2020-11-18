var id

function getInfo() {
    id = getUrlParam("id")
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
                $('#video-id').html(json.data.id)
                $('#video-title').html(json.data.title)
                $('#video-introduction').html(json.data.introduction)
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

function deleteVideo() {
    ajax({
        url: "/api/video/deleteForids",
        type: 'get',
        data: {
            ids: id
        },
        dataType: 'json',
        timeout: 10000,
        contentType: "application/json",
        success: function (data) {
            console.log("json详情：" + data)
            var json = JSON.parse(data);
            if (json.code == 200) {
                window.history.back(-1);
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
