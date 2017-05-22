<%-- 
    Document   : comment_card
    Created on : May 2, 2017, 9:56:44 PM
    Author     : Nguyen Tan Luan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<div class="comment-body">
    <div class="col-md-12 well well-lg">
        <div class="col-md-12">

            <h4 class="col-md-8"><span></span> <c:out value="${comment.userId.username}"/></h4>
            <div class="col-md-4" id="commnent-date-${comment.id}">
                
            </div>
        </div>
        <div class="well well-lg">
            <p class="media-comment">
                <c:out value="${comment.id}"/>
                <c:out value="${comment.content}"/>
            </p>
            <!--            <a class="btn btn-info btn-circle text-uppercase" href="#" id="reply"><span class="glyphicon glyphicon-share-alt"></span> Reply</a>-->
        </div>
        <c:choose> 
            <c:when test='${user!=null && user.id == comment.userId.id}'>
                <div class="form-group">
                    <div class="col-sm-2">                    
                        <button class="btn btn-default btn-circle text-uppercase " aria-hidden="true" type="submit" id="edit-comment-${comment.id}"><span class="glyphicon glyphicon-edit"></span> Edit</button>
                    </div>
                    <div class="col-sm-2">                    
                        <button class="btn btn-danger bt n-circle text-uppercase" aria-hidden="true" type="submit" id="delete-comment-${comment.id}"><span class="glyphicon glyphicon-remove"></span> Delete</button>
                    </div>
                </div>    
            </c:when>
        </c:choose>

    </div>
</div>
<script>
    $(document).ready(function () {
        var dateNumber = ${comment.date} * 1000;
        var date = new Date(dateNumber);
        $('#commnent-date-${comment.id}').text(date.toDateString());
        $('#delete-comment-${comment.id}').click(deleteComment);
        $('#edit-comment-${comment.id}').click(function () {
            document.getElementById("addComment").text(comment.content);
            document.getElementById("addComment").focus();
            $('#addComment').focus();
            $('#addComment').text(${comment.content});

            editComment();
        });
//
//        $('#delete-comment-${comment.id}').click(function () {
//
//            openDialog('Bạn có muốn xoá bình luận?', 'CÓ', 'KHÔNG', function () {
//                deleteComment();
//            });
//            
//        });

    });

    function editComment() {
        jQuery.ajax({
            url: "${pageContext.request.contextPath}/comment-edit", // path, nếu là query get thì để ở đây luôn
            data: {
                id: ${comment.id},
                post_id: ${post.id}
                // post / put data
            },
            method: 'GET',
            success: function (data) {
                // kết quả trả về/ 
                // đoạn bên dươi thì tùy xử lý
                var json = $.parseJSON(data);
                if (data === 200) {
                    window.location.replace('${pageContext.request.contextPath}/post?id=${post.id}');
                } else {
                    showSnackBarError('Lỗi');
                }
            }
        });
    }

    function deleteComment() {
        jQuery.ajax({
            url: "${pageContext.request.contextPath}/comment-delete", // path, nếu là query get thì để ở đây luôn
            data: {
                id: ${comment.id}
                // post / put data
            },
            method: 'GET',
            success: function (data) {
                // kết quả trả về/ 
                // đoạn bên dươi thì tùy xử lý
                var json = $.parseJSON(data);
                if (data === 200) {
                    window.location.replace('${pageContext.request.contextPath}/post?id=${post.id}');
                } else {
                    
                    showSnackBarError('Lỗi');
                }
            }
        });
    }

</script>
