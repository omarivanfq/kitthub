$(document).ready(function(){
  $(".edit-comment-btn").each(function(index) {
    $(this).on("click", function(e){
      e.preventDefault();
      $("#comment-" + $(this).attr("data-comment-id") + " .edit-comment-form").show();
    });
  });
});

