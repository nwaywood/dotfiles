// For more information on customizing Oni,
// check out our wiki page:
// https://github.com/onivim/oni/wiki/Configuration
// https://github.com/onivim/oni/blob/master/browser/src/Input/KeyBindings.ts
// https://github.com/onivim/oni/wiki/API
const activate = (oni) => {
    console.log("config activated")

    oni.input.bind("<c-enter>", () => console.log("Control+Enter was pressed"))
    //
    // Or remove the default bindings here by uncommenting the below line:
    //
    // oni.input.unbind("<c-p>")
}

const isNormalMode = () => editors.activeEditor.mode === "normal"
const isInsertMode = () => editors.activeEditor.mode === "insert"

const deactivate = () => {
    console.log("config deactivated")
}

module.exports = {
    activate,
    deactivate,
    //add custom config here, such as

    "ui.colorscheme": "onedark",

    //"oni.useDefaultConfig": true,
    //"oni.bookmarks": ["~/Documents",]
    //"oni.loadInitVim": false,
    "editor.fontSize": "15px",

    // UI customizations
    "ui.animations.enabled": true,
    "ui.fontSmoothing": "auto",
    // Use custom Oni init.vim file for settings that can't be set from this file
    "oni.loadInitVim": "~/.oni/init.vim"
}

