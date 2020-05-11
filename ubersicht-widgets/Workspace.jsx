// This workspace is functionally a combination of https://github.com/kkga/nibar
// and https://github.com/noperator/dotfiles/blob/master/widgets/spaces.coffee
import { css, run } from "uebersicht"

// export const command = "/usr/local/bin/yabai -m query --spaces"
// export const command = "/Users/nick/.dotfiles/ubersicht-widgets/scripts/spaces-json.sh"
// export const command = "/usr/local/bin/node --no-warnings /Users/nick/.dotfiles/ubersicht-widgets/scripts/spaces-json.mjs"
export const command = dispatch => {
    run("/usr/local/bin/yabai -m query --spaces")
    // run("/usr/local/bin/node --no-warnings /Users/nick/.dotfiles/ubersicht-widgets/scripts/spaces-json.mjs")
        .then(out => dispatch({type: "UPDATED", output: out} ))
        // NOTE: This error is being deliberately swallowed
        .catch(() => dispatch({type: "UPDATE_FAILED", error: "erroring" }))
}

export const initialState = { output: 'fetching data...' }

export const updateState = (event, previousState) => {
  switch(event.type) {
    case 'UPDATED': return {output: event.output }
    // NOTE: Uncomment this for debugging
    case "UPDATE_FAILED": return {error: event.error }
    default: {
      return previousState
    }
  }
}

export const refreshFrequency = false

export const className = ` 
  -webkit-font-smoothing: antialiased;
  color: #FAFDFF;
  font: 14.3px 'Helvetica Neue';
  font-weight: bold;
  top: 3px;
  left: 10px;
  position: absolute;
`

const container = css`
    display: flex;
    flex-direction: row;
    padding: 3px 8px;
    justify-content: center;
`

const cell = css`
    margin: 0 0.5em;
    color: #aaa;
`

const visibleStyle = css`
    border-bottom: 2px solid #fafdff
`

const hasWindowsStyle = css`
    color: #fafdff;
`

export const render = ( { output, error } ) => {
    if (error) {
        return <div>{error}</div>
    }
    const spaces = JSON.parse(output)
    return (
        <div className={container}>
            {renderSpaces(spaces)}
        </div>
    )
}

const renderSpaces = (spaces) => {
    let out = []
    let currentDisplay = 1
    let numWindowsOnCurrentDisplay = 0

    for (let i = 0; i < spaces.length; ++i) {
        let currentSpace = spaces[i]
        // add seperator if changing display
        if (currentDisplay !== currentSpace.display) {
            out.push(<div className={cell}>—</div>)
            // update currentDisplay variable
            currentDisplay = currentSpace.display
        }
        // what text to render for this space
        const value = currentSpace["zoom-fullscreen"] === 1 ? ("" + currentSpace.index + "°") : currentSpace.index
        const hasWindows = currentSpace.windows && currentSpace.windows.length > 0
        if (currentSpace.visible == 1 && hasWindows) {
            out.push(<div className={`${cell} ${visibleStyle} ${hasWindowsStyle}`}>{value}</div>)
        } else if (hasWindows) {
            out.push(<div className={`${cell} ${hasWindowsStyle}`}>{value}</div>)
        } else if (currentSpace.visible == 1) {
            out.push(<div className={`${cell} ${visibleStyle}`}>{value}</div>)
        } else {
            // default display
            out.push(<div className={cell}>{value}</div>)
        }

        // set numWindowsOnCurrentDisplay if currentSpace is focussed
        if (currentSpace.focused === 1) {
            numWindowsOnCurrentDisplay = currentSpace.windows.length
        }
    }
    // nerd font char
    const windowsChar = '\ufa6f' // 﩯
    // output number of windows on current focussed space 
    out.push(<div><span style={{ margin: "0px 6px"}}>{windowsChar}</span>{numWindowsOnCurrentDisplay}</div>)
    return out.flat()
}

