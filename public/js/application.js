function displayContact(contact) {
  $("#contacts").append("<ul><li><a href='/contacts/" +
    contact.id + "'>" + contact.name  + "</a></li>" +
    "<li>" + contact.email + "</li></ul><hr/>"
  );
};

$(document).ready(function() {
  $.ajax({
    url: "/contacts",
    success: function(contacts) {
      for(var i=0; i < contacts.length; i++) {
        var contact = contacts[i];
        displayContact(contact);
      }
    }
  });
  // $.getJSON("/contacts.json",
  // });

  $("#create-contact").click(function() {
    var newContact = {
      name: $("#name").val(),
      email: $("#email").val()
    };
    var params = { contact: newContact };
    $.ajax({
      url: "/contacts",
      data: params,
      type: "POST",
      success: function(contact) {
        console.log(contact);
        displayContact(contact);
      }
    });
  });
});
