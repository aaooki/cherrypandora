'use strict'

@initTimer = () ->
  document.getElementById('minutes').innerHTML = '25'
  document.getElementById('seconds').innerHTML = '00'

  # Set the switch to stopped mode
  document.getElementById('start-stop-switch').checked = true
  return

@checkSwitch = () ->
  if document.getElementById('start-stop-switch').checked
    stop()
  else
    start()

  return

@start = () ->
  # Get the input time
  inputMinutes = parseInt document.getElementById("minutes").innerHTML
  inputSeconds = parseInt document.getElementById("seconds").innerHTML
  window.timeLimit = inputMinutes * 60 + inputSeconds


  window.startTime = new Date().getTime()
  window.elapsedSeconds = 0
  window.seconds = 0
  window.minutes = 0

  # lock editing timer panels before starting the counter
  document.getElementById('minutes').contentEditable='false'
  document.getElementById('seconds').contentEditable='false'

  window.timerID = setInterval(timeCounter, 1000)
  return

@stop = ->
  clearInterval timerID if timerID

  # unlock editing timer panels
  document.getElementById('minutes').contentEditable='true'
  document.getElementById('seconds').contentEditable='true'

  # Reset the switch to stopped mode
  document.getElementById('start-stop-switch').checked = true

  return

timeCounter = ->
  if elapsedSeconds >= timeLimit
    stop()
    Notify("Finished Your Session", "Great! You can take a rest now.")
    return

  currentTime = new Date().getTime() - startTime

  window.elapsedSeconds = parseInt(Math.floor(currentTime / 100) / 10)

  allTheTime = elapsedSeconds
  minutes = parseInt(allTheTime/60)
  allTheTime -= minutes * 60
  seconds = parseInt(allTheTime)

  minutes = '0' + minutes if minutes < 10
  seconds = '0' + seconds if seconds < 10

  document.getElementById('seconds').innerHTML = seconds
  document.getElementById('minutes').innerHTML = minutes

  return
