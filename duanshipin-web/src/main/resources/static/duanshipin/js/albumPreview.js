var albumId

function getAlbumDetail() {
    albumId = getUrlParam("id")
    ajax({
        url: "/api/album/getInfoById",
        type: 'post',
        data: {
            id: albumId
        },
        dataType: 'json',
        timeout: 10000,
        contentType: "application/json",
        success: function (data) {
            let json = JSON.parse(data);
            if (json.code === 200) {
                $('#album-title').html(json.data.title)
                $('#album-id').html(json.data.id)
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
