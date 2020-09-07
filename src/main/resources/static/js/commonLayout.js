// 输出头代码
function writeHander() {
    document.writeln("<div class=\'hander\'>");
    document.writeln("            <div class=\'logo\'>");
    document.writeln("                    <a href=\'#\'>");
    document.writeln("                <img src=\'../../../static/img/logo-white.png\' alt=\'\' class=\'logo_img\'/>");
    document.writeln("                    </a>");
    document.writeln("            </div>");
    document.writeln("                    <a href=\'#\'>");
    document.writeln("                <img src=\'../../../static/img/tx.jpg\' alt=\'\' class=\'hander_per_icon\'/>");
    document.writeln("                <span class=\'hander_per_name\'>吴彦祖</span>");
    document.writeln("                    </a>");
    document.writeln("            <div class=\'account_controll\'>");
    document.writeln("            <span>");
    document.writeln("                    <a class=\'account\' id=\'account\' href=\'#\'>");
    document.writeln("                        账户");
    document.writeln("                    </a>");
    document.writeln("                    <a class=\'logo_out\' id=\'loginout\' href=\'#\'>");
    document.writeln("                        退出登录");
    document.writeln("                    </a>");
    document.writeln("            </span>");
    document.writeln("            </div>");
    document.writeln("    </div>");
}
// 输出左边栏
function writeLeft() {
    document.writeln("<div class=\'left\'>");
    document.writeln("                    <div class=\'left_nav\'>");
    document.writeln("                        <div class=\'left_item left_item_one\' id=\'left_item_one\'>");
    document.writeln("                            <a href=\'albumOperationVideo.html\' id=\'left_item_one_a\'>");
    document.writeln("                                <i id=\'left_item_one_img\'>");
    document.writeln("                                 </i>");
    document.writeln("                                <span>内容</span>");
    document.writeln("                            </a>");
    document.writeln("                        </div>");
    document.writeln("                        <div class=\'left_item left_item_two\'>");
    document.writeln("                            <a href=\'#\'>");
    document.writeln("                                <i id=\'left_item_two_img\'>");
    document.writeln("                                 </i>");
    document.writeln("                                <span>用户</span>");
    document.writeln("                            </a>");
    document.writeln("                        </div>");
    document.writeln("                        <div class=\'left_item left_item_three\'>");
    document.writeln("                            <a href=\'#\'>");
    document.writeln("                                <i id=\'left_item_three_img\'>");
    document.writeln("                                </i>");
    document.writeln("                                <span>审核</span>");
    document.writeln("                            </a>");
    document.writeln("                        </div>");
    document.writeln("                        <div class=\'left_item left_item_four\'>");
    document.writeln("                            <a href=\'#\'>");
    document.writeln("                                <i id=\'left_item_four_img\'>");
    document.writeln("                                </i>");
    document.writeln("                                <span>app</span>");
    document.writeln("                            </a>");
    document.writeln("                        </div>");
    document.writeln("                        <div class=\'left_item left_item_five\'>");
    document.writeln("                            <a href=\'#\'>");
    document.writeln("                                <i id=\'left_item_five_img\'>");
    document.writeln("                                </i>");
    document.writeln("                                <span>消息客服</span>");
    document.writeln("                            </a>");
    document.writeln("                        </div>");
    document.writeln("                        <div class=\'left_item left_item_six\'>");
    document.writeln("                            <a href=\'#\'>");
    document.writeln("                                <i id=\'left_item_six_img\'>");
    document.writeln("                                </i>");
    document.writeln("                                <span>系统</span>");
    document.writeln("                            </a>");
    document.writeln("                        </div>");
    document.writeln("                    </div>");
    document.writeln("                </div>");
}
function writeLeftTwoOfLeft() {
    document.writeln("<div class=\'left_two\'>");
    document.writeln("                    <div class=\'left_two_nav\'>");
    document.writeln("                        <div id=\'left_two_nav_item\'>");
    document.writeln("                            <span>视频管理</span>");
    document.writeln("                        </div>");
    document.writeln("                        <a  href=\"albumOperationVideo.html\" class=\'item_one_one item_style\' id=\'item_one_one\'>");
    document.writeln("                            <span>专辑管理</span>");
    document.writeln("                        </a>");
    document.writeln("                        <a  href=\"videoOperation.html\" class=\'item_one_two item_style\' id=\'item_one_two\'>");
    document.writeln("                            <span>影视管理</span>");
    document.writeln("                        </a>");
    document.writeln("                        <div id=\'left_two_nav_item\'>");
    document.writeln("                            <span>标签管理</span>");
    document.writeln("                        </div>");
    document.writeln("                        <a href=\"#\" class=\'item_two_one item_style\'>");
    document.writeln("                            <span>标签管理</span>");
    document.writeln("                        </a>");
    document.writeln("                    </div>");
    document.writeln("                </div>");
}
// 输出内容页的html代码
function writeContent() {
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