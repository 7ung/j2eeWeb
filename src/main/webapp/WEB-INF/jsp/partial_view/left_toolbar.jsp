<%-- 
    Document   : left_toolbar
    Created on : Apr 28, 2017, 4:18:15 PM
    Author     : Stevie
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<row class ='row-fluid' id='post-left-toolbar'>
    <div class='border-bottom'>
        <c:choose>
            <c:when test='${user != null}'>
                <button class="mdl-button mdl-js-button mdl-button--secondary left-action-btn" onclick="redirectToCreatePost()">
                    Viết bài mới
                </button>
                <button class="mdl-button mdl-js-button mdl-button--secondary left-action-btn">
                    Bài viết đã tạo
                </button>  
            </c:when>
        </c:choose>
        <button class="mdl-button mdl-js-button mdl-button--secondary left-action-btn" onclick="redirectToRecentPost()">
            Bài viết mới nhất
        </button>  
    </div>
</row>
<c:choose>
    <c:when test='${user != null}'>   
        <row class='row-fluid'>
            <div id ='users-tags-collection'>
                <h5><b>Tags</b> </h5>
            </div>
        </row>
        <script>
                
        $(document).ready(function (){
            var tags = $.ajax({
                url: '${pageContext.request.contextPath}/user/${user.id}/tags',
                method: "get",
                success : function (){
                    var json = $.parseJSON(tags.responseText);
                    json.forEach(function (item, index){
                        var x ="<button class='mdl-button mdl-js-button mdl-button--secondary left-action-btn'>" +
                    item.name +
                    "</button>";
                        $('#users-tags-collection').append(x);
                        $('#users-tags-collection :last-child').click(function (){
                            window.location = "${pageContext.request.contextPath}/tags/" + item.id;
                        });
                    });
                }
            });
        });
        </script>
    </c:when>
</c:choose> 
<script>
    function redirectToCreatePost(){
        window.location = "${pageContext.request.contextPath}/post";
    }
    
    function redirectToRecentPost(){
        window.location = "${pageContext.request.contextPath}/recent";
    }

</script>
