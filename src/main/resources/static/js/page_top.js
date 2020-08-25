// 输出头代码
function writeHander() {
    document.writeln("<div class=\'hander\'>");
    document.writeln("        <div class=\'inner_c\'>");
    document.writeln("            <div class=\'logo\'>");
    document.writeln("                <img src=\'../../../static/img/logo.png\' alt=\'\' class=\'logo_img\'/>");
    document.writeln("                <span class=\'logo_title_span\'>视频后台管理系统</span>");
    document.writeln("            </div>");
    document.writeln("            <div class=\'nav\'>");
    document.writeln("                <ul class=\'home_bar_ul\'>");
    document.writeln("                    <li><a href=\'#\' class=\'current\'>内容管理</a></li>");
    document.writeln("                    <li>");
    document.writeln("                        <a href=\'#\'>用户管理</a>");
    document.writeln("                    </li>");
    document.writeln("                    <li>");
    document.writeln("                        <a href=\'#\'>审核系统</a>");
    document.writeln("                    </li>");
    document.writeln("                    <li>");
    document.writeln("                        <a href=\'#\'>APP内容块</a>");
    document.writeln("                    </li>");
    document.writeln("                    <li>");
    document.writeln("                        <a href=\'#\'>消息和客服</a>");
    document.writeln("                    </li>");
    document.writeln("                    <li>");
    document.writeln("                        <a href=\'#\' class=\'last\'>系统管理</a>");
    document.writeln("                    </li>");
    document.writeln("                </ul>");
    document.writeln("            </div>");
    document.writeln("            <div class=\'account_controll\'>");
    document.writeln("            <span>");
    document.writeln("                    <a href=\'#\'>");
    document.writeln("                        账户");
    document.writeln("                    </a>");
    document.writeln("                    <a href=\'#\'>");
    document.writeln("                        退出登录");
    document.writeln("                    </a>");
    document.writeln("            </span>");
    document.writeln("            </div>");
    document.writeln("        </div>");
    document.writeln("    </div>");
}
// 输出内容页的html代码
function writeContent(){
    document.writeln("<div class=\'content\'>");
    document.writeln("        <div class=\'inner_c\'>");
    document.writeln("            <div class=\'left\'>");
    document.writeln("                <div class=\'left_nav\'>");
    document.writeln("");
    document.writeln("                </div>");
    document.writeln("            </div>");
    document.writeln("            <div class=\'main_content\'>");
    document.writeln("            </div>");
    document.writeln("        </div>");
    document.writeln("    </div>");   
}