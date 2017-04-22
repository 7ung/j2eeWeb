<%-- 
    Document   : user_subject_partial
    Created on : Apr 22, 2017, 2:11:24 PM
    Author     : Stevie
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="col-md-3 right-container mdl-card mdl-shadow--2dp">
    <p class="mdl-card__title mdl-card--border"><b>Các chủ đề đã tạo</b><p>
    <div id="_holder"> 
        <ul class=" mdl-list" id="subject_list">
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
                                "<a href='#'>" + item.title + "</a>" +
                            "<span>" + 
                        "</li>"; 
                    $('#subject_list').append(li);
                });
            }
        });
     
</script>
    
