https://www.kinesis-ergo.com/advantage2-resources/
https://kinesis-ergo.com/wp-content/uploads/Adv2-Users-Manual-fw1.0.521.us-9-16-20.pdf

firmware update: https://kinesis-ergo.com/wp-content/uploads/Adv2-Firmware-Update-Instructions-4-2-19.pdf

## Power user mode

`Progm + Shift + Esc`

Lights will flash 4 times to indicate activated and 2 times to indicate deactivated

## Remapping a key

NOTE: For remapping of the thumb clusters, the default windows layout is used.

`Source action > Destination key`

Press the `Progm` key to exit remap mode.

## Opening the v-drive

PUM must be activated.

To mount/unmount:

`Progm + F1`

Lights will flash 4 times to indicate activated and 2 times to indicate deactivated

## Creating a custom hotkey layout

NOTE: The v-drive must be closed and PUM mode must be activated!

Pressing `Progm + F2` will cause the num lock LED to start flashing rapidly, then press
the alphanumeric key that you want the layout to be assigned to. This will automatically create a
new file for the new layout.

e.g. Pressing `Progm + F2 + n` will create a new layout in the `Progm + n` namespace with an associated
`n_query.txt` file which will be a copy of the current layout.

NOTE: Only create new layouts using this method, never create the file from the v-drive.

## Programming a layout

Keymap structure:

`[location token] > [action token]`

e.g. map `q` to `a`: `[q]>[a]`
e.g. When the keypad layer is active, map `a` to `volume down`: `[kp-a]>[vol-]`

Macro structure:

`{Location Token 1}{Location Token 2}... > {Action Token 1}{Action Token 2}{Action Token 3}...`

e.g. Execute `shift-h` when `pup` is pressed: `{pup}>{-shift}{h}{+shift}`

`-` indicates the depression of the key and `+` the release. This can be used for any key that needs
to be held, control, alt, cmd and shift

## Print info

`Progm + Esc` will output the current keyboard status into a text box

## Hard reset

To initiate a Hard Reset, hold progm+F9 while plugging the keyboard. Once all four LED Indicator Lights start
to flash, release progm+F9. The LEDs will flash four times to signal that the Hard Reset is complete.


## NOTE:

For the media keys to work in High Sierra, need to install BeardedSpice
