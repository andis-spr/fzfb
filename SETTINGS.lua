-- SETTINGS_DEFAULT.lua - Default configuration values for fzf-bookmarks.

-- TIP: Your personal ovverides of these values can go into SETTINGS_LOCAL.lua.

if package.config:sub(1,1) == '/' -- (Determine system by checking the path separator.)
then
    -- Assume a Unix-like system e.g. GNU/Linux, macOS --

    -- BROWSER_CMDS: A list of available web browsers.
    BROWSER_CMD = {
        "sensible-browser %s", -- Debian/*buntu GNU/Linux symlink to an installed default browser
        "safari %s",
        "chrome %s",
        "firefox -new-tab %s",
    }

    -- BOOKMARKS_FILE - Path to your bookmarks file.
    if (fileExists('bookmarks.txt')) -- determine if there's a personal 'bookmarks.txt' present
    then
        BOOKMARKS_FILE=arg[1].."/bookmarks.txt"
    else
        BOOKMARKS_FILE=arg[1].."/example.bookmarks.txt"
    end
    -- You can also pass this path as a parameter to fzfb[.bat].
    
    -- CLIPBOARD_CMD - system clipboard utility
    -- Typically on
    --- Microsoft Windows:
    --- CLIPBOARD_CMD="clip"
    --- Linux/Unix with X11:
    --- CLIPBOARD_CMD="xclip -selection c"
    --- macOS
    --- CLIPBOARD_CMD="pbcopy"
    CLIPBOARD_CMD="xclip -selection c"
else
    -- Assume a Microsoft Windows system --

    -- BROWSER_CMDS: A list of available web browsers.
    BROWSER_CMD = {
        "start chrome %s",
        "start %s", -- Point to Windows default http/s URL handler
        "start edge %s",
        "start firefox -new-tab %s",
    }

    -- BOOKMARKS_FILE - Path to your bookmarks file.
    if (fileExists(arg[1]..'bookmarks.txt')) -- determine if there's a personal 'bookmarks.txt' present
    then
        BOOKMARKS_FILE=arg[1].."bookmarks.txt"
    else
        BOOKMARKS_FILE=arg[1].."example.bookmarks.txt"
    end
    -- You can also pass this path as a parameter to fzfb[.bat].
    
    -- CLIPBOARD_CMD - system clipboard utility
    -- Typically on
    --- Microsoft Windows:
    --- CLIPBOARD_CMD="clip"
    --- Linux/Unix with X11:
    --- CLIPBOARD_CMD="xclip -selection c"
    --- macOS
    --- CLIPBOARD_CMD="pbcopy"
    CLIPBOARD_CMD="clip"
end

-- BROWSER_CMD_IS_SEQ - determines what pressing Enter on selected bookmarks does:
-- true - repeats BROWSER_CMD call for each link individually;
-- false - bookmark links are passed as a space-delimeted argument to single BROWSER_CMD call;
BROWSER_CMD_IS_SEQ=false

-- fzf parameters. Check fzf manual for more information on these.
FZF_PREVIEW=true
FZF_PREVIEW_WINDOW="up:8"
FZF_LAYOUT="reverse-list"
