<%-- 
    Document   : notification_card
    Created on : May 24, 2017, 10:06:44 PM
    Author     : Nguyen Tan Luan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<div class="well-lg notification" style="width: 100px; height: 30px">
    <li><a href="#"><c:out value="${comment.userId.username}"/> commented on a post<c:out value="${comment.postId.title}"/> </a></li>
</div>
