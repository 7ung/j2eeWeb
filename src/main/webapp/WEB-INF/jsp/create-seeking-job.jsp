<%-- 
    Document   : create-seeking-job
    Created on : May 8, 2017, 12:43:53 PM
    Author     : quytocngheo
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!--        <head>
        <link href="resources/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="resources/mycss/findjob.css" rel="stylesheet" type="text/css"/>
        <link href="resources/css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="resources/material/material.min.css" type="text/css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        
        

        <script src="resources/material/material.min.js" type="text/javascript"></script>
        <script src="resources/jQuery/jquery-3.0.0.min.js" type="text/javascript"></script>
        <script src="resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="resources/registration/javascript/registration.js" type="text/javascript"></script>
        <script src="resources/js/findjob.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>-->
    <jsp:include page="../jsp/partial_view/head.jsp"/>
    <body>
        <jsp:include page="../jsp/header.jsp"/>
        <div class="container" style ="margin-top: 100px; " >

          <div class="create-seek " style = "float: left;width: 300px;
position: relative;left:0%; transform-origin:center; 
top: 30%;">
              <c:out value="${status}" />
              <form class="input-group stylish-input-group" action="${pageContext.servletContext.contextPath}/create-seeking-job" method="post">
                  <input type="hidden" id="seekCreateID" name="seekCreateID" value="${seekCreateID}" />
                   <div class="input-group input-seek">
              <a class="btn btn-success btn-select" style="padding:0px;margin: 0px;">
                  <input type="hidden" class="btn-select-input" id="developmentType" name="developmentType" id="developmentType" type="hidden" value="${developmentType}" />
                  <span class="btn-select-value"><c:out value="${devLabel}" /></span>
                  <span class='btn-select-arrow glyphicon glyphicon-chevron-down'></span>
                  <ul>
                      <c:forEach items="${developmentTypeCollection}" var="developementType">
                     <li>
                      <c:out value="${developementType.name}" />
                    </li>          
                    </c:forEach> 
                      
                  </ul>
              </a>
            </div>

              <div class="input-group input-seek">
                <span class="input-group-addon" id="basic-addon1" style="width:100px;">Min salary</span>
                <input type="text" name="minSalary" id="minSalary"  class="form-control" placeholder="Dollar" aria-describedby="basic-addon1" value="${minSalary}">
              </div>
              <div class="input-group input-seek">
                <span class="input-group-addon" id="basic-addon1" style="width:100px;">Max salary</span>
                <input type="text" name="maxSalary" id="maxSalary" class="form-control" placeholder="Dollar" aria-describedby="basic-addon1" value="${maxSalary}">
              </div>
              <div class="input-group input-seek">
                <a class="btn btn-success btn-select" style="padding:0px;margin: 0px;">
                    <input type="hidden" class="btn-select-input" id="seniority" name="seniority" id="seniority" type="hidden" value="${seniority}" />
                    <span class="btn-select-value" ><c:out value="${seniorityLabel}" /></span>                
                    <span class='btn-select-arrow glyphicon glyphicon-chevron-down'></span>
                    <ul>
                        <c:forEach items="${seniorities}" var="seniority">
                     <li>
                      <c:out value="${seniority.name}" />
                    </li>          
                    </c:forEach>
                    </ul>
                </a>
              </div>

              <div class="input-group input-seek">
                <span class="input-group-addon" id="basic-addon1" style="width:100px;">Location</span>
                <input type="text" name="location" id="location" class="form-control" placeholder="Location" aria-describedby="basic-addon1"  value="${location}">
              </div>
              
              <div class="form-group">
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3">
                        <input type="submit" name="create" id="create" tabindex="4" class="form-control btn btn-create btn-primary" value="${create}">
                    </div>
                </div>
            </div>
<!--                <form class="input-group stylish-input-group" action="${pageContext.servletContext.contextPath}/create-seeking-job" method="post">
                  
                    <span class="input-group-addon">
                        <button type="submit" >
                            <input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-create btn-primary" value="Log In">
                        </button>  
                    </span>
                </form>-->
              </form>
             
          </div>

<div class="create-seek" style =" width: 600px;padding: 0px; float: right; margin-left: 350px; position:  absolute; margin-bottom: 20px;">
    
     <c:forEach items="${listseekingJob}" var="seekingJob">
<div class="my-seek-card mdl-shadow--3dp" style = "width: 550px;
  height: 200px;
  display: block;
  background-color: #EFF6E6; margin-top: 20px; margin-left: 22px; margin-bottom: 20px;">

                <div style = "  width: 180px; height: 180px; float:left;margin: 10px;">
                  <img src="resources/image/${seekingJob.developmentTypeId.image}" alt="Mountain View" style="width:100%;height:100%;">
                </div>


                <div style = " width: 350px;float:left; padding:10px;">
                  <div style = "  width: 100%; height: 50px;">
                    <span class="job-title">
                      <a class="job-title" href="http://jobseekers.vn/job/senior-android-developer-unity-dev-exp/" title="Senior Android (with Unity exp) Developer" target="_blank" >
                       <c:out value="${seekingJob.developmentTypeId.name}" /></a>
                    </span>
                  </div>

                  <div class="" style = " width:100%;">
                      <div style =" width: 70%;float: left;">
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
                    
                    
                    <div style =" width: 30%; height: 100px;float: right;">
                        <form class="input-group stylish-input-group" action="${pageContext.servletContext.contextPath}/deactive-seeking-job" method="post" style = "width: 100%">
                             <input type="hidden" id="seekID" name="seekID" value="${seekingJob.id}" />
                             <input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-create btn-warning" value="Deactive" style = "height:30px;width: 100%; padding: 0px;background-color: red; border-color: red;">
                        </form>
                        <form class="input-group stylish-input-group" action="${pageContext.servletContext.contextPath}/edit-seeking-job" method="post" style = "width: 100%">
                            <input type="hidden" id="seekID" name="seekID" value="${seekingJob.id}" />
                            <input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-create btn-primary" value="Edit" style = "height:30px;width: 100%; padding: 0px; margin-top: 10px;">
                        </form>
                    </div>
                  </div>
                  <div class="" style="width:100%; margin-top: 20px ">
                    <div class="job-label "   >
                      android
                    </div>
                    <div class="job-label "   >
                      java
                    </div>
                   <c:forEach items="${seekingJob.userId.experienceCollection}" var="experience">
                     <div class="job-label "   >
                      <c:out value="${experience.name}" />
                    </div>           
                    </c:forEach>
                  </div>
                </div>
            </div>
  </c:forEach>
</div>


       </div>

    </body>
</html>
