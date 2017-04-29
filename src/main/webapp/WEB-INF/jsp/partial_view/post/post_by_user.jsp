<%-- 
    Document   : post_by_user
    Created on : Apr 29, 2017, 11:53:58 AM
    Author     : Stevie
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="mdl-card mdl-shadow--2dp right-content-card" id='post-card-byuser'>
    <p class="mdl-card__title mdl-card--border"><b>Bài viết cùng tác giả</b><p>
    <div id="_holder" class="card-holder"> 
        <ul class=" mdl-list" id="post-list-byuser">
        </ul>
    </div>
</div>
<script>
    $(document).ready(function() {
        var post_by_user = $.ajax({
            url : '${pageContext.request.contextPath}/users/${post.userId.id}/posts',
            method: 'GET',
            success :function (){
                var json = $.parseJSON(post_by_user.responseText);
                if (json.length === 0  ){
                    $("#post-card-byuser").hide();
                    return;
                }
                json.forEach(function (item, index){

                    var li =
                        "<li class='mdl-list__item'>" + 
                            "<span class='mdl-list__item-primary-content'>" +
                                "<a href='${pageContext.request.contextPath}/post?id={id}'>" + item.title + "</a>" +
                            "<span>" + 
                        "</li>"; 
                        li = li.replace('{id}',item.id);
                    $('#post-list-byuser').append(li);                         
                   
                });                
            }
        });
    });
</script>
