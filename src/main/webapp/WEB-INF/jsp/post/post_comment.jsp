<%-- 
    Document   : post_comment
    Created on : May 2, 2017, 9:26:21 PM
    Author     : Nguyen Tan Luan
--%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<row class="row-fluid">

    <h2>Leave your comment</h2>

    <div class="add-comment">
        <form action="${pageContext.servletContext.contextPath}/post?id=${post.id}" method="post" class="form-horizontal" id="commentForm" role="form"> 
            <div class="form-group">
                <div class="col-sm-12">
                    <textarea class="form-control" name="comment-content" id="addComment" rows="5"></textarea>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-12">                    
                    <button class="btn btn-success btn-circle text-uppercase" type="submit" id="submitComment"><span class="glyphicon glyphicon-send"></span> Summit comment</button>
                </div>
            </div>            
        </form>
    </div>
</row>
<row class="row-fluid">
    <h2  class="glyphicon glyphicon-comment">Comments(<span>${post.commentCollection.size()}</span>)</h2>
    <div class="comments">                
        <ul class="comment-list ">
            <c:choose>
                <c:when test='${post.commentCollection.isEmpty() == false}'>
                    <row class='row-fluid'>
                        <ul class='mdl-list' id='recent-post-list'>
                            <c:forEach items="${comments}" var="p">
                                <c:set var="comment" value="${p}" scope="request"/>
                                <jsp:include page="../partial_view/comment/comment_card.jsp"/>
                            </c:forEach>
                            <c:remove var="comment"/>                           
                        </ul>
                    </row>                                          
            </c:when>
        </c:choose>  
        </ul> 
    </div>

</row>
