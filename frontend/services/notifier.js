export default class Notifier {
  constructor() {
    window.notification = window.Notification || window.mozNotification || window.webkitNotification;

    if ('undefined' === typeof window.notification) {
      alert('Web notification not supported');
    } else {
      window.notification.requestPermission(function(permission) {});
    }
  }

  push(title, body) {
    document.title = title;

    if ('undefined' === typeof window.notification) {
      window.navigator.vibrate(300);
      return false;
    }

    let notification = new Notification(title, {
      body: body,
      dir: 'auto',
      lang: 'EN',
      tag: 'notificationPopup',
      icon: './panadoura-flat.png'
    });

    notification.onclick = () => {
      window.focus();
      this.close();
    };
    notification.onerror = (err) => {
      console.log(err);
    };
    notification.onshow = () => {
      this._playSound('sounds/bell_ring');
    };
    notification.onclose = () => {
      document.title = 'Panadoura';
    };

    return true;
  }

  _playSound(fileName) {
    document.getElementById('notification-sound').innerHTML =
      `
      <audio autoplay="autoplay">
        <source src="${fileName}.mp3" type="audio/mpeg" />
        <source src="${fileName}.ogg" type="audio/ogg" />
        <embed hidden="true" autostart="true" loop="false" src="${fileName}.mp3" />
      </audio>`;
  }
}
