<%-- 
    Document   : post_card
    Created on : Apr 27, 2017, 3:38:20 PM
    Author     : Stevie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<li class='mdl-list__item mdl-shadow--2dp post-list-item' >                                    
    <div class='col-md-12'>
        <row class='row-fluid'>
            <div class='col-md-8'>
                <h5>
                    <a href="${pageContext.request.contextPath}/post?id=${post.id}" >
                        <span id='post-card-title-${mode}-${post.id}'>${post.title}<span>
                    </a>
                </h5>
                <h6><a href='#'><span>${post.userId.profileCollection[0].displayName}</span></a></h6>
            </div>
            <div class='col-md-2' id='post-card-views-${mode}-${post.id}-div' >
                <h5 id='post-card-views-${mode}-${post.id}' class='primary-text' >${post.view}</h5>
                <h6 class='secondary-text'>views</h6>
            </div>
            <div class='col-md-2' id="post-card-follows-${mode}-${post.id}-div">
                <h5 class='primary-text' id='post-card-follows-${mode}-${post.id}'>0</h5>
                <h6 class='secondary-text'>followed</h6>
            </div> 
        </row>
        <c:choose >
            <c:when test="${post.tagCollection.isEmpty() == false}">
                <row class='row-fluid'>
                    <div class="mdl-card" id="tags-box" style="width: 100%; min-height: 0px; margin-top: 8px; margin-bottom: 16px;
                     box-shadow: inset 0px 0px 2px 2px #60dda6;">
                        <div class="mdl-card__supporting-text" id="tags-box-holder" style="width: 100%;">
                            <c:forEach items="${post.tagCollection}" var="tag">
                                <span class='mdl-chip mdl-chip--deletable  mdl-shadow--2dp my-mdl-chip'
                                        id="${tag.id}">
                                    <span class='mdl-chip__text'><c:out value="${tag.name}"/> tag</span>
                                </span>                                    
                            </c:forEach>                            
                       </div>
                    </div>         
                </row>
            </c:when>
        </c:choose>            
    </div>
</li>

<script>
    $(document).ready(function (){
        var rs_${mode}_${post.id} = $.ajax({
            url: '${pageContext.request.contextPath}/post/${post.id}/follows',
            data: {},
            method: 'GET',
            success: function (data){
                $('#post-card-follows-${mode}-${post.id}').text(rs_${mode}_${post.id}.responseText);
            }
        });
    });
</script>
