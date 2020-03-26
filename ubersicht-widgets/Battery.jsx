import { css } from "uebersicht"
// #B55353
export const command = "pmset -g batt | grep -o '[0-9]*%; [a-z]*'"

export const refreshFrequency = 300000 // ms

export const className = ` 
  -webkit-font-smoothing: antialiased;
  color: #FAFDFF;
  font: 12px 'Helvetica Neue';
  font-weight: bold;
  top: 3px;
  right: 35px;
  position: absolute;
`

const battery = css`
    text-align: right;
    padding: 3px 8px;
    border-bottom: 2px solid #3E7274;
`

export const render = ({ output }) => {
    const data = parseOutput(output)
    return (
      <div className={battery}>{data[0]} - {data[1]}</div>
    )
}

const parseOutput = output => {
    return output.split(";")
}
