<toolbar-button>
  <button class={ button-disabled: opts.unclickable } disabled={ opts.unclickable }><i class="zmdi zmdi-{ opts.icon }" if={ opts.icon }></i>
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

    i {
      color: #365d98;
    }

    button:hover,
    button:hover i {
      background-color: #365d98;
      color: #FFFFFF;
    }

    .button-disabled {
      border-color: #888888;
    }
    .button-disabled i {
      color: #888888;
    }

    .button-disabled:hover,
    .button-disabled:hover i {
      background-color: #FFFFFF;
      color: #888888;
    }


  </style>
</toolbar-button>
