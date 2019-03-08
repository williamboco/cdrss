$(document).ready(function() {
    var max_fields      = 10; //maximum input boxes allowed
    var wrapper         = $(".input_fields_wrap"); //Fields wrapper
    var add_button      = $(".add_field_button"); //Add button ID
    
    var x = 1; //initlal text box count
    $(add_button).click(function(e){ //on add input button click
        e.preventDefault();
        if(x < max_fields){ //max input box allowed
            x++; //text box increment
            $(wrapper).append('<div><div class="col-md-8" style="margin-top: 10px;">' +
												'<input type="text" id="event-name" name="medicine[' + x + ']" class="form-control input-no-border" placeholder="Medicine ' + x + '">' +
											'</div>' +
											'<div class="col-md-2"><p></p><input type="number" name="quantity[' + x + ']" min="1" max="5" class="form-control input-no-border" placeholder="qty." ></div>' +
											'<div class="col-md-2"><a href="#" class="remove_field"><span class="glyphicon glyphicon-remove"></span></a></div></div>'); //add input box
        }
    });
    
    $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
        e.preventDefault(); $(this).parent('div').parent().remove();x--;
    })
});