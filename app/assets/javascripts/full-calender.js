$(document).on('turbolinks:load', function(){
    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();

    var events_array = events_load;

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
        eventColor: 'red',
        //Hide all events in month view
        eventRender: function(event, element, view) {
		if(view.type == 'month') {
			$(element).css("display", "none");
		}},
		//On Click event for month go to the selected day agenda.
        dayClick: function(date, jsEvent, view) {
            var today = new Date();
            today.setDate(today.getDate());
            var todayday = moment(today).startOf('day');
            var clickday = moment(date).startOf('day');
            if ( clickday >= todayday ) {
                $('#calendar').fullCalendar('gotoDate',date);
                $('#calendar').fullCalendar('changeView','agendaDay');
            }
        },
        //Make selectable events.
        select: function(start, end, jsEvent, view) {
            console.log(view.name);
			if ( view.name === "agendaDay") {
                document.getElementById('pickup_datetime').value = moment(start).toISOString();
                document.getElementById('drop_datetime').value = moment(end).toISOString();
                var totalTime = (moment(end).unix() - moment(start).unix())/3600;
                document.getElementById('booking_total').value = (totalTime * vec_rate).toFixed(2);
			}
        }
    });
});