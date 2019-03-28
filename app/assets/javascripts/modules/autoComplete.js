

function checkGroup($name){

  var found = availableGroups.includes($name);
}

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
       // alert(element.username);
        availableUsers.push(element.username);
        availableTags.push(element.username);
      });
    }
  })


  $.ajax({
    type:"GET",
    url:"/group",
    dataType:"json",
    data: {some_parameter: 'hello'},
    success:function(result){
      result.forEach(element => {
       // alert(element.name);
        availableGroups.push(element.name) 
        availableTags.push(element.name);
      });
    }
  })

  let tags=[];
  let tagss=[];
  $("#tags").autocomplete({
    source: availableTags,

    select: function(event, ui) {
      
      $(this).val("");
     // alert(ui.item.value );
      if(!tagss.includes(ui.item.value)){
      if(availableGroups.includes(ui.item.value)){
          $.ajax({
          type:"GET",
          url:"/member",
          dataType:"json",
          data: {id:ui.item.value },
          success:function(result){
            result.forEach(element => {
             // alert(element.username);
              availableUsers.push(element.username);
            //  availableTags.push(element.username);
              $("#invite-list ul")
              .append(
                
      
                "<li class='hidden'>" +
                element.username +
                  "<input type='hidden' name='order[friends["+element.username+"]]' value="+element.username+" />" 
                  + " <button class='remove btn btn-info'>X</button> </li>"
                  
              )
              .find("li.hidden")
              .fadeIn();
              tagss.push(element.username);
            });
          }
        })
        
      }else{
      $("#invite-list ul")
        .append(
          

          "<li class='hidden'>" +
            ui.item.value +
            "<input type='hidden' name='order[friends["+ui.item.value+"]]' value="+ui.item.value+" />" 
            + " <button class='remove btn btn-info'>X</button> </li>"
            
        )
        .find("li.hidden")
        .fadeIn();
        tagss.push(ui.item.value);
      
      }
     
    }}
  });


  $("#invite-list ul").on("click", ".remove", function() {
    $(this)
      .parent()
      .fadeOut(700)
      .remove();
  });
});
