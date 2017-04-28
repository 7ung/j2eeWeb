<%-- 
    Document   : left_toolbar
    Created on : Apr 28, 2017, 4:18:15 PM
    Author     : Stevie
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<row class ='row-fluid' id='post-left-toolbar'>
    <div class='border-bottom'>
        <c:choose>
            <c:when test='${user != null}'>
                <button class="mdl-button mdl-js-button mdl-button--secondary left-action-btn">
                    Viết bài mới
                </button>
                <button class="mdl-button mdl-js-button mdl-button--secondary left-action-btn">
                    Bài viết đã tạo
                </button>                 
            </c:when>
        </c:choose>
    </div>
</row>
<row class ='row-fluid' id='post-left-toolbar'>
    <div class='border-bottom'>
        <c:choose>
            <c:when test='${user != null}'>        
                <button class="mdl-button mdl-js-button mdl-button--secondary left-action-btn">
                    Tạo chủ đề mới
                </button>
                <button class="mdl-button mdl-js-button mdl-button--secondary left-action-btn">
                    Chủ đề đã tạo
                </button>  
            </c:when>
        </c:choose>        
    </div>
</row>
