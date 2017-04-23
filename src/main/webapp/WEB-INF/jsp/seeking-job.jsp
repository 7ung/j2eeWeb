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
        <link href="resources/registration/css/registration.css" rel="stylesheet" type="text/css"/>

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
            <div id="imaginary_container"> 
                <form class="input-group stylish-input-group" action="${pageContext.servletContext.contextPath}/seeking-job" method="post">
                   <input type="text" name="password" id="password"  class="form-control" placeholder="Search" value="${searchText}">
                    <span class="input-group-addon">
                        <button type="submit" >
                            <span class="glyphicon glyphicon-search"></span>
                        </button>  
                    </span>
                </form>
            </div>
        </div>
	</div>
<!--       <div>
            <p>abc</p>
  <c:forEach items="${listseekingJob}" var="seekingJob">
    
      <b><c:out value="${seekingJob.minSalary}" /></b>
    <b><c:out value="${seekingJob.maxSalary}" /></b>
  </c:forEach>
       </div>-->
<div
    
    <table>
  <c:forEach items="${listseekingJob}" var="seekingJob">
    <tr>
      <td><c:out value="${seekingJob.minSalary}" /></td>
      <td><c:out value="${seekingJob.maxSalary}" /></td>

    </tr>
  </c:forEach>
    
</table>
</div>

</div>
    </body>
</html>

