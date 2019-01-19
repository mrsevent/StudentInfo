/**
 * Created by 94888 on 2019/1/11.
 */
var n=99;
function gs2(d,a) {
    if(d.currentStyle){
        var curVal = d.currentStyle[a];
    }else{
        var curVal=document.defaultView.getComputedStyle(d, null)[a];//getComputedStyle获取元素最终使用的CSS属性值。例： var w = window.getComputedStyle("元素", "伪类");
    }
    return curVal;
}
if (document.getElementById){
    (function() {
        var dragok = false;
        var d,dx,dy,x,y;
        function move(e) {
            if (!e) e = window.event;
            if (dragok){
                /**以下配置主要是为了让界面不会跑出到页面以外，2013-1-7更改**/
                var x_value=dx + e.clientX - x;
                var y_value=dy + e.clientY - y;
                //获取整个屏幕的宽度和高度
                var p_height=document.body.clientHeight;
                var p_width=document.body.clientWidth;
                if(x_value<0){
                    x_value=0;
                }
                if(x_value>=(p_width))
                {
                    x_value=p_width-40;
                }
                if(y_value<0){
                    y_value=0;
                }
                if(y_value>=(p_height-40))
                {
                    y_value=p_height-40;
                }
                d.style.left=x_value+ "px";
                d.style.top =y_value+ "px";
                /**新加代码结束**/
                /**此处是原代码，已被注释**/
                //d.style.left = dx + e.clientX - x + "px";
                //d.style.top  = dy + e.clientY - y + "px";
                return false;
            }
        }
        function down(e) {
            if(!e) e=window.event;
            var temp = (typeof e.target != "undefined")?e.target:e.srcElement;
            if (temp.tagName != "HTML"|"BODY" && temp.className != "dragclass"){
                temp = (typeof temp.parentNode != "undefined")?temp.parentNode.parentNode:temp.parentElement.parentElement;
            }
            if(temp.className=="dragclass"){
                dragok = true;
                temp.style.zIndex = n++;
                d = temp;
                dx = parseInt(gs2(temp,"left"))|0;//框架在鼠标按下时的位置
                dy = parseInt(gs2(temp,"top"))|0;
                x = e.clientX;//鼠标按下的位置
                y = e.clientY;
                document.onmousemove = move;
                return false;
            }
        }
        function up() {
            dragok=false;
            document.onmousemove = null;
        }
        document.onmousedown = down;
        document.onmouseup = up;
    })();
}