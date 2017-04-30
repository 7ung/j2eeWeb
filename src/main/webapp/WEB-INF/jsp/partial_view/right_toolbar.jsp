<%-- 
    Document   : right_toolbar
    Created on : Apr 29, 2017, 8:09:19 PM
    Author     : Stevie
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<c:choose>
    <c:when test="${post != null}">
        <c:choose>
            <c:when test="${post.subjectId != null}">
                <jsp:include page="../partial_view/post/post_by_subject.jsp"/>
            </c:when>
        </c:choose>
        <!--post luôn có user nên không cần check user != null-->
        <jsp:include page="../partial_view/post/post_by_user.jsp"/>
        
    </c:when>
</c:choose>

<c:choose>
    <c:when test="${user != null}">
        <c:set var="mode" value="created-subject" scope="request"/>
        <jsp:include page="../partial_view/subject/user_subject_partial.jsp"/>
    </c:when>
</c:choose>
