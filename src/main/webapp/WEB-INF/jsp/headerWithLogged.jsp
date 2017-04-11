<%-- 
    Document   : headerWithLogged
    Created on : Apr 9, 2017, 9:42:18 PM
    Author     : huynphu
--%>
<%--Header khi đăng nhập thành công--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Header With Logged - J2EE Website</title>
        
        <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/resources/css/mystyle.css" rel="stylesheet" type="text/css"/>
        
        <script src="${pageContext.request.contextPath}/resources/jQuery/jquery-3.0.0.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="container-fluid">
            <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
                <div class="container">
                    <div class="navbar-header">
                        <a href="${pageContext.servletContext.contextPath}" class="navbar-brand"><img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="J2EEWeb"></a>
                    </div>
                    <form class="navbar-form navbar-left" role="search">
                            <div class="input-group ">
                                <input type="text" class="form-control" placeholder="Tìm kiếm" name="srch-term" id="srch-term">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                                </div>
                            </div>
                    </form>
                    <ul class="nav navbar-nav">
                      <li><a href="#" class="btn btn-primary" role="button"> Trang chủ</a></li>
                      <li>
                            <div class="dropdown">
                              <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Trending
                              <span class="caret"></span></button>
                              <ul class="dropdown-menu">
                                <li><a href="${pageContext.servletContext.contextPath}">Bài viết</a></li>
                                <li><a href="${pageContext.servletContext.contextPath}">Chủ đề</a></li>
                              </ul>
                            </div>
                      </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="${pageContext.servletContext.contextPath}/registration" class="btn btn-primary"> Đăng ký</a></li>
                      <li><a href="${pageContext.servletContext.contextPath}/login" class="btn btn-primary"> Đăng nhập</a></li>
                    </ul>
                </div>
            </nav>
        </div>
    </body>
</html>
