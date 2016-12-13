class Timer
  constructor: ->
    @overallSeconds = 0
    @startTime = 0
    @elapsedSeconds = 0
    @currentMinute = 0
    @currentSecond = 0
    @timerID = 0

  start: ->
    $('#minutes').prop('contenteditable', false)
    $('#seconds').prop('contenteditable', false)

    inputMinutes = parseInt $('#minutes').text()
    inputSeconds = parseInt $('#seconds').text()

    inputMinutes = 0 if isNaN inputMinutes
    inputSeconds = 0 if isNaN inputSeconds

    @overallSeconds = inputMinutes * 60 + inputSeconds
    @elapsedSeconds = 0
    @currentMinute = 0
    @currentSecond = 0
    @startTime = new Date().getTime()

    @timerID = setInterval (=>
      if @elapsedSeconds >= @overallSeconds
        @stop()

        title = "You Can Take a Break Now"
        message = "You Have Worked for #{inputMinutes}:#{inputSeconds}"
        Notify(title, message)
        return

      currentTime = new Date().getTime() - @startTime
      @elapsedSeconds = parseInt(Math.floor(currentTime / 100) / 10)

      leftSeconds = @elapsedSeconds
      @currentMinute = parseInt(leftSeconds/60)
      leftSeconds -= @currentMinute * 60
      @currentSecond = parseInt leftSeconds

      @currentMinute = '0' + @currentMinute if @currentMinute < 10
      @currentSecond = '0' + @currentSecond if @currentSecond < 10

      $('#minutes').text @currentMinute
      $('#seconds').text @currentSecond

      return
    ), 1000

    return

  stop: ->
    clearInterval @timerID if typeof @timerID != 'undefined'

    # unlock editing timer panels
    $('#minutes').prop('contenteditable', true)
    $('#seconds').prop('contenteditable', true)

    # Reset the switch to stopped mode
    $('#start-stop-switch').prop('checked', true)
    return

# 'use strict'
#
# # Clear timer panels on focus
# $('#minutes, #seconds').focus ->
#   $(this).empty()
#   return
#
# # Validate input
# validateInput = (inputMinutes, inputSeconds) ->
#   return true if inputMinutes >= 0 and inputSeconds >= 0
#   return false
#
# @initTimer = () ->
#   document.getElementById('minutes').innerHTML = '25'
#   document.getElementById('seconds').innerHTML = '00'
#
#   # Set the switch to stopped mode
#   document.getElementById('start-stop-switch').checked = true
#   return
#
# @checkSwitch = () ->
#   if document.getElementById('start-stop-switch').checked
#     stop()
#   else
#     start()
#
#   return
#
# @start = () ->
#   # Get the input time
#   inputMinutes = parseInt document.getElementById("minutes").innerHTML
#   inputSeconds = parseInt document.getElementById("seconds").innerHTML
#
#   # Manage input validation and error msg
#   $('.alert-box').hide()
#   unless validateInput(inputMinutes, inputSeconds)
#     $('#alert-msg').html("Minutes and Seconds must be positive values!")
#     $('.alert-box').show()
#     stop()
#     return
#
#   window.timeLimit = inputMinutes * 60 + inputSeconds
#
#   window.startTime = new Date().getTime()
#   window.elapsedSeconds = 0
#   window.seconds = 0
#   window.minutes = 0
#
#   # lock editing timer panels before starting the counter
#   document.getElementById('minutes').contentEditable='false'
#   document.getElementById('seconds').contentEditable='false'
#
#   window.timerID = setInterval(timeCounter, 1000)
#   return
#
# @stop = ->
#   clearInterval timerID if typeof timerID != 'undefined'
#
#   # unlock editing timer panels
#   document.getElementById('minutes').contentEditable='true'
#   document.getElementById('seconds').contentEditable='true'
#
#   # Reset the switch to stopped mode
#   document.getElementById('start-stop-switch').checked = true
#
#   return
#
# timeCounter = ->
#   if elapsedSeconds >= timeLimit
#     stop()
#     Notify("Finished Your Session", "Great! You can take a rest now.")
#     return
#
#   currentTime = new Date().getTime() - startTime
#
#   window.elapsedSeconds = parseInt(Math.floor(currentTime / 100) / 10)
#
#   allTheTime = elapsedSeconds
#   minutes = parseInt(allTheTime/60)
#   allTheTime -= minutes * 60
#   seconds = parseInt(allTheTime)
#
#   minutes = '0' + minutes if minutes < 10
#   seconds = '0' + seconds if seconds < 10
#
#   document.getElementById('seconds').innerHTML = seconds
#   document.getElementById('minutes').innerHTML = minutes
#
#   return
