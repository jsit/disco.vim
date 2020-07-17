# disco.vim

A full set of 1-, 8-, 16-, 88-, 256-, and GUI-color-compatible Vim colors. Aims to be bulletproof and obey terminal palette options and `background` setting if present.

Codebase derived from [jsit/vim-tomorrow-theme](https://gitub.com/jsit/vim-tomorrow-theme) (which was derived from [chriskempson/vim-tomorrow-theme](https://github.com/chriskempson/vim-tomorrow-theme))

# Options

- `g:disco_nobright`: If set to `1`, don't use bright colors. Default `0`.
- `g:disco_red_error_only`: If set to `1`, only use the red color for
  errors -- useful for terminal themes that intend to reserve this color for
  that purpose, like [Rainglow](https://rainglow.io/). Default `0`.

# Custom color mapping
`g:disco_color_map` allow you to manually map any Disco color to a specific terminal
color. Example:

```vimscript
let g:disco_color_map = {
	\'green': 'DarkYellow'
	\'truered': 'DarkRed'
\}
```

The value (e.g. `'DarkYellow'`) should be taken from `:h gui-colors`; the keys
(e.g., `'green'`) are as follows:

- `red`: High-contrast Red (against background)
- `green`: High-contrast Green
- `yellow`: High-contrast Yellow
- `blue`: High-contrast Blue
- `magenta`: High-contrast Magenta
- `cyan`: High-contrast Cyan

- `dimred`: Low-contrast Red (against background)
- `dimgreen`: Low-contrast Green
- `dimyellow`: Low-contrast Yellow
- `dimblue`: Low-contrast Blue
- `dimmagenta`: Low-contrast Magenta
- `dimcyan`: Low-contrast Cyan
 
- `bg`: Background color
- `fg`: Foreground (text) color

- `truered`: Actual red, if red is to be used only for errors
 
- `dim`: Low-contrast gray color, for `Number`, `CursorLine` background, etc.
- `dimtwo`: High-contrast gray color, for `Comment` foreground etc.

- `brightyellow`: Background color for search results

# Screenshots

These screenshots were made using iTerm2 with the specified
Color Presets, `t_Co=256`, and **no** Vim plugins

### Monokai
![](https://cl.ly/kJ6j/disco-monokai.png)


### Base16 Railscasts Light
![](https://cl.ly/kIjt/disco-base16-railscasts-light.png)


### Base16 Railscasts Dark
![](https://cl.ly/kJ9E/disco-base16-railscasts-dark.png)


### Base16 Tomorrow
![](https://cl.ly/kInn/disco-base16.png)


### Solarized
![](https://cl.ly/kJ6K/disco-solarized.png)


### Jellybeans
![](https://cl.ly/kKtx/disco-jellybeans.png)


### Tango Light
![](https://cl.ly/kIZd/disco-tango-light.png)


### Tango Dark
![](https://cl.ly/kIa8/disco-tango-dark.png)


# License

Copyright (c) Jay Sitter. Distributed under the same terms as Vim itself. See :help license.
