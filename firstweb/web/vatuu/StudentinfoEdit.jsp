<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = (String) session.getAttribute("id");
    if (id==null){
        response.sendRedirect("../login.jsp");
    }
%>
<html>
<head>
    <title>修改信息</title>
    <style>
        .but_1{
            height: 36px;
            width: 34px;
            background: url(http://localhost:8080/hello/css/images/usersys/icon/lefticon.jpg);
            background-repeat: no-repeat;
            background-position:10px;
            cursor: pointer;
        }
        .but_2{
            height: 36px;
            width: 34px;
            background: url(http://localhost:8080/hello/css/images/usersys/icon/righticon.jpg);
            background-repeat: no-repeat;
            background-position:13px;
            cursor: pointer;
        }
        .but_3{
            height: 38px;
            width: 34px;
            background: url(http://localhost:8080/hello/css/images/usersys/icon/refresh.jpg);
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
        select{
            width: 120px;
            height: 28px;
            line-height: 28px;
            padding-left: 5px;
            margin-right: 10px;
            box-sizing: border-box;
        }
    </style>
</head>
<body style="background: #fafafa;">
<div>
    <div class="labelcol">
        <ul>
            <li><a href="http://localhost:8080/hello/vatuu/StudentinfoAction.jsp">学籍信息</a></li>
            <li class="active"><a href="http://localhost:8080/hello/vatuu/StudentinfoEdit.jsp">信息修改</a></li>
            <li><a href="https://my.chsi.com.cn/archive/index.jsp" target="_blank">学信档案</a></li>
        </ul>
    </div>
    <div class="winContent">
        <div>
            <button class="but_1" onclick="window.history.go(-1);"></button>
            <button class="but_2" onclick="window.history.go(1);"></button>
            <button class="but_3" onclick="queryStuInfo();"></button>
        </div>
        <div>
            <form action="http://localhost:8080/hello/editStudentInfoServlet" method="post">
                <table style="width: 100%" class="table_1" >
                    <tbody>
                    <tr>
                        <td colspan="4">学生信息表</td>
                    </tr>
                    <tr>
                        <td style="width: 12%">账号</td>
                        <td id="id"style="width: 25%"></td>
                        <td style="width: 12%">密码</td>
                        <td style="width: 25%">
                            <input type="password" id="password" name="password">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 12%">性别</td>
                        <td style="width: 25%">
                            <input type="text" id="gender" name="gender">
                            <%--<select name="gender" id="gender">--%>
                                <%--<option value="主将">主将</option>--%>
                                <%--<option value="副将"selected>副将</option>--%>
                                <%--<option value="监军">监军</option>--%>
                                <%--<option value="军师">军师</option>--%>
                            <%--</select>--%>
                        </td>
                        <td style="width: 12%">电话</td>
                        <td style="width: 25%">
                            <input type="text" id="telephone" name="telephone" >
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <input type="submit" value="保存以上信息">
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript" src="http://localhost:8080/hello/js/http_code.jquery.com_jquery-2.0.0.js"></script>
<script type="text/javascript">
    window.onload = function () {
        queryStuInfo();
    }
    var xmlHttp;
    function createXMLHttpRequest() {
        if(window.ActiveXObject){
            xmlHttp = new ActiveXObject();
        }else if(window.XMLHttpRequest){
            xmlHttp = new XMLHttpRequest();
        }
    }
    function queryStuInfo(){
        var url = "http://localhost:8080/hello/queryStudentInfo";
        createXMLHttpRequest();
        xmlHttp.onreadystatechange = queryStudentInfo;
        xmlHttp.open("GET",url,true);
        xmlHttp.send(null);
    }
//    function editStuInfo() {
//        var id = document.getElementById("id").innerHTML;
//        var password = document.getElementById("password").value;
//        var gender = document.getElementById("gender").value;
//        var telephone = document.getElementById("telephone").value;
//        var url = "http://localhost:8080/hello/editStudentInfoServlet?id="+id+"&password="+password+"&gender="+gender+"&telephone="+telephone;
//        createXMLHttpRequest();
//        xmlHttp.onreadystatechange = editStudentInfo;
//        xmlHttp.open("GET",url,true);
//        xmlHttp.send(null);
//    }
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
                document.getElementById("password").value = arrY[1];
                document.getElementById("gender").value = arrY[2];
                document.getElementById("telephone").value = arrY[3];
            }
        }
    }
//    function editStudentInfo() {
//
//    }
</script>
</body>
</html>
