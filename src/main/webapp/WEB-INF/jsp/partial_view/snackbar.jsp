<%-- 
    Document   : snackbar
    Created on : Apr 25, 2017, 4:11:52 PM
    Author     : Stevie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id="snack-bar-error" aria-live="assertive" aria-atomic="true" aria-relevant="text" 
     class="mdl-snackbar mdl-js-snackbar my-snack-bar-error">
    <div class="mdl-snackbar__text upper-text"></div>
    <button type="button" class="mdl-snackbar__action"></button>
</div>
<div id="snack-bar-info" aria-live="assertive" aria-atomic="true" aria-relevant="text" 
     class="mdl-snackbar mdl-js-snackbar my-snack-bar-info">
    <div class="mdl-snackbar__text upper-text"></div>
    <button type="button" class="mdl-snackbar__action"></button>
</div>
<script> 
    
    function showSnackBarError(errorMessage){
        var notification = document.querySelector('#snack-bar-error');
        var data = {
          message: errorMessage
        };
        notification.MaterialSnackbar.showSnackbar(data);
    }
    function showSnackBarInfo(info){
        var notification = document.querySelector('#snack-bar-info');
        var data = {
          message: info
        };
        notification.MaterialSnackbar.showSnackbar(data);
    }    
</script>