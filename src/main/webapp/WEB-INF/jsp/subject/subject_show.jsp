<%-- 
    Document   : subject_show
    Created on : Apr 27, 2017, 12:47:24 PM
    Author     : Stevie
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page='../partial_view/head.jsp'/>    
    <body>
        <div class="container-fuild main-container ">
            <row class="row-fluid">
                <div class="col-md-2" style="background-color: #adadad;">
                    <div style ="background-color: #5bc0de; height: 200px;" >
                    </div>
                </div>
                <div class="col-md-7" style="background-color: #fafafa;">
                    <row class="row-fluid">
                        <h1 class="post-title" >
                            ${subject.title}
                        </h1>
                    </row>
                    <row class="row-fluid">
                        <div class ="col-md-12 post-subtitle" >
                            <span>
                                <a herf="#" class="post-author" >${subject.userId.profileCollection[0].displayName}</a>
                            </span>
                        </div>
                    </row> 
                    <row class='row-fluid'>
                        <c:choose>
                            <c:when test="${subject.description != ''}">
                                <div class='col-md-12 subject-description-box' >
                                    <span>${subject.description}</span>
                                </div>                                
                            </c:when>
                        </c:choose>
                    </row>
                    <row class='row-fluid'>
                        <ul class='mdl-list' id='posts-list-subject-${subject.id}'>
                            
                            <c:forEach items="${subject.postCollection}" var="p">
                                <c:set var="post" value="${p}" scope="request"/>
                                <c:set var="mode" value="subject${subject.id}" scope="request"/>
                                <jsp:include page="../partial_view/post/post_card.jsp"/>
                            </c:forEach>
                        </ul>
                    </row>
                </div>
                <div class="col-md-3 right-container">
                    <div style ="background-color: #5bc0de; height: 200px;" >
                    </div>  
                </div>
            </row>
        </div>
    </body>
</html>

