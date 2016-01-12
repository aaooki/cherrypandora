# https://www.binpress.com/tutorial/building-useful-notifications-with-html5-apis/163


# Determine the correct object to use for notification
window.notification = window.Notification or window.mozNotification or window.webkitNotification
# The user needs to allow this
if 'undefined' == typeof notification
  alert 'Web notification not supported'
else
  notification.requestPermission (permission) ->

# Notification Function
@Notify = (titleText, bodyText) ->
  document.title = titleText

  # Not supported
  if 'undefined' == typeof notification
    # just vibrate
    window.navigator.vibrate(300)
    return false

  noty = new notification(titleText,
    body: bodyText
    dir: 'auto'
    lang: 'EN'
    tag: 'notificationPopup'
    icon: '')

  noty.onclick = ->
    console.log 'notification.Click'
    return

  noty.onerror = ->
    console.log 'notification.Error'
    return

  noty.onshow = ->
    console.log 'notification.Show'
    return

  noty.onclose = ->
    document.title = 'Panadora'
    console.log 'notification.Close'
    return

  true
