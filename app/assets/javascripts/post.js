$(document).ready(function(){
  $(".edit-post-btn").each(function(index) {
    $(this).on("click", function(e){
      e.preventDefault();
      $("#edit_post_" + $(this).attr("data-post-id")).show();
    });
  });
});

