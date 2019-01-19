<%--
  Created by IntelliJ IDEA.
  User: 94888
  Date: 2019/1/2
  Time: 16:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" type="text/css" media="all" href="css/style.css">
    <style>
        body{
            background-image: url("css/images/background.PNG");
            background-size:cover;
            font-family: 楷体;
            font-size: large;
            /*图片过大，隐藏多余部分*/
            overflow: hidden;
        }
        .login{
            font-family: 楷体;
            font-size: large;
        }
        .reminded{
            color: red;
        }
    </style>
</head>
<body>
<a href="#loginmodal" class="flatbtn" id="modellogin">登录</a>
<a href="register.jsp" class="flatbtn" id="modelregister">注册</a>
<div id="loginmodal" style="display: none;text-align: center">
    <form name="login"  action="login" method="post" style="text-align: center">
        <table style="border-collapse:separate;border-spacing: 20px 20px;text-align: left;">
            <tr>
                <td>账号：<input type="text" name="id" id="id" ></td>
            </tr>
            <tr>
                <td>密码：<input type="password" name="password" id="password" ></td>
            </tr>
            <tr>
                <td>验证码：<input type="text" id="code" name="code" style="width: 80px;" onblur="checkcode();"/><span id="remindCode"></span></td>
            </tr>
            <tr>
                <td><img id="imgObj" alt="验证码" src="${pageContext.request.contextPath}/getCode">&nbsp;&nbsp;<a href="#" onclick="changeImg()">换一张</a></td>
            </tr>
            <tr style="text-align: center"><td class="login"><input style="width: 220px;height: 30px;" type="submit" value="登录" onclick="return checkform();"/></td></tr>
        </table>
    </form>
</div>
<script type="text/javascript" src="js/http_code.jquery.com_jquery-2.0.0.js"></script>
<script type="text/javascript" src="js/jquery.leanModal.min.js"></script>
<script type="text/javascript">
    var xmlHttp;
    var yanzhengma = 0;
    var id = document.getElementById("id").value;
    var code = document.getElementById("code").value;
    var password = document.getElementById("password").value;
    function checkcode() {
        id = document.getElementById("id").value;
        code = document.getElementById("code").value;
        password = document.getElementById("password").value;
        XMLHttpReady();
        if(yanzhengma == 0){
            return false;
        }else{
            return true;
        }
    }
    function createXmlHttpRequest() {
        if(window.ActiveXObject){
            xmlHttp = new ActiveXObject();
        }else if(window.XMLHttpRequest){
            xmlHttp = new XMLHttpRequest();
        }
    }
    function XMLHttpReady() {
        createXmlHttpRequest();
        var al = 123;
        var url = "CheckCode?password="+password+"&code="+code+"&id="+id;
        xmlHttp.onreadystatechange = callback;
        xmlHttp.open("GET",url,true);
        xmlHttp.send();
    }
    function callback() {
        if (xmlHttp.readyState == 4){
            if(xmlHttp.status == 200){
                document.getElementById("remindCode").innerHTML = xmlHttp.responseText;
                if (xmlHttp.responseText=="错误！"||xmlHttp.responseText=="空！"){
//                    alert("请输入正确的验证码！");
                    yanzhengma = 0;
                }else if (xmlHttp.responseText == "正确！"){
                    yanzhengma = 1;
                }else{
                    alert("dogresponseText="+xmlHttp.responseText);
                    yanzhengma = 0;
                }
            }
        }
    }
    function checkform() {
        var id  = document.getElementById("id");
        var password  = document.getElementById("password");
        $("#remindCode").html("");
        if (id.value == ""&&password.value == ""){
            alert("请输入账号和密码！");
            return false;
        }else if (id.value == ""){
            alert("账号不能为空！");
            return false;
        }else if (password.value == ""){
            alert("密码不能为空！");
            return false;
        }
        else if(!checkcode()){
            return false;
        }
        return true;
    }
    function changeImg() {
        var imgSrc = $("#imgObj");
        var src = imgSrc.attr("src");
        imgSrc.attr("src", chgUrl(src));
    }

    // 时间戳
    // 为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳
    function chgUrl(url) {
        var timestamp = (new Date()).valueOf();
        url = url.substring(0, 20);
        if ((url.indexOf("&") >= 0)) {
            url = url + "×tamp=" + timestamp;
        } else {
            url = url + "?timestamp=" + timestamp;
        }
        return url;
    }
    $("#modellogin").leanModal({ top: 110, overlay: 0.45, closeButton: ".hidemodal" });
    //    $("#modelregister").leanModal({ top: 110, overlay: 0.45, closeButton: ".hidemodal" });

</script>
</body>
</html>
