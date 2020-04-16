// This script adds the field "zoom-fullscreen" to the output of each object in $(yabai -m query --spaces)
// If a window within a space is currently zoomed in, the value will be 1, otherwise 0
import * as util from "util"
import * as cp from "child_process"

const promiseExec = util.promisify(cp.exec)

const spacesCommand = promiseExec("/usr/local/bin/yabai -m query --spaces")
const windowsCommand = promiseExec("/usr/local/bin/yabai -m query --windows")

Promise.all([spacesCommand, windowsCommand])
    .then(([spacesOutput, windowsOutput]) => {
        const spaces = JSON.parse(spacesOutput.stdout)
        const windows = JSON.parse(windowsOutput.stdout)
        // Add "zoom-fullscreen" to each space object
        const defaultZoomFullscreen = spaces.map(space => ({...space, "zoom-fullscreen": 0}))
        windows.forEach(window => {
            if (window["zoom-fullscreen"] == 1) {
                defaultZoomFullscreen[window.space -1]["zoom-fullscreen"] = 1
            }
        })
        process.stdout.write(JSON.stringify(defaultZoomFullscreen))
    })
