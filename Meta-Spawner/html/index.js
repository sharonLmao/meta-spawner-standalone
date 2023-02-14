
$(function () {
    function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }
  
    display(false)
  
    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })

    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('http://meta-spawner/exit1', JSON.stringify({}));
            return
        }
    //when the user clicks on the submit button, it will run
   }
    // if the person uses the escape key, it will exit the resource
    $("#submit").click(function () {
      $.post('http://meta-spawner/main', JSON.stringify({}));
      return
   })
    $("#close").click(function () {
        $.post('http://meta-spawner/exit', JSON.stringify({}));
        return
    }) 
})
  
  