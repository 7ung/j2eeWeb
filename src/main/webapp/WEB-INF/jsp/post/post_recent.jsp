<%-- 
    Document   : post_recent
    Created on : Apr 30, 2017, 11:52:28 PM
    Author     : Stevie
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<c:set var="page-title" value="Developer Hall" scope="request"></c:set>
<html>
    <jsp:include page='../partial_view/head.jsp'/>
    <body>
        <%--Include trang Header--%>
        <jsp:include page="/WEB-INF/jsp/header.jsp"/>
        <jsp:include page='../partial_view/snackbar.jsp'/>
        <jsp:include page='../partial_view/dialog.jsp'/>
        <div class="container-fuild main-container " >
            <row class="row-fluid">
                <div class="col-md-2"  style='background-color: rgb(240, 240, 240)'>
                    <jsp:include page="../partial_view/left_toolbar.jsp"/>
                </div>
                <div class="col-md-7" style="background-color: #fafafa;">
                    <row class='row-fluid'>
                        <ul class='mdl-list col-md-12' id='posts-list-recent'>
                            <c:choose>
                                <c:when test='${posts.hasContent() == true}'>
                                    <row class='row-fluid'>
                                        <ul class='mdl-list' id='recent-post-list'>
                                            <c:forEach items="${posts.content}" var="p">
                                                <c:set var="post" value="${p}" scope="request"/>
                                                <c:set var="mode" value="tag_posts" scope="request"/>
                                                <jsp:include page="../partial_view/post/post_card.jsp"/>
                                            </c:forEach>
                                            <c:remove var="post"/>
                                            <c:remove var="mode"/>

                                        </ul>
                                        <div class="mdl-spinner mdl-js-spinner is-active" id='loadingUI' style="display: none;"></div>
                                        <div class='' id ='load-tracker' style='height: 42px; visibility: hidden;'>
                                        </div>                                            
                                    </row>
                                </c:when>
                            </c:choose>  
                        </ul>
                    </row>   
                </div>
                <div class="col-md-3 right-container">
                    <jsp:include page="../partial_view/right_toolbar.jsp"/>
                </div>
            </row>
        </div>
    </body>
</html>
<jsp:include  page="../partial_view/post/post-card-js-template.jsp"/>
<script src="${pageContext.request.contextPath}/resources/js/load_paging.js" type="text/javascript"></script>
<script>
    
    pagingData = {
        currentPage : ${posts.number},
        pageSize : ${posts.size},
        totalPage : ${posts.totalPages},
        numberOfElement : ${posts.numberOfElements},
        totalElements : ${posts.totalElements},
        hasNext : ${posts.hasNext()},
        isLoading : false
    };
    
    $(document).ready(function (){
        loadPaging($('#load-tracker'), '${pageContext.request.contextPath}/posts-paging',
            function (item){
                $('#post-template').tmpl(item).appendTo('#recent-post-list');
                var _url =  '${pageContext.request.contextPath}/post/{id}/follows'.replace('{id}', item.id);
                var followid ='#post-card-follows-tag_posts-{id}'.replace('{id}',item.id);
                var rs_follow = $.ajax({
                    url: _url,
                    data: {},
                    method: 'GET',
                    success: function (data){
                        $(followid).text(rs_follow.responseText);
                    }
                });
            },
            function (){
                $('#loadingUI').show();
            }, 
            function (){
                $('#loadingUI').hide();
            });
            
            
    });
</script>