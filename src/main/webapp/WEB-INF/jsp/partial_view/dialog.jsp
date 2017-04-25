<%-- 
    Document   : dialog
    Created on : Apr 25, 2017, 4:53:04 PM
    Author     : Stevie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
  <dialog class="mdl-dialog">
    <div class="mdl-dialog__content">
      <p id="dialog-content">
       Content
      </p>
    </div>
    <div class="mdl-dialog__actions mdl-dialog__actions--full-width">
      <button type="button" class="mdl-button" id="dialog-primary-action" style="padding-right: 8px;">Có</button>
      <button type="button" class="mdl-button close" id='dialog-secondary-action' style="padding-right: 8px">Không</button>
    </div>
  </dialog>
  <script>
    var dialog = document.querySelector('dialog');
    
    if (! dialog.showModal) {
        dialogPolyfill.registerDialog(dialog);
    }
    
    dialog.querySelector('.close').addEventListener('click', function() {
      dialog.close();
    });
    
    function openDialog(content, primaryAction, secondaryAction, primaryCallback){
        $('#dialog-content').text(content);
        $('#dialog-primary-action').text(primaryAction);
        $('#dialog-secondary-action').text(secondaryAction);
        $('#dialog-primary-action').click(primaryCallback);

        dialog.showModal();

    }
    
    
  </script>
  
  
