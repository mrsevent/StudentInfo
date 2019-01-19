<%--
  Created by IntelliJ IDEA.
  User: 94888
  Date: 2019/1/2
  Time: 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String id = (String) session.getAttribute("id");
  if (id==null){
    response.sendRedirect("login.jsp");
  }
%>
<html>
  <head>
    <title>首页</title>
    <style>
      body{
        background-image: url("css/images/background.PNG");
        background-size: cover;
        /*overflow: hidden;*/
      }
      .IndexMenu{
        margin-left: 40px;
        position: absolute;
        z-index: 9;
      }
      .IndexIconBig{
        box-sizing: border-box;
        width: 100px;
        height: 108px;
      }
      .IndexIconBigHover{
        box-sizing: border-box;
        width: 100px;
        height: 108px;
        background: #525864;
      }
      #WindowMain0{
        box-sizing: border-box;
      }
      .WindowHead{
        background: #575657;
        height: 38px;
        overflow: hidden;
      }
      .WindowHeadLeft{
        float: left;
        height: 30px;
        width:20%;
      }
      .WindowHeadTitle{
        cursor: move;
        width:65%;
        float: left;
        text-align: center;
        line-height: 38px;
      }
      .WindowHeadActionMin{
        background: #525864 url("css/images/usersys/icon/icon_05.png");
        background-position: center;
        float: left;
        height: 38px;
        width: 34px;
        background-repeat: no-repeat;
      }
      .WindowHeadActionMax{
        background: #525864 url("css/images/usersys/icon/icon_06.png");
        background-position: center;
        float: left;
        height: 38px;
        width: 34px;
        background-repeat: no-repeat;
      }
      .WindowHeadActionClose{
        background: #525864 url("css/images/usersys/icon/icon_07.png");
        background-position: center;
        float: left;
        height: 38px;
        width: 34px;
        background-repeat: no-repeat;
      }
    </style>
  </head>
  <body>
    <%--账号：${sessionScope.id}<br/>--%>
    <%--密码：<%=session.getAttribute("password").toString()%><br/>--%>
  <form name="WindowTarget" action="" target="_blank"></form>
  <div class="pageBody">
    <ul class="IndexMenu">
      <li class="IndexIconBig" onmouseover="this.className='IndexIconBigHover'" onmouseout="this.className='IndexIconBig'" onclick="AddNewWindow('我的个人信息','max','0','vatuu/StudentinfoAction.jsp')" style="list-style: none">
        <div class="DeskIconImg" style="text-align: center">
          <img width="65" height="65" src="css/images/usersys/icon/icon_01.png">
        </div>
        <div class="DeskIconText">
          <p class="DeskIconTableMiddle" style="text-align: center;">学籍信息</p>
        </div>
      </li>
      <li class="IndexIconBig" onmouseover="this.className='IndexIconBigHover'"onmouseout="this.className='IndexIconBig'" onclick="AddNewWindow('我的成绩','max','1','vatuu/StudentinfoAction.jsp')" style="list-style: none">
        <div class="DeskIconImg" style="text-align: center">
          <img width="65" height="65" src="css/images/usersys/icon/icon_02.png">
        </div>
        <div class="DeskIconText">
          <p class="DeskIconTableMiddle" style="text-align: center;">成绩信息</p>
        </div>
      </li>
      <li class="IndexIconBig" onmouseover="this.className='IndexIconBigHover'"onmouseout="this.className='IndexIconBig'" onclick="AddNewWindow('我的学习资源','max','2','vatuu/StudentinfoAction.jsp')" style="list-style: none">
        <div class="DeskIconImg" style="text-align: center">
          <img width="65" height="65" src="css/images/usersys/icon/icon_03.png">
        </div>
        <div class="DeskIconText">
          <p class="DeskIconTableMiddle" style="text-align: center;">学习资源</p>
        </div>
      </li>
    </ul>
  </div>
  <script type="text/javascript" src="js/window.js"></script>
  <script type="text/javascript" src="js/http_code.jquery.com_jquery-2.0.0.js"></script>
  <script type="text/javascript">
    function AddNewWindow(title,minormax,divid,url) {
//        document.WindowTarget.action=url;
//        document.WindowTarget.submit();
        var hadid = document.getElementById("WindowMain"+divid);
        if (!hadid){
            var o = document.createElement("div");
            o.className="dragclass";
            o.id="WindowMain"+divid;
            o.style.position="absolute";
            o.style.left = "50px";
            o.style.top = "20px";
            o.style.width="830px";
            document.body.appendChild(o);
            o.innerHTML=
                "<div class=\"WindowHead\" id=\"WindowHead"+divid+"\">"+
                "<div class=\"WindowHeadLeft\"><input type=hidden id=\"WindowHeadMaxMinValue"+divid+"\" value="+minormax+" /></div>"+
                "<div class=\"WindowHeadTitle\" id=\"WindowHeadTitle"+divid+"\">"+title+"</div>"+
                "<div class=\"WindowHeadAction\"><span class=\"WindowHeadActionMin\"  onclick=\"SetViewDiv('"+divid+"','hidden')\" title=\"最小化\"></span><span class=\"WindowHeadActionMax\" onclick=\"WindowChange('"+divid+"')\" title=\"调整窗口\"></span><span class=\"WindowHeadActionClose\" onclick=\"SetViewDiv('"+divid+"','del')\" title=\"关闭窗口\"></span></div>"+
                "</div>"+
                "<div class=\"WindowBody\" id=\"WindowBody"+divid+"\">"+
                "<iframe id=\"WindowFrame"+divid+"\" style=\"background: #fff;\"src=\""+url+"\" scrolling=\"auto\" frameborder=\"0\" width=\"830px\" height=\"500px\"></iframe>"+
                "</div>";
        }else{
            hadid.style.display="";
            window.parent.frames["WindowFrame"+divid].location=url;
        }
        document.getElementById("WindowMain"+divid).style.top ="70px";
        document.getElementById("WindowMain"+divid).style.left ="40px";
        document.getElementById("WindowMain"+divid).style.zIndex = 10;
    }
        function SetViewDiv(sid,action) {
            var divobj = document.getElementById("WindowMain"+sid);
            if(action=="del"){
                document.body.removeChild(divobj);
            }else if (action=="view"){
                divobj.style.zIndex=11;
            }else{
                divobj.style.display="none";
            }
        }
        function WindowChange(divid){
            var minormax = document.getElementById("WindowHeadMaxMinValue"+divid).value;
            if(minormax == "max"){
                alert("max");
                WindowMin(divid);
                document.getElementById("WindowHeadMaxMinValue"+divid).value = "min";
            }else{
                alert("min");
                WindowMax(divid);
                document.getElementById("WindowHeadMaxMinValue"+divid).value = "max";
            }
        }
        //获取xmlHttpRequest对象
  </script>
  </body>
</html>
