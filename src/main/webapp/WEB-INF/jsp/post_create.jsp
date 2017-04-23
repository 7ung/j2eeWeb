<%-- 
    Document   : create_post
    Created on : Apr 17, 2017, 8:40:25 PM
    Author     : Stevie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@taglib uri="/struts-tags" prefix="s"%>--%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.blue_grey-blue.min.css" />

        <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>

        <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/resources/css/mystyle.css" rel="stylesheet" type="text/css"/>
        
        <script src="${pageContext.request.contextPath}/resources/jQuery/jquery-3.0.0.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        
        <!-- Include Editor style. -->
        <script src="//cdn.ckeditor.com/4.6.2/standard/ckeditor.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Trirong" rel="stylesheet">
        <style>
            body {
              font-family: 'Trirong', sans-serif;
            }
            span {
                font-family: 'Trirong', sans-serif;
            }
        </style>
    </head>
    <body>
        <%--<jsp:include page="headerWithoutLogin.jsp"></jsp:include>--%>
        <div class="container-fuild" style="margin-left: 4%; margin-right:4%;" >
            <row class="row-fluid">
                <div class="col-md-2" style="background-color: #adadad;">
                    <div style ="background-color: #5bc0de; height: 200px;" >

                    </div>
                </div>
                <div class="col-md-7" style="background-color: #fafafa;">

                    <row class="row">
                        <form id="post-form" action="${pageContext.servletContext.contextPath}/post"
                                method="post" role="form"  >
                            <jsp:include page="partial_view/search_autocomplete.jsp"/>

                            <div class="form-group">
                                <input name="subject-id" type="hidden" id="subject-id" />
                            </div>

                            <div class="form-group">
                                <label for="tilte">Tiêu đề</label>
                                <input type="text" name="title" id="title" tabindex="2" class="form-control" placeholder="Tilte" value="">
                            </div>
                            
                            <jsp:include page="partial_view/tags_partial.jsp"></jsp:include>
                            
                            <textarea cols="80" id="editor1" name="editor1" rows="10" ></textarea>
                            <input type="hidden" name="content" id="content" tabindex="4" class="form-control" value="">

                            <div class="form-group">
                                <div class="row">
                                    <div class="col-sm-6 col-sm-offset-3">
                                        <input type="submit" name="submit-btn" id="submit-btn" tabindex="5" class="form-control btn btn-login" value="Publish">
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div id="ar"> </div>
                            </div>    
                        </form>                    
                    </row>
                </div>
                <jsp:include page="partial_view/user_subject_partial.jsp"/>

            </row>
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
    
    $('#post-form').submit(function (){
        $("#subject-id").val(getSubjectId());
        return true;
    });
    

    </script>
</html>
