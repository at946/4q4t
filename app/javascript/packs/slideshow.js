$(document).on('turbolinks:load', function() {
  slide_index = 1
  showSlide(slide_index)

  // prev iconをクリックしたら次のスライドが表示される
  $(".slideshow-nav.prev").click(function() {
    slide_index -= 1
    showSlide(slide_index)
  });

  // next iconをクリックしたら前のスライドが表示される
  $(".slideshow-nav.next").click(function() {
    slide_index += 1
    showSlide(slide_index)
  })

})

function showSlide(n) {
  // slideの表示非表示
  $(".slide").hide()
  $(".slide:nth-child("+n+")").fadeIn("slow")

  // slideshow-navの表示非表示
  $(".slideshow-nav").show()
  if (n < 2) { $(".slideshow-nav.prev").hide() }
  if (n > $(".slide").length - 1) { $(".slideshow-nav.next").hide() }
};