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

# General service consumer function, used for extending VMP
consumeService = (packageName, providerName, fn) ->
  if atom.packages.isPackageActive(packageName)
    pack = atom.packages.getActivePackage(packageName)
    fn(pack.mainModule[providerName]())
  else
    disposable = atom.packages.onDidActivatePackage (pack) ->
      if pack.name is packageName
        disposable.dispose()
        fn(pack.mainModule[providerName]())

consumeService 'vim-mode-plus', 'provideVimModePlus', (service) ->
  {Base} = service

  ScrollUp = Base.getClass('ScrollUp')
  ScrollDown = Base.getClass('ScrollDown')

  class ScrollThreeLinesUp extends ScrollUp
    @commandPrefix: 'vim-mode-plus-user'
    @registerCommand()
    defaultCount: 3

  class ScrollThreeLinesDown extends ScrollDown
    @commandPrefix: 'vim-mode-plus-user'
    @registerCommand()
    defaultCount: 3
