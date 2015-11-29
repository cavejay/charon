<filelist>
  <table>
    <tr onclick={ parent.parent.openFileOrDirectory } each={ opts.files }>
      <td><i charonClk="false" class="zmdi zmdi-{ isFile ? 'file' : 'folder-outline' }" /></td>
      <td charonClk={ isFile ? true : false } class="filename">{ name }</td>
      <td charonClk={ isFile ? true : false } class="filesize">{ formatSize(size) }</td>
      <td charonClk={ isFile ? true : false } class="date">{ formatDate(lastModified) }</td>
    </tr>
  </table>

  <script>

    console.log('update filelist.');

    qwer() {
      console.log('qwer');
    }

    formatDate(dateString) {
      var date = moment(dateString, "ddd MMM D HH:mm:ss YYYY");
      return date.format('DD.MM.YYYY');
    }

    formatSize(size) {
      return size + ' KB';
    }
  </script>

  <style>
    table {
      width: 100%;
    }

    td {
      padding: 4px;
    }
    td:first-child {
      padding-left: 16px;
    }
    td:last-child {
      padding-right: 16px;
    }

    tr {
      height: 32px;
    }

    tr:nth-child(even) {
      background-color: #EEEEEE;
    }

    tr:hover {
      background-color: #365d98;
      color: #FFFFFF;
      cursor: pointer;
    }

    .filesize,
    .date {
      text-align: right;
    }
  </style>
</filelist>
