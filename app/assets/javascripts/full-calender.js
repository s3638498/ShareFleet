$(document).on('turbolinks:load', function(){
    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();

    var events_array = [
        {
        title: 'Booked',
        start  : '2018-09-30T12:30:00',
        end    : '2018-09-30T13:30:00',
        allDay: false}
    ];

    $('#calendar').fullCalendar({
        header: {
            left: 'next today',
            center: 'title',
            right: 'month,agendaDay'
        },
        selectable: true,
        selectOverlap: false,
        defaultView: 'month',
        events: events_array,
        //Hide all events in month view
        eventRender: function(event, element, view) {
		if(view.type == 'month') {
			$(element).css("display", "none");
		}},
		//On Click event for month go to the selected day agenda.
        dayClick: function(date, jsEvent, view) {
            var today = new Date();
            today.setDate(today.getDate());
            if ( date >= today ) {
                $('#calendar').fullCalendar('gotoDate',date);
                $('#calendar').fullCalendar('changeView','agendaDay');
            }
        },
        //Make selectable events.
        select: function(start, end, jsEvent, view) {
            console.log(view.name);
			if ( view.name === "agendaDay") {
				// start contains the date you have selected
                // end contains the end date. 
                // Caution: the end date is exclusive (new since v2).
                var allDay = !start.hasTime() && !end.hasTime();
                alert(["Event Start date: " + moment(start).format(),
                "Event End date: " + moment(end).format(),
                "AllDay: " + allDay].join("\n"));
                document.getElementById('pickup_datetime').value = moment(start).toISOString();
                document.getElementById('drop_datetime').value = moment(end).toISOString();
                var totalTime = (moment(end).unix() - moment(start).unix())/3600;
                document.getElementById('booking_total').value = (totalTime * vec_rate).toFixed(2);;
			}
        }
    });
});