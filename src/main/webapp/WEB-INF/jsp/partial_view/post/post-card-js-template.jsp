<%-- 
    Document   : post-card-js-template
    Created on : Apr 30, 2017, 9:32:27 PM
    Author     : Stevie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script id="post-template" type="text/x-jquery-tmpl" src="${pageContext.request.contextPath}/resources/js/post-card-template.js">

<li class='mdl-list__item mdl-shadow--2dp post-list-item' >                                    
    <div class='col-md-12'>
        <row class='row-fluid'>
            <div class='col-md-8'>
                <h5>
                    <a href="${pageContext.request.contextPath}/post?id=\${id}" >
                        <span id='post-card-title-tag_posts-\${id}'>\${title}<span>
                    </a>
                </h5>
                <h6><a href='#'><span>\${userId.profileCollection[0].displayName}</span></a></h6>
            </div>
            
            <div class='col-md-2' id='post-card-views-tag_posts-\${id}-div' >
                <h5 id='post-card-views-tag_posts-\${id}' class='primary-text' >\${view}</h5>
                <h6 class='secondary-text'>views</h6>
            </div>
            <div class='col-md-2' id="post-card-follows-tag_posts-\${id}-div">
                <h5 class='primary-text' id='post-card-follows-tag_posts-\${id}'>0</h5>
                <h6 class='secondary-text'>followed</h6>
            </div> 
        </row>  
        <row class='row-fluid'>
            <div class="mdl-card" id="tags-box" style="width: 100%; min-height: 0px; margin-top: 8px; margin-bottom: 16px;
             box-shadow: inset 0px 0px 2px 2px #60dda6;">
                <div class="mdl-card__supporting-text" id="tags-box-holder" style="width: 100%;">
                    {{each(tag) tagCollection}}
                        <span class='mdl-chip mdl-chip--deletable  mdl-shadow--2dp my-mdl-chip'
                                id="\${tag.id}">
                            <span class='mdl-chip__text'>\${name}</span>
                        </span>              
                    {{/each}}
               </div>
            </div>         
        </row>
    </div>
</li>
</script>
