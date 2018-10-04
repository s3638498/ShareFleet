$(document).ready(function() { 
    var discount = 0;
    var start = null;
    var end = null;
    $("#promo_button").on('click',function(){
        var val = document.getElementById('promo_code_input').value;
        if(discount == 0){
            $.ajax({
              type: "GET",
              url: "/checkpromotion",
              dataType: "JSON",
              data: { 'code': val },
              success: function(data) {
                console.log(data);
                if(data["value"] === false){
                    //document.getElementById('discount_label').value = "Invalid code";
                }else{
                    discount = data["value"].toFixed(2);
                    document.getElementById('booking_total').value = (document.getElementById('booking_total').value * discount).toFixed(2);
                    start = document.getElementById('pickup_datetime').value;
                    end = document.getElementById('drop_datetime').value;
                }
              }
            });
        }
        if(discount != 0 && ((start != document.getElementById('pickup_datetime').value) || (end != document.getElementById('drop_datetime').value))){
            amount = (document.getElementById('booking_total').value * discount).toFixed(2);
            document.getElementById('booking_total').value = amount;
            total = amount;
            start = document.getElementById('pickup_datetime').value;
            end = document.getElementById('drop_datetime').value;
        }
    }) 
});