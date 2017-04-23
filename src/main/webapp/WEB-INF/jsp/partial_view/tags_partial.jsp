<%-- 
    Document   : tags_partial
    Created on : Apr 23, 2017, 2:37:03 PM
    Author     : Stevie
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="form-group">
    <label for="tags">Tags</label>
    <input type="text" name="tags" id="tags" tabindex="3" class="form-control" placeholder="Put your tags" value="">
</div>
<dialog class="search-result-dialog" id="tags-search-dialog" role="dialog">
    <ul class="mdl-list ggdropdown" id="tags-search-result">
    </ul>
</dialog>
<div class="mdl-card" id="tags-box" style="width: 100%; min-height: 0px;">
    <div class="mdl-card__supporting-text" id="tags-box-holder" style="width: 100%;">
    </div>
</div>
<div id="snack-bar-error" aria-live="assertive" aria-atomic="true" aria-relevant="text" 
     class="mdl-snackbar mdl-js-snackbar my-snack-bar-error">
    <div class="mdl-snackbar__text upper-text"></div>
    <button type="button" class="mdl-snackbar__action"></button>
</div>

<script>
    
    $(document).ready(function(){
        checkIfBoxEmpty();
        $('#tags').focusout(function (){
            if (!$('#tags-search-dialog').is(":hover"))
                $('#tags-search-dialog').hide();
        });
    });
    
    $('#tags').bind('keypress', function (e){
       if (e.keyCode === 59){
            createTag($('#tags').val().trim());
            event.preventDefault();

       } 
    });
    
    $('.mdl-chip__action').click(tagclose);
    
    $('#tags').keyup(function (){
        if ($('#tags').val().trim() !== ''){
            getList($('#tags').val().trim());
        }else {
            $('tags-search-dialog').hide();
        }
    });
    
    function getList(tagname){
        var rs = jQuery.ajax(
        {
        url: "${pageContext.request.contextPath}/tags",
        data: {
            tags_name: tagname
        },
        method: "GET",
        success:function(data){
            var json = $.parseJSON(rs.responseText);
            $('#tags-search-result').empty();
            if (json.length === 0){
                $('#tags-search-dialog').stop();
                $('#tags-search-dialog').hide();
            }
            else {
                json.forEach(function (item, index){
                    var li =
                        "<li class='mdl-list__item ggdropdown-list-item' id=" +item.id +" > " +
                            "<span class='mdl-list__item-primary-content'>" +
                                item.name +
                            "</span>"+
                        "</li>";
                    $('#tags-search-result').append(li);
                    });
                $('#tags-search-dialog').fadeIn(80, function() {
                    $('#tags-search-dialog li').click(function (){
                        $('#tags-search-dialog').hide();
                        createTag($(this).children('span')[0].textContent);
                    });                        
                }); 
            }
        }
        });
             
    }
    
    function checkIfBoxEmpty(){
        if($('#tags-box .mdl-chip').length === 0){
            $('#tags-box').hide();
        }
        else {
            $('#tags-box').show();
        }
    }
    
    function tagclose(){
        var chip  = $(this).parents('.mdl-chip');
        chip.remove();
        checkIfBoxEmpty();        
    }
        
    function createTagChip(tag_name){
        return $.parseHTML( "<span class='mdl-chip mdl-chip--deletable  mdl-shadow--2dp my-mdl-chip'>" +
            "<span class='mdl-chip__text'>" + tag_name + "</span>" +
            "<button type='button' class='mdl-chip__action' style='margin-bottom:8px;'><i class='material-icons'> &#x2716</i></button>" +
        "</span>");
    }
    
    function isMaxTag(){
        return ($('#tags-box .mdl-chip').length >= 8);
    }
    
    function showSnackBarError(errorMessage){
        var notification = document.querySelector('#snack-bar-error');
        var data = {
          message: errorMessage
        };
        notification.MaterialSnackbar.showSnackbar(data);
    }
    
    function createTag(tag){
        if (isMaxTag()) {
            showSnackBarError('Chỉ có thể tạo tối đa 8 tag trong một post');
            return;
        }
        
        if (tag !== ''){
            var tagChip = createTagChip(tag);
            $('#tags-box-holder').append(tagChip);
            $('#tags-box-holder .mdl-chip__action').last().click(tagclose);
            $('#tags').val('');   
        }
        checkIfBoxEmpty();

    }
    
</script>