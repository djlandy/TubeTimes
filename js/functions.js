function getstations() {

    var host;
    var path;
    var newurl;
    var l;
    var s;

    l = document.getElementById("line-pick").value;

    host = location.hostname;
    path = location.pathname;
    newurl = "http://" + host + path.replace("index.asp", "") + "stations.asp";



    $.mobile.loading('show');

    $.get(newurl, "l=" + l, function (j) {
        $("option", "select#station-pick").remove();
        $("select#station-pick").append(j);
        $("select#station-pick").selectmenu("refresh", true);
        $("select#station-pick").selectmenu('enable');
        $('[type="submit"]').button('disable');
        $('[type="submit"]').buttonMarkup({ icon: '' });

    })

    $.mobile.loading('hide');
}

function changestation() {
    $('[type="submit"]').button('enable');
    $('[type="submit"]').buttonMarkup({ icon: "arrow-r" });
    $('[type="submit"]').buttonMarkup({ iconpos: "right" });
}


function changepage() {
    var l;
    var s;
    l = document.getElementById("line-pick").value;
    s = document.getElementById("station-pick").value;
    $.mobile.changePage("showtimes.asp?l=" + l + "&s=" + s, { transition: "slide" });

}

$("#picker").live('pageinit', function () {

    if ($.event.special.orientationchange.orientation() == 'portrait') {
        lockscroll()
    };

    $("#picker").bind('orientationchange', function (o) {
        if (o.orientation == 'portrait') {
            lockscroll();
        }
        else if (o.orientation == 'landscape') {
            unlockscroll();
        }
    });

});

function reloadpage() {
    $.mobile.changePage(window.location.href, {
        allowSamePageTransition: false,
        transition: 'none',
        showLoadMsg: true,
        reloadPage: true,
        changeHash: false
    }
);
}

function lockscroll() {
    $("#picker").bind("touchmove", function (event) {
        event.preventDefault();
    })
}

function unlockscroll() {
    $("#picker").unbind("touchmove");
}
