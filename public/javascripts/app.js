$(document).ready(function() {
    $('#cats li h2').click(function() {
        if ($(this).hasClass('selected')) {
            return false;
        }
        cat = $(this).attr('id');

        if ($('.recipe-list').is(':visible')) {
            $('.recipe-list').hide("slide", {
                direction: "left"
            }, 200);
            $('.recipe-list ul').empty();
        }
        if ($('#subcats').is(':visible')) {
            $('#subcats').hide("slide", {
                direction: "left"
            }, 200);
            $('#subcats ul').empty();
        }

        $.ajax({
            url: "/ajax/subcategories",
            data: "cat=" + cat,
            type: 'GET',
            success: function(data) {
                $('#subcats ul').append(data);
                subcatDelay();
            }});
        function subcatDelay() {
            $('#subcats').show("slide", {
                direction: "left"
            }, 200);
        }
        $('#cats li h2').removeClass('selected').siblings().remove('i');

        $(this).addClass('selected').delay(200).parent().fadeIn('fast').append("<i></i>");
    });
    $('#subcats li h3').live('click', function() {
        if ($(this).hasClass('selected')) {
            return false;
        }
        subcat = $(this).attr('id');

        if ($('.recipe-list').is(':visible')) {
            $('.recipe-list').hide("slide", {
                direction: "left"
            }, 300);
            $('.recipe-list ul').empty();
        }
        $('#subcats li h3').removeClass('selected').siblings().remove('i');
        $(this).addClass('selected').parent().append("<i></i>");
        $.ajax({
            url: "/ajax/recipes",
            data: "subcat=" + subcat,
            type: 'GET',
            success: function(data) {
                $('.recipe-list ul').append(data);
            recipeDelay();
            }});
        function recipeDelay() {
            $('.recipe-list').show("slide", {
                direction: "left"
            }, 200);
        }


        });
    $('.recipe-list li .hd').live('click', function() {
        $(this).siblings('.bd').slideToggle(200);

    });

    $('h1').click(function(){
        if ($('.recipe-list').is(':visible')) {
            $('.recipe-list').hide("slide", {
                direction: "left"
            }, 300);
        }
        $('#subcats li h3').removeClass('selected').siblings().remove('i');
        if ($('#subcats').is(':visible')) {
            $('#subcats').hide("slide", {
                direction: "left"
            }, 200);
            $('#cats li h2').removeClass('selected').siblings().remove('i');

        }

    });
    $('#search').autocomplete('/ajax/search_ajax',{
        formatItem: function(data, i, n, value) {
        return "<h2>" + value.split(".")[0] + "</h2><h3>" + value.split(".")[1] + "</h3> ";
        },
        formatResult: function(data, value) {
            return value.split(".")[0];
        },
        matchContains: true

    });
    $('#search').result(function(event, data, formatted) {
        if (data){
            $('input#id').val(formatted.split(".")[2]);
            $('form').submit();            
        }

    });

});
