


$(function() {

    // Modals
    positionModal = function() {
        var wHeight = window.innerHeight;

        if (wHeight == undefined) {
            wHeight = document.documentElement.clientHeight;
        }

        if ($("#modal").height() > wHeight) {
            $("#modal .content").height(wHeight - 150);
        }


        // position modal
        var boxTop = parseInt((wHeight / 2) - ($("#modal").height() / 2));
        $("#modal").css({
            'margin-top': boxTop
        });


        var modalBG = $("body").height();
        if (modalBG < wHeight) {
            modalBG = wHeight;
        }
        $("#modal-background, #modal-wrapper").height(modalBG);

        $("#modal img:first").load(function() {
            var boxTop = parseInt((wHeight / 2) - ($("#modal").height() / 2));
            $("#modal").css({
                'margin-top': boxTop
            });
        });

    }

    loadModal = function(url, buttonUrl) {
        $("body").append('<div id="modal-background"></div>');
        $("body").append('<div id="modal-wrapper"></div>');
        $("#modal-background").css("opacity", 0).fadeTo('slow', 0.5);
        $("#modal-wrapper").append('<div id="modal"></div>');
        if ($.browser.msie) {
            $("select").hide();
        }
        $.ajax({
            url: url,
            cache: false,
            success: function(html) {
                if (($.browser.msie) && ($.browser.version == 6.0)) {
                    html = html.replace("<iframe", "<iframe scrolling='yes'");
                }
                $("#modal").html(html);
                var querystring = url.split('?')[1];
                if (querystring) {
                    var view = querystring.split('=')[1];
                    $(".assignment-step").hide();
                    $("#" + view).show();
                }

                $(".popup-border-left").height($(".popup-content").height() + 40);
                $(".popup-border-right").height($(".popup-content").height() + 40);
                $(".popup-border-left").css("opacity", 0.8);
                $(".popup-border-right").css("opacity", 0.8);
                $(".popup-border-top").css("opacity", 0.8);
                $(".popup-border-bot").css("opacity", 0.8);
                $(".popup-corner-left").css("opacity", 0.8);
                $(".popup-corner-right").css("opacity", 0.8);
                if ($.browser.msie) {
                    $(".error-arrow").css("margin-left", "-50px");
                }
                if ($.browser.mozilla) {
                    $(".error-arrow").css("margin-left", "-40px");
                }
                if (($.browser.msie) && ($.browser.version == 6.0)) {
                    $(".popup-content").css("width", "424px");
                    alert($("iframe").attr("scrolling"));
                }

                //$(".close-modal").focus();
                $(".close-modal").click(function() {
                    closeModal();
                    return false;
                });

                $("#popup button").click(function() {
                    if (this.id == "button-continue") {
						window.location.href = buttonUrl;
						return false;
                    }
                    else if (this.id == "button-submit") {
                        if ($('#checkbox-affirm').is(':checked')) {
                            $(".assignment-step").hide();
                            $("#assignment-step-3").show();
							if ($("#submitButton").hasClass("no_global_ad")) {
								$("#info-message").show();
								$("#button-upload").addClass("info");
							}
                        }
                        else {
                            $(".error-arrow").show();
                            $("#error-message").show();
                        }
                    }
                    else if (this.id == "button-upload") {
						document.submitForm.submit();
						closeModal();
                    }

                    $(".popup-border-left").height($(".popup-content").height() + 40);
                    $(".popup-border-right").height($(".popup-content").height() + 40);
                    positionModal();

                    return false;
                });
                positionModal();
            },
            error: function() {
                alert("Error loading page" + url);
                closeModal();
            }
        });
        return false;
    }

    closeModal = function() {
        $("#modal-wrapper").remove();
        $("#modal-background").remove();
        if ($.browser.msie) {
            $("select").show();
        }
    }

    $(".show-modal-register").click(function() {
        var url = $(this).attr("href");
        if (url.match('#')) {
            url = '#' + url.split('#')[1];
        }
        loadModal("/i/popup.html?view=assignment-step-1", url);
        return false;
    });

    $("#submitButton").click(function() {
        var url = "/i/popup.html?view=assignment-step-2";
        loadModal(url);
        return false;
    });

    $(".close-modal").click(function() {
        closeModal();
        return false;
    });
});
