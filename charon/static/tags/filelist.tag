<filelist>
  <table>
    <tr each={ opts.files }>
      <td><i class="zmdi zmdi-{ isFile ? 'file' : 'folder' }" /></td>
      <td>{ name }</td>
      <td class="filesize">{ formatSize(size) }</td>
      <td class="date">{ formatDate(lastModified) }</td>
    </tr>
  </table>

  <script>
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

    tr {
      height: 32px;
    }

    tr:nth-child(even) {
      background-color: #EEEEEE;
    }

    .filesize,
    .date {
      text-align: right;
    }
  </style>
</filelist>
