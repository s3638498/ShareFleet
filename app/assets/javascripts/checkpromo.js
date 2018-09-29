$(document).ready(function() { 
    $("#promo_button").on('click',function(){
        var val = document.getElementById('promo_code_input').value;
        $.ajax({
          type: "GET",
          url: "/checkpromotion",
          dataType: "JSON",
          data: { 'code': val },
          success: function(data) {
            console.log(data);
            document.getElementById('booking_total').value = (document.getElementById('booking_total').value * data["value"]).toFixed(2);
          }
        });
    }) 
});