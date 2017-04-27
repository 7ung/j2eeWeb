<%-- 
    Document   : featured_subject_card
    Created on : Apr 27, 2017, 12:52:18 AM
    Author     : Stevie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<row class='row-fluid'>
    <div class="mdl-card card-stretch card-flat" id='featured-subject-card'  >
        <p class="mdl-card__title mdl-card--border featured-title-color top-title "><b>Top chủ đề nổi bật</b><p>
        <div id="featured-subject-card-holder" class="" > 
            <row class='row-fluid'>
                <c:forEach items="${featured_subject}" var="s">
                    <c:set var="subject" value="${s}" scope="request"/>                         
                    <c:set var="mode" value="featured" scope="request"/>     
                    <jsp:include page="subject_card.jsp"/>
                </c:forEach>
            </row>
        </div>
    </div>
</row>    
