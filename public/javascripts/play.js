/**
 * Created by JetBrains RubyMine.
 * User: prakash
 * Date: 12/22/11
 * Time: 3:20 PM
 * To change this template use File | Settings | File Templates.
 */
jQuery(document).ready(function() {
    jQuery('#playForm').submit(function() {
        <!--alert('Handler for .submit() called.');-->
        alert("On SUbmit");

        jQuery.ajax({
            type: 'POST',
            url: '/play/playresults',
            data: {user_group_item_id:"1",
                option:"2"},
                success:function(data, textStatus) {
                    document.getElementById("playOutput").innerHTML = "<p style='color:red'>Coming Soon !! </p>";
                },
            error:function(request, textStatus, errorThrown) {
                document.getElementById("playOutput").innerHTML = "<p style='color:red'>he he.. </p>";
            }
        });
        return false;
    });
    $('#playOutput').dataTable();
});

