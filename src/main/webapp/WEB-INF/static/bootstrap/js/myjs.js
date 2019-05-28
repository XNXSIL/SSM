function showhead(obj) {
    var newPreview = document.getElementById('protrait');
    if (obj) {
        //ie浏览器兼容
        if (window.navigator.userAgent.indexOf("MSIE") >= 1) {
            obj.select();
            newPreview.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);";

            var path = document.selection.createRange().text;
            var flag = judgeImgSuffix(path);
            if(flag){
                newPreview.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = document.selection.createRange().text;
            }else{
                alert("要求图片格式为png,jpg,jpeg,bmp");
            }

            return;
        }
        //firefox浏览器兼容
        else if (window.navigator.userAgent.indexOf("Firefox") >= 1) {
            if (obj.files) {
                newPreview.src = window.URL.createObjectURL(obj.files.item(0));
                return;
            }
            newPreview.src = obj.value;
            return;
        }
        //Chrome浏览器兼容
        else if(window.navigator.userAgent.indexOf("Chrome") >= 1 || window.navigator.userAgent.indexOf("Safari") >= 1){
            if(obj.files){
                newPreview.src = window.webkitURL.createObjectURL(obj.files.item(0));
                return;
            }
            newPreview.src = obj.value;
            return;
        }
        newPreview.src = obj.value;
        return;
    }
}

function judgeImgSuffix(path){
    var index = path.lastIndexOf('.');
    var suffix = "";
    if(index > 0){
        suffix = path.substring(index+1);
    }
    if("png"==suffix || "jpg"==suffix || "jpeg"==suffix || "bmp"==suffix || "PNG"==suffix || "JPG"==suffix || "JPEG"==suffix || "BMP"==suffix){
        return true;
    }else{
        return false;
    }

}

function  show(name) {
    var div = document.getElementById(name + '_div');
    var text = document.getElementById(name + '_c');
    if(div.style.display == 'none'){
        div.style.display = 'block';
        text.innerText = '收起';
    }else{
        div.style.display = 'none';
        text.innerText = '修改';
    }
}