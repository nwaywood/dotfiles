"use babel"

module.exports = function loadVmpCommands({Base}) {
    class ScrollThreeLinesUp extends Base.getClass("ScrollUp") {
        static commandPrefix = "vim-mode-plus-user"
        defaultCount = 3
    }

    class ScrollThreeLinesDown extends Base.getClass("ScrollDown") {
        static commandPrefix = "vim-mode-plus-user"
        defaultCount = 3
    }
  return {ScrollThreeLinesUp, ScrollThreeLinesDown}
}

// consumeService 'vim-mode-plus', 'provideVimModePlus', (service) ->
//   {Base} = service

//   ScrollUp = Base.getClass('ScrollUp')
//   ScrollDown = Base.getClass('ScrollDown')

//   class ScrollThreeLinesUp extends ScrollUp
//     @commandPrefix: 'vim-mode-plus-user'
//     @registerCommand()
//     defaultCount: 3

//   class ScrollThreeLinesDown extends ScrollDown
//     @commandPrefix: 'vim-mode-plus-user'
//     @registerCommand()
//     defaultCount: 3
