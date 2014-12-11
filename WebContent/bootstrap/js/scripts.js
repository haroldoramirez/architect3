$(document).ready( function(){

    $('.dropdown-toggle').parent().mouseleave( function(event){
    	$(this).removeClass('open');
        //event.stopPropagation();
    });
});