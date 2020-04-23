// This script adds the field "zoom-fullscreen" to the output of each object in $(yabai -m query --spaces)
// If a window within a space is currently zoomed in, the value will be 1, otherwise 0
import * as util from "util"
import * as cp from "child_process"

const promiseExec = util.promisify(cp.exec)

const spacesCommand = promiseExec("/usr/local/bin/yabai -m query --spaces")
const windowsCommand = promiseExec("/usr/local/bin/yabai -m query --windows")

Promise.all([spacesCommand, windowsCommand])
    .then(([spacesOutput, windowsOutput]) => {
        if (spacesOutput.stderr) {
            process.stderr.write(spacesOutput.stderr)
            process.exit(5)
        } else if (windowsOutput.stderr) {
            process.stderr.write(windowsOutput.stderr)
            process.exit(5)
        } else {
            // check if either stdout is empty, yabai service failing to respond?
            if (!spacesOutput.stdout || !windowsOutput.stdout) {
                process.exit(5)
            }
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
        }
    })
    .catch(() => process.exit(5))
