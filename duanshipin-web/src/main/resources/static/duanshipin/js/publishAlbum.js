function changepic(obj) {
    //console.log(obj.files[0]);//这里可以获取上传文件的name
    var newsrc=getObjectURL(obj.files[0]);
    document.getElementById('show').src=newsrc;
}
//建立一個可存取到該file的url
function getObjectURL(file) {
    var url = null ;
    // 下面函数执行的效果是一样的，只是需要针对不同的浏览器执行不同的 js 函数而已
    if (window.createObjectURL!=undefined) { // basic
        url = window.createObjectURL(file) ;
    } else if (window.URL!=undefined) { // mozilla(firefox)
        url = window.URL.createObjectURL(file) ;
    } else if (window.webkitURL!=undefined) { // webkit or chrome
        url = window.webkitURL.createObjectURL(file) ;
    }
    return url;
}
function publishAlbum(){
    var formData = new FormData();
    formData.append("title", $("#form-title").val());
    formData.append("cover", $("#img-file")[0].files[0]);
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