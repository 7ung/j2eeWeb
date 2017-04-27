<%-- 
    Document   : user_subject_partial
    Created on : Apr 22, 2017, 2:11:24 PM
    Author     : Stevie
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="mdl-card mdl-shadow--2dp">
    <p class="mdl-card__title mdl-card--border"><b>Các chủ đề đã tạo</b><p>
    <div id="_holder" class="card-holder"> 
        <ul class=" mdl-list" id="subject-list-${mode}">
        </ul>
    </div>
</div>

<script>
    var userId = "${user.id}";
    var rs = jQuery.ajax(
        {
        url: "${pageContext.request.contextPath}/user-info/subject",
        data: {
            user_id: userId
        },
        method: "GET",
        success:function(data){
            var json = $.parseJSON(rs.responseText);
            json.forEach(function (item, index){
                    var li =
                        "<li class='mdl-list__item'>" + 
                            "<span class='mdl-list__item-primary-content'>" +
                                "<a href='${pageContext.request.contextPath}/subjects/{id}'>" + item.title + "</a>" +
                            "<span>" + 
                        "</li>"; 
                        li = li.replace('{id}',item.id);
                    $('#subject-list-${mode}').append(li);
                });
            }
        });
     
</script>
    
