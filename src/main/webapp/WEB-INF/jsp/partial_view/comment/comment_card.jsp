<%-- 
    Document   : comment_card
    Created on : May 2, 2017, 9:56:44 PM
    Author     : Nguyen Tan Luan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<li class="media media-replied">
    <a class="pull-left" href="#">
        <img class="media-object img-circle" src="https://s3.amazonaws.com/uifaces/faces/twitter/ManikRathee/128.jpg" alt="profile">
    </a>
    <div class="media-body">
        <div class="well well-lg">
            <h4 class="media-heading text-uppercase reviews"><span>${}</span> The Hipster</h4>
            <ul class="media-date text-uppercase reviews list-inline">
                <li class="dd">22</li>
                <li class="mm">09</li>
                <li class="aaaa">2014</li>
            </ul>
            <p class="media-comment">
                Nice job Maria.s
            </p>
            <a class="btn btn-info btn-circle text-uppercase" href="#" id="reply"><span class="glyphicon glyphicon-share-alt"></span> Reply</a>
        </div>              
    </div>
</li>
