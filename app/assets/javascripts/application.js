//= require jquery
//= require jquery_ujs
//= require_self

var getUsers = function(){
  return $.ajax({
    url: '/api/users',
    method: 'GET',
    dataType: 'json'
  });
};

var getUser = function(id){
  return $.ajax({
    url: '/api/users/' + id,
    method: 'GET',
    dataType: 'json'
  });
};

var showUsers = function(){
  $('#content').html('<p>Loading users...</p>');
  
  var combinedPromise = $.when( getUsers(), getUser('3b0c42cc-a856-4cfa-8dfd-1efa2ad457e1') );
  
  combinedPromise.fail(function(a,b,c) {
    $('#content').html("Something went wrong!");
  });

  combinedPromise.done(function(users, user) {
    $('#content').hide();
    $('#content').html(JSON.stringify(users));
    $('#content').append('<br><br>');
    $('#content').append(JSON.stringify(user));
    $('#content').fadeIn(3000);
  });
};

$('#do_it').on('click', showUsers);



