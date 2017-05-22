<%-- 
    Document   : profile
    Created on : Apr 19, 2017, 12:48:34 AM
    Author     : huynphu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Cập nhật profile | J2EE | SE313H21 </title>

        <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/resources/css/mystyle.css" rel="stylesheet" type="text/css"/>
        
        <script src="${pageContext.request.contextPath}/resources/jQuery/jquery-3.0.0.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha256-3dkvEK0WLHRJ7/Csr0BZjAWxERc5WH7bdeUya2aXxdU= sha512-+L4yy6FRcDGbXJ9mPG8MT/3UCDzwR9gPeyFNMCtInsol++5m3bk2bXWKdZjvybmohrAsn3Ua5x8gfLnbE1YkOg==" crossorigin="anonymous">
        <!-- Bootstrap CSS -->
	<!--<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha256-7s5uDGW3AHqw6xtJmNNtr+OBRJUlgkNJEo78P4b0yRw= sha512-nNo+yCHEyn0smMxSswnf/OnX6/KwJuZTlNZBjauKhTK0c+zT+q5JOCx0UFhXQ6rJR9jg6Es8gPuD2uZcYDLqSw==" crossorigin="anonymous">-->
	<!-- Latest compiled and minified JavaScript -->
	<!--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>-->
        
        <!-- Custom CSS -->
        <style>
            body {
                padding-top: 70px;
                /* Required padding for .navbar-fixed-top. Remove if using .navbar-static-top. Change if height of navigation changes. */
            }

            .othertop{margin-top:10px;}
        </style>
    </head>
    <body>       
        <div class="container">
            <div class="row">
                <%--Include trang Header--%>
                <jsp:include page="/WEB-INF/jsp/header.jsp"/>

                <legend style="font-size: 40px; font-weight: bold;">Hồ sơ của bạn</legend>
                <div class="col-md-7 col-lg-7">
                    <form class="form-horizontal">
                        <!-- Các form nhập thông tin-->
			<fieldset>
                            <!-- Họ và tên-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="Full name">Full name</label>
                                <div class="col-md-3">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-user"></i>
                                        </div>
                                        <input id="Full name" name="Full name" type="text" placeholder="Full name" class="form-control input-md">
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Ngày sinh-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="Date Of Birth">Ngày sinh</label>
                                <div class="col-md-3">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-birthday-cake"></i>
                                        </div>
                                        <input id="Date Of Birth" name="Date Of Birth" type="text" placeholder="Date Of Birth" class="form-control input-md">
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Giới tính -->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="Gender">Giới tính</label>
                                <div class="col-md-3"> 
                                    <label class="radio-inline" for="Gender-0">
                                        <input type="radio" name="Gender" id="Gender-0" value="1" checked="checked">Nam
                                    </label> 
                                    <label class="radio-inline" for="Gender-1">
                                        <input type="radio" name="Gender" id="Gender-1" value="2">Nữ
                                    </label>
                                </div>
                            </div>
                            
                            <!--Địa chỉ-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="Address">Địa chỉ</label>  
                                <div class="col-md-3">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="glyphicon glyphicon-map-marker"></i>
                                        </div>
                                        <input id="Address" name="Address" type="text" placeholder="Địa chỉ" class="form-control input-md"> 
                                    </div> 
                                </div>
                            </div>
                            
                            <!--Quốc gia-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="Country">Quốc gia</label>  
                                <div class="col-md-3">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="glyphicon glyphicon-star"></i>
                                        </div>
                                        <input id="Country" name="Country" type="text" placeholder="Quốc gia" class="form-control input-md">
                                    </div> 
                                </div>
                            </div>
                            
                            <!-- Primary Occupation-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="Primary Occupation">Primary Occupation</label>  
                                <div class="col-md-3">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-briefcase"></i>
                                        </div>
                                        <input id="Primary Occupation" name="Primary Occupation" type="text" placeholder="Primary Occupation" class="form-control input-md">
                                    </div> 
                                </div>
                            </div>
                            
                            <!-- Secondary Occupation (if any-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="Secondary Occupation (if any)">Secondary Occupation (if any)</label>  
                                <div class="col-md-3">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-briefcase"></i>
                                        </div>
                                        <input id="Secondary Occupation" name="Secondary Occupation (if any)" type="text" placeholder="Secondary Occupation" class="form-control input-md">
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Skills-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="Skills">Skills</label>  
                                <div class="col-md-3">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-graduation-cap"></i>
                                        </div>
                                        <input id="Skills" name="Skills" type="text" placeholder="Skills" class="form-control input-md">
                                    </div> 
                                </div>
                            </div>

                            <!-- Working Experience-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="Working Experience (time period)">Kinh nghiệm làm việc</label>  
                                <div class="col-md-3">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-clock-o"></i>
                                        </div>
                                        <input id="Working Experience" name="Working Experience" type="text" placeholder="Enter time period " class="form-control input-md">	   
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Email Address-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="Email Address">Địa chỉ Email</label>  
                                <div class="col-md-3">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-envelope-o"></i>
                                        </div>
                                        <input id="Email Address" name="Email Address" type="text" placeholder="Email Address" class="form-control input-md">
                                    </div>
                                </div>
                            </div>
                            
                            <!-- About -->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="About">About</label>
                                <div class="col-md-3">                     
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="glyphicon glyphicon-exclamation-sign"></i>
                                        </div>
                                        <textarea class="form-control" rows="10"  id="About" name="About"></textarea>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Update profile button-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" ></label>  
                                <div class="col-md-3">
                                    <a href="#" class="btn btn-success"><span class="glyphicon glyphicon-thumbs-up"></span> Cập nhật</a>  
                                </div>
                            </div>
                            
                        </fieldset>
                    </form>
                </div>
                
                <!-- Upload avartar -->
                <div class="col-md-5 col-lg-5"> 
                    <div class="form-group">
                        <!-- <label class="col-md-3 control-label" for="Upload photo">Tải lên avartar</label> -->
                        <div class="col-md-5">
                            <img src="${pageContext.request.contextPath}/resources/images/avatar.jpg" class="img-responsive img-thumbnail">
                            <input id="Upload photo" name="Upload photo" class="input-file" type="file">
                        </div>
                    </div>
                </div>
            </div><!--End row-->
        </div><!--End container-->
    </body>
</html>
