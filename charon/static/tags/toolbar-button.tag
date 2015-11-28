<toolbar-button>
  <button>
    <i class="zmdi zmdi-{ opts.icon }" if={ opts.icon }></i>
    <span if={ opts.label }>{ opts.label }</span>
  </button>

  <style scoped>
    button {
      border: none;
      background: #DDDDDD;
      margin: 0;
    }
  </style>
</toolbar-button>
