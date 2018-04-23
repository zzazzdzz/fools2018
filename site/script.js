"use strict";

var ACHIEVEMENTS = [

    ['Basics', [
        ['you_tried', 'An attempt was made', 'Log in and visit at least one map.'],
        ['exploration_lv1', 'Rookie Explorer', 'Visit 20 unique maps.'],
        ['exploration_lv2', 'Experienced Explorer', 'Visit 60 unique maps.'],
        ['exploration_lv3', 'Exploration Prodigy', 'Visit 110 unique maps.']
    ]],

    ['Exploration', [
        ['northern_edge', 'To the North!', 'Visit the Northern Edge of Glitchland.'],
        ['southern_edge', 'To the South!', 'Visit the Southern Edge of Glitchland.'],
        ['western_edge', 'To the West!', 'Visit the Western Edge of Glitchland.'],
        ['eastern_edge', 'To the East!', 'Visit the Eastern Edge of Glitchland.'],
        ['altering_cave_all', 'All the alterations', 'Visit all three forms of the Altering Cave.'],
        ['lost_woods_all', 'Not lost anymore', 'Find all three secret areas in the Lost Woods.'],
        ['deliria', 'Delirium achieved', 'Visit Deliria.'],
        ['designers_creation', 'Field of Koopers 4', 'Go through the best map ever made.'],
        ['binary_woods', 'Depth First Search', 'Trek through the Binary Woods.']
    ]],
    
    ['Quests', [
        ['microscopic_nuclear_things', "It's very hot in the lab", "Help find the microscopic nuclear things."],
        ['best_pokemon', "Who's the best Pokémon?", "Complete the survey and give the correct answer."],
        ['glitched_house', 'Reunited', 'Help the couple in the Glitched House.'],
        ['glitched_lab', 'As if nothing ever happened', 'Help the Glitch Research Lab clean up the mess they created.'],
        ['returned_flute', 'Demisemihemidemisemiquaver', 'Return the lost Poké Flute.'],
        ['grasslands', 'LAWN PURGE', "Why do people hate grass so much?"],
        ['glitch_plains', 'Cleanse the Glitch Plains', 'Remove the corruption from the Glitch Plains.'],
        ['hidden_retreat', 'Overhead view is cheating', 'Someone might be hiding in the Hidden Retreat.'],
        ['yet_another_secret', 'Yet Another Secret', "Another secret that is easy to find and completely uninspired."],
        ['dark_house', 'Infinite light', "You don't need electricity when you have HM05."],
        ['demonetized', 'Demonetized', "Find out who's demonetizing all of these videos."],
        ['obscured_path', 'Recursive madness', 'Understand recursion and find the Obscured Path.']
    ]],
    
    ['The Fossilized Trio', [
        ['obtained_helix', 'All praise the Helix', 'Acquire the Helix Fossil.'],
        ['obtained_dome', 'Filthy Dome worshipper', 'Acquire the Dome Fossil.'],
        ['obtained_old_amber', "Guys, I'm still here", 'Acquire the Old Amber.'],
        ['returned_fossils', 'In the name of science', 'Return all three fossils to the Explorer Sindicate.']
    ]],
    
    ['Game Corner', [
        ['small_winner', 'Suboptimal RNG', 'Get at least a single match in the Glitchland Lottery.'],
        ['medium_winner', 'Sometimes lucky', 'Get at least a triple match in the Glitchland Lottery.'],
        ['big_winner', 'You lucky bastard', 'Get a quintuple match in the Glitchland Lottery.'],
        ['thousand_coins', 'All luck, no skill', 'Win 1000 coins in the Game Corner in one sitting.']
    ]],
    
    ['Collecting Balls', [
        ['pokeball_lv1', 'Bronze Balls', 'Give 1 Poké Ball to the guy in Western Glitchland.'],
        ['pokeball_lv2', 'Silver Balls', 'Give 3 Poké Balls to the guy in Western Glitchland.'],
        ['pokeball_lv3', 'Golden Balls', 'Give 5 Poké Balls to the guy in Western Glitchland.']
    ]],
    
    ['Cracker Cavern', [
        ['cracker_cavern_1', 'I know how to edit memory', 'Clear the first challenge of the Cracker Cavern.'],
        ['cracker_cavern_2', 'I got better at editing memory', 'Clear the second challenge of the Cracker Cavern.'],
        ['cracker_cavern_3', 'I know how to solve crackmes', 'Clear the third challenge of the Cracker Cavern.'],
        ['cracker_cavern_4', 'I reversed the communication protocol', 'Clear the fourth challenge of the Cracker Cavern.']
    ]]
    
];

