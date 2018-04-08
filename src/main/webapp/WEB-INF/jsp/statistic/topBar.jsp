<%@ page import="com.css.entity.YuzhengUser" %>
<%@ page import="com.css.util.IConstant" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    YuzhengUser user = (YuzhengUser) session.getAttribute(IConstant.SESSION_ATTRIBUTE_USER);
%>
<!-- Top Bar Start -->
<div class="topbar">

    <!-- LOGO -->
    <div class="topbar-left">
        <div class="text-center">
            <a href="javascript:void(0);" class="logo"><i class="mdi mdi-radar"></i> <span></span></a>
        </div>
    </div>

    <!-- Button mobile view to collapse sidebar menu -->
    <nav class="navbar-custom">

        <ul class="list-inline float-right mb-0">

            <li class="list-inline-item notification-list hide-phone">
                <a class="nav-link waves-light waves-effect" href="#" id="btn-fullscreen">
                    <i class="mdi mdi-crop-free noti-icon"></i>
                </a>
            </li>
<!--
            <li class="list-inline-item notification-list">
                <a class="nav-link right-bar-toggle waves-light waves-effect" href="#">
                    <i class="mdi mdi-dots-horizontal noti-icon"></i>
                </a>
            </li>

            <li class="list-inline-item dropdown notification-list">
                <a class="nav-link dropdown-toggle arrow-none waves-light waves-effect" data-toggle="dropdown" href="#" role="button"
                   aria-haspopup="false" aria-expanded="false">
                    <i class="mdi mdi-bell noti-icon"></i>
                    <span class="badge badge-pink noti-icon-badge">4</span>
                </a>
            </li>
-->
            <li class="list-inline-item dropdown notification-list">
                <a class="nav-link dropdown-toggle waves-effect waves-light nav-user" data-toggle="dropdown" href="#" role="button"
                   aria-haspopup="false" aria-expanded="false">
                    <img src="assets/images/users/admin.jpg" alt="user" class="rounded-circle">
                </a>
                <div class="dropdown-menu dropdown-menu-right profile-dropdown " aria-labelledby="Preview">
                    <!-- item-->
                    <div class="dropdown-item noti-title">
                        <h5 class="text-overflow"><small>欢迎您：<%=user.getDisplayName()%></small> </h5>
                    </div>

                    <!-- item-->
                    <a href="javascript:void(0);" class="dropdown-item notify-item" data-toggle="modal" data-target="#con-close-modal">
                        <i class="mdi mdi-settings"></i>
                        <span>修改密码</span>
                    </a>

                    <!-- item-->
                    <a href="/statistic/logout" class="dropdown-item notify-item">
                        <i class="mdi mdi-logout"></i>
                        <span>登出</span>
                    </a>

                </div>
            </li>

        </ul>

        <ul class="list-inline menu-left mb-0">
            <li class="float-left">
                <button class="button-menu-mobile open-left waves-light waves-effect">
                    <i class="mdi mdi-menu"></i>
                </button>
            </li>
            <li>
                <img src="assets/images/logo1.png" height="80px"/>
            </li>

        </ul>
    </nav>

</div>
<div id="con-close-modal" class="modal fade" tabindex="-1"
     role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">密码修改</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="oldPasswd" class="control-label">旧密码</label>
                            <input type="password" class="form-control" id="oldPasswd" placeholder="旧密码">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="newPasswd" class="control-label">新密码</label>
                            <input type="password" class="form-control" id="newPasswd" placeholder="新密码">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="conPasswd" class="control-label">重复新密码</label>
                            <input type="password" class="form-control" id="conPasswd" placeholder="再次输入">
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div id="chgPwdMsg"></div>
                <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">关闭</button>
                <button type="button" id="saveButton" class="btn btn-info waves-effect waves-light">保存</button>
            </div>
        </div>
    </div>
</div>
<!-- Top Bar End -->
<!-- ========== Left Sidebar Start ========== -->
<div class="left side-menu">
    <div class="sidebar-inner slimscrollleft">
        <!--- Divider -->
        <div id="sidebar-menu">
            <ul>
                <li>
                    <a href="/statistic/index" class="waves-effect waves-primary">
                        <i class="ti-home"></i>
                        <span> 首页 </span>
                    </a>
                </li>
                <li class="has_sub">
                    <a href="/statistic/jingLi" class="waves-effect waves-primary">
                        <i class=" ti-user"></i>
                        <span>警力分布</span>
                    </a>
                </li>
                <li>
                    <a href="/statistic/dianMing" class="waves-effect waves-primary">
                        <i class=" ti-pencil-alt"></i>
                        <span> 点名系统 </span>
                    </a>
                </li>
                <li>
                    <a href="/statistic/xunGeng" class="waves-effect waves-primary">
                        <i class=" ti-loop"></i>
                        <span> 巡更系统 </span>
                    </a>
                </li>
            </ul>
            <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!-- Left Sidebar End -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/prison.js"></script>
<script src="assets/js/changePassword.js" type="text/javascript"></script>
<script>
    var isSupervise = <%=IConstant.ADMIN_AREA.equals(user.getPrisonArea())%>;
</script>