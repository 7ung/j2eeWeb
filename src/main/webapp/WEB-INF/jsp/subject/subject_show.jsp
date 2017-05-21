<%-- 
    Document   : subject_show
    Created on : Apr 27, 2017, 12:47:24 PM
    Author     : Stevie
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page='../partial_view/head.jsp'/>    
    <body>
        <jsp:include page='../partial_view/snackbar.jsp'/>
        <jsp:include page='../partial_view/dialog.jsp'/>        
        <div class="container-fuild main-container ">
            <row class="row-fluid">
                <div class="col-md-2 left-container">
                    <jsp:include page="../partial_view/left_toolbar.jsp"/>
                </div>
                <div class="col-md-7" style="background-color: #fafafa;" >
                    <row class="row-fluid">
                        <h1 class="post-title" id='subject-title'>${subject.title}</h1>
                        <c:choose>
                            <c:when test='${owner == true}'>
                                <input type="text" name="subject-title" id="subject-title-textbox" tabindex="1" 
                                       class="form-control post-title input-lg" style="font-weight: bold; display: none;" />  
                                <div class="mdl-tooltip" data-mdl-for="subject-title">
                                    Click to Edit
                                </div>
                            </c:when>
                        </c:choose>
                    </row>
                    <row class="row-fluid">
                        <div class ="col-md-12 post-subtitle" >
                            <span>
                                <a herf="#" class="post-author" >${subject.userId.profileCollection[0].displayName}</a>
                            </span>
                        </div>
                    </row> 
                    <row class='row-fluid'>
                        <div class='col-md-12 subject-description-box' id='subject-description' >
                            <c:choose >
                                <c:when test="${subject.description == ''}">
                                    <span><i>No description</i></span>
                                </c:when>
                                <c:otherwise>
                                    <span>${subject.description}</span>
                                </c:otherwise>
                            </c:choose>
                        </div>    
                        <c:choose >
                            <c:when test='${owner == true}'>
                                <textarea type="text" name="subject-description" id="subject-description-textbox" 
                                          class="form-control " style="display: none;" >  </textarea>
                                <div class="mdl-tooltip" data-mdl-for="subject-description">
                                    Click to Edit
                                </div>                                        
                            </c:when>
                        </c:choose>

                    </row>
                    <c:choose>
                        <c:when test='${subject.postCollection.isEmpty() == false}'>
                            <row class='row-fluid'>
                                <ul class='mdl-list' id='posts-list-subject-${subject.id}'>
                                    <c:forEach items="${subject.postCollection}" var="p">
                                        <c:set var="post" value="${p}" scope="request"/>
                                        <c:set var="mode" value="subject${subject.id}" scope="request"/>
                                        <jsp:include page="../partial_view/post/post_card.jsp"/>
                                    </c:forEach>
                                    <c:remove var="post"/>
                                    <c:remove var="mode"/>                                    
                                </ul>
                            </row>
                        </c:when>
                    </c:choose>
                    <row class='row-fluid'>
                        <div class='col-md-12 float-right-box' >
                            <div class='float-right-content small-text' id="subject-info-box">
                                <span class='border-right float-right-item' id='subject-date' ></span>
                                <span class='float-right-item' id='subject-follows-count'></span>
                                <c:choose>
                                    <c:when test='${user != null && owner == false}'>
                                        <span class='float-right-item border-right'>                
                                            <button type="button" class="btn small-btn" id="follow-btn">
                                                <i class="fa fa-rss" aria-hidden="true" style=" margin: 8px;color: rgba(64,64,64,0.8); margin: 2px;"></i>
                                            </button>
                                            <button type="button" class="btn small-btn" id="unfollow-btn">
                                                <i class="fa fa-rss-square" aria-hidden="true" style=" margin: 8px;color: rgba(64,64,64,0.8); margin: 2px;"></i>
                                            </button>     
                                        </span>
                                    </c:when>
                                    <c:when test='${owner == true}'>
                                        <button type="button" class="btn my-action-btn" id="undo-btn" style="display: none">
                                            <i class="fa fa-undo" aria-hidden="true"  ></i>
                                        </button>                                        
                                        <button type="button" class="btn my-action-btn" id="save-btn" style="display: none">
                                            <i class="fa fa-floppy-o" aria-hidden="true"  ></i>
                                        </button>                                        
                                        <button type="button" class="btn my-action-btn" id="delete-btn">
                                            <i class="fa fa-trash" aria-hidden="true"  ></i>
                                        </button> 
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>
                    </row>
                </div>
                <div class="col-md-3 right-container">
                    <jsp:include page="../partial_view/right_toolbar.jsp"/>
                </div>
            </row>
        </div>
    </body>
