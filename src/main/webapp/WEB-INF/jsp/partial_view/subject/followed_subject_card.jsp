<%-- 
    Document   : followed_subject_card
    Created on : Apr 26, 2017, 1:22:39 AM
    Author     : Stevie
--%>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<row class='row-fluid'>
    <div class="mdl-card card-stretch card-flat" id='followed-subject-card'  >
        <p class="mdl-card__title mdl-card--border"><b>Các chủ đề được theo dõi</b><p>
        <div id="followed-subject-card-holder" class="" > 
            <row class='row-fluid'>
                <c:forEach items="${followed_subject}" var="subject">
                    <div class ='col-md-6' id='${subject.id}'>
                        <div class="mdl-card col-md-12 mdl-shadow--2dp" id='followed-subject-card-${subject.id}'
                             style='margin-top: 4px; margin-bottom: 4px; padding-bottom: 8px;'>
                            <row class='row-fuild'>
                                <p class="mdl-card__title blocked-text title-blocked-text" ><b>${subject.title}</b><p>
                            </row>
                            <div id="followed-subject-card-holder-${subject.id}" class="card-holder"> 
                                <row class='row-fuild '> 
                                    <p class='blocked-text subject-card-border'>
                                        <c:choose>
                                            <c:when test="${subject.description ==  ''}">
                                                <i><c:out value="No description"/></i>
                                            </c:when>
                                            <c:otherwise>
                                                <c:out value="${subject.description}"/>
                                            </c:otherwise>
                                        </c:choose>
                                    </p>                                   
                                </row>
                                <row class ='row-fluid blocked-text' id='followed-subject-posts-${subject.id}'>
                                </row>
                                
                            </div>    
                            <h5  style='background-color: #eff7f7; padding-top: 6px; padding-bottom: 4px; padding-left: 16px; padding-right: 8px;'>
                                - ${subject.userId.profileCollection.get(0).displayName} -
                            </h5>                            
                            <row class="row-fluid" id='subject-info-holder-${subject.id}'>
                                <span class="border-right small-info-space" id="subject-date-${subject.id}">
                                </span>
                                <span class="border-right small-info-space" id="subject-view-${subject.id}">
                                </span>     
                                <span class="border-right small-info-space" id="subject-posts-${subject.id}">
                                </span>                                  
                                <script>
                                    var date = new Date( ${subject.date * 1000});
                                    $('#subject-date-${subject.id}').text(date.toDateString());
                                    $(document).ready(function (data){
                                        
                                        var v = $.ajax({
                                            url: '${pageContext.request.contextPath}/subject-follows',
                                            data: {id:${subject.id}},
                                            method: 'GET',
                                            success: function (data){
                                                $('#subject-view-${subject.id}').text(v.responseText + ' followed');
                                            }
                                        });
                                        
                                        var p = $.ajax({
                                            url: '${pageContext.request.contextPath}/subject-posts',
                                            data: {id:${subject.id}},
                                            method: 'GET',
                                            success: function (data){
                                                $('#subject-posts-${subject.id}').text(p.responseText + ' posts');

                                            }
                                        });
                                        
                                        var pp = $.ajax({
                                            url: '${pageContext.request.contextPath}/subjects/${subject.id}/posts-top',
                                            method: 'GET',
                                            success: function (data){
                                                postJson = $.parseJSON(pp.responseText);
                                                if (postJson.length === 0){
                                                    $('#followed-subject-posts-${subject.id}')
                                                            .append(createPostLink(null, 0));
                                                }
                                                else {
                                                    postJson.forEach(function (item, index){
                                                        $('#followed-subject-posts-${subject.id}')
                                                            .append(createPostLink(item.title, item.id));
                                                        
                                                    });
                                                }
                                            }
                                        });
                                    });
                                    $('#subject-info-holder-${subject.id} :last-child').removeClass('border-right');
                                    
                                    
                                </script>
                            </row>                             
                        </div>                    
                    </div>                    
                </c:forEach>
            </row>
        </div>
    </div>
</row>

<script>
    function createPostLink(title, id){
        if (title === null){
            return "<div class='single-line-blocked-text'  id=''>"+
                "<p> <i>No post found</i></p>" +
            "</div>";
        }
        else {
            
            var x = "<div class='single-line-blocked-text'  id='followed-subject-post-{1}'>" +
                "<a href ='${pageContext.request.contextPath}/post?id={2}' class=''>{3}</a> "+
            "</div>";
            x = x.replace('{1}',id);
            x = x.replace('{2}',id);
            x = x.replace('{3}', title);
            return x;
        }
    }
</script>