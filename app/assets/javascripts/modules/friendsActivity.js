setInterval(get_fb, 1200);
function get_fb(){
    $.ajax({
        type:"GET",
        url:"/friendActivity",
        dataType:"json",
        success:function(result){
          $(".custom-activity-updates").html("");
         result.forEach(order => {
          $(".custom-activity-updates").append("<p>");
          $(".custom-activity-updates").append(" "+ order.name + " has created an order for " + order.meal + "from " + order.restaurant_name + "");
          $(".custom-activity-updates").append("</p>");
          });
        //   alert("hiiiiiiiiii");
       
      
    }
  })
}