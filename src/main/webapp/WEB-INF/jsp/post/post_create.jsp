<%-- 
    Document   : create_post
    Created on : Apr 17, 2017, 8:40:25 PM
    Author     : Stevie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@taglib uri="/struts-tags" prefix="s"%>--%> 
<!DOCTYPE html>
<html>
    <jsp:include page="../partial_view/head.jsp"/>
    <body>
        <jsp:include page='../partial_view/snackbar.jsp'/>
        <div class="container-fuild main-container ">
            <row class="row-fluid">
                <div class="col-md-2 left-container">
                    <jsp:include page="../partial_view/left_toolbar.jsp"/>
                </div>
                <div class="col-md-7" style="background-color: #fafafa;">
                    <row class="row">
                        <form id="post-form" action="${pageContext.servletContext.contextPath}/post"
                                method="post" role="form"  >
                            <jsp:include page="../partial_view/subject/search_autocomplete.jsp"/>

                            <div class="form-group">
                                <input name="subject-id" type="hidden" id="subject-id" value=""/>
                            </div>
                            <div class="form-group">
                                <input name="tags-post-list" type="hidden" id="tags-post-list" />
                            </div>                            
                            <c:choose>
                                <c:when test="${mode == 'edit'}">
                                    <div class="form-group">
                                        <input name="post-id" type="hidden" id="post-id" value="${post.id}" />
                                    </div>      
                                </c:when>
                            </c:choose>
                            <div class="form-group">
                                <label for="tilte">Tiêu đề</label>
                                <input type="text" name="title" id="title" tabindex="2" 
                                       class="form-control" placeholder="Tilte" value="${post.title}">
                            </div>
                            
                            <jsp:include page="../partial_view/tags/tags_partial.jsp"/>
                            
                            <div class="form-group">
                                <textarea cols="80" id="editor1" name="editor1" tabindex="4" rows="10" >
                                    ${post.content}
                                </textarea>
                                <input type="hidden" name="content" id="content" tabindex="4" class="form-control" value="">
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-sm-6 col-sm-offset-3">
                                        <input type="submit" name="submit-btn" id="submit-btn" tabindex="5" 
                                               class="form-control btn" value="Publish" style="background-color: #B2DFDB;"/>
                                    </div>
                                </div>
                            </div>
<!--                            <div>
                                <div id="ar"> </div>
                            </div>    -->
                        </form>                    
                    </row>
                </div>
                <div class="col-md-3 right-container">
                    <jsp:include page="../partial_view/right_toolbar.jsp"/>
                </div>
            </row>
        </div>
    </body>
    <script>var editor1 = CKEDITOR.replace( 'editor1', {
                height: 280                
        } );
    $("#ar").html(CKEDITOR.instances.editor1.getData());

    $("#submit-btn").click(function (){
        $("#content").val(CKEDITOR.instances.editor1.getData());
    });
    
    $('#post-form').submit(function (){
        if (checkIfValid() === false)
            return false;

        $("#subject-id").val(getSubjectId());
        $('#tags-post-list').val(getTagString());
        return true;
    });
    
    
    function checkIfValid(){
        if ($('#title').val() === ''){
            showSnackBarError('Tiêu đề không được để trống');
            return false;
        }
        if (getTagString() === ''){
            showSnackBarError('Không để trống tags');
            return false;            
        }
        if ($('#content').val() === ''){
            showSnackBarError('Nội dung không được để trống');
            return false;            
        }        
        return true;
    }
    
    var mode = '${mode}';
    
    $(document).ready(function (){
        if (mode === 'edit'){
            fillTextBox();
        }
    });
    
    function fillTextBox(){
        
   
//        
//        postTags.forEach(function (item, index){
//            var tagChip = createTagChip(item.name);
//            $('#tags-box-holder').append(tagChip);
//            $('#tags-box-holder .mdl-chip__action').last().click(tagclose);            
//        });
    }

    </script>
</html>
