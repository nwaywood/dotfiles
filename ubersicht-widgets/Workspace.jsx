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
        .catch(err => dispatch({type: "UPDATE_FAILED", error: "erroring" }))
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
    const numDisplays = calcNumDisplays(spaces)

    for (let i = 1; i <= numDisplays; ++i) {
        let displaySpaces = generateSpacesForDisplay(spaces, i)
        out.push(displaySpaces)
        // add a "-" to separate spaces on different displays
        if (i < numDisplays) {
            out.push(<div className={cell}>—</div>)
        }
    }
    return out.flat()
}

const generateSpacesForDisplay = (spaces, displayNum) => {
    return spaces.filter(space => space.display == displayNum)
        .map(space => {
            // what text to render for this space
            const value = space["zoom-fullscreen"] === 1 ? ("" + space.index + "°") : space.index
            const hasWindows = space.windows && space.windows.length > 0
            if (space.visible == 1 && hasWindows) {
                return (<div className={`${cell} ${visibleStyle} ${hasWindowsStyle}`}>{value}</div>)
            } else if (hasWindows) {
                return (<div className={`${cell} ${hasWindowsStyle}`}>{value}</div>)
            } else if (space.visible == 1) {
                return (<div className={`${cell} ${visibleStyle}`}>{value}</div>)
            }
            // default display
            return (<div className={cell}>{value}</div>)
        })
}

// each space contains a `"display": num` field, use it to cal num displays
const calcNumDisplays = (spaces) => {
    const set = new Set()
    spaces.forEach(space => {
        set.add(space.display)
    })
    return set.size
}

