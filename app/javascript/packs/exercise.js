$(document).on('turbolinks:load', function() {
  
  // Initialization
  exercise_index = 1
  members_count = parseInt($("#members_count").text(), 10)
  showExerciseCard(exercise_index)

  // prev iconをクリックしたら次のスライドが表示される
  $(".exercise-nav.prev").click(function() {
    if (exercise_index > 1) {
      exercise_index -= 1
      showExerciseCard(exercise_index)  
    }
  })

  // next iconをクリックしたら前のスライドが表示される
  $(".exercise-nav.next").click(function() {
    if (exercise_index < members_count) {
      exercise_index += 1
      showExerciseCard(exercise_index)
    }
  })

})

function showExerciseCard(n) {
  // exercise-cardの表示非表示
  $(".exercise-card").hide()
  $(".exercise-card").eq(n-1).fadeIn("slow")
  $(window).scrollTop(0)
  $("#present_count").text(n)

  // exercise-nav.prevの表示非表示
  if (n < 2) {
    $(".exercise-nav.prev").hide()
  } else {
    $(".exercise-nav.prev").fadeIn("slow")
  }

  // exercise-nav.nextの表示非表示
  if (n > members_count - 1) {
    $(".exercise-nav.next").hide()
  } else {
    $(".exercise-nav.next").fadeIn("slow")
  }
}