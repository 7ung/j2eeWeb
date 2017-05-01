<%-- 
    Document   : action-btn
    Created on : Apr 25, 2017, 1:58:48 AM
    Author     : Stevie
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id="post-owner-action" class="" style="position: absolute; right:0px;top:0px; padding: 12px;">
    <button type="button" class="btn my-action-btn" id="edit-btn">
        <i class="fa fa-pencil-square-o" aria-hidden="true"  ></i>
    </button>
    <button type="button" class="btn my-action-btn" id="private-btn">
        <i class="fa fa-eye-slash" aria-hidden="true"  ></i>
    </button>              
    <button type="button" class="btn my-action-btn" id="publish-btn">
        <i class="fa fa-eye" aria-hidden="true"  ></i>
    </button>                
    <button type="button" class="btn my-action-btn" id="delete-btn">
        <i class="fa fa-trash" aria-hidden="true"  ></i>
    </button> 
  
</div>

<script>
    var postStatus = '${post.status}';
    
    if (postStatus === 'published'){
        $('#private-btn').show();
        $('#publish-btn').hide();
    }
    else if (postStatus === 'private'){    
        $('#private-btn').hide();
        $('#publish-btn').show();
    }
    
    $(document).ready(function(){

   });
</script>
    