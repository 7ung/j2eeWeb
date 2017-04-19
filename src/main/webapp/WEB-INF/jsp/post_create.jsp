<%-- 
    Document   : create_post
    Created on : Apr 17, 2017, 8:40:25 PM
    Author     : Stevie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <!-- Include Editor style. -->
        
        <!-- Include Editor style. -->
        <script src="//cdn.ckeditor.com/4.6.2/standard/ckeditor.js"></script>
    </head>
    <body>
        <%--<jsp:include page="headerWithoutLogin.jsp"></jsp:include>--%>
        <div class="container">
            <form id="post-form" action="${pageContext.servletContext.contextPath}/post"
                    method="post" role="form"  >

                <div class="form-group">
                    <label for="tilte">Title</label>
                    <input type="text" name="title" id="title" tabindex="1" class="form-control" placeholder="Tilte" value="">
                </div>
                
            	<textarea cols="80" id="editor1" name="editor1" rows="10" ></textarea>
                <input type="hidden" name="content" id="content" tabindex="1" class="form-control" value="">

                <div class="form-group">
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3">
                            <input type="submit" name="submit-btn" id="submit-btn" tabindex="4" class="form-control btn btn-login" value="Publish">
                        </div>
                    </div>
                </div>
                <div>
                    <div id="ar"> </div>
                </div>    
                <div class="form-group">
                    <input type="checkbox" tabindex="5" class="" name="us" id="us" path="us">
                    <label for="remember">Use Parent Subject</label>
                </div>
                    <td>
                        <select name="subjects" id="subjects" >
                            <c:forEach items="${subjects}" var="s">
                                <option value="${s.id}" >
                                    <c:out value="${s.title}"/>
                                </option>
                            </c:forEach>
                        </select>
                    </td>
                <div class="form-group">
                    <input type="checkbox" tabindex="6" class="" name="us" id="us" path="us" >
                    <label for="remember">Use new parent subject</label>
                </div>        
                <div class="form-group">
                    <input name="subjectid" type="hidden" id="subjectid" />
                </div>
                <div class="form-group">
                    <label for="subject-name-new">New Subject Name</label>
                    <input type="text" name="subject-name-new" id="subject-name-new" tabindex="4" class="form-control" placeholder="new subject" value="">
                </div>
            </form>
            <br/>
        </div>
        <p>${message}</p>      
             
    </body>
    <script>var editor1 = CKEDITOR.replace( 'editor1', {
                height: 250
        } );
    $("#ar").html(CKEDITOR.instances.editor1.getData());

    $("#submit-btn").click(function (){
        $("#content").val(CKEDITOR.instances.editor1.getData());
    });
    
    $("#subjectid").val($('#subjects').val());
    $("#subjects").change(function(){
        $("#subjectid").val($('#subjects').val());
    });</script>
</html>
