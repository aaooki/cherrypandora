'use strict'

@start = (limit) ->
  window.startDate = new Date().getTime()
  window.seconds = 0
  window.minutes = 0
  window.limit = limit
  window.timerID = setInterval(timeCounter, 1000)
  return

@stop = ->
  clearInterval timerID
  return

timeCounter = ->
  if seconds >= limit
    stop()
    return

  time = new Date().getTime() - startDate

  window.seconds = parseInt(Math.floor(time / 100) / 10)

  if seconds % 60 == 0
    minutes += 1

  document.getElementById('seconds').innerHTML = seconds
  document.getElementById('minutes').innerHTML = minutes

  return
