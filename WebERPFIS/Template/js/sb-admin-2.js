$(function() {
    $('#side-menu').metisMenu({
        toggle: false,
        preventDefault: false
    });
});

//Loads the correct sidebar on window load,
//collapses the sidebar on window resize.
// Sets the min-height of #page-wrapper to window size
$(function() {
    $(window).bind("load resize", function() {
        var topOffset = 50;
        var width = (this.window.innerWidth > 0) ? this.window.innerWidth : this.screen.width;
        if (width < 768) {
            $('#left-toggle').hide();
            $('#right-toggle').hide();
            $('#page-wrapper').css({ 'margin-left': 0 + 'px' });
            $('.navbar-collapse').hide();

            //$('div.navbar-collapse').addClass('collapse');
            topOffset = 100; // 2-row-menu
        } else {
            $('#left-toggle').show();
            $('#page-wrapper').css({ 'margin-left': 250 + 'px' });
            $('.navbar-collapse').show();

            //$('div.navbar-collapse').removeClass('collapse');
        }

        var height = ((this.window.innerHeight > 0) ? this.window.innerHeight : this.screen.height) - 1;
        //height = height - topOffset;
        //if (height < 1) height = 1;
        //if (height > topOffset) {
        //    $("#page-wrapper").css("min-height", (height) + "px");
        //}
    });

    var url = window.location;
    // var element = $('ul.nav a').filter(function() {
    //     return this.href == url;
    // }).addClass('active').parent().parent().addClass('in').parent();
    var element = $('ul.nav a').filter(function() {
        return this.href === url;
    }).addClass('active').parent();

    //while (true) {
    //    if (element.is('li')) {
    //        element = element.parent().addClass('in').parent();
    //    } else {
    //        break;
    //    }
    //}
});
