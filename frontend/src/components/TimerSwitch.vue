<template>
  <label class="switch">
    <input id="timer-switch" type="checkbox" @change="onChange" @click="$emit('switch-click')">
    <span class="slider"></span>
  </label>
</template>

<script>
  export default {
    methods: {
      onChange(event) {
        this.$emit("output", event.target.checked)
      }
    }
  }
</script>

<style scoped>
  .switch {
    position: relative;
    display: inline-block;
    width: 60px;
    height: 34px;

    & input { display:none; }
  }

  .slider {
    position: absolute;
    cursor: pointer;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: var(--switch-on-color);
    -webkit-transition: .4s;
    transition: .4s;
    border-radius: 4px;

    &:before {
      position: absolute;
      content: "";
      height: 26px;
      width: 26px;
      left: 4px;
      bottom: 4px;
      background-color: white;
      -webkit-transition: .4s;
      transition: .4s;
      border-radius: 10%;
    }
  }

  input:checked + .slider {
    background-color: var(--switch-off-color);
  }

  input:focus + .slider {
    box-shadow: 0 0 1px var(--switch-off-color);
  }

  input:checked + .slider:before {
    -webkit-transform: translateX(26px);
    -ms-transform:     translateX(26px);
    transform:         translateX(26px);
  }
</style>
