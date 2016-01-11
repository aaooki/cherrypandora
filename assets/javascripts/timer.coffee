'use strict'

@start = (limit) ->
  window.startDate = new Date().getTime()
  window.elapsedSeconds = 0
  window.seconds = 0
  window.minutes = 0
  window.limit = limit
  window.timerID = setInterval(timeCounter, 1000)
  return

@stop = ->
  clearInterval timerID
  return

timeCounter = ->
  if elapsedSeconds >= limit
    stop()
    return

  time = new Date().getTime() - startDate

  window.elapsedSeconds = parseInt(Math.floor(time / 100) / 10)

  allTheTime = elapsedSeconds
  minutes = parseInt(allTheTime/60)
  allTheTime -= minutes * 60
  seconds = parseInt(allTheTime)

  document.getElementById('seconds').innerHTML = seconds
  document.getElementById('minutes').innerHTML = minutes

  return
