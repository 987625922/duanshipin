// 输出头代码
function writeHander() {
    document.writeln("<div class=\'hander\'>");
    document.writeln("            <div class=\'logo\'>");
    document.writeln("                    <a href=\'#\'>");
    document.writeln("                <img src=\'/duanshipin/img/logo-white.png\' alt=\'\' class=\'logo_img\'/>");
    document.writeln("                    </a>");
    document.writeln("            </div>");
    document.writeln("                    <a href=\'#\'>");
    document.writeln("                <img src=\'/duanshipin/img/tx.jpg\' alt=\'\' class=\'hander_per_icon\'/>");
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
    document.writeln("                            <a href=\'../content/albumOperationVideo.html\' id=\'left_item_one_a\'>");
    document.writeln("                                <i id=\'left_item_one_img\'>");
    document.writeln("                                 </i>");
    document.writeln("                                <span>内容</span>");
    document.writeln("                            </a>");
    document.writeln("                        </div>");
    document.writeln("                        <div class=\'left_item left_item_two\'  id=\'left_item_two\'>");
    document.writeln("                            <a href=\'../user/userManage.html\' id=\'left_item_two_a\'>");
    document.writeln("                                <i id=\'left_item_two_img\'>");
    document.writeln("                                 </i>");
    document.writeln("                                <span>用户</span>");
    document.writeln("                            </a>");
    document.writeln("                        </div>");
    document.writeln("                        <div class=\'left_item left_item_three\'  id=\'left_item_three\'>");
    document.writeln("                            <a href=\'../review/firstLevelReview.html\' id=\'left_item_three_a\'>");
    document.writeln("                                <i id=\'left_item_three_img\'>");
    document.writeln("                                </i>");
    document.writeln("                                <span>审核</span>");
    document.writeln("                            </a>");
    document.writeln("                        </div>");
    document.writeln("                        <div class=\'left_item left_item_four\'   id=\'left_item_four\'>");
    document.writeln("                            <a href=\'../app/adManage.html\'  id=\'left_item_four_a\'>");
    document.writeln("                                <i id=\'left_item_four_img\'>");
    document.writeln("                                </i>");
    document.writeln("                                <span>app</span>");
    document.writeln("                            </a>");
    document.writeln("                        </div>");
    document.writeln("                        <div class=\'left_item left_item_five\' id=\'left_item_five\'>");
    document.writeln("                            <a href=\'../customer/videoReport.html\'  id=\'left_item_five_a\'>");
    document.writeln("                                <i id=\'left_item_five_img\'>");
    document.writeln("                                </i>");
    document.writeln("                                <span>客服系统</span>");
    document.writeln("                            </a>");
    document.writeln("                        </div>");
    document.writeln("                        <div class=\'left_item left_item_seven\'  id=\'left_item_six\'>");
    document.writeln("                            <a href=\'../system/adminManage.html\' id=\'left_item_six_a\'>");
    document.writeln("                                <i id=\'left_item_six_img\'>");
    document.writeln("                                </i>");
    document.writeln("                                <span>系统</span>");
    document.writeln("                            </a>");
    document.writeln("                        </div>");
    document.writeln("                    </div>");
    document.writeln("                </div>");
}
// 内容管理的左边栏
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
    document.writeln("                        <a href=\"tags.html\" class=\'item_two_one item_style\' id=\'item_two_one\'>");
    document.writeln("                            <span>标签管理</span>");
    document.writeln("                        </a>");
    document.writeln("                    </div>");
    document.writeln("                </div>");
}
function writeUserManage() {
    document.writeln("<div class=\'left_two\'>");
    document.writeln("                <div class=\'left_two_nav\'>");
    document.writeln("                    <div id=\'left_two_nav_item\'>");
    document.writeln("                        <span>用户管理</span>");
    document.writeln("                    </div>");
    document.writeln("                    <a href=\'../user/userManage.html\' class=\'item_one_one item_style\' id=\'item_one_one\'>");
    document.writeln("                        <span>用户管理</span>");
    document.writeln("                    </a>");
    document.writeln("                </div>");
    document.writeln("            </div>");
}
function writeReview() {
    document.writeln("<div class=\'left_two\'>");
    document.writeln("                <div class=\'left_two_nav\'>");
    document.writeln("                    <div id=\'left_two_nav_item\'>");
    document.writeln("                        <span>视频管理</span>");
    document.writeln("                    </div>");
    document.writeln("                    <a class=\'item_style item_one_one\' id=\'left-one\' href=\'firstLevelReview.html\'>");
    document.writeln("                        <span>一级审核</span>");
    document.writeln("                    </a>");
    document.writeln("                    <a class=\'item_one_one item_style\' id=\'left-two\' href=\'secondLevelReview.html\'>");
    document.writeln("                        <span>二级审核</span>");
    document.writeln("                    </a>");
    document.writeln("                    <div id=\'left_two_nav_item\'>");
    document.writeln("                        <span>专辑审核管理</span>");
    document.writeln("                    </div>");
    document.writeln("                    <a class=\'item_one_one item_style\' id=\'left-three\' href=\'newAlbumReview.html\'>");
    document.writeln("                        <span>全新专辑</span>");
    document.writeln("                    </a>");
    document.writeln("                    <a class=\'item_one_one item_style\' id=\'left-four\' href=\'albumUpdateReview.html\'>");
    document.writeln("                        <span>专辑更新</span>");
    document.writeln("                    </a>");
    document.writeln("                    <div id=\'left_two_nav_item\'>");
    document.writeln("                        <span>评论审核管理</span>");
    document.writeln("                    </div>");
    document.writeln("                    <a class=\'item_one_one item_style\' id=\'left-five\' href=\'commentReview.html\'>");
    document.writeln("                        <span>评论审核</span>");
    document.writeln("                    </a>");
    document.writeln("                </div>");
    document.writeln("            </div>");
}
function writeAppLeftControl() {
    document.writeln("  <div class=\'left_two\'>");
    document.writeln("                <div class=\'left_two_nav\'>");
    document.writeln("                    <div id=\'left_two_nav_item\'>");
    document.writeln("                        <span>广告页管理</span>");
    document.writeln("                    </div>");
    document.writeln("                    <a class=\'item_one_one item_style\' id=\'left-one\' href=\'adManage.html\'>");
    document.writeln("                        <span>广告页管理</span>");
    document.writeln("                    </a>");
    document.writeln("                    <div id=\'left_two_nav_item\'>");
    document.writeln("                        <span>分享页管理</span>");
    document.writeln("                    </div>");
    document.writeln("                    <a class=\'item_one_one item_style\' id=\'left-two\' href=\'recommendVideo.html\'>");
    document.writeln("                        <span>推荐视频</span>");
    document.writeln("                    </a>");
    document.writeln("                    <div id=\'left_two_nav_item\'>");
    document.writeln("                        <span>用户推荐管理</span>");
    document.writeln("                    </div>");
    document.writeln("                    <a class=\'item_one_one item_style\' id=\'left-three\' href=\'recommendUser.html\'>");
    document.writeln("                        <span>推荐用户</span>");
    document.writeln("                    </a>");
    document.writeln("                </div>");
    document.writeln("            </div>");
}
function writeCustomerControl() {
    document.writeln("<div class=\'left_two\'>");
    document.writeln("                <div class=\'left_two_nav\'>");
    document.writeln("                    <div id=\'left_two_nav_item\'>");
    document.writeln("                        <span>举报管理</span>");
    document.writeln("                    </div>");
    document.writeln("                    <a class=\'item_one_one item_style\' href=\'videoReport.html\' id=\'left-one\'>");
    document.writeln("                        <span>视频举报</span>");
    document.writeln("                    </a>");
    document.writeln("                    <a class=\'item_one_one item_style\' href=\'commentReport.html\' id=\'left-two\'>");
    document.writeln("                        <span>评论举报</span>");
    document.writeln("                    </a>");
    document.writeln("                    <div id=\'left_two_nav_item\'>");
    document.writeln("                        <span>反馈管理</span>");
    document.writeln("                    </div>");
    document.writeln("                    <a class=\'item_one_one item_style\' href=\'userRepotr.html\' id=\'left-three\'>");
    document.writeln("                        <span>用户反馈</span>");
    document.writeln("                    </a>");
    document.writeln("                </div>");
    document.writeln("            </div>");
}
function writeSystemLeft() {
    document.writeln("<div class=\'left_two\'>");
    document.writeln("                <div class=\'left_two_nav\'>");
    document.writeln("                    <div id=\'left_two_nav_item\'>");
    document.writeln("                        <span>权限管理</span>");
    document.writeln("                    </div>");
    document.writeln("                    <a class=\'item_one_one item_style\' href=\'adminManage.html\' id=\'left-one\'>");
    document.writeln("                        <span>管理员</span>");
    document.writeln("                    </a>");
    document.writeln("                    <a class=\'item_one_one item_style\' href=\'roleManage.html\' id=\'left-two\'>");
    document.writeln("                        <span>角色管理</span>");
    document.writeln("                    </a>");
    document.writeln("                    <a class=\'item_one_one item_style\' href=\'permissionManage.html\' id=\'left-three\'>");
    document.writeln("                        <span>权限管理</span>");
    document.writeln("                    </a>");
    document.writeln("                    <div id=\'left_two_nav_item\'>");
    document.writeln("                        <span>机器人管理</span>");
    document.writeln("                    </div>");
    document.writeln("                    <a class=\'item_one_one item_style\' href=\'robotManage.html\' id=\'left-four\'>");
    document.writeln("                        <span>机器人管理</span>");
    document.writeln("                    </a>");
    document.writeln("                    <div id=\'left_two_nav_item\'>");
    document.writeln("                        <span>日志管理</span>");
    document.writeln("                    </div>");
    document.writeln("                    <a class=\'item_one_one item_style\' href=\'loginLog.html\' id=\'left-five\'>");
    document.writeln("                        <span>登录日志</span>");
    document.writeln("                    </a>");
    document.writeln("                    <a class=\'item_one_one item_style\' href=\'controlLog.html\' id=\'left-six\'>");
    document.writeln("                        <span>操作日志</span>");
    document.writeln("                    </a>");
    document.writeln("                </div>");
    document.writeln("            </div>");
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