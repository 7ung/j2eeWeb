<%-- 
    Document   : tag_show
    Created on : Apr 29, 2017, 4:24:59 PM
    Author     : Stevie
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                    <row class='row-fluid'>
                        <div class='' style="border-bottom: rgb(51,51,51) 2px inset; position: relative">
                            <h1>#${tag.name}</h1>
                            <button type="button" class="btn my-action-btn" id="unbookmark-btn" style='position: absolute; right: 0px; top: 0px; display: none;'>
                                <i class="fa fa-bookmark-o" aria-hidden="true"  ></i>
                            </button>                                           
                            <div class="mdl-tooltip" data-mdl-for="unbookmark-btn">
                                Click to remove bookmark
                            </div>                                    
                            <button type="button" class="btn my-action-btn" id="bookmark-btn" style='position: absolute; right: 0px; top: 0px; display: none;'>
                                <i class="fa fa-bookmark" aria-hidden="true"  ></i>
                            </button>                                          
                            <div class="mdl-tooltip" data-mdl-for="bookmark-btn">
                                Click to bookmark
                            </div>  
                        </div>
                    </row>
                    <row class='row-fluid'>
                        <ul class='mdl-list col-md-12' id='posts-list-recent'>
                            <c:choose>
                                <c:when test='${posts.hasContent() == true}'>
                                    <row class='row-fluid'>
                                        <ul class='mdl-list' id='recent-post-list'>
                                            <c:forEach items="${posts.content}" var="p">
                                                <c:set var="post" value="${p}" scope="request"/>
                                                <c:set var="mode" value="tag_posts" scope="request"/>
                                                <jsp:include page="partial_view/post/post_card.jsp"/>
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
                    <jsp:include page="partial_view/right_toolbar.jsp"/>
                </div>
            </row>
        </div>
    </body>
</html>
<jsp:include  page="partial_view/post/post-card-js-template.jsp"/>
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
        checkUserFollowed();

        $('#bookmark-btn').click(followSubject);
        $('#unbookmark-btn').click(unfollowSubject);   
        
        loadPaging($('#load-tracker'), '${pageContext.request.contextPath}/tags/${tag.id}/posts',
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
    
    function checkUserFollowed(){
        var followed = ${isFollowed};
        if (followed === true){
            showUnfollowButton();
        }
        else if (followed === false){
            showFollowButton();
        }
        else if (followed === undefined){
            hideAllFollowButton();
        }
    }
    
    function hideAllFollowButton(){
        $('#bookmark-btn').hide();
        $('#unbookmark-btn').hide();
    }
    
    function showFollowButton(){
        $('#bookmark-btn').show();                
        $('#unbookmark-btn').hide();        
    }
    
    function showUnfollowButton(){
        $('#bookmark-btn').hide();
        $('#unbookmark-btn').show();
    }
    
    function followSubject(){
        var follow = jQuery.ajax({
            url: "${pageContext.request.contextPath}/tags/${tag.id}/follow",
            data: {},
            method: 'GET',
            success :function(data){
                if (data === 200){
                    showUnfollowButton();
                }
                else {
                    showFollowButton();
                }
            } 
        });        
    }
    
    function unfollowSubject(){
        var unfollow = jQuery.ajax({
            url: "${pageContext.request.contextPath}/tags/${tag.id}/unfollow",
            data: {},
            method: 'GET',
            success :function(data){
                if (data === 200){
                    showFollowButton();
                }
                else {
                    showUnfollowButton();
                }
            } 
        });        
    }    
</script>
