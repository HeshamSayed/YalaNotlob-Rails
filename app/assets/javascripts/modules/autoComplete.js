$(document).ready(function() {
  let availableUsers = [];
  let availableGroups = [];
  let availableTags=[];
  $.ajax({
    type:"GET",
    url:"/test",
    dataType:"json",
    data: {some_parameter: 'hello'},
    success:function(result){
      result.forEach(element => {
        alert(element.username);
        availableUsers.push(element);
        availableTags.push(element.username);
      });
    }
  })

  let tags=[];
  $("#tags").autocomplete({
    source: availableTags,
    select: function(event, ui) {
      $(this).val("");
      $("#invite-list ul")
        .append(
           
          "<li class='hidden'>" +
            ui.item.value +
            "<input type='hidden' name='order[friends["+ui.item.value+"]]' value="+ui.item.value+" />" 
            + " <button class='remove btn btn-info'>X</button> </li>"
            
        )
        .find("li.hidden")
        .fadeIn();
       tags.push(ui.item.value);
       console.log(tags);
      //  $.ajax({
      //   type: "POST",
      //   url: "/save",
      //   data: { tags: JSON.stringify(tags) },
      //   success: function() { alert("Success!"); }
      // });
    }
  });


  $("#invite-list ul").on("click", ".remove", function() {
    $(this)
      .parent()
      .fadeOut(700)
      .remove();
  });
});
