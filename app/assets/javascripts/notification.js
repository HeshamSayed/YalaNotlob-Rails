$(document).ready(function () {
     fetch("/all_notifications/count_all").then((data)=>{
         return data.json();
     }).then((data)=>{
        $('#noti_Counter')
        .text(data);
     })
    // ANIMATEDLY DISPLAY THE NOTIFICATION COUNTER.
    $('#noti_Counter')
        .css({ opacity: 0 })
        .text('')  // ADD DYNAMIC VALUE (YOU CAN EXTRACT DATA FROM DATABASE OR XML).
        .css({ top: '0px' })
        .animate({ top: '0px', opacity: 1 }, 500);

    $('.fa-bell').click(function () {

        // TOGGLE (SHOW OR HIDE) NOTIFICATION WINDOW.
        $('#notifications').fadeToggle('fast', 'linear', function () {
            if ($('#notifications').is(':hidden')) {
                $('.fa-bell').css('background-color', '#2E467C');
            }
            // CHANGE BACKGROUND COLOR OF THE BUTTON.
            else $('.fa-bell').css('background-color', '#FFF');
        });

        $('#noti_Counter').fadeOut('slow');     // HIDE THE COUNTER.

        return false;
    });

    // HIDE NOTIFICATIONS WHEN CLICKED ANYWHERE ON THE PAGE.
    $(document).click(function () {
        $('#notifications').hide();

        // CHECK IF NOTIFICATION COUNTER IS HIDDEN.
        if ($('#noti_Counter').is(':hidden')) {
            // CHANGE BACKGROUND COLOR OF THE BUTTON.
            $('.fa-bell').css('background-color', '#2E467C');
        }
    });

    $('#notifications').click(function () {
        return false;       // DO NOTHING WHEN CONTAINER IS CLICKED.
    });

    $('.destroy').on('click', function(){
        // $.ajax({
        //     url: '/orders/' + this.parentElement.id + '/details/' + this.parentElement.class,
        //     type: 'DELETE',
        //     success: function(){
        //         console.log('Success');
        //     }
        // });
        // axios({
        //     url: 'localhost:3000/orders/' + this.parentElement.id + '/details/' + this.parentElement.class,
        //     method: 'DELETE'
        // });
        fetch('http://localhost:3000/orders/' + this.parentElement.id + '/details/' + this.parentElement.class, {
            method: 'DELETE'
        });
    });
});