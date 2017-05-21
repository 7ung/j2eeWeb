/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function registeEditableText(label, input, clickEvent){
    input.hide();
    label.bind('click', function(){
        input.show();
        input.focusin(function (){
            input.val(label.text().trim());
            label.hide();
        });
        input.focus();
        clickEvent();
    });

    input.focusout(function (){
        label.show();
        input.hide();            
    });

    input.on('keypress', function(e){
        if (e.which === 13){
            label.text(input.val().trim());
            input.hide();
        }
    });
}