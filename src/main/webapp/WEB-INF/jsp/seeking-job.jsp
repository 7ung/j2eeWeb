<%-- 
    Document   : seeking-job
    Created on : Mar 9, 2017, 9:53:11 PM
    Author     : quytocngheo
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link href="resources/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="resources/mycss/findjob.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="resources/material/material.min.css" type="text/css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        

        <script src="resources/material/material.min.js" type="text/javascript"></script>
        <script src="resources/jQuery/jquery-3.0.0.min.js" type="text/javascript"></script>
        <script src="resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="resources/registration/javascript/registration.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
	<div class="row">
        <div class="col-sm-6 col-sm-offset-3">
            <div id="imaginary_container" style="margin: 20px;"> 
                <form class="input-group stylish-input-group" action="${pageContext.servletContext.contextPath}/seeking-job" method="post">
                   <input type="text" name="password" id="password"  class="form-control" placeholder="Search" value="${searchText}">
                    <span class="input-group-addon">
                        <button type="submit" >
                            <span class="glyphicon glyphicon-search"></span>
                        </button>                      
                    </span>
<!--<span class="input-group-addon" style = "padding: 0px; background-color: transparent; border: 1px;
border-style: solid;
border-radius: 5px;
border-color: transparent;">
    <button type="submit" class="btn btn-primary">
                        <i class="glyphicon glyphicon-search"></i>
                    </button>
</span>-->
                    
                </form>
            </div>
        </div>
	</div>
<!--       <div>
            <p>abc</p>
  <c:forEach items="${listseekingJob}" var="seekingJob">
    
      
    <div class="demo-card-wide mdl-card mdl-shadow--2dp">
 <b><c:out value="${seekingJob.developmentTypeId.name}" /></b>
    <b><c:out value="${seekingJob.maxSalary}" /></b>
</div>
  </c:forEach>
       </div>-->
<table>
            
             <c:forEach items="${listseekingJob}" var="seekingJob">
    
      
<tr class="item">
              <div class="demo-card-wide mdl-card mdl-shadow--3dp">

                <div style = " background-color:green; width: 180px; height: 180px; float:left;margin: 10px;">
                  <img src="resources/image/android.PNG" alt="Mountain View" style="width:100%;height:100%;">
                </div>


                <div style = " width: 350px;float:left; padding:10px;">
                  <div style = "  width: 100%; height: 50px; ">
                    <span class="job-title">
                      <a class="job-title" href="http://jobseekers.vn/job/senior-android-developer-unity-dev-exp/" title="Senior Android (with Unity exp) Developer" target="_blank" >
                       <c:out value="${seekingJob.developmentTypeId.name}" /></a>
                    </span>
                  </div>

                  <div class="" style = " width:100%;">
                    <span class="salary-text">
                    $  <c:out value="${seekingJob.minSalary}" /> - <c:out value="${seekingJob.maxSalary}" /> USD
                    </span>
                    <span class="salary-text">
                    <c:out value="${seekingJob.seniorityId.name}" />
                    </span>
                    <span class="address-text">
                    <c:out value="${seekingJob.location}" />
                    </span>
                  </div>
                  <div class="" style="width:100%; margin-top: 20px ">
<!--                    <div class="job-label "   >
                      android
                    </div>
                    <div class="job-label "   >
                      java
                    </div>-->
                   <c:forEach items="${seekingJob.userId.experienceCollection}" var="experience">
                     <div class="job-label "   >
                      <c:out value="${experience.name}" />
                    </div>           
                    </c:forEach>
                  </div>
                </div>
            </tr>
  </c:forEach>
          </table>

</div>
    </body>
</html>