var ACHIEVEMENT_POINTS = {
    'northern_edge': 30,
    'southern_edge': 30,
    'western_edge': 30,
    'eastern_edge': 30,
    'altering_cave_all': 40,
    'deliria': 30,
    'desolate_cabin': 20,
    'lost_woods_all': 40,
    'demonetized': 10,
    'microscopic_nuclear_things': 20,
    'pokeball_lv1': 10,
    'pokeball_lv2': 20,
    'pokeball_lv3': 30,
    'best_pokemon': 10,
    'glitched_house': 10,
    'glitched_lab': 20,
    'obtained_helix': 30,
    'obtained_dome': 20,
    'obtained_old_amber': 20,
    'thousand_coins': 20,
    'returned_fossils': 30,
    'returned_flute': 30,
    'dark_house': 10,
    'obscured_path': 20,
    'glitch_plains': 10,
    'grasslands': 20,
    'designers_creation': 10,
    'binary_woods': 10,
    'hidden_retreat': 10,
    'yet_another_secret': 20,
    'cracker_cavern_1': 20,
    'cracker_cavern_2': 20,
    'cracker_cavern_3': 30,
    'cracker_cavern_4': 40,
    'small_winner': 0,
    'medium_winner': 0,
    'big_winner': 0,
    'you_tried': 10,
    'exploration_lv1': 20,
    'exploration_lv2': 30,
    'exploration_lv3': 40
};

function getApiEndpoint(name){
    return "http://127.0.0.1:12709/api/" + name;
}

function entities(s){
    return $('<div>').text(s).html();
}

function transition(a, b, complete){
    $(a).slideUp(400);
    if (complete) $(b).slideDown(400, complete);
    else $(b).slideDown(400);
}

function createAchievementList(q){
    var html = '<table class="achievement-table">';
    for (var i=0; i<ACHIEVEMENTS.length; i++){
        html += '<tr><th>' + ACHIEVEMENTS[i][0] + ' (%PTS%)</th></tr>';
        var total_player_pts = 0;
        var total_pts = 0;
        for (var j=0; j<ACHIEVEMENTS[i][1].length; j++){
            var achievement = ACHIEVEMENTS[i][1][j];
            var achievement_pts = ACHIEVEMENT_POINTS[achievement[0]];
            var achievement_player_pts = q[achievement[0]] ? achievement_pts : 0;
            total_pts += achievement_pts;
            total_player_pts += achievement_player_pts;
            html += '<tr><td ';
            if (q[achievement[0]]) html += 'class="achievement-achieved"';
            else html += 'class="achievement-unachieved"';
            html += '><span class="achievement-title">' + achievement[1] + '</span> (';
            html += achievement_player_pts + "/" + achievement_pts;
            html += ')<br>';
            html += '<span class="achievement-description">' + achievement[2] + '</span></td></tr>';
        }
        html = html.replace("%PTS%", total_player_pts + "/" + total_pts);
    }
    html += "</table>";
    return html;
}

function loadScoreboard(){
    $('#highscore_table').find('td:not(.servicing)').parent().remove();
    $('#highscore_loader').show();
    $('#highscore_error').hide();
    var ajax = $.get(getApiEndpoint("scoreboard"));
    ajax.done(function(data){
        if (typeof(data) != "object") data = JSON.parse(data);
        if (!data['error']){
            $('#highscore_loader').hide();
            data = data['data'];
            if (data.length){
                var place = 1;
                var prev_score = -1;
                var color_flip = 0;
                for (var i=0; i<data.length; i++){
                    var score = parseInt(data[i]['points']);
                    if (score != prev_score){
                        place = i+1;
                        color_flip += 1;
                    }
                    prev_score = score;
                    var row = $('<tr>');
                    row[0].style.backgroundColor = ['#ffe', '#ffb'][color_flip % 2];
                    row.append($('<td>').text(place));
                    row.append($('<td>').html("<b>"+data[i]['username']+"</b>"));
                    row.append($('<td>').html("<b>" + score + "</b>"));
                    $('#highscore_table').append(row);
                }
            }else{
                var row = $('<tr>');
                row.append($('<td colspan="5">').html("<i>No scores submitted yet. Be the first!</i>"));
                $('#highscore_table').append(row);
            }
        }else{
            $('#highscore_error').show();
            $('#highscore_loader').hide();
        }
    });
    ajax.fail(function(data){
        $('#highscore_error').show();
        $('#highscore_loader').hide();
    });
}

function formatTimeDiff(diff){
    var time_split = [];
    time_split.push(diff % 60);
    diff = Math.floor(diff / 60);
    time_split.push(diff % 60);
    diff = Math.floor(diff / 60);
    time_split.push(diff % 24);
    diff = Math.floor(diff / 24);
    time_split.push(diff);
    time_split.reverse();
    var suffixes = ["days", "hours", "minutes", "seconds"];
    for (var i=0; i<suffixes.length; i++){
        suffixes[i] = time_split[i] + " " + suffixes[i];
    }
    return suffixes.join(", ");
}

