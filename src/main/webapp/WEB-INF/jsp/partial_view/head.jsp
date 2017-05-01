<%-- 
    Document   : head_tag
    Created on : Apr 24, 2017, 4:30:00 PM
    Author     : Stevie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${page-title}</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.blue_grey-blue.min.css" />

    <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>

    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources/css/mystyle.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources/css/post_ui.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" rel="stylesheet"  type="text/css"/>

    <script src="${pageContext.request.contextPath}/resources/jQuery/jquery-3.0.0.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.tmpl.min.js" type="text/javascript"></script>

    <!-- Include Editor style. -->
    <script src="//cdn.ckeditor.com/4.6.2/standard/ckeditor.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Trirong" rel="stylesheet">

    <style>
        body, span, p, h1, h2, h3, h4, h5, h6, textarea, button {
          font-family: 'Trirong', sans-serif;
        }
        
        body {
            background-color: rgb(240, 240, 240);
        }
      
    </style>
</head>
