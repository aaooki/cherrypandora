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
    if typeof @timerID != 'undefined'
      clearInterval @timerID
      @create_entry()

    # unlock editing timer panels
    $('#minutes').prop('contenteditable', true)
    $('#seconds').prop('contenteditable', true)

    # Reset the switch to stopped mode
    $('#start-stop-switch').prop('checked', true)
    return

  create_entry: ->
    $.post "/entry",
    length: @elapsedSeconds

# instantiate Timer
@timer_instance = new Timer

# prepare the timer
$('#start-stop-switch').prop('checked', true)

# events
# start ot stop the timer
$('#start-stop-switch').change (event) ->
  if event.target.checked
    timer_instance.stop()
  else
    timer_instance.start()

# clear the timer label on focus
$('#minutes, #seconds').focus (event) ->
  $(event.target).empty()
  return

# set default minutes & seconds if not provided
$('#minutes, #seconds').focusout ->
  $('#minutes').text '25' if $('#minutes').is(':empty')
  $('#seconds').text '00' if $('#seconds').is(':empty')
  return

# prevent typing more than two digits/characters
$('#minutes, #seconds').keypress (event) ->
  event.preventDefault() if event.target.textContent.length > 1
  return
