<%-- 
    Document   : post_info
    Created on : Apr 25, 2017, 8:06:25 PM
    Author     : Stevie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<row class="row-fluid" id='post-info-holder'>
    <div class="col-md-3 border-right" id="post-date">
    </div>
    <div class="col-md-2 border-right" id="post-view">
        ${post.view} 
        <i class="fa fa-eye" aria-hidden="true" style="color: rgba(64,64,64,0.8); margin: 2px;"></i>
    </div>
    <div class="col-md-2 border-right" id="post-follow">
        <span id='post-follow-text'>${post.userPostBookmarkCollection.size()} followed</span>
        
        <c:choose>
            <c:when test='${user != null && owner == false}'>
                <button type="button" class="btn small-btn" id="follow-btn">
                    <i class="fa fa-rss" aria-hidden="true" style=" margin: 8px;color: rgba(64,64,64,0.8); margin: 2px;"></i>
                </button>
                <button type="button" class="btn small-btn" id="unfollow-btn">
                    <i class="fa fa-rss-square" aria-hidden="true" style=" margin: 8px;color: rgba(64,64,64,0.8); margin: 2px;"></i>
                </button>                
            </c:when>
        </c:choose>
    </div>

</row> 

<script>
    $(document).ready(function (){
        var dateNumber = ${post.date} * 1000;
        var date = new Date(dateNumber);
        $('#post-date').text(date.toDateString());
        
        $('#post-info-holder :last-child').removeClass('border-right');
        
        checkUserFollowed();
        
        $('#follow-btn').click(followPost);
        $('#unfollow-btn').click(unfollowPost);

    });
    
    function unfollowPost(){
        jQuery.ajax({
            url: "${pageContext.request.contextPath}/post-unfollow", // path, nếu là query get thì để ở đây luôn
            data: {
                id: ${post.id}          // post / put data
            },
            method: 'GET',
            success :function(data){
                // kết quả trả về/ 
                // đoạn bên dươi thì tùy xử lý
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
    
    function followPost(){
        jQuery.ajax({
            url: "${pageContext.request.contextPath}/post-follow",
            data: {
                id: ${post.id}
            },
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
   
    function showFollowButton(){
        $('#follow-btn').show();
        $('#unfollow-btn').hide();
    }
    
    function showUnfollowButton(){
        $('#follow-btn').hide();
        $('#unfollow-btn').show();
    }
    
    function updateCountFollow(){
        jQuery.ajax({
            url: "${pageContext.request.contextPath}/post-count-follow",
            data: {
                id: ${post.id}
            },
            method: 'GET',
            success :function(data){
                $('#post-follow').find('#post-follow-text')[0].innerHTML = data + ' followed';
            } 
        });        
    }
    
    function hideAllFollowButton(){
        $('#follow-btn').hide();
        $('#unfollow-btn').hide();        
    }
</script>
