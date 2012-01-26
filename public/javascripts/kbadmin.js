/**
 * Created by JetBrains RubyMine.
 * User: prakash
 * Date: 1/26/12
 * Time: 11:35 AM
 * To change this template use File | Settings | File Templates.
 */
jQuery(function(){
    var $items = jQuery('#vtab>ul>li');
    $items.mouseover(function() {
        $items.removeClass('selected');
        $(this).addClass('selected');

        var index = $items.index($(this));
        jQuery('#vtab>div').hide().eq(index).show();
    }).eq(1).mouseover();
    jQuery('#datasetItems').dataTable();

});
