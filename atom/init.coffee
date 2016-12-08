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


# add vim :x command
atom.commands.add 'atom-text-editor', 'custom:save-and-quit', ->
    atom.workspace.saveActivePaneItem()
    atom.workspace.closeActivePaneItemOrEmptyPaneOrWindow()

atom.commands.add 'atom-text-editor', 'custom:unimpaired-new-line-below', ->
    editor = atom.workspace.getActiveTextEditor()
    atom.commands.dispatch(atom.views.getView(editor), "vim-mode-plus:insert-below-with-newline")
    atom.commands.dispatch(atom.views.getView(editor), "vim-mode-plus:activate-normal-mode")
    atom.commands.dispatch(atom.views.getView(editor), "vim-mode-plus:move-up")

atom.commands.add 'atom-text-editor', 'custom:unimpaired-new-line-above', ->
    editor = atom.workspace.getActiveTextEditor()
    atom.commands.dispatch(atom.views.getView(editor), "vim-mode-plus:insert-above-with-newline")
    atom.commands.dispatch(atom.views.getView(editor), "vim-mode-plus:activate-normal-mode")
    atom.commands.dispatch(atom.views.getView(editor), "vim-mode-plus:move-down")
