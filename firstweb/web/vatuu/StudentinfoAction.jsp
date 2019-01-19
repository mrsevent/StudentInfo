<%--
  Created by IntelliJ IDEA.
  User: 94888
  Date: 2019/1/10
  Time: 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = (String) session.getAttribute("id");
    if (id==null){
        response.sendRedirect("../login.jsp");
    }
%>
<html>
<head>
    <title>学籍信息</title>
    <style>
        .but_1{
            height: 36px;
            width: 34px;
            background: url(../css/images/usersys/icon/lefticon.jpg);
            background-repeat: no-repeat;
            background-position:10px;
            cursor: pointer;
        }
        .but_2{
            height: 36px;
            width: 34px;
            background: url(../css/images/usersys/icon/righticon.jpg);
            background-repeat: no-repeat;
            background-position:13px;
            cursor: pointer;
        }
        .but_3{
            height: 38px;
            width: 34px;
            background: url(../css/images/usersys/icon/refresh.jpg);
            background-repeat: no-repeat;
            background-position: 5px;
            cursor: pointer;
        }
        .labelcol{
            width: 160px;
            height:100%;
            float: left;
            box-sizing: border-box;
            border-right: solid 1px #cccccc;
        }
        .winContent{
            margin-left: 160px;
        }
        .table_1{
            border-collapse: collapse;
        }
        .table_1 td{
            text-align: center;
            border: 1px solid #9f7e42;
        }
    </style>
</head>
<body style="background: #fafafa;">

<%--<%=session.getAttribute("id").toString()%>--%>
<%--<%=session.getAttribute("password").toString()%>--%>
<div>
    <div class="labelcol">
        <ul>
            <li class="active"><a href="StudentinfoAction.jsp">学籍信息</a></li>
            <li><a href="StudentinfoEdit.jsp">信息修改</a></li>
            <li><a href="https://my.chsi.com.cn/archive/index.jsp" target="_blank">学信档案</a></li>
        </ul>
    </div>
    <div class="winContent">
        <div>
            <button class="but_1" onclick="window.history.go(-1);"></button>
            <button class="but_2" onclick="window.history.go(1);"></button>
            <button class="but_3" onclick="window.location.reload();"></button>
        </div>
        <div>
            <table style="width: 100%" class="table_1" >
                <tbody>
                    <tr>
                        <td colspan="4">学生信息表</td>
                    </tr>
                    <tr>
                        <td style="width: 12%">账号</td>
                        <td id="id" style="width: 25%"></td>
                        <td style="width: 12%">密码</td>
                        <td id="password" style="width: 25%"></td>
                    </tr>
                    <tr>
                        <td style="width: 12%">性别</td>
                        <td id="gender" style="width: 25%"></td>
                        <td style="width: 12%">电话</td>
                        <td id="telephone" style="width: 25%"></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript" src="http://localhost:8080/hello/js/http_code.jquery.com_jquery-2.0.0.js"></script>
<script type="text/javascript">
//    $('.labelcol ul li').click(function () {
//        $(this).addClass("active").siblings("li").removeClass("active");
//    })
    window.onload = function () {
        XMLHttpReady();
    }
    var xmlHttp;
    function createXMLHttpRequest() {
        if(window.ActiveXObject){
            xmlHttp = new ActiveXObject();
        }else if(window.XMLHttpRequest){
            xmlHttp = new XMLHttpRequest();
        }
    }
    function XMLHttpReady(){
        var url = "../queryStudentInfo";
        createXMLHttpRequest();
        xmlHttp.onreadystatechange = queryStudentInfo;
        xmlHttp.open("GET",url,true);
        xmlHttp.send(null);
//        xmlHttp.open("POST",url,true);
        <%--xmlHttp.send(<%=session.getAttribute("id")%>);--%>
    }
    function queryStudentInfo() {
        if(xmlHttp.readyState == 4){
            if(xmlHttp.status == 200){
                var responseText = xmlHttp.responseText;
                var arrX = new Array();
                var arrY = new Array();
                var data = responseText.substring(1);
                arrX = data.split("?");
                for(var i = 0 ;i < arrX.length;i++){
                    arrY[i] = arrX[i].split("=")[1];
                }
                document.getElementById("id").innerHTML = arrY[0];
                document.getElementById("password").innerHTML = arrY[1];
                document.getElementById("gender").innerHTML = arrY[2];
                document.getElementById("telephone").innerHTML = arrY[3];
            }
        }
    }
</script>
</body>
</html>
