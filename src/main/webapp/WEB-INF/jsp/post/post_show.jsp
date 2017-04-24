<%-- 
    Document   : post_show
    Created on : Apr 24, 2017, 4:28:16 PM
    Author     : Stevie
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="../partial_view/head.jsp"/>
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
                            ${post.title}
                        </h1>
                    </row>
                    <row class="row-fluid">
                        <div class ="col-md-9 post-subtitle" >
                            <span style="">
                                <a herf="#" class="post-subject">
                                    ${post.subjectId.title}
                                </a>
                            </span>  
                            -
                            <span>
                                <a herf="#" class="post-author" >${post.userId.profileCollection[0].displayName}</a>
                            </span>
                        </div>
                    </row>         
                    <row class="row-fuild">
                        <div class="mdl-card" id="tags-box" style="width: 100%; min-height: 0px; margin-top: 8px; margin-bottom: 16px;
                             box-shadow: inset 0px 0px 2px 2px #60dda6;">
                            <div class="mdl-card__supporting-text" id="tags-box-holder" style="width: 100%;">
                                <c:forEach items="${post.tagCollection}" var="tag">
                                    <span class='mdl-chip mdl-chip--deletable  mdl-shadow--2dp my-mdl-chip'
                                          id="${tag.id}">
                                        <span class='mdl-chip__text'><c:out value="${tag.name}"/></span>
                                    </span>                                    
                                </c:forEach>
                            </div>
                        </div>            
                    </row>
                    <row class="row-fluid">
                        <div class="demo-card-wide mdl-card mdl-shadow--2dp post-main" >
                            <div class="mdl-card__supporting-text post-content mdl-card--border" id="post-content">
                                ${post.content}
                            </div>
                            
                            <div class="mdl-card__supporting-text post-content">
                                <row class="row-fluid">
                                    <div class="col-md-3 border-right" id="post-date">
                                    </div>
                                    <div class="col-md-2" id="post-view">
                                        ${post.view} 
                                        <i class="fa fa-eye" aria-hidden="true" style="color: rgba(64,64,64,0.8); margin: 2px;"></i>
                                    </div>
                                </row> 
                            </div>                            
                        </div>
                    </row>
                                
                </div>
                <jsp:include page="../partial_view/subject/user_subject_partial.jsp"/>
            </row>

        </div>
    </body>
    
    <script>
        $(document).ready(function() {
            var dateNumber = ${post.date} * 1000;
            var date = new Date(dateNumber);
//            $('#post-date').innerHTML = date.toString();           
            $('#post-date').text(date.toDateString());
        });
    </script>
</html>
