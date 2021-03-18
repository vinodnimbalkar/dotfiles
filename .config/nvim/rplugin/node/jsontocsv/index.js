function onBufWrite() {
  console.log('Buffer written!');
}

module.exports = (plugin) => {
  let jsonData = nvim.plugin.buffer.getLines();
  console.log(jsonData)
  function setLine(a) {
    // const items = JSON.parse(a);
    // const replacer = (_, value) => value === null ? '' : value
    // const header = Object.keys(items[0])
    // const csv = [
    // header.join(','), // header row first
    // ...items.map(row => header.map(fieldName => JSON.stringify(row[fieldName], replacer)).join(','))
  // ].join('\r\n')

    plugin.nvim.setLine(a);
  }
  plugin.registerCommand('SetMyLine', [plugin.nvim.buffer, setLine(jsonData)]);
  plugin.registerAutocmd('BufWritePre', onBufWrite, { pattern: '*' });
};
