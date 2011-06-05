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

         $('#playOutput').dataTable( {
        "bProcessing": true,
        "bServerSide": false,
             "bDestroy": true,
             "bSort": true,
        "sAjaxSource": "/play/playresults",
        "fnServerData": function ( sSource, aoData, fnCallback ) {
            $.ajax( {
                "dataType": 'json',
                "type": "POST",

                "url": '/play/playresults',
                "data":{user_group_item_id:jQuery('#play_user_group_item_id').val(),
                startdate:jQuery('#from').val(),
                enddate:jQuery('#to').val(),
                parlevel:jQuery('#parLevel').val(),
                minReorderPoint:jQuery("#reorderpoint-slider-range").slider("values", 0),
                maxReorderPoint:jQuery("#reorderpoint-slider-range").slider("values", 1)
                },
                "success": fnCallback
            } );
        }
    } );

        return false;
    });

    $('.flex-grid').layout();
        $('.grid').layout();

        $( "#parLevel-slider" ).slider({
                orientation: "horizontal",
                range: "min",
                min: 0,
                max: 100,
                value: 60,
                slide: function( event, ui ) {
                    $( "#parLevel" ).val( ui.value );
                }
            });
            $( "#parLevel" ).val( $( "#parLevel-slider" ).slider( "value" ) );



        $("#reorderpoint-slider-range").slider({
            orientation: "horizontal",
            range: true,
            min: 1,
            max: $("#parLevel").value,
            values: [ 1, 10 ],

            slide: function(event, ui) {
                $("#reorderpoint").val(ui.values[ 0 ] + " - " + ui.values[ 1 ]);
            }
        });
        $("#reorderpoint").val( $("#reorderpoint-slider-range").slider("values", 0) +
            " - " + $("#reorderpoint-slider-range").slider("values", 1));

        var dates = $( "#from, #to" ).datepicker({
                    defaultDate: "+1w",
                    changeMonth: true,
                    numberOfMonths: 1,
                    onSelect: function( selectedDate ) {
                        var option = this.id == "from" ? "minDate" : "maxDate",
                            instance = $( this ).data( "datepicker" ),
                            date = $.datepicker.parseDate(
                                instance.settings.dateFormat ||
                                $.datepicker._defaults.dateFormat,
                                selectedDate, instance.settings );
                        dates.not( this ).datepicker( "option", option, date );
                    }
                });

});

