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
        <div class="container-fuild main-container ">
            <row class="row-fluid">
                <div class="col-md-2" style="background-color: #adadad;">
                    <div style ="background-color: #5bc0de; height: 200px;" >
                    </div>
                </div>
                <div class="col-md-7" style="background-color: #fafafa;">
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
                    <c:choose>
                        <c:when test="${user != null}">
                            <jsp:include page="partial_view/subject/user_subject_partial.jsp"/>
                        </c:when>
                    </c:choose>
                </div>
            </row>
        </div>
    </body>
</html>