</html>
<script src="${pageContext.request.contextPath}/resources/js/editable-text.js" type="text/javascript"></script>

<script>
    $(document).ready(function (){
        hideAllFollowButton();
        
        registeEditableText($('#subject-title'),$('#subject-title-textbox'), showSaveUndo);
        registeEditableText($('#subject-description'),$('#subject-description-textbox'), showSaveUndo);
        
        
        var dateNumber = ${subject.date} * 1000;
        var date = new Date(dateNumber);
        $('#subject-date').text(date.toDateString());
        
        checkUserFollowed();
        updateCountFollow();

        $('#follow-btn').click(followSubject);
        $('#unfollow-btn').click(unfollowSubject);
        
        $('#subject-info-box :last-child').removeClass('border-right');

        $('#delete-btn').click(function (){
            openDialog('Bạn có muốn xoá bái viết', 'CÓ', 'KHÔNG', function () {
                deleteSubject();
            });
        });
        
        $('#undo-btn').click(undoButtonClick);
        $('#save-btn').click(saveButtonClick);
    });  
    
    function showSaveUndo(){
        $('#undo-btn').show();
        $('#save-btn').show();
    }
    
    function hideSaveUndo(){
        $('#undo-btn').hide();
        $('#save-btn').hide();
    }    
    
    function undoButtonClick(){
        $('#subject-description-textbox').val('');
        $('#subject-title-textbox').val('');
        $('#subject-title').text('${subject.title}');
        $('#subject-description').text('${subject.description}');
        hideSaveUndo();
    }
    
    
    function saveButtonClick(){

        var myForm = document.createElement("form");
        myForm.method="post" ;
        myForm.action = "${pageContext.request.contextPath}/subjects/${subject.id}" ;

        var title = document.createElement("input") ;
        title.setAttribute("name", "title");
        title.setAttribute("value", $('#subject-title').text());

        var description = document.createElement("input") ;
        description.setAttribute("name", "description");
        description.setAttribute("value", $('#subject-description').text());    
    
        myForm.appendChild(title);
        myForm.appendChild(description);
        
        document.body.appendChild(myForm);
        myForm.submit() ;

    }
    
    function checkUserFollowed(){
        var followed = ${isFollowed};
        if (followed === true){
            showUnfollowButton();
        }
        else if (followed === false){
            showFollowButton();
        }
        else if (followed === undefined){
            hideAllFollowButton();
        }
    }
    
    function followSubject(){
        jQuery.ajax({
            url: "${pageContext.request.contextPath}/subject/${subject.id}/follow",
            data: {},
            method: 'GET',
            success :function(data){
                if (data === 200){
                    showUnfollowButton();
                }
                else {
                    showFollowButton();
                }
                updateCountFollow();                   
            } 
        });        
    }
    
    function unfollowSubject(){
        jQuery.ajax({
            url: "${pageContext.request.contextPath}/subject/${subject.id}/unfollow",
            data: {},
            method: 'GET',
            success :function(data){
                if (data === 200){
                    showFollowButton();
                }
                else {
                    showUnfollowButton();
                }
                updateCountFollow();                
            } 
        });                
    }
    
    function hideAllFollowButton(){
        $('#follow-btn').hide();
        $('#unfollow-btn').hide();
    }
    
    function showFollowButton(){
        $('#follow-btn').show();                
        $('#unfollow-btn').hide();        
    }
    
    function showUnfollowButton(){
        $('#follow-btn').hide();
        $('#unfollow-btn').show();
    }
    
    function updateCountFollow(){
        var f = jQuery.ajax({
            url: "${pageContext.request.contextPath}/subject-follows",
            data: {
                id: ${subject.id}
            },
            method: 'GET',
            success :function(data){
                $('#subject-follows-count').text(f.responseText + ' followed');
            } 
        });        
    }
    
    function deleteSubject(){
        rs = $.ajax({
            url: '${pageContext.request.contextPath}/subjects/${subject.id}/del',
            data: {},
            method: 'GET',
            success : function (data){
                if (data === 200){
                    window.location.replace('${pageContext.request.contextPath}');
                }
                else {
                    showSnackBarError('Lỗi');
                }
            }
        });
    }
    
</script>
    