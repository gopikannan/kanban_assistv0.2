/**
 * Created by JetBrains RubyMine.
 * User: prakash
 * Date: 1/26/12
 * Time: 11:35 AM
 * To change this template use File | Settings | File Templates.
 */
jQuery(function() {
    var $items = jQuery('#vtab>ul>li');
    $items.mouseover(
        function() {
            $items.removeClass('selected');
            $(this).addClass('selected');

            var index = $items.index($(this));
            jQuery('#vtab>div').hide().eq(index).show();
        }).eq(1).mouseover();
     $('#datasetItems').dataTable({

            'aoColumns': [
                {'fnRender': function(row_data) { return row_data.aData[0] }},
                {'fnRender': function(row_data) { return row_data.aData[1] }},
                {'fnRender': function(row_data) { return row_data.aData[2] }},
                {'fnRender': function(row_data) { return row_data.aData[3] }},
                {'fnRender': function(row_data) { return row_data.aData[4] }},
                {'fnRender': function(row_data) { return row_data.aData[5] }},
                {'fnRender': function(row_data) {
            var str = '<a href=\"#\" onclick=\"showDemand(\'' + row_data.aData[6] + '\');return false;\">Show Demand</a>';
            return str;
            },  "bUseRendered": false ,"bSortable": false
            }],


            "bProcessing": true,
            "bAutoWidth:": false,
            "bServerSide": false,
            "bDestroy": true,
            "bSort": true,
            "sAjaxSource": "/kbadmin/dataset/getItems",
            "fnServerData": function (sSource, aoData, fnCallback) {
                $.ajax({
                    "dataType": 'json',
                    "type": "POST",

                    "url": '/kbadmin/dataset/getItems',
                    "data":{dataset_id:jQuery('select#item_dataset_id :selected').val()
                     },
                    "success": fnCallback
                });
            }
        });
    $("#item_dataset_id").change(function() {
        var selected = $('select#item_dataset_id :selected').val();
        //alert(selected);
        $('#datasetItems').dataTable({

            'aoColumns': [
                {'fnRender': function(row_data) { return row_data.aData[0] }},
                {'fnRender': function(row_data) { return row_data.aData[1] }},
                {'fnRender': function(row_data) { return row_data.aData[2] }},
                {'fnRender': function(row_data) { return row_data.aData[3] }},
                {'fnRender': function(row_data) { return row_data.aData[4] }},
                {'fnRender': function(row_data) { return row_data.aData[5] }},
                {'fnRender': function(row_data) {
            var str = '<a href=\"#\" onclick=\"showDemand(\'' + row_data.aData[6] + '\');return false;\">Show Demand</a>';
            return str;
            },  "bUseRendered": false, "bSortable": false
        }
            ],
            "bProcessing": true,
            "bAutoWidth:": false,
            "bServerSide": false,
            "bDestroy": true,
            "bSort": true,
            "sAjaxSource": "/kbadmin/dataset/getItems",
            "fnServerData": function (sSource, aoData, fnCallback) {
                $.ajax({
                    "dataType": 'json',
                    "type": "POST",

                    "url": '/kbadmin/dataset/getItems',
                    "data":{dataset_id:selected
                     },
                    "success": fnCallback
                });
            }
        });
        jQuery("#datasetItems").css("width","100%")

        return false;
    });


});
function showDemand(item_id){
        alert("Coming Soon! demand for "+item_id);
    }