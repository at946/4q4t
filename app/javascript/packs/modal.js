$(document).on('turbolinks:load', function() {

  // .modal-openをクリックしたら、data-targetでid指定されたmodalとmodal_overlayがフェードインする
  $(".modal-open").click(function () {
    $(this).blur();
    $("#modal_overlay").fadeIn("slow");
    $("#"+$(this).data("target")).fadeIn("slow");
  });

  // .modal-closeをクリックしたら、modalとmodal_overlayがフェードアウトする
  $(".modal-close").unbind().click(function () {
    $("#modal_overlay").fadeOut("slow");
    $(".modal").fadeOut("slow");
  });

  // #modal_overlayをクリックしたら、modalとmodal_overlayがフェードアウトする
  $("#modal_overlay").unbind().click(function () {
    $("#modal_overlay").fadeOut("slow");
    $(".modal").fadeOut("slow");
  });
});
