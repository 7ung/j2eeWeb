<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<c:set var="page-title" value="Developer Hall" scope="request"></c:set>
<html>
    <jsp:include page='partial_view/head.jsp'/>
    <body>
        <%--Include trang Header--%>
        <jsp:include page="/WEB-INF/jsp/header.jsp"/>
        <jsp:include page='partial_view/snackbar.jsp'/>
        <jsp:include page='partial_view/dialog.jsp'/>
        <div class="container-fuild main-container " >
            <row class="row-fluid">
                <div class="col-md-2"  style='background-color: rgb(240, 240, 240)'>
                    <jsp:include page="partial_view/left_toolbar.jsp"/>
                </div>
                <div class="col-md-7" style="background-color: #fafafa;">
                    <jsp:include page="home/recent_post.jsp"/>
                    <c:choose>
                        <c:when test="${featured_subject != null && featured_subject.size() != 0}">
                            <jsp:include page="partial_view/subject/featured_subject_card.jsp"/>
                        </c:when>
                    </c:choose> 
                    <c:choose>
                        <c:when test="${user != null && followed_subject != null && followed_subject.size() != 0}">
                            <jsp:include page="partial_view/subject/followed_subject_card.jsp"/>
                        </c:when>
                    </c:choose>                   
                </div>
                <div class="col-md-3 right-container">
                    <jsp:include page="partial_view/right_toolbar.jsp"/>
                </div>
            </row>
        </div>
    </body>
</html>
