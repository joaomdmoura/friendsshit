$('form').bind("ajax:success", function(evt, data, status, xhr){
  alert('hello');
});
$('form').bind('ajax:error', function(evt, data, status, xhr){
  alert("Error!");
});