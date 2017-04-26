<%-- 
    Document   : followed_subject_card
    Created on : Apr 26, 2017, 1:22:39 AM
    Author     : Stevie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<row class='row-fluid'>
    <div class="mdl-card card-stretch card-flat" id='followed-subject-card'  >
        <p class="mdl-card__title mdl-card--border follow-title-color "><b>Các chủ đề được theo dõi</b><p>
        <div id="followed-subject-card-holder" class="" > 
            <row class='row-fluid'>
                <c:forEach items="${followed_subject}" var="s">
                    <c:set var="subject" value="${s}" scope="request"/>                         
                    <c:set var="mode" value="followed" scope="request"/>     
                    <jsp:include page="subject_card.jsp"/>
                </c:forEach>
            </row>
        </div>
    </div>
</row>        
