import { css } from "uebersicht"

// https://www.cyberciti.biz/faq/linux-unix-formatting-dates-for-display/
export const command = "date +\"%a %d %b %l:%M %p\""

export const refreshFrequency = 60000 // ms
export const className = ` 
  -webkit-font-smoothing: antialiased;
  color: #FAFDFF;
  font: 12px 'Helvetica Neue';
  font-weight: bold;
  top: 3px;
  right: 163px;
  position: absolute;
`

const date = css`
    text-align: right;
    padding: 3px 8px;
    border-bottom: 2px solid #7446b9;
`

export const render = ({ output }) => (
  <div className={date}>{output}</div>
)

