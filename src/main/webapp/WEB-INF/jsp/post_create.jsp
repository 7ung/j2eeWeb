<%-- 
    Document   : create_post
    Created on : Apr 17, 2017, 8:40:25 PM
    Author     : Stevie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/resources/css/mystyle.css" rel="stylesheet" type="text/css"/>
        
        <script src="${pageContext.request.contextPath}/resources/jQuery/jquery-3.0.0.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        
    </head>
    <body>
        <%--<jsp:include page="headerWithoutLogin.jsp"></jsp:include>--%>
        <div class="container">
            <form id="login-form" action="${pageContext.servletContext.contextPath}/"
                    method="post" role="form" >

                <div class="form-group">
                    <label for="tilte">Title</label>
                    <input type="text" name="title" id="title" tabindex="1" class="form-control" placeholder="Tilte" value="">
                </div>

            </form>

        </div>
             
    </body>
</html>
