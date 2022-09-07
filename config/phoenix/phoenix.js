// https://github.com/kasper/phoenix
Phoenix.set({
  daemon: true,
  openAtLogin: true
});

const MOD1 = ['cmd', 'ctrl', 'alt'];
const MOD2 = ['alt', 'shift'];


Key.on('t', MOD2, function() {
    App.launch("Kitty").focus();
});

Key.on('s', MOD2, function() {
    App.launch("Slack").focus();
});

Key.on('c', MOD2, function(){
  App.launch('Google Chrome').focus();
});

Key.on('f', MOD2, function(){
  App.launch('Firefox').focus();
});

Key.on('e', MOD2, function(){
  App.launch('Visual Studio Code').focus();
});

Key.on('z', MOD2, function(){
  App.launch('zoom.us').focus();
});

Key.on('b', MOD2, function(){
  App.launch('Bear').focus();
});
