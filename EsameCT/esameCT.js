$("document").ready(function(){

    /*Inizialmente i div contenenti le abbreviazioni e le traduzioni, le glosse non sono visibili*/
    $("#p30").css("display", "none");
    $(".traduzione").css("display", "none");
    $(".abbr").css("display", "none");
    $(".sic").css("display", "none");
    $("#listaG").css("display", "none");
    $("#listaP").css("display", "none");

    $(document).on("click", "#cambioPagina", function(){
        if ($(this).data("click") == false) {
            $(this).data("click", true);
            $("#p30").css("display", "grid");
            $("#p29").css("display", "none");
            $("#cambioPagina").html("visualizza pagina 29");
        } else {
            $("#p29").css("display", "grid");
            $("#p30").css("display", "none");
            $(this).data("click", false);
            $("#cambioPagina").html("visualizza pagina 30"); 
        };
    });

    $(document).on("click", "#cambioLingua", function(){
        if ($(this).data("click") == false) {
            $(this).data("click", true);
            $(".traduzione").css("display", "inline");
            $(".originale").css("display", "none");
            $("#cambioLingua").html("leggi in francese");
            $("#cambioAbbr").css("display", "none");
        } else {
            $(".originale").css("display", "inline");
            $(".traduzione").css("display", "none");
            $(this).data("click", false);
            $("#cambioLingua").html("leggi in italiano");
            $("#cambioAbbr").css("display", "inline");
        };
    });

    $(document).on("click", "#cambioAbbr", function(){   /*mostra abbr e sic*/
        if ($(this).data("click") == false) {
            $(this).data("click", true);
            $(".abbr").css("display", "inline");
            $(".sic").css("display", "inline");
            $(".expan").css("display", "none");
            $(".corr").css("display", "none");
            $(".ex").css("display", "none");
            $("#cambioAbbr").html("visualizza edizione diplomatico-interpretativa");

        } else {
            $(this).data("click", false);
            $(".abbr").css("display", "none");
            $(".sic").css("display", "none");
            $(".expan").css("display", "inline");
            $(".corr").css("display", "inline");
            $(".ex").css("display", "inline");
            $("#cambioAbbr").html("visualizza edizione diplomatica");
        };
    });

    /*evidenzia le pericopi al passaggio sull'immagine*/
    $(document).on("mouseover", ".zona", function(){
        var id = $(this).attr("id");
        $('#' + id).css("background-color", "#ffff66");
        $('span#'+id).css("background-color", "#ffff66");
    });
    $(document).on("mouseleave", ".zona", function(){
        var id = $(this).attr("id");
        $('#' + id).css("background-color", "#ECDFD6");
        $('span#'+id).css("background-color", "#ECDFD6");
    });


    $(document).on("click", "#tendaGloss", function(){   /*mostra il glossario*/
        if ($(this).data("click") == false) {
            $(this).data("click", true);
            $("#listaG").css("display", "block");
            $("#tendaGloss").html("▲");
        } else {
            $(this).data("click", false);
            $("#listaG").css("display", "none");
            $("#tendaGloss").html("▼");
        };
    });

    $(document).on("click", "#tendaPers", function(){   /*mostra le persone nominate*/
        if ($(this).data("click") == false) {
            $(this).data("click", true);
            $("#listaP").css("display", "block");
            $("#tendaPers").html("▲");
        } else {
            $(this).data("click", false);
            $("#listaP").css("display", "none");
            $("#tendaPers").html("▼");
        };
    });

});

