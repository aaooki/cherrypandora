import notificaionIcon     from '../assets/images/panadoura-flat.png';
import notificaionSoundMP3 from '../assets/sounds/bell_ring.mp3';
import notificaionSoundOGG from '../assets/sounds/bell_ring.ogg';

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
      icon: notificaionIcon
    });

    notification.onclick = () => {
      window.focus();
      this.close();
    };
    notification.onerror = (err) => {
      console.log(err);
    };
    notification.onshow = () => {
      this._playSound();
    };
    notification.onclose = () => {
      document.title = 'Panadoura';
    };

    return true;
  }

  _playSound() {
    document.getElementById('notification-sound').innerHTML =
      `
      <audio autoplay="autoplay">
        <source src="${notificaionSoundMP3}" type="audio/mpeg" />
        <source src="${notificaionSoundOGG}" type="audio/ogg" />
        <embed hidden="true" autostart="true" loop="false" src="${notificaionSoundMP3}" />
      </audio>`;
  }
}
