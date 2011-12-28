// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
jQuery(function() {
    jQuery("#tabs").tabs();
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


//    playLayout();

});
function playLayout() {
    alert("PlayLayout");
    jQuery('.flex-grid').layout();
    jQuery('.column').layout();
    jQuery('.border').layout();
    jQuery('.mpb').layout();

    // we call the inner layout first
    jQuery('.nested-center').layout();

    // then we set the outer one to a fixed size, and turn resizing off
    jQuery('.nested').width(600).height(400).layout({resize: false});

    // we can also specify everything in code; in this example
    // we create two columns of equal size.
    jQuery('.code').layout({
        type: 'grid',
        items: [
            jQuery('.col-1').width(400),
            jQuery('.col-2').width(400)
        ],
        vgap: 3,
        hgap: 3
    });

    $('#flow-left').layout();

    $('.horizontal').layout();
    $('.vertical').layout();




}