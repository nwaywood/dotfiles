"use babel"

// Your init script
//
// Atom will evaluate this file each time a new window is opened. It is run
// after packages are loaded/activated and after the previous editor state
// has been restored.

// add vim :x command, bound to `space x` in keymap.cson
atom.commands.add("atom-text-editor", "custom:save-and-quit", () => {
  atom.workspace.saveActivePaneItem()
  atom.workspace.closeActivePaneItemOrEmptyPaneOrWindow()
})

// add command for pressing spacebar so I can add Shift - Space keybinding
atom.commands.add("atom-text-editor", "custom:space", () => {
  editor = atom.workspace.getActiveTextEditor()
  editor.insertText(" ")
})

atom.commands.add("atom-workspace", "custom:merge-panes", async () => {
  const panes = atom.workspace.getCenter().getPanes()
  const firstPane = panes.shift()

  // loop through all panes except for the first pane
  for (pane of panes) {
    for (item of pane.getItems()) {
      // if item is already in first pane, delete it, otherwise move it to first pane
      for (firstPaneItem of firstPane.getItems()) {
        pane.moveItemToPane(item, firstPane)
        // if (firstPaneItem.getPath() === item.getPath()) {
        //   await pane.destroyItem(item)
        // } else {
        //   pane.moveItemToPane(item, firstPane)
        // }
      }
    }
  }
})

// vim-mode-plus commands
// ======================

// General service consumer function, used for extending VMP
function consumeService(packageName, functionName, fn) {
  const consume = pack => fn(pack.mainModule[functionName]())

  if (atom.packages.isPackageActive(packageName)) {
    consume(atom.packages.getActivePackage(packageName))
  } else {
    const disposable = atom.packages.onDidActivatePackage(pack => {
      if (pack.name === packageName) {
        disposable.dispose()
        consume(pack)
      }
    })
  }
}

consumeService("vim-mode-plus", "provideVimModePlus", ({ Base }) => {
  class ScrollThreeLinesUp extends Base.getClass("ScrollUp") {
    static commandPrefix = "vim-mode-plus-user"
    defaultCount = 3
  }
  ScrollThreeLinesUp.registerCommand()

  class ScrollThreeLinesDown extends Base.getClass("ScrollDown") {
    static commandPrefix = "vim-mode-plus-user"
    defaultCount = 3
  }
  ScrollThreeLinesDown.registerCommand()
})
