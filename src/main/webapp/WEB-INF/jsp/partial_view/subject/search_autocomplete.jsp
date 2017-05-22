<%-- 
    Document   : search_autocomplete
    Created on : Apr 22, 2017, 7:02:02 PM
    Author     : Stevie
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="form-group">
    <label for="sample6">Chủ đề</label>
    <input class="form-control" type="text" id="subject-name" tabindex="1" name="subject-name" style=""
           placeholder="Subject" value="${subject.title}">
</div>
<dialog class="search-result-dialog" id="search_result" role="dialog">
    <ul class="mdl-list ggdropdown" id="result_list">
    </ul>
</dialog>
<c:choose>
    <c:when test="${subject != null}">
        <script>selectedSubjectId = ${subject.id};
        selectedSubjectName = '${subject.title}';</script>
    </c:when>
    <c:otherwise>
        <script>selectedSubjectId = -1;
        selectedSubjectName = '';</script>
    </c:otherwise>
</c:choose>
<script>
    $(document).ready(function (){
        
        $('#subject-name').keyup(function (){
            selectedSubjectName = $('#subject-name').val().trim();
            if (selectedSubjectName !== ""){
                searchSubjectByTitle();
            }
            else {
                if ($('#search_result').is(':visible'))
                    $('#search_result').hide();
            }
        });
        
        $('#subject-name').focusout(function (){
            closeResultDialog();
        });

    });

    function searchSubjectByTitle(){
            var userId = "${user.id}";
            var result = jQuery.ajax(
                {
                url: "${pageContext.request.contextPath}/user-info/subject-by-title",
                data: {
                    user_id: userId,
                    subject_title: selectedSubjectName
                },
                method: "GET",
                success:function(data){
                    var json = $.parseJSON(result.responseText);
                    $('#result_list').empty();
                    if (json.length === 0){
                        $('#search_result').stop();
                        closeResultDialog();
                    }
                    else {
                        json.forEach(function (item, index){
                                var li =
                                "<li class='mdl-list__item ggdropdown-list-item' id=" +item.id +" > " +
                                    "<span class='mdl-list__item-primary-content'>" +
                                        item.title +
                                    "</span>"+
                                "</li>";
                                $('#result_list').append(li);
                            });
                        showResultDialog();                            
                    }
                }
            }); 
    }
    
    function showResultDialog(){
        $('#search_result').fadeIn(80, function() {
            $('#result_list li').click(resultItemClick);                        
        });       
    }
    
    function closeResultDialog(){
        if (!$('#search_result').is(":hover") || selectedSubjectId !== -1)
            $('#search_result').hide();
    }
    
    function resultItemClick(){
        selectedSubjectId = $(this).attr('id');
        selectedSubjectName = $(this).children('span')[0].textContent;
        $('#subject-name').val(selectedSubjectName);
        $('#search_result').hide();
    }
    
    function getSubjectId(){
        return selectedSubjectId;
    }
    
    function getSubjectName(){
        return selectedSubjectName;
    }
</script>
