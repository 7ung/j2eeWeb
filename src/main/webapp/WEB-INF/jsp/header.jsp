<%-- 
    Document   : header
    Created on : Apr 9, 2017, 2:37:02 AM
    Author     : huynphu
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="resources/css/mystyle.css" rel="stylesheet" type="text/css"/>
<!DOCTYPE html>

<!--<div class="container-fluid">-->
<div class="row">
    <nav class="navbar navbar-default navbar-fixed-top navcolor" role="navigation">
        <div class="container wrapper">
            <div class="navbar-header">
                <a href="${pageContext.servletContext.contextPath}" class="navbar-brand navbrand"><img id="img-brand" src="${pageContext.request.contextPath}/resources/images/logo.png" alt="J2EEWeb"></a>
            </div>
            <form class="navbar-form navbar-left" role="search">
                <div class="input-group width-search-box">
                    <input type="text" class="form-control" placeholder="Tìm kiếm" name="srch-term" id="srch-term">
                    <div class="input-group-btn">
                        <button class="btn btn-default height-btn" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                    </div>
                </div>
            </form>
            <ul class="nav navbar-nav">
                <li><a href="${pageContext.servletContext.contextPath}" class="btn btn-primary btnprimary" role="button"> Trang chủ</a></li>
                <li>
                    <div class="dropdown custom-dropdown">
                        <button class="btn btn-primary dropdown-toggle btnprimary" type="button" data-toggle="dropdown">Trending
                            <span class="caret"></span></button>
                        <ul class="dropdown-menu">
                            <li><a href="${pageContext.servletContext.contextPath}">Bài viết</a></li>
                            <li><a href="${pageContext.servletContext.contextPath}">Chủ đề</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
            <c:choose>
                <c:when test="${user != null}">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <div class="dropdown">
                                <button class="btn btn-primary" type="button" data-toggle="dropdown" ><span class="glyphicon glyphicon-bell" id="notification"></span></button>
                                <ul class="dropdown-menu" id="dropdown-notification" style="min-width: 100px;">                                                                     

                                </ul> 
                            </div>
                        </li>
                        <li>
                            <div class="dropdown">
                                <button class="btn btn-primary" type="button" data-toggle="dropdown"><span class="glyphicon glyphicon-plus"></span>
                                    <span class="caret"></span></button>
                                <ul class="dropdown-menu">
                                    <li><a href="${pageContext.servletContext.contextPath}">Viết bài mới</a></li>
                                    <li><a href="${pageContext.servletContext.contextPath}">Bài viết đã tạo</a></li>
                                </ul>
                            </div>
                        </li>
                        <li>
                            <div class="dropdown custom-dropdown">
                                <button class="btn btn-primary dropdown-toggle btnprimary" type="button" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>
                                    <span class="caret"></span></button>
                                <ul class="dropdown-menu">
                                    <li><span style="padding-left: 20px; font-weight: bold;">Xin chào, ${user.username}!</span></li>
                                    <li class="divider"></li>
                                    <li><a href="${pageContext.servletContext.contextPath}/profile">Hồ sơ</a></li>
                                    <li class="divider"></li>
                                    <li><a href="${pageContext.servletContext.contextPath}">Tài khoản</a></li>
                                    <li class="divider"></li>
                                    <li><a href="${pageContext.servletContext.contextPath}">Đăng xuất</a></li>
                                    <li class="divider"></li>
                                    <li><a href="${pageContext.servletContext.contextPath}/create-seeking-job">Tạo yêu cầu tìm việc</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </c:when>
                <c:otherwise>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="${pageContext.servletContext.contextPath}/registration" class="btn btn-primary btnprimary"> Đăng ký</a></li>
                        <li><a href="${pageContext.servletContext.contextPath}/login" class="btn btn-primary btnprimary"> Đăng nhập</a></li>
                    </ul>                    
                </c:otherwise>
            </c:choose>
        </div>
    </nav>
</div>
<script>
    $(document).ready(function () {

        $('#notification').click(function () {
            $('#notification').text("");
        });
        if (user != null) {
            var rs = $.ajax({
                url: "${pageContext.request.contextPath}/notification", // path, nếu là query get thì để ở đây luôn
                method: 'get',
                success: function () {
                    // kết quả trả về/ 
                    // đoạn bên dươi thì tùy xử lý
                    var json = $.parseJSON(rs.responseText);
                    if (json.length !== 0) {
                        $('#notification').text(json.length);
                    }

                    json.forEach(function (item, index) {
                        var li = '<li><a href="${pageContext.servletContext.contextPath}/post?id=' + item.postId.id + '">' +
                                '<span style="font-weight: bold; ">' + item.userId.username + '</span>' +
                                ' commented on a post <span style="font-weight: bold;">' + item.postId.title + '</span>' +
                                '</a></li>';
                        $("#dropdown-notification").append(li);
                    });
                }
            });
        }
    });

</script>
<!--</div>-->
