<%-- 
    Document   : registration
    Created on : Apr 1, 2017, 9:47:25 AM
    Author     : Stevie
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!--Todo: ràng buộc nhập liệu-->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link href="resources/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="resources/registration/css/registration.css" rel="stylesheet" type="text/css"/>

        <script src="resources/jQuery/jquery-3.0.0.min.js" type="text/javascript"></script>
        <script src="resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="resources/registration/javascript/registration.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <div class="panel panel-login">
                        <c:choose>
                            <c:when test="${startPage == 0}">
                                <c:set var="loginPageStyle" value="display: block;"/>
                                <c:set var="registerPageStyle" value="display: none;"/>
                                <c:set var="loginTitleClass" value="active"/>
                                <c:set var="registerTitleClass" value=""/>
                            </c:when>
                            <c:when test="${startPage == 1}">
                                <c:set var="loginPageStyle" value="display: none;"/>
                                <c:set var="registerPageStyle" value="display: block;"/>
                                <c:set var="loginTitleClass" value=""/>
                                <c:set var="registerTitleClass" value="active"/>                                
                            </c:when>
                        </c:choose>
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-6">
                                    <a href="#" class="${loginTitleClass}" id="login-form-link">Login</a>
                                </div>
                                <div class="col-xs-6">
                                    <a href="#" class="${registerTitleClass}" id="register-form-link">Register</a>
                                </div>
                            </div>
                            <hr>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <form id="login-form" action="${pageContext.servletContext.contextPath}/login" method="post" role="form" style="${loginPageStyle}">
                                        <c:choose>
                                            <c:when test="${startPage == 0}">
                                                <p>${status.message}</p>
                                            </c:when>
                                        </c:choose>
                                        <div class="form-group">
                                            <input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="Username" value="${defUsername}">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password">
                                        </div>
                                        <div class="form-group text-center">
                                            <input type="checkbox" tabindex="3" class="" name="remember" id="remember" modelAttribute="remember">
                                            <label for="remember"> Remember Me</label>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-6 col-sm-offset-3">
                                                    <input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Log In">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="text-center">
                                                        <a href="http://phpoll.com/recover" tabindex="5" class="forgot-password">Forgot Password?</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <form id="register-form" action="${pageContext.servletContext.contextPath}/registration" method="post" role="form" style="${registerPageStyle}">
                                        <c:choose>
                                            <c:when test="${startPage == 1}">
                                                <p>${status.message}</p>
                                            </c:when>
                                        </c:choose>
                                        <div class="form-group">
                                            <input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="Username" value="">
                                        </div>
                                        <div class="form-group">
                                            <input type="email" name="email" id="email" tabindex="1" class="form-control" placeholder="Email Address" value="">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="confirm-password" id="confirm-password" tabindex="2" class="form-control" placeholder="Confirm Password">
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-6 col-sm-offset-3">
                                                    <input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Register Now">
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
