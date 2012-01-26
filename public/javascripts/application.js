// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
jQuery(function() {
    jQuery("#tabs").tabs();
        jQuery("#tabs").bind('tabsselect', function(event,ui){
            //alert(ui.index);
            if (ui.index == 3) {
                $('#playOutput').dataTable( {
            "bProcessing": true,
            "bServerSide": false,
                 "bDestroy": true,
                 "bSort": true,
            "sAjaxSource": "/getItems"
            });
            }
        });

                   jQuery( "#dialog-message" ).dialog({
                    modal: true,
                    buttons: {
                          /*
                        Ok: function() {

                            jQuery( this ).dialog( "close" );
                            alert("I am here");
                            jQuery('<form action="/welcomeuser" method="POST">' +
                               '<input type="hidden" name="group" value= "1">' +
                               '</form>').submit();
                            alert("after submit");

                        }           */
                    },
                closeOnEscape: false,
                open: function(event, ui) { $(".ui-dialog-titlebar-close").hide(); }

                });

//    playLayout();

});
