function displayContact(contact) {
  $("#contacts").append("<ul><li><a href='/contacts/" +
    contact.id + "'>" + contact.name  + "</a></li>" +
    "<li>" + contact.email + "</li></ul><hr/>"
  );
};

$(document).ready(function() {
  $.getJSON("/contacts.json", function(contacts) {
    for(var i=0; i < contacts.length; i++) {
      var contact = contacts[i];
      displayContact(contact);
    }
  });

  $("#create-contact").click(function() {
    var newContact = {
      name: $("#name").val(),
      email: $("#email").val()
    };
    $.post("/contacts", { contact: newContact }, function(contact) {
      console.log(contact);
      displayContact(contact);
    });
  });
});
