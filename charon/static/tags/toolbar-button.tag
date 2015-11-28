<toolbar-button>
  <button><i class="zmdi zmdi-{ opts.icon }" if={ opts.icon }></i>
    <span if={ opts.label }>{ opts.label }</span>
  </button>

  <style scoped>
    button {
      border: 1px solid #365d98;
      border-radius: 2px;
      background-color: #FFFFFF;
      margin: 0;
      width: 24px;
      height: 24px;
      margin: 4px 0 4px 0;
      padding: 0;
    }
    button:first-child {
      margin-left: 4px;
    }
    button:hover,
    button:hover i {
      background-color: #365d98;
      color: #FFFFFF;
    }

    i {
      color: #365d98;
    }
  </style>
</toolbar-button>