function updateTimers(){
    var now = parseInt(+new Date() / 1000);
    var untilEventEnd = 1523102400 - now;
    var untilServerShutdown = 1524497400 - now;
    if (untilEventEnd > 0){
        $('#countdown_end').html(formatTimeDiff(untilEventEnd) + " until the end of the event.");
    }else{
        if (untilServerShutdown > 0){
            $('#countdown_end').html("The event has ended! The scoreboard is locked, but the game can still be played.");
        }else{
            $('#countdown_end').html("The event has ended.");
        }
    }
    if (untilServerShutdown > 0){
        $('#countdown_shutdown').html(formatTimeDiff(untilServerShutdown) + " until server shutdown.");
    }else{
        $('#countdown_shutdown').html("Thanks everyone for participating!");
    }
}

function registerValidate(){
    var username = $('#register_username').val();
    var password1 = $('#register_password1').val();
    var password2 = $('#register_password2').val();
    var username_test = /^[A-Za-z0-9]+$/.test(username);
    var empty_test = password1.length > 0 && password2.length > 0 && username.length > 0;
    var password_test = password1 == password2;
    $('#register_btn').attr('disabled', !(username_test && empty_test && password_test));
    $('#register_btn').html('Register');
    if (!username_test){
        $('#register_btn').html('(Invalid username)');
    }
    if (!empty_test){
        $('#register_btn').html('(Fill in all of the fields)');
    }
    if (!password_test){
        $('#register_btn').html('(Passwords do not match)');
    }
}

function registerPerform(){
    var ajax = $.post(getApiEndpoint("register"), {
        'username': $('#register_username').val(),
        'password': $('#register_password1').val(),
        'message': $('#register_message').val()
    });
    ajax.done(function(data){
        if (!data['error']){
            transition("#loader","#register_success");
        }else{
            $(".error_msg").text(data['message']);
            transition("#loader","#register_error");
        }
    });
    ajax.fail(function(xhr){
        $(".error_msg").html("An unknown error has occured. Please try again.<br><br>Note: For security reasons, a single IP is only allowed one registration attempt per minute.");
        transition("#loader","#register_error");
    });
}

function loginPerform(){
    var ajax = $.post(getApiEndpoint("login"), {
        'username': $('#login_username').val(),
        'password': $('#login_password').val()
    });
    ajax.done(function(data){
        if (!data['error']){
            localStorage['d_username'] = $('#login_username').val();
            localStorage['d_sessid'] = data['sessid'];
            $('.placeholder_username').text($('#login_username').val());
            transition("#loader","#start_playing");
        }else{
            $(".error_msg").text(data['message']);
            transition("#loader","#login_error");
        }
    });
    ajax.fail(function(xhr){
        $(".error_msg").html("An unknown error has occured. You might have made too many login requests - wait a couple of minutes, and then try again.");
        transition("#loader","#login_error");
    });
}

function editDetailsPerform(){
    var ajax = $.post(getApiEndpoint("message"), {
        'message': $('#edit_details_message').val(),
        'sessid': localStorage['d_sessid']
    });
    ajax.done(function(data){
        if (!data['error']){
            transition("#loader","#edit_details_success");
        }else{
            $(".error_msg").text(data['message']);
            transition("#loader","#edit_details_error");
        }
    });
    ajax.fail(function(xhr){
        $(".error_msg").html("An unknown error has occured. You might have made too many login requests - wait a couple of minutes, and then try again.");
        transition("#loader","#edit_details_error");
    });
}

var _username;
function userProfilePerform(){
    var ajax = $.get(getApiEndpoint("user/" + _username));
    ajax.done(function(data){
        if (!data['error']){
            data = data['data'];
            $('#user_profile_name').text(data['username']);
            $('#achievement_list').html(createAchievementList(data['achievements']));
            transition("#loader","#user_profile");
        }else{
            $(".error_msg").text(data['message']);
            transition("#loader","#user_profile_error");
        }
    });
    ajax.fail(function(xhr){
        $(".error_msg").html("An unknown error has occured. You might have made too many login requests - wait a couple of minutes, and then try again.");
        transition("#loader","#user_profile_error");
    });
}

function checkLoggedIn(){
    if (localStorage['d_sessid'] && localStorage['d_username']){
        $('.placeholder_username').text(localStorage['d_username']);
        $('#main').hide();
        $('#start_playing').show();
    }
}

function logout(){
    localStorage['d_sessid'] = '';
    localStorage['d_username'] = '';
    window.location = window.location;
}

function checkUser(e){
    _username = e.textContent;
    $('#start_playing').slideUp(400);
    transition('#user_profile', '#loader', userProfilePerform);
    window.scrollTo(0, 0);
}

function checkSelf(){
    _username = localStorage['d_username'];
    $('#start_playing').slideUp(400);
    transition('#user_profile', '#loader', userProfilePerform);
    window.scrollTo(0, 0);
}

$(document).ready(function(){
    checkLoggedIn();
    updateTimers();
    $('#login_username, #login_password').on('keypress', function(e){
        if (e.keyCode == 13){
            $('#login_btn').click();
        }
    });
    loadScoreboard();
    setInterval(updateTimers, 1000);
});
