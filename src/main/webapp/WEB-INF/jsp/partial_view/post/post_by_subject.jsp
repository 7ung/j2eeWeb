<%-- 
    Document   : post_by_subject
    Created on : Apr 29, 2017, 11:17:18 AM
    Author     : Stevie
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="mdl-card mdl-shadow--2dp right-content-card" id='post-card-insubject'>
    <p class="mdl-card__title mdl-card--border"><b>Bài viết cùng chủ đề</b><p>
    <div id="_holder" class="card-holder"> 
        <ul class=" mdl-list" id="post-list-insubject">
        </ul>
    </div>
</div>
<script>
    $(document).ready(function (){
        var rs = $.ajax({
            url: '${pageContext.request.contextPath}/subjects/${post.subjectId.id}/posts',
            method: 'get',
            success : function (){
                var json = $.parseJSON(rs.responseText);
                if (json.length === 0 || (json.length === 1 && json[0].id === ${post.id}) ){
                    $("#post-card-insubject").hide();
                    return;
                }
                json.forEach(function (item, index){
                    var existsPostId = ${post.id};
                    if (item.id !== existsPostId){
                        var li =
                            "<li class='mdl-list__item'>" + 
                                "<span class='mdl-list__item-primary-content'>" +
                                    "<a href='${pageContext.request.contextPath}/post?id={id}'>" + item.title + "</a>" +
                                "<span>" + 
                            "</li>"; 
                            li = li.replace('{id}',item.id);
                        $('#post-list-insubject').append(li);                         
                    }
                   
                });
            }
        });
    });
</script>