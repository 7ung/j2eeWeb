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
        <jsp:include page='../partial_view/snackbar.jsp'/>
        <jsp:include page='../partial_view/dialog.jsp'/>        
        <div class="container-fuild main-container ">
            <row class="row-fluid">
                <div class="col-md-2" style="background-color: #adadad;">
                    
                </div>
                <div class="col-md-7" style="background-color: #fafafa;" >
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
                    <c:choose>
                        <c:when test='${subject.postCollection.isEmpty() == false}'>
                            <row class='row-fluid'>
                                <ul class='mdl-list' id='posts-list-subject-${subject.id}'>
                                    <c:forEach items="${subject.postCollection}" var="p">
                                        <c:set var="post" value="${p}" scope="request"/>
                                        <c:set var="mode" value="subject${subject.id}" scope="request"/>
                                        <jsp:include page="../partial_view/post/post_card.jsp"/>
                                    </c:forEach>
                                </ul>
                            </row>
                        </c:when>
                    </c:choose>
                    <row class='row-fluid'>
                        <div class='col-md-12 float-right-box' >
                            <div class='float-right-content small-text' id="subject-info-box">
                                <span class='border-right float-right-item' id='subject-date' ></span>
                                <span class='float-right-item' id='subject-follows-count'></span>
                                <c:choose>
                                    <c:when test='${user != null && owner == false}'>
                                        <span class='float-right-item border-right'>                
                                            <button type="button" class="btn small-btn" id="follow-btn">
                                                <i class="fa fa-rss" aria-hidden="true" style=" margin: 8px;color: rgba(64,64,64,0.8); margin: 2px;"></i>
                                            </button>
                                            <button type="button" class="btn small-btn" id="unfollow-btn">
                                                <i class="fa fa-rss-square" aria-hidden="true" style=" margin: 8px;color: rgba(64,64,64,0.8); margin: 2px;"></i>
                                            </button>     
                                        </span>
                                    </c:when>
                                    <c:when test='${user != null && owner == true}'>
                                        <button type="button" class="btn my-action-btn" id="edit-btn">
                                            <i class="fa fa-pencil-square-o" aria-hidden="true"  ></i>
                                        </button>                                        
                                        <button type="button" class="btn my-action-btn" id="delete-btn">
                                            <i class="fa fa-trash" aria-hidden="true"  ></i>
                                        </button> 
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>
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

<script>
    $(document).ready(function (){
        hideAllFollowButton();

        var dateNumber = ${subject.date} * 1000;
        var date = new Date(dateNumber);
        $('#subject-date').text(date.toDateString());
        
        checkUserFollowed();
        updateCountFollow();

        $('#follow-btn').click(followSubject);
        $('#unfollow-btn').click(unfollowSubject);
        
        $('#subject-info-box :last-child').removeClass('border-right');

        $('#delete-btn').click(function (){
            openDialog('Bạn có muốn xoá bái viết', 'CÓ', 'KHÔNG', function () {
                deleteSubject();
            });
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
    
    function followSubject(){
        jQuery.ajax({
            url: "${pageContext.request.contextPath}/subject/${subject.id}/follow",
            data: {},
            method: 'GET',
            success :function(data){
                if (data === 200){
                    showUnfollowButton();
                }
                else {
                    showFollowButton();
                }
                updateCountFollow();                   
            } 
        });        
    }
    
    function unfollowSubject(){
        jQuery.ajax({
            url: "${pageContext.request.contextPath}/subject/${subject.id}/unfollow",
            data: {},
            method: 'GET',
            success :function(data){
                if (data === 200){
                    showFollowButton();
                }
                else {
                    showUnfollowButton();
                }
                updateCountFollow();                
            } 
        });                
    }
    
    function hideAllFollowButton(){
        $('#follow-btn').hide();
        $('#unfollow-btn').hide();
    }
    
    function showFollowButton(){
        $('#follow-btn').show();                
        $('#unfollow-btn').hide();        
    }
    
    function showUnfollowButton(){
        $('#follow-btn').hide();
        $('#unfollow-btn').show();
    }
    
    function updateCountFollow(){
        var f = jQuery.ajax({
            url: "${pageContext.request.contextPath}/subject-follows",
            data: {
                id: ${subject.id}
            },
            method: 'GET',
            success :function(data){
                $('#subject-follows-count').text(f.responseText + ' followed');
            } 
        });        
    }
    
    function deleteSubject(){
        rs = $.ajax({
            url: '${pageContext.request.contextPath}/subjects/${subject.id}/del',
            data: {},
            method: 'GET',
            success : function (data){
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
    