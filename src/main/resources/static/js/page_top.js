// 输出头代码
function writeHander() {
    document.writeln("<div class=\'hander\'>");
    // document.writeln("        <div class=\'inner_c\'>");
    document.writeln("            <div class=\'logo\'>");
    document.writeln("                    <a href=\'#\'>");
    document.writeln("                <img src=\'../../../static/img/logo-white.png\' alt=\'\' class=\'logo_img\'/>");
    document.writeln("                    </a>");
    document.writeln("            </div>");
    document.writeln("                <img src=\'../../../static/img/tx.jpg\' alt=\'\' class=\'hander_per_icon\'/>");
    document.writeln("                <span class=\'hander_per_name\'>吴彦祖</span>");
    document.writeln("            <div class=\'account_controll\'>");
    document.writeln("            <span>");
    document.writeln("                    <a class=\'account\' href=\'#\'>");
    document.writeln("                        账户");
    document.writeln("                    </a>");
    document.writeln("                    <a class=\'logo_out\' href=\'#\'>");
    document.writeln("                        退出登录");
    document.writeln("                    </a>");
    document.writeln("            </span>");
    document.writeln("            </div>");
    // document.writeln("        </div>");
    document.writeln("    </div>");
}
// 输出左边栏
function writeLeft(){
document.writeln("<div class=\'left\'>");
document.writeln("                    <div class=\'left_nav\'>");
document.writeln("                        <div class=\'left_item left_item_one\' id=\'left_item_one\'>");
document.writeln("                            <a href=\'#\' id=\'left_item_one_a\'>");
document.writeln("                                <img src=\'../../../static/img/video_content_n.png\' id=\'left_item_one_img\' alt=\'\'>");
document.writeln("                                内容");
document.writeln("                            </a>");
document.writeln("                        </div>");
document.writeln("                        <div class=\'left_item left_item_two\'>");
document.writeln("                            <a href=\'#\'>");
document.writeln("                                <img src=\'../../../static/img/per_n.png\' alt=\'\'>");
document.writeln("                                用户");
document.writeln("                            </a>");
document.writeln("                        </div>");
document.writeln("                        <div class=\'left_item left_item_three\'>");
document.writeln("                            <a href=\'#\'>");
document.writeln("                                <img src=\'../../../static/img/ev_n.png\' alt=\'\'>");
document.writeln("                                审核");
document.writeln("                            </a>");
document.writeln("                        </div>");
document.writeln("                        <div class=\'left_item left_item_four\'>");
document.writeln("                            <a href=\'#\'>");
document.writeln("                                <img src=\'../../../static/img/app_n.png\' alt=\'\'>");
document.writeln("                                app");
document.writeln("                            </a>");
document.writeln("                        </div>");
document.writeln("                        <div class=\'left_item left_item_five\'>");
document.writeln("                            <a href=\'#\'>");
document.writeln("                                <img src=\'../../../static/img/msg_n.png\' alt=\'\'>");
document.writeln("                                消息客服");
document.writeln("                            </a>");
document.writeln("                        </div>");
document.writeln("                        <div class=\'left_item left_item_six\'>");
document.writeln("                            <a href=\'#\'>");
document.writeln("                                <img src=\'../../../static/img/sys_n.png\' alt=\'\'>");
document.writeln("                                系统");
document.writeln("                            </a>");
document.writeln("                        </div>");
document.writeln("                    </div>");
document.writeln("                </div>");
}
function writeLeftTwoOfLeft(){
document.writeln("<div class=\'left_two\'>");
document.writeln("                    <div class=\'left_two_nav\'>");
document.writeln("                        <div id=\'item\'>");
document.writeln("                            <span>视频管理</span>");
document.writeln("                        </div>");
document.writeln("                        <div class=\'item_one_one item_style\' id=\'item_one_one\'>");
document.writeln("                            <span>专辑管理</span>");
document.writeln("                        </div>");
document.writeln("                        <div class=\'item_one_two item_style\'>");
document.writeln("                            <span>影视管理</span>");
document.writeln("                        </div>");
document.writeln("                        <div id=\'item\'>");
document.writeln("                            <span>标签管理</span>");
document.writeln("                        </div>");
document.writeln("                        <div class=\'item_two_one item_style\'>");
document.writeln("                            <span>标签管理</span>");
document.writeln("                        </div>");
document.writeln("                    </div>");
document.writeln("                </div>");
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