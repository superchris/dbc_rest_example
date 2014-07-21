$(document).ready(function() {
  $.getJSON("/contacts.json", function(contacts) {
    for(var i=0; i < contacts.length; i++) {
      var contact = contacts[i];
      $("#contacts").append("<ul><li><a href='/contacts/" +
        contact.id + "'>" + contact.name  + "</a></li>" +
        "<li>" + contact.email + "</li></ul><hr/>"
      );
    }
  });

  $("#create-contact").click(function() {
    $.post("/contacts", { contact: { name: "Bob", email: "Jones"} }, function(response) {
      console.log(response);
    });
  });
});
