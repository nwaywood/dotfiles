# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"


# add vim :x command, bound to `space x` in keymap.cson
atom.commands.add 'atom-text-editor', 'custom:save-and-quit', ->
    atom.workspace.saveActivePaneItem()
    atom.workspace.closeActivePaneItemOrEmptyPaneOrWindow()

# add command for pressing spacebar so I can add Shift - Space keybinding
atom.commands.add 'atom-text-editor', 'custom:space', () ->
    editor = atom.workspace.getActiveTextEditor()
    editor.insertText(' ')

# Merge panes (excluding docks/panels)
# https://github.com/atom/atom/issues/380
atom.commands.add 'atom-workspace', 'custom:merge-panes', ->
  aPanes = atom.workspace.getCenter().getPanes()
  oFirstPane = aPanes.shift()
  for oPane in aPanes
    for oItem in oPane.getItems()
      oPane.moveItemToPane oItem, oFirstPane

# General service consumer function, used for extending VMP
consumeService = (packageName, functionName, fn) ->
  consume = (pack) -> fn(pack.mainModule[functionName]())

  if atom.packages.isPackageActive(packageName)
    consume(atom.packages.getActivePackage(packageName))
  else
    disposable = atom.packages.onDidActivatePackage (pack) ->
      if pack.name is packageName
        disposable.dispose()
        consume(pack)

# load vmp commands from js file
consumeService 'vim-mode-plus', 'provideVimModePlus', (service) ->
  commands = require('./load-vmp-commands')(service)
  for name, klass of commands
    klass.commandPrefix = "vim-mode-plus-user"
    klass.registerCommand()
