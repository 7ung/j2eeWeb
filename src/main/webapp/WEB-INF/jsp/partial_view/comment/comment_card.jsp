<%-- 
    Document   : comment_card
    Created on : May 2, 2017, 9:56:44 PM
    Author     : Nguyen Tan Luan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<div class="comment-body">
    <div class="col-md-12 well well-lg">
        <div class="col-md-12">
        <h4 class="col-md-8"><span></span> ${comment.userId}</h4>
        <ul class="col-md-4 text-uppercase reviews list-inline">
            <li class="dd">22</li>
            <li class="mm">09</li>
            <li class="aaaa">2014</li>
            <li class="date">${comment.date}</li>
        </ul>
        </div>
        <div class="well well-lg">
        <p class="media-comment">
        ${comment.content}
        </p>
        <!--            <a class="btn btn-info btn-circle text-uppercase" href="#" id="reply"><span class="glyphicon glyphicon-share-alt"></span> Reply</a>-->
        </div>   
    </div>
    
    
</div>

