<%-- 
    Document   : search_autocomplete
    Created on : Apr 22, 2017, 7:02:02 PM
    Author     : Stevie
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<form action="#" class="form">
    <div class="form-group">
        <label for="sample6">Tên chủ đề</label>
        <input class="form-control" type="text" id="subject-name" style="">
    </div>
    <dialog class="search-result-dialog" id="search_result" role="dialog">
        <ul class="mdl-list ggdropdown" id="result_list">
        </ul>
    </dialog>
</form>


<script>
    $(document).ready(function (){
        $('#subject-name').keyup(function (){
            
            if ($('#subject-name').val().trim() !== ""){
                if (!$('#search_result').is(':visible')){
                    
                    $('#search_result').fadeIn(80, function() {
                        // Animation complete
                    });
                    searchSubjectByTitle();
                }
            }
            else {
                if ($('#search_result').is(':visible'))
                    $('#search_result').hide();
            }
            
        });
    });

    function searchSubjectByTitle(){
            var userId = "${user.id}";
            var result = jQuery.ajax(
                {
                url: "${pageContext.request.contextPath}/user-info/subject-by-title",
                data: {
                    user_id: userId,
                    subject_title: $('#subject-name').val()
                },
                method: "GET",
                success:function(data){
                    var json = $.parseJSON(result.responseText);
                    $('#result_list').empty();
                    json.forEach(function (item, index){
                            var li =
                            "<li class='mdl-list__item ggdropdown-list-item'> " +
                                "<span class='mdl-list__item-primary-content'>" +
                                    item.title +
                                "</span>"+
                            "</li>";
                            $('#result_list').append(li);
                        });
                    }
                });   
    }
</script>
