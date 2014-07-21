$(document).ready(function() {
  $.getJSON("/contacts.json", function(contacts) {
    for(var i=0; i < contacts.length; i++) {
      console.log(contacts[i].name);
    }
  });
});
