<template>
  <div class="row">
    <div class="col-12 col-m-12 text-center">
      <div id="timer__box">
        <div>
          <span id="minutes" contenteditable="true">{{ minutes }}</span>
          :
          <span id="seconds" contenteditable="true">{{ seconds }}</span>
        </div>
      </div>
      <div class="row">
        <timer-switch @output="state => switchChecked = state" @switch-click="setTime"></timer-switch>
      </div>
    </div>
  </div>
</template>

<script>
  import TimerSwitch from './TimerSwitch.vue'

  export default {
    components: {
      'timer-switch': TimerSwitch
    },
    data() {
      return {
        minutes: '25',
        seconds: '00',
        intervalTimer: undefined,
        switchChecked: false
      }
    },
    methods: {
      setTime() {
        if (this.switchChecked) {
          this.stop();
        } else {
          let minutesToRun = document.querySelector("#minutes").textContent;
          let secondsToRun = document.querySelector("#seconds").textContent;
          let seconds      = parseInt(minutesToRun) * 60 + parseInt(secondsToRun);

          this.start(seconds);
        }
      },
      start(seconds) {
        const now = Date.now();
        const end = now + seconds * 1000;

        this.displayTimeLeft(seconds);

        this.countdown(end);
      },
      stop() {
        clearInterval(this.intervalTimer);
      },
      countdown(end) {
        this.intervalTimer = setInterval(() => {
          const secondsLeft = Math.round((end - Date.now()) / 1000);

          if(secondsLeft === 0) {
            this.endTime = 0;
          }

          if(secondsLeft < 0) {
            clearInterval(this.intervalTimer);
            return;
          }
          this.displayTimeLeft(secondsLeft)
        }, 1000);
      },
      displayTimeLeft(secondsLeft) {
        const minutes = Math.floor((secondsLeft % 3600) / 60);
        const seconds = secondsLeft % 60;

        this.minutes = minutes;
        this.seconds = `${seconds < 10 ? '0' : ''}${seconds}`;
      },
    }
  }
</script>

<style scoped>
  :root {
    --white: #fefefe;
    --black: #0a0a0a;
  }

  #timer__box {
    font-family: sans-serif;
    display: inline-block;
    font-size: 100px;
    font-weight: 100;
    margin-top: 100px;
    margin-bottom: 50px;
    line-height: 1.5;

    /* small screens */
    @media screen and (max-width: 39.9375em) {
      font-size: 40px;
    }

    & > div {
      padding: 15px;
      border-radius: 3px;
      background-color: var(--white);
      display: inline-block;

      & span {
        padding: 15px;
        display: inline-block;
        width: 150px;
        max-width: 150px;

        /* small screens */
        @media screen and (max-width: 39.9375em) {
          width: 80px;
          max-width: 80px;
        }
      }
    }
  }

  [contenteditable="true"] { outline: 1px dashed var(--black); }

  /* contenteditable for mobile browsers */
  [contenteditable] {
    -webkit-user-select: text;
    user-select: text;
  }
</style>
