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

atom.commands.add("atom-workspace", "custom:merge-panes", () => {
  const panes = atom.workspace.getCenter().getPanes()
  // find the first visible pane (not in a non-active "vim tab" and remove it from `panes`)
  const firstPane = getFirstVisiblePane(panes)

  // loop through all panes except for the first visible pane
  // (all other panes will get merged into `firstPane`)
  for (pane of panes) {
    // only loop through panes that are currently visible
    // atom-vim-like-tab hides panes in diffenent "vim tabs"
    // by setting their css `display: none`
    if (pane.element.style.display !== "none") {
        for (item of pane.getItems()) {
          // if item is already in first pane, delete it, otherwise move it to first pane
          if (firstPane.getItems().find(findItemInPane(item))) {
            pane.destroyItem(item)
          } else {
            pane.moveItemToPane(item, firstPane)
          }
        }
    }
  }
  // make sure the pane that all the items were merged into is active
  firstPane.activate()
})

function findItemInPane(nonFirstPaneItem) {
  return function(firstPaneItem) {
    // check that both items are standard editor items (e.g. not SettingsView)
    if (
      Object.getPrototypeOf(firstPaneItem).constructor.name === "TextEditor" &&
      Object.getPrototypeOf(nonFirstPaneItem).constructor.name === "TextEditor"
    ) {
      return firstPaneItem.getPath() === nonFirstPaneItem.getPath()
    } else {
      return firstPaneItem.uri === nonFirstPaneItem.uri
    }
  }
}

function getFirstVisiblePane(panes) {
    for (let i = 0; i < panes.length; ++i) {
        if (panes[i].element.style.display !== "none") {
            return panes.splice(i, 1)[0]
        }
    }
}

// Custom commands to move active item to specified index
atom.commands.add("atom-workspace", {
  "custom:move-active-item-to-index-1": () => {
    const activePane = atom.workspace.getActivePane()
    activePane.moveItem(activePane.getActiveItem(), 0)
  },
  "custom:move-active-item-to-index-2": () => {
    const activePane = atom.workspace.getActivePane()
    activePane.moveItem(activePane.getActiveItem(), 1)
  },
  "custom:move-active-item-to-index-3": () => {
    const activePane = atom.workspace.getActivePane()
    activePane.moveItem(activePane.getActiveItem(), 2)
  },
  "custom:move-active-item-to-index-4": () => {
    const activePane = atom.workspace.getActivePane()
    activePane.moveItem(activePane.getActiveItem(), 3)
  },
  "custom:move-active-item-to-index-5": () => {
    const activePane = atom.workspace.getActivePane()
    activePane.moveItem(activePane.getActiveItem(), 4)
  },
  "custom:move-active-item-to-index-6": () => {
    const activePane = atom.workspace.getActivePane()
    activePane.moveItem(activePane.getActiveItem(), 5)
  },
  "custom:move-active-item-to-index-7": () => {
    const activePane = atom.workspace.getActivePane()
    activePane.moveItem(activePane.getActiveItem(), 6)
  },
  "custom:move-active-item-to-index-8": () => {
    const activePane = atom.workspace.getActivePane()
    activePane.moveItem(activePane.getActiveItem(), 7)
  },
  "custom:move-active-item-to-index-9": () => {
    const activePane = atom.workspace.getActivePane()
    activePane.moveItem(activePane.getActiveItem(), 8)
  }
})

// vim-mode-plus commands
// ======================

// General service consumer function, used for extending VMP
// function consumeService(packageName, functionName, fn) {
//   const consume = pack => fn(pack.mainModule[functionName]())
//
//   if (atom.packages.isPackageActive(packageName)) {
//     consume(atom.packages.getActivePackage(packageName))
//   } else {
//     const disposable = atom.packages.onDidActivatePackage(pack => {
//       if (pack.name === packageName) {
//         disposable.dispose()
//         consume(pack)
//       }
//     })
//   }
// }
//
// consumeService("vim-mode-plus", "provideVimModePlus", ({ Base }) => {
//   class ScrollThreeLinesUp extends Base.getClass("ScrollUp") {
//     static commandPrefix = "vim-mode-plus-user"
//     defaultCount = 3
//   }
//   ScrollThreeLinesUp.registerCommand()
//
//   class ScrollThreeLinesDown extends Base.getClass("ScrollDown") {
//     static commandPrefix = "vim-mode-plus-user"
//     defaultCount = 3
//   }
//   ScrollThreeLinesDown.registerCommand()
// })
