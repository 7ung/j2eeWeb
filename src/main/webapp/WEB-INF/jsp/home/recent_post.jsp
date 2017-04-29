<%-- 
    Document   : recent_post
    Created on : Apr 29, 2017, 2:06:12 PM
    Author     : Stevie
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<row class='row-fluid'>
    <div class="mdl-card card-stretch card-flat" id='recent-post-card' style='padding-left: ' >
        <p class="mdl-card__title mdl-card--border featured-title-color top-title "><b>Bài viết mới nhất</b><p>
        <div id="featured-subject-card-holder" class="" > 
            <row class='row-fluid'>
                <ul class='mdl-list col-md-12' id='posts-list-recent'>
                    <c:choose>
                        <c:when test='${recent_post.isEmpty() == false}'>
                            <row class='row-fluid'>
                                <ul class='mdl-list' id='recent-post-list'>
                                    <c:forEach items="${recent_post}" var="p">
                                        <c:set var="post" value="${p}" scope="request"/>
                                        <c:set var="mode" value="recent_post" scope="request"/>
                                        <jsp:include page="../partial_view/post/post_card.jsp"/>
                                    </c:forEach>
                                </ul>
                            </row>
                        </c:when>
                    </c:choose>  
                </ul>
            </row>
        </div>
    </div>
</row> 
<script>
    $(document).ready(function  (){

    });
</script>