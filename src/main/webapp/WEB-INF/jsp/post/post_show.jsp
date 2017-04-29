<%-- 
    Document   : post_show
    Created on : Apr 24, 2017, 4:28:16 PM
    Author     : Stevie
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="../partial_view/head.jsp"/>
    <body>
        <jsp:include page='../partial_view/snackbar.jsp'/>
        <jsp:include page='../partial_view/dialog.jsp'/>
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
                        <div class ="col-md-12 post-subtitle" >
                            <c:choose>
                                <c:when test='${post.subjectId != null}'>
                                    <span>
                                        <a href="${pageContext.request.contextPath}/subjects/${post.subjectId.id}" 
                                           class="post-subject">${post.subjectId.title}</a>
                                    </span>  
                                    -                                    
                                </c:when>
                            </c:choose>
                            <span>
                                <a href="#" class="post-author" >${post.userId.profileCollection[0].displayName}</a>
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
 
                            <div class="mdl-card__supporting-text post-content mdl-card--border" 
                                 id="post-content" style="position: relative;" >
                                <c:choose>
                                    <c:when test="${user != null && user.id == post.userId.id}">
                                        <jsp:include page="../partial_view/hover-action-btn.jsp"/>
                                    </c:when>
                                </c:choose>                                
                                <div>${post.content}</div>
                            </div>
                            
                            <div class="mdl-card__supporting-text post-content">
                                <jsp:include page='post_info.jsp'/>
                            </div>                            
                        </div>
                    </row>      
                </div>
                <div class="col-md-3 right-container">
                    <c:choose>
                        <c:when test="${post.subjectId != null}">
                            <jsp:include page="../partial_view/post/post_by_subject.jsp"/>
                        </c:when>
                    </c:choose>
                    <jsp:include page="../partial_view/post/post_by_user.jsp"/>

                    <c:choose>
                        <c:when test="${user != null}">
                            <c:set var="mode" value="created-subject" scope="request"/>
                            <jsp:include page="../partial_view/subject/user_subject_partial.jsp"/>
                        </c:when>
                    </c:choose>
                </div>
            </row>

        </div>
    </body>
    
    <script>
        $(document).ready(function() {
            
            $('#edit-btn').click(function (){
                window.location.replace("${pageContext.request.contextPath}/post-edit?id=${post.id}");
            });
            $('#private-btn').click(unpublishPost);            
            $('#publish-btn').click(publishPost);            
            $('#delete-btn').click(function (){
                openDialog('Bạn có muốn xoá bái viết', 'CÓ', 'KHÔNG', function () {
                    deletePost();
                });
            });
        });
        
        function unpublishPost(){
            var rs = jQuery.ajax({
                url: "${pageContext.request.contextPath}/post-private",
                data: {
                    id: ${post.id}
                },
                method: 'GET',
                success: function (data){
                    var json = $.parseJSON(data);
                    if (data === 200){
                        $('#private-btn').hide();
                        $('#publish-btn').show();
                        showSnackBarInfo('Đã huỷ công khai bài viết');
                    }
                    else {
                        showSnackBarError('Lỗi');
                    }
                }
            });
        }
        function publishPost(){
            var rs = jQuery.ajax({
                url: "${pageContext.request.contextPath}/post-publish",
                data: {
                    id: ${post.id}
                },
                method: 'GET',
                success: function (data){
                    var json = $.parseJSON(data);
                    if (data === 200){
                        $('#private-btn').show();
                        $('#publish-btn').hide();
                        showSnackBarInfo('Đã công khai bài viết');
                    }
                    else {
                        showSnackBarError('Lỗi');
                    }                    
                }
            });
        }        
        
        function deletePost(){
            var rs = jQuery.ajax({
                url: "${pageContext.request.contextPath}/post-delete",
                data: {
                    id: ${post.id}
                },
                method: 'GET',
                success: function (data){
                    var json = $.parseJSON(data);
                    if (data === 200){
                        window.location.replace('${pageContext.request.contextPath}');
                    }
                    else {
                        showSnackBarError('Lỗi');
                    }
                }
            });            
        }
    </script>
</html>
