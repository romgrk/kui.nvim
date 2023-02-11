/** This is automatically generated file. Do not modify this file manually. */
/** @noResolution */
/** @noSelfInFile */
import type { INvimFloatWinConfig } from "./utils";
/** @noSelf */
export interface Option {
    /**
     * number	(default 224)
     * 			global
     * 	The ASCII code for the first letter of the Hebrew alphabet.  The
     * 	routine that maps the keyboard in Hebrew mode, both in Insert mode
     * 	(when hkmap is set) and on the command-line (when hitting CTRL-_)
     * 	outputs the Hebrew characters in the range [aleph..aleph+26].
     * 	aleph=128 applies to PC code, and aleph=224 applies to ISO 8859-8.
     * 	See |rileft.txt|.
     */
    aleph: number;
    /**
     * boolean	(default off)
     * 			global
     * 	Allow CTRL-_ in Insert and Command-line mode.  This is default off, to
     * 	avoid that users that accidentally type CTRL-_ instead of SHIFT-_ get
     * 	into reverse Insert mode, and don't know how to get out.  See
     * 	'revins'.
     */
    allowrevins: boolean;
    /**
     * string (default: "single")
     * 			global
     * 	Tells Vim what to do with characters with East Asian Width Class
     * 	Ambiguous (such as Euro, Registered Sign, Copyright Sign, Greek
     * 	letters, Cyrillic letters).
     */
    ambiwidth: string;
    /**
     * boolean (default off)
     * 			global
     * 	When on, Vim will change the current working directory whenever you
     * 	open a file, switch buffers, delete a buffer or open/close a window.
     * 	It will change to the directory containing the file which was opened
     * 	or selected.
     * 	Note: When this option is on some plugins may not work.
     */
    autochdir: boolean;
    /**
     * boolean (default off)
     * 			local to window
     * 	This option can be set to start editing Arabic text.
     * 	Setting this option will:
     * 	- Set the 'rightleft' option, unless 'termbidi' is set.
     * 	- Set the 'arabicshape' option, unless 'termbidi' is set.
     * 	- Set the 'keymap' option to "arabic"; in Insert mode CTRL-^ toggles
     * 	  between typing English and Arabic key mapping.
     * 	- Set the 'delcombine' option
     */
    arabic: boolean;
    /**
     * boolean (default on)
     * 			global
     * 	When on and 'termbidi' is off, the required visual character
     * 	corrections that need to take place for displaying the Arabic language
     * 	take effect.  Shaping, in essence, gets enabled; the term is a broad
     * 	one which encompasses:
     * 	  a) the changing/morphing of characters based on their location
     * 	     within a word (initial, medial, final and stand-alone).
     * 	  b) the enabling of the ability to compose characters
     * 	  c) the enabling of the required combining of some characters
     * 	When disabled the display shows each character's true stand-alone
     * 	form.
     * 	Arabic is a complex language which requires other settings, for
     * 	further details see |arabic.txt|.
     */
    arabicshape: boolean;
    /**
     * boolean	(default on)
     * 			local to buffer
     * 	Copy indent from current line when starting a new line (typing <CR>
     * 	in Insert mode or when using the "o" or "O" command).  If you do not
     * 	type anything on the new line except <BS> or CTRL-D and then type
     * 	<Esc>, CTRL-O or <CR>, the indent is deleted again.  Moving the cursor
     * 	to another line has the same effect, unless the 'I' flag is included
     * 	in 'cpoptions'.
     * 	When autoindent is on, formatting (with the "gq" command or when you
     * 	reach 'textwidth' in Insert mode) uses the indentation of the first
     * 	line.
     * 	When 'smartindent' or 'cindent' is on the indent is changed in
     * 	a different way.
     * 	The 'autoindent' option is reset when the 'paste' option is set and
     * 	restored when 'paste' is reset.
     * 	{small difference from Vi: After the indent is deleted when typing
     * 	<Esc> or <CR>, the cursor position when moving up or down is after the
     * 	deleted indent; Vi puts the cursor somewhere in the deleted indent}.
     */
    autoindent: boolean;
    /**
     * boolean	(default on)
     * 			global or local to buffer |global-local|
     * 	When a file has been detected to have been changed outside of Vim and
     * 	it has not been changed inside of Vim, automatically read it again.
     * 	When the file has been deleted this is not done, so you have the text
     * 	from before it was deleted.  When it appears again then it is read.
     * 	|timestamp|
     * 	If this option has a local value, use this command to switch back to
     * 	using the global value: >
     * 		:set autoread<
     * <
     * 				 *'autowrite'* *'aw'* *'noautowrite'* *'noaw'*
     */
    autoread: boolean;
    /**
     * boolean	(default off)
     * 			global
     * 	Write the contents of the file, if it has been modified, on each
     * 	:next, :rewind, :last, :first, :previous, :stop, :suspend, :tag, :!,
     * 	:make, CTRL-] and CTRL-^ command; and when a :buffer, CTRL-O, CTRL-I,
     * 	'{A-Z0-9}, or `{A-Z0-9} command takes one to another file.
     * 	Note that for some commands the 'autowrite' option is not used, see
     * 	'autowriteall' for that.
     * 	Some buffers will not be written, specifically when 'buftype' is
     * 	"nowrite", "nofile", "terminal" or "prompt".
     */
    autowrite: boolean;
    /**
     * boolean	(default off)
     * 			global
     * 	Like 'autowrite', but also used for commands ":edit", ":enew", ":quit",
     * 	":qall", ":exit", ":xit", ":recover" and closing the Vim window.
     * 	Setting this option also implies that Vim behaves like 'autowrite' has
     * 	been set.
     */
    autowriteall: boolean;
    /**
     * string	(default "dark")
     * 			global
     * 	When set to "dark" or "light", adjusts the default color groups for
     * 	that background type.  The |TUI| or other UI sets this on startup
     * 	(triggering |OptionSet|) if it can detect the background color.
     */
    background: string;
    /**
     * string	(default "indent,eol,start")
     * 			global
     * 	Influences the working of <BS>, <Del>, CTRL-W and CTRL-U in Insert
     * 	mode.  This is a list of items, separated by commas.  Each item allows
     * 	a way to backspace over something:
     * 	value	effect	~
     * 	indent	allow backspacing over autoindent
     * 	eol	allow backspacing over line breaks (join lines)
     * 	start	allow backspacing over the start of insert; CTRL-W and CTRL-U
     * 		stop once at the start of insert.
     */
    backspace: string;
    /**
     * boolean	(default off)
     * 			global
     * 	Make a backup before overwriting a file.  Leave it around after the
     * 	file has been successfully written.  If you do not want to keep the
     * 	backup file, but you do want a backup while the file is being
     * 	written, reset this option and set the 'writebackup' option (this is
     * 	the default).  If you do not want a backup file at all reset both
     * 	options (use this if your file system is almost full).  See the
     * 	|backup-table| for more explanations.
     * 	When the 'backupskip' pattern matches, a backup is not made anyway.
     * 	When 'patchmode' is set, the backup may be renamed to become the
     * 	oldest version of a file.
     */
    backup: boolean;
    /**
     * string	(Vi default for Unix: "yes", otherwise: "auto")
     * 			global or local to buffer |global-local|
     * 	When writing a file and a backup is made, this option tells how it's
     * 	done.  This is a comma separated list of words.
     */
    backupcopy: string;
    /**
     * string	(default ".,$XDG_DATA_HOME/nvim/backup")
     * 			global
     * 	List of directories for the backup file, separated with commas.
     * 	- The backup file will be created in the first directory in the list
     * 	  where this is possible.  The directory must exist, Vim will not
     * 	  create it for you.
     * 	- Empty means that no backup file will be created ('patchmode' is
     * 	  impossible!).  Writing may fail because of this.
     * 	- A directory "." means to put the backup file in the same directory
     * 	  as the edited file.
     * 	- A directory starting with "./" (or ".\" for Windows) means to
     * 	  put the backup file relative to where the edited file is.  The
     * 	  leading "." is replaced with the path name of the edited file.
     * 	  ("." inside a directory name has no special meaning).
     * 	- Spaces after the comma are ignored, other spaces are considered part
     * 	  of the directory name.  To have a space at the start of a directory
     * 	  name, precede it with a backslash.
     * 	- To include a comma in a directory name precede it with a backslash.
     * 	- A directory name may end in an '/'.
     * 	- For Unix and Win32, if a directory ends in two path separators "//",
     * 	  the swap file name will be built from the complete path to the file
     * 	  with all path separators changed to percent '%' signs. This will
     * 	  ensure file name uniqueness in the backup directory.
     * 	  On Win32, it is also possible to end with "\\".  However, When a
     * 	  separating comma is following, you must use "//", since "\\" will
     * 	  include the comma in the file name. Therefore it is recommended to
     * 	  use '//', instead of '\\'.
     * 	- Environment variables are expanded |:set_env|.
     * 	- Careful with '\' characters, type one before a space, type two to
     * 	  get one in the option (see |option-backslash|), for example: >
     * 	    :set bdir=c:\\tmp,\ dir\\,with\\,commas,\\\ dir\ with\ spaces
     * <	- For backwards compatibility with Vim version 3.0 a '>' at the start
     * 	  of the option is removed.
     * 	See also 'backup' and 'writebackup' options.
     * 	If you want to hide your backup files on Unix, consider this value: >
     * 		:set backupdir=./.backup,~/.backup,.,/tmp
     * <	You must create a ".backup" directory in each directory and in your
     * 	home directory for this to work properly.
     * 	The use of |:set+=| and |:set-=| is preferred when adding or removing
     * 	directories from the list.  This avoids problems when a future version
     * 	uses another default.
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    backupdir: string;
    /**
     * string	(default "~")
     * 			global
     * 	String which is appended to a file name to make the name of the
     * 	backup file.  The default is quite unusual, because this avoids
     * 	accidentally overwriting existing files with a backup file.  You might
     * 	prefer using ".bak", but make sure that you don't have files with
     * 	".bak" that you want to keep.
     * 	Only normal file name characters can be used, "/\*?[|<>" are illegal.
     */
    backupext: string;
    /**
     * string	(default "all")
     * 			global
     * 	Specifies for which events the bell will not be rung. It is a comma
     * 	separated list of items. For each item that is present, the bell
     * 	will be silenced. This is most useful to specify specific events in
     * 	insert mode to be silenced.
     */
    belloff: string;
    /**
     * boolean	(default off)
     * 			local to buffer
     * 	This option should be set before editing a binary file.  You can also
     * 	use the |-b| Vim argument.  When this option is switched on a few
     * 	options will be changed (also when it already was on):
     * 		'textwidth'  will be set to 0
     * 		'wrapmargin' will be set to 0
     * 		'modeline'   will be off
     * 		'expandtab'  will be off
     * 	Also, 'fileformat' and 'fileformats' options will not be used, the
     * 	file is read and written like 'fileformat' was "unix" (a single <NL>
     * 	separates lines).
     * 	The 'fileencoding' and 'fileencodings' options will not be used, the
     * 	file is read without conversion.
     * 	NOTE: When you start editing a(nother) file while the 'bin' option is
     * 	on, settings from autocommands may change the settings again (e.g.,
     * 	'textwidth'), causing trouble when editing.  You might want to set
     * 	'bin' again when the file has been loaded.
     * 	The previous values of these options are remembered and restored when
     * 	'bin' is switched from on to off.  Each buffer has its own set of
     * 	saved option values.
     * 	To edit a file with 'binary' set you can use the |++bin| argument.
     * 	This avoids you have to do ":set bin", which would have effect for all
     * 	files you edit.
     * 	When writing a file the <EOL> for the last line is only written if
     * 	there was one in the original file (normally Vim appends an <EOL> to
     * 	the last line if there is none; this would make the file longer).  See
     * 	the 'endofline' option.
     */
    binary: boolean;
    /**
     * boolean	(default off)
     * 			local to buffer
     * 	When writing a file and the following conditions are met, a BOM (Byte
     * 	Order Mark) is prepended to the file:
     * 	- this option is on
     * 	- the 'binary' option is off
     * 	- 'fileencoding' is "utf-8", "ucs-2", "ucs-4" or one of the little/big
     * 	  endian variants.
     * 	Some applications use the BOM to recognize the encoding of the file.
     * 	Often used for UCS-2 files on MS-Windows.  For other applications it
     * 	causes trouble, for example: "cat file1 file2" makes the BOM of file2
     * 	appear halfway through the resulting file.  Gcc doesn't accept a BOM.
     * 	When Vim reads a file and 'fileencodings' starts with "ucs-bom", a
     * 	check for the presence of the BOM is done and 'bomb' set accordingly.
     * 	Unless 'binary' is set, it is removed from the first line, so that you
     * 	don't see it when editing.  When you don't change the options, the BOM
     * 	will be restored when writing the file.
     */
    bomb: boolean;
    /**
     * string	(default " ^I!@*-+;:,./?")
     * 			global
     * 	This option lets you choose which characters might cause a line
     * 	break if 'linebreak' is on.  Only works for ASCII characters.
     */
    breakat: string;
    /**
     * boolean (default off)
     * 			local to window
     * 	Every wrapped line will continue visually indented (same amount of
     * 	space as the beginning of that line), thus preserving horizontal blocks
     * 	of text.
     */
    breakindent: boolean;
    /**
     * string (default empty)
     * 			local to window
     * 	Settings for 'breakindent'. It can consist of the following optional
     * 	items and must be separated by a comma:
     * 		min:{n}	    Minimum text width that will be kept after
     * 			    applying 'breakindent', even if the resulting
     * 			    text should normally be narrower. This prevents
     * 			    text indented almost to the right window border
     * 			    occupying lot of vertical space when broken.
     * 		shift:{n}   After applying 'breakindent', the wrapped line's
     * 			    beginning will be shifted by the given number of
     * 			    characters.  It permits dynamic French paragraph
     * 			    indentation (negative) or emphasizing the line
     * 			    continuation (positive).
     * 		sbr	    Display the 'showbreak' value before applying the
     * 			    additional indent.
     * 	The default value for min is 20 and shift is 0.
     */
    breakindentopt: string;
    /**
     * string	(default: "last")
     * 			global
     * 	Which directory to use for the file browser:
     * 	   last		Use same directory as with last file browser, where a
     * 			file was opened or saved.
     * 	   buffer	Use the directory of the related buffer.
     * 	   current	Use the current directory.
     * 	   {path}	Use the specified directory
     */
    browsedir: string;
    /**
     * string (default: "")
     * 			local to buffer
     * 	This option specifies what happens when a buffer is no longer
     * 	displayed in a window:
     * 	  <empty>	follow the global 'hidden' option
     * 	  hide		hide the buffer (don't unload it), also when 'hidden'
     * 			is not set
     * 	  unload	unload the buffer, also when 'hidden' is set or using
     * 			|:hide|
     * 	  delete	delete the buffer from the buffer list, also when
     * 			'hidden' is set or using |:hide|, like using
     * 			|:bdelete|
     * 	  wipe		wipe out the buffer from the buffer list, also when
     * 			'hidden' is set or using |:hide|, like using
     * 			|:bwipeout|
     */
    bufhidden: string;
    /**
     * boolean (default: on)
     * 			local to buffer
     * 	When this option is set, the buffer shows up in the buffer list.  If
     * 	it is reset it is not used for ":bnext", "ls", the Buffers menu, etc.
     * 	This option is reset by Vim for buffers that are only used to remember
     * 	a file name or marks.  Vim sets it when starting to edit a buffer.
     * 	But not when moving to a buffer with ":buffer".
     */
    buflisted: boolean;
    /**
     * string (default: "")
     * 			local to buffer
     * 	The value of this option specifies the type of a buffer:
     * 	  <empty>	normal buffer
     * 	  acwrite	buffer will always be written with |BufWriteCmd|s
     * 	  help		help buffer (do not set this manually)
     * 	  nofile	buffer is not related to a file, will not be written
     * 	  nowrite	buffer will not be written
     * 	  quickfix	list of errors |:cwindow| or locations |:lwindow|
     * 	  terminal	|terminal-emulator| buffer
     * 	  prompt	buffer where only the last line can be edited, meant
     * 			to be used by a plugin, see |prompt-buffer|
     */
    buftype: string;
    /**
     * string	(default: "internal,keepascii")
     * 			global
     * 	Specifies details about changing the case of letters.  It may contain
     * 	these words, separated by a comma:
     * 	internal	Use internal case mapping functions, the current
     * 			locale does not change the case mapping. When
     * 			"internal" is omitted, the towupper() and towlower()
     * 			system library functions are used when available.
     * 	keepascii	For the ASCII characters (0x00 to 0x7f) use the US
     * 			case mapping, the current locale is not effective.
     * 			This probably only matters for Turkish.
     */
    casemap: string;
    /**
     * string	(default: equivalent to $CDPATH or ",,")
     * 			global
     * 	This is a list of directories which will be searched when using the
     * 	|:cd| and |:lcd| commands, provided that the directory being searched
     * 	for has a relative path, not an absolute part starting with "/", "./"
     * 	or "../", the 'cdpath' option is not used then.
     * 	The 'cdpath' option's value has the same form and semantics as
     * 	|'path'|.  Also see |file-searching|.
     * 	The default value is taken from $CDPATH, with a "," prepended to look
     * 	in the current directory first.
     * 	If the default value taken from $CDPATH is not what you want, include
     * 	a modified version of the following command in your vimrc file to
     * 	override it: >
     * 	  :let &cdpath = ',' . substitute(substitute($CDPATH, '[, ]', '\\\0', 'g'), ':', ',', 'g')
     * <	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     * 	(parts of 'cdpath' can be passed to the shell to expand file names).
     */
    cdpath: string;
    /**
     * string	(Vim default: CTRL-F, Vi default: "")
     * 			global
     * 	The key used in Command-line Mode to open the command-line window.
     * 	Only non-printable keys are allowed.
     * 	The key can be specified as a single character, but it is difficult to
     * 	type.  The preferred way is to use the <> notation.  Examples: >
     * 		:exe "set cedit=\<C-Y>"
     * 		:exe "set cedit=\<Esc>"
     * <	|Nvi| also has this option, but it only uses the first character.
     * 	See |cmdwin|.
     */
    cedit: string;
    /**
     * number (default: 0)
     * 			local to buffer
     * 	|channel| connected to the buffer, or 0 if no channel is connected.
     * 	In a |:terminal| buffer this is the terminal channel.
     * 	Read-only.
     */
    channel: number;
    /**
     * string (default "")
     * 			global
     * 	An expression that is used for character encoding conversion.  It is
     * 	evaluated when a file that is to be read or has been written has a
     * 	different encoding from what is desired.
     * 	'charconvert' is not used when the internal iconv() function is
     * 	supported and is able to do the conversion.  Using iconv() is
     * 	preferred, because it is much faster.
     * 	'charconvert' is not used when reading stdin |--|, because there is no
     * 	file to convert from.  You will have to save the text in a file first.
     * 	The expression must return zero or an empty string for success,
     * 	non-zero for failure.
     * 	See |encoding-names| for possible encoding names.
     * 	Additionally, names given in 'fileencodings' and 'fileencoding' are
     * 	used.
     * 	Conversion between "latin1", "unicode", "ucs-2", "ucs-4" and "utf-8"
     * 	is done internally by Vim, 'charconvert' is not used for this.
     * 	Also used for Unicode conversion.
     * 	Example: >
     * 		set charconvert=CharConvert()
     * 		fun CharConvert()
     * 		  system("recode "
     * 			\ . v:charconvert_from . ".." . v:charconvert_to
     * 			\ . " <" . v:fname_in . " >" v:fname_out)
     * 		  return v:shell_error
     * 		endfun
     * <	The related Vim variables are:
     * 		v:charconvert_from	name of the current encoding
     * 		v:charconvert_to	name of the desired encoding
     * 		v:fname_in		name of the input file
     * 		v:fname_out		name of the output file
     * 	Note that v:fname_in and v:fname_out will never be the same.
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    charconvert: string;
    /**
     * boolean	(default off)
     * 			local to buffer
     * 	Enables automatic C program indenting.  See 'cinkeys' to set the keys
     * 	that trigger reindenting in insert mode and 'cinoptions' to set your
     * 	preferred indent style.
     * 	If 'indentexpr' is not empty, it overrules 'cindent'.
     * 	If 'lisp' is not on and both 'indentexpr' and 'equalprg' are empty,
     * 	the "=" operator indents using this algorithm rather than calling an
     * 	external program.
     * 	See |C-indenting|.
     * 	When you don't like the way 'cindent' works, try the 'smartindent'
     * 	option or 'indentexpr'.
     * 	This option is not used when 'paste' is set.
     */
    cindent: boolean;
    /**
     * string	(default "0{,0},0),0],:,0#,!^F,o,O,e")
     * 			local to buffer
     * 	A list of keys that, when typed in Insert mode, cause reindenting of
     * 	the current line.  Only used if 'cindent' is on and 'indentexpr' is
     * 	empty.
     * 	For the format of this option see |cinkeys-format|.
     * 	See |C-indenting|.
     */
    cinkeys: string;
    /**
     * string	(default "")
     * 			local to buffer
     * 	The 'cinoptions' affect the way 'cindent' reindents lines in a C
     * 	program.  See |cinoptions-values| for the values of this option, and
     * 	|C-indenting| for info on C indenting in general.
     */
    cinoptions: string;
    /**
     * string	(default "if,else,while,do,for,switch")
     * 			local to buffer
     * 	These keywords start an extra indent in the next line when
     * 	'smartindent' or 'cindent' is set.  For 'cindent' this is only done at
     * 	an appropriate place (inside {}).
     * 	Note that 'ignorecase' isn't used for 'cinwords'.  If case doesn't
     * 	matter, include the keyword both the uppercase and lowercase:
     * 	"if,If,IF".
     */
    cinwords: string;
    /**
     * string	(default "")
     * 			global
     * 	This option is a list of comma separated names.
     * 	These names are recognized:
     */
    clipboard: string;
    /**
     * number	(default 1)
     * 			global
     * 	Number of screen lines to use for the command-line.  Helps avoiding
     * 	|hit-enter| prompts.
     * 	The value of this option is stored with the tab page, so that each tab
     * 	page can have a different value.
     */
    cmdheight: number;
    /**
     * number	(default 7)
     * 			global
     * 	Number of screen lines to use for the command-line window. |cmdwin|
     */
    cmdwinheight: number;
    /**
     * string	(default "")
     * 			local to window
     * 	'colorcolumn' is a comma separated list of screen columns that are
     * 	highlighted with ColorColumn |hl-ColorColumn|.  Useful to align
     * 	text.  Will make screen redrawing slower.
     * 	The screen column can be an absolute number, or a number preceded with
     * 	'+' or '-', which is added to or subtracted from 'textwidth'. >
     */
    colorcolumn: string;
    /**
     * number	(default 80 or terminal width)
     * 			global
     * 	Number of columns of the screen.  Normally this is set by the terminal
     * 	initialization and does not have to be set by hand.
     * 	When Vim is running in the GUI or in a resizable window, setting this
     * 	option will cause the window size to be changed.  When you only want
     * 	to use the size for the GUI, put the command in your |ginit.vim| file.
     * 	When you set this option and Vim is unable to change the physical
     * 	number of columns of the display, the display may be messed up.  For
     * 	the GUI it is always possible and Vim limits the number of columns to
     * 	what fits on the screen.  You can use this command to get the widest
     * 	window possible: >
     * 		:set columns=9999
     * <	Minimum value is 12, maximum value is 10000.
     */
    columns: number;
    /**
     * string	(default "/*%s*\/")
     * 			local to buffer
     * 	A template for a comment.  The "%s" in the value is replaced with the
     * 	comment text.  Currently only used to add markers for folding, see
     * 	|fold-marker|.
     */
    commentstring: string;
    /**
     * string	(default: ".,w,b,u,t")
     * 			local to buffer
     * 	This option specifies how keyword completion |ins-completion| works
     * 	when CTRL-P or CTRL-N are used.  It is also used for whole-line
     * 	completion |i_CTRL-X_CTRL-L|.  It indicates the type of completion
     * 	and the places to scan.  It is a comma separated list of flags:
     * 	.	scan the current buffer ('wrapscan' is ignored)
     * 	w	scan buffers from other windows
     * 	b	scan other loaded buffers that are in the buffer list
     * 	u	scan the unloaded buffers that are in the buffer list
     * 	U	scan the buffers that are not in the buffer list
     * 	k	scan the files given with the 'dictionary' option
     * 	kspell  use the currently active spell checking |spell|
     * 	k{dict}	scan the file {dict}.  Several "k" flags can be given,
     * 		patterns are valid too.  For example: >
     * 			:set cpt=k/usr/dict/*,k~/spanish
     * <	s	scan the files given with the 'thesaurus' option
     * 	s{tsr}	scan the file {tsr}.  Several "s" flags can be given, patterns
     * 		are valid too.
     * 	i	scan current and included files
     * 	d	scan current and included files for defined name or macro
     * 		|i_CTRL-X_CTRL-D|
     * 	]	tag completion
     * 	t	same as "]"
     */
    complete: string;
    /**
     * string	(default: empty)
     * 			local to buffer
     * 	This option specifies a function to be used for Insert mode completion
     * 	with CTRL-X CTRL-U. |i_CTRL-X_CTRL-U|
     * 	See |complete-functions| for an explanation of how the function is
     * 	invoked and what it should return.
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    completefunc: string;
    /**
     * string	(default: "menu,preview")
     * 			global
     * 	A comma separated list of options for Insert mode completion
     * 	|ins-completion|.  The supported values are:
     */
    completeopt: string;
    /**
     * string (default: "")
     * 			local to window
     * 	Sets the modes in which text in the cursor line can also be concealed.
     * 	When the current mode is listed then concealing happens just like in
     * 	other lines.
     * 	  n		Normal mode
     * 	  v		Visual mode
     * 	  i		Insert mode
     * 	  c		Command line editing, for 'incsearch'
     */
    concealcursor: string;
    /**
     * number (default 0)
     * 			local to window
     * 	Determine how text with the "conceal" syntax attribute |:syn-conceal|
     * 	is shown:
     */
    conceallevel: number;
    /**
     * boolean (default off)
     * 			global
     * 	When 'confirm' is on, certain operations that would normally
     * 	fail because of unsaved changes to a buffer, e.g. ":q" and ":e",
     * 	instead raise a dialog asking if you wish to save the current
     * 	file(s).  You can still use a ! to unconditionally |abandon| a buffer.
     * 	If 'confirm' is off you can still activate confirmation for one
     * 	command only (this is most useful in mappings) with the |:confirm|
     * 	command.
     * 	Also see the |confirm()| function and the 'v' flag in 'guioptions'.
     */
    confirm: boolean;
    /**
     * boolean	(default off)
     * 			local to buffer
     * 	Copy the structure of the existing lines indent when autoindenting a
     * 	new line.  Normally the new indent is reconstructed by a series of
     * 	tabs followed by spaces as required (unless |'expandtab'| is enabled,
     * 	in which case only spaces are used).  Enabling this option makes the
     * 	new line copy whatever characters were used for indenting on the
     * 	existing line.  'expandtab' has no effect on these characters, a Tab
     * 	remains a Tab.  If the new indent is greater than on the existing
     * 	line, the remaining space is filled in the normal manner.
     * 	See 'preserveindent'.
     */
    copyindent: boolean;
    /**
     * number	(default 0)
     * 			global
     * 	Determines how many components of the path to show in a list of tags.
     * 	See |cscopepathcomp|.
     */
    cscopepathcomp: number;
    /**
     * string	(default "cscope")
     * 			global
     * 	Specifies the command to execute cscope.  See |cscopeprg|.
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    cscopeprg: string;
    /**
     * string	(default "")
     * 			global
     * 	Specifies whether to use quickfix window to show cscope results.
     * 	See |cscopequickfix|.
     */
    cscopequickfix: string;
    /**
     * boolean (default off)
     * 			global
     * 	In the absence of a prefix (-P) for cscope. setting this option enables
     * 	to use the basename of cscope.out path as the prefix.
     * 	See |cscoperelative|.
     */
    cscoperelative: boolean;
    /**
     * boolean (default off)
     * 			global
     * 	Use cscope for tag commands.  See |cscope-options|.
     */
    cscopetag: boolean;
    /**
     * number	(default 0)
     * 			global
     * 	Determines the order in which ":cstag" performs a search.  See
     * 	|cscopetagorder|.
     */
    cscopetagorder: number;
    /**
     * boolean  (default off)
     * 			local to window
     * 	When this option is set, as the cursor in the current
     * 	window moves other cursorbound windows (windows that also have
     * 	this option set) move their cursors to the corresponding line and
     * 	column.  This option is useful for viewing the
     * 	differences between two versions of a file (see 'diff'); in diff mode,
     * 	inserted and deleted lines (though not characters within a line) are
     * 	taken into account.
     */
    cursorbind: boolean;
    /**
     * boolean	(default off)
     * 			local to window
     * 	Highlight the screen column of the cursor with CursorColumn
     * 	|hl-CursorColumn|.  Useful to align text.  Will make screen redrawing
     * 	slower.
     * 	If you only want the highlighting in the current window you can use
     * 	these autocommands: >
     * 		au WinLeave * set nocursorline nocursorcolumn
     * 		au WinEnter * set cursorline cursorcolumn
     * <
     */
    cursorcolumn: boolean;
    /**
     * boolean	(default off)
     * 			local to window
     * 	Highlight the screen line of the cursor with CursorLine
     * 	|hl-CursorLine|.  Useful to easily spot the cursor.  Will make screen
     * 	redrawing slower.
     * 	When Visual mode is active the highlighting isn't used to make it
     * 	easier to see the selected text.
     */
    cursorline: boolean;
    /**
     * string	(default "")
     * 			global
     * 	These values can be used:
     * 	msg	Error messages that would otherwise be omitted will be given
     * 		anyway.
     * 	throw	Error messages that would otherwise be omitted will be given
     * 		anyway and also throw an exception and set |v:errmsg|.
     * 	beep	A message will be given when otherwise only a beep would be
     * 		produced.
     * 	The values can be combined, separated by a comma.
     * 	"msg" and "throw" are useful for debugging 'foldexpr', 'formatexpr' or
     * 	'indentexpr'.
     */
    debug: string;
    /**
     * string	(default "^\s*#\s*define")
     * 			global or local to buffer |global-local|
     * 	Pattern to be used to find a macro definition.  It is a search
     * 	pattern, just like for the "/" command.  This option is used for the
     * 	commands like "[i" and "[d" |include-search|.  The 'isident' option is
     * 	used to recognize the defined name after the match:
     * 		{match with 'define'}{non-ID chars}{defined name}{non-ID char}
     * 	See |option-backslash| about inserting backslashes to include a space
     * 	or backslash.
     * 	The default value is for C programs.  For C++ this value would be
     * 	useful, to include const type declarations: >
     * 		^\(#\s*define\|[a-z]*\s*const\s*[a-z]*\)
     * <	You can also use "\ze" just before the name and continue the pattern
     * 	to check what is following.  E.g. for Javascript, if a function is
     * 	defined with "func_name = function(args)": >
     * 		^\s*\ze\i\+\s*=\s*function(
     * <	If the function is defined with "func_name : function() {...": >
     * 	        ^\s*\ze\i\+\s*[:]\s*(*function\s*(
     * <	When using the ":set" command, you need to double the backslashes!
     * 	To avoid that use `:let` with a single quote string: >
     * 		let &l:define = '^\s*\ze\k\+\s*=\s*function('
     * <
     */
    define: string;
    /**
     * boolean (default off)
     * 			global
     * 	If editing Unicode and this option is set, backspace and Normal mode
     * 	"x" delete each combining character on its own.  When it is off (the
     * 	default) the character along with its combining characters are
     * 	deleted.
     * 	Note: When 'delcombine' is set "xx" may work different from "2x"!
     */
    delcombine: boolean;
    /**
     * string	(default "")
     * 			global or local to buffer |global-local|
     * 	List of file names, separated by commas, that are used to lookup words
     * 	for keyword completion commands |i_CTRL-X_CTRL-K|.  Each file should
     * 	contain a list of words.  This can be one word per line, or several
     * 	words per line, separated by non-keyword characters (white space is
     * 	preferred).  Maximum line length is 510 bytes.
     */
    dictionary: string;
    /**
     * boolean	(default off)
     * 			local to window
     * 	Join the current window in the group of windows that shows differences
     * 	between files.  See |diff-mode|.
     */
    diff: boolean;
    /**
     * string	(default "")
     * 			global
     * 	Expression which is evaluated to obtain a diff file (either ed-style
     * 	or unified-style) from two versions of a file.  See |diff-diffexpr|.
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    diffexpr: string;
    /**
     * string	(default "internal,filler,closeoff")
     * 			global
     * 	Option settings for diff mode.  It can consist of the following items.
     * 	All are optional.  Items must be separated by a comma.
     */
    diffopt: string;
    /**
     * boolean	(default off)
     * 			global
     * 	Enable the entering of digraphs in Insert mode with {char1} <BS>
     * 	{char2}.  See |digraphs|.
     */
    digraph: boolean;
    /**
     * string	(default "$XDG_DATA_HOME/nvim/swap//")
     * 			global
     * 	List of directory names for the swap file, separated with commas.
     * 	- The swap file will be created in the first directory where this is
     * 	  possible.  If it is not possible in any directory, but last
     * 	  directory listed in the option does not exist, it is created.
     * 	- Empty means that no swap file will be used (recovery is
     * 	  impossible!) and no |E303| error will be given.
     * 	- A directory "." means to put the swap file in the same directory as
     * 	  the edited file.  On Unix, a dot is prepended to the file name, so
     * 	  it doesn't show in a directory listing.  On MS-Windows the "hidden"
     * 	  attribute is set and a dot prepended if possible.
     * 	- A directory starting with "./" (or ".\" for Windows) means to
     * 	  put the swap file relative to where the edited file is.  The leading
     * 	  "." is replaced with the path name of the edited file.
     * 	- For Unix and Win32, if a directory ends in two path separators "//",
     * 	  the swap file name will be built from the complete path to the file
     * 	  with all path separators substituted to percent '%' signs. This will
     * 	  ensure file name uniqueness in the preserve directory.
     * 	  On Win32, it is also possible to end with "\\".  However, When a
     * 	  separating comma is following, you must use "//", since "\\" will
     * 	  include the comma in the file name. Therefore it is recommended to
     * 	  use '//', instead of '\\'.
     * 	- Spaces after the comma are ignored, other spaces are considered part
     * 	  of the directory name.  To have a space at the start of a directory
     * 	  name, precede it with a backslash.
     * 	- To include a comma in a directory name precede it with a backslash.
     * 	- A directory name may end in an ':' or '/'.
     * 	- Environment variables are expanded |:set_env|.
     * 	- Careful with '\' characters, type one before a space, type two to
     * 	  get one in the option (see |option-backslash|), for example: >
     * 	    :set dir=c:\\tmp,\ dir\\,with\\,commas,\\\ dir\ with\ spaces
     * <	- For backwards compatibility with Vim version 3.0 a '>' at the start
     * 	  of the option is removed.
     * 	Using "." first in the list is recommended.  This means that editing
     * 	the same file twice will result in a warning.  Using "/tmp" on Unix is
     * 	discouraged: When the system crashes you lose the swap file.
     * 	"/var/tmp" is often not cleared when rebooting, thus is a better
     * 	choice than "/tmp".  But it can contain a lot of files, your swap
     * 	files get lost in the crowd.  That is why a "tmp" directory in your
     * 	home directory is tried first.
     * 	The use of |:set+=| and |:set-=| is preferred when adding or removing
     * 	directories from the list.  This avoids problems when a future version
     * 	uses another default.
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    directory: string;
    /**
     * string	(default "lastline,msgsep", Vi default: "")
     * 			global
     * 	Change the way text is displayed.  This is comma separated list of
     * 	flags:
     * 	lastline	When included, as much as possible of the last line
     * 			in a window will be displayed.  "@@@" is put in the
     * 			last columns of the last screen line to indicate the
     * 			rest of the line is not displayed.
     * 	truncate	Like "lastline", but "@@@" is displayed in the first
     * 			column of the last screen line.  Overrules "lastline".
     * 	uhex		Show unprintable characters hexadecimal as <xx>
     * 			instead of using ^C and ~C.
     * 	msgsep		When showing messages longer than 'cmdheight', only
     * 			scroll the message lines, not the entire screen. The
     * 			separator line is decorated by |hl-MsgSeparator| and
     * 			the "msgsep" flag of 'fillchars'.
     */
    display: string;
    /**
     * string	(default "both")
     * 			global
     * 	Tells when the 'equalalways' option applies:
     * 		ver	vertically, width of windows is not affected
     * 		hor	horizontally, height of windows is not affected
     * 		both	width and height of windows is affected
     */
    eadirection: string;
    /**
     * boolean (default: on)
     * 			global
     * 	When on all Unicode emoji characters are considered to be full width.
     */
    emoji: boolean;
    /**
     * boolean	(default on)
     * 			local to buffer
     * 	When writing a file and this option is off and the 'binary' option
     * 	is on, or 'fixeol' option is off, no <EOL> will be written for the
     * 	last line in the file.  This option is automatically set or reset when
     * 	starting to edit a new file, depending on whether file has an <EOL>
     * 	for the last line in the file.  Normally you don't have to set or
     * 	reset this option.
     * 	When 'binary' is off and 'fixeol' is on the value is not used when
     * 	writing the file.  When 'binary' is on or 'fixeol' is off it is used
     * 	to remember the presence of a <EOL> for the last line in the file, so
     * 	that when you write the file the situation from the original file can
     * 	be kept.  But you can change it if you want to.
     */
    endofline: boolean;
    /**
     * boolean	(default on)
     * 			global
     * 	When on, all the windows are automatically made the same size after
     * 	splitting or closing a window.  This also happens the moment the
     * 	option is switched on.  When off, splitting a window will reduce the
     * 	size of the current window and leave the other windows the same.  When
     * 	closing a window the extra lines are given to the window next to it
     * 	(depending on 'splitbelow' and 'splitright').
     * 	When mixing vertically and horizontally split windows, a minimal size
     * 	is computed and some windows may be larger if there is room.  The
     * 	'eadirection' option tells in which direction the size is affected.
     * 	Changing the height and width of a window can be avoided by setting
     * 	'winfixheight' and 'winfixwidth', respectively.
     * 	If a window size is specified when creating a new window sizes are
     * 	currently not equalized (it's complicated, but may be implemented in
     * 	the future).
     */
    equalalways: boolean;
    /**
     * string	(default "")
     * 			global or local to buffer |global-local|
     * 	External program to use for "=" command.  When this option is empty
     * 	the internal formatting functions are used; either 'lisp', 'cindent'
     * 	or 'indentexpr'.  When Vim was compiled without internal formatting,
     * 	the "indent" program is used.
     * 	Environment variables are expanded |:set_env|.  See |option-backslash|
     * 	about including spaces and backslashes.
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    equalprg: string;
    /**
     * boolean	(default off)
     * 			global
     * 	Ring the bell (beep or screen flash) for error messages.  This only
     * 	makes a difference for error messages, the bell will be used always
     * 	for a lot of errors without a message (e.g., hitting <Esc> in Normal
     * 	mode).  See 'visualbell' to make the bell behave like a screen flash
     * 	or do nothing. See 'belloff' to finetune when to ring the bell.
     */
    errorbells: boolean;
    /**
     * string	(default: "errors.err")
     * 			global
     * 	Name of the errorfile for the QuickFix mode (see |:cf|).
     * 	When the "-q" command-line argument is used, 'errorfile' is set to the
     * 	following argument.  See |-q|.
     * 	NOT used for the ":make" command.  See 'makeef' for that.
     * 	Environment variables are expanded |:set_env|.
     * 	See |option-backslash| about including spaces and backslashes.
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    errorfile: string;
    /**
     * string	(default is very long)
     * 			global or local to buffer |global-local|
     * 	Scanf-like description of the format for the lines in the error file
     * 	(see |errorformat|).
     */
    errorformat: string;
    /**
     * string	(default "")
     * 			global
     * 	A list of autocommand event names, which are to be ignored.
     * 	When set to "all" or when "all" is one of the items, all autocommand
     * 	events are ignored, autocommands will not be executed.
     * 	Otherwise this is a comma separated list of event names.  Example: >
     * 	    :set ei=WinEnter,WinLeave
     * <
     * 				 *'expandtab'* *'et'* *'noexpandtab'* *'noet'*
     */
    eventignore: string;
    /**
     * boolean	(default off)
     * 			local to buffer
     * 	In Insert mode: Use the appropriate number of spaces to insert a
     * 	<Tab>.  Spaces are used in indents with the '>' and '<' commands and
     * 	when 'autoindent' is on.  To insert a real tab when 'expandtab' is
     * 	on, use CTRL-V<Tab>.  See also |:retab| and |ins-expandtab|.
     * 	This option is reset when the 'paste' option is set and restored when
     * 	the 'paste' option is reset.
     */
    expandtab: boolean;
    /**
     * string (default: "")
     * 			local to buffer
     * 	File-content encoding for the current buffer. Conversion is done with
     * 	iconv() or as specified with 'charconvert'.
     */
    fileencoding: string;
    /**
     * string (default: "ucs-bom,utf-8,default,latin1")
     * 			global
     * 	This is a list of character encodings considered when starting to edit
     * 	an existing file.  When a file is read, Vim tries to use the first
     * 	mentioned character encoding.  If an error is detected, the next one
     * 	in the list is tried.  When an encoding is found that works,
     * 	'fileencoding' is set to it.  If all fail, 'fileencoding' is set to
     * 	an empty string, which means that UTF-8 is used.
     * 		WARNING: Conversion can cause loss of information! You can use
     * 		the |++bad| argument to specify what is done with characters
     * 		that can't be converted.
     * 	For an empty file or a file with only ASCII characters most encodings
     * 	will work and the first entry of 'fileencodings' will be used (except
     * 	"ucs-bom", which requires the BOM to be present).  If you prefer
     * 	another encoding use an BufReadPost autocommand event to test if your
     * 	preferred encoding is to be used.  Example: >
     * 		au BufReadPost * if search('\S', 'w') == 0 |
     * 			\ set fenc=iso-2022-jp | endif
     * <	This sets 'fileencoding' to "iso-2022-jp" if the file does not contain
     * 	non-blank characters.
     * 	When the |++enc| argument is used then the value of 'fileencodings' is
     * 	not used.
     * 	Note that 'fileencodings' is not used for a new file, the global value
     * 	of 'fileencoding' is used instead.  You can set it with: >
     * 		:setglobal fenc=iso-8859-2
     * <	This means that a non-existing file may get a different encoding than
     * 	an empty file.
     * 	The special value "ucs-bom" can be used to check for a Unicode BOM
     * 	(Byte Order Mark) at the start of the file.  It must not be preceded
     * 	by "utf-8" or another Unicode encoding for this to work properly.
     * 	An entry for an 8-bit encoding (e.g., "latin1") should be the last,
     * 	because Vim cannot detect an error, thus the encoding is always
     * 	accepted.
     * 	The special value "default" can be used for the encoding from the
     * 	environment.  It is useful when your environment uses a non-latin1
     * 	encoding, such as Russian.
     * 	When a file contains an illegal UTF-8 byte sequence it won't be
     * 	recognized as "utf-8".  You can use the |8g8| command to find the
     * 	illegal byte sequence.
     * 	WRONG VALUES:			WHAT'S WRONG:
     * 		latin1,utf-8		"latin1" will always be used
     * 		utf-8,ucs-bom,latin1	BOM won't be recognized in an utf-8
     * 					file
     * 		cp1250,latin1		"cp1250" will always be used
     * 	If 'fileencodings' is empty, 'fileencoding' is not modified.
     * 	See 'fileencoding' for the possible values.
     * 	Setting this option does not have an effect until the next time a file
     * 	is read.
     */
    fileencodings: string;
    /**
     * string (default: "")
     * 			local to buffer
     * 	When this option is set, the FileType autocommand event is triggered.
     * 	All autocommands that match with the value of this option will be
     * 	executed.  Thus the value of 'filetype' is used in place of the file
     * 	name.
     * 	Otherwise this option does not always reflect the current file type.
     * 	This option is normally set when the file type is detected.  To enable
     * 	this use the ":filetype on" command. |:filetype|
     * 	Setting this option to a different value is most useful in a modeline,
     * 	for a file for which the file type is not automatically recognized.
     * 	Example, for in an IDL file:
     * 		/* vim: set filetype=idl : *\/ ~
     * 	|FileType| |filetypes|
     * 	When a dot appears in the value then this separates two filetype
     * 	names.  Example:
     * 		/* vim: set filetype=c.doxygen : *\/ ~
     * 	This will use the "c" filetype first, then the "doxygen" filetype.
     * 	This works both for filetype plugins and for syntax files.  More than
     * 	one dot may appear.
     * 	This option is not copied to another buffer, independent of the 's' or
     * 	'S' flag in 'cpoptions'.
     * 	Only normal file name characters can be used, "/\*?[|<>" are illegal.
     */
    filetype: string;
    /**
     * string	(default "")
     * 			global or local to window |global-local|
     * 	Characters to fill the statuslines and vertical separators.
     * 	It is a comma separated list of items:
     */
    fillchars: string;
    /**
     * boolean	(default on)
     * 			local to buffer
     * 	When writing a file and this option is on, <EOL> at the end of file
     * 	will be restored if missing. Turn this option off if you want to
     * 	preserve the situation from the original file.
     * 	When the 'binary' option is set the value of this option doesn't
     * 	matter.
     * 	See the 'endofline' option.
     */
    fixendofline: boolean;
    /**
     * string (default "")
     * 			global
     * 	When set to "all", a fold is closed when the cursor isn't in it and
     * 	its level is higher than 'foldlevel'.  Useful if you want folds to
     * 	automatically close when moving out of them.
     */
    foldclose: string;
    /**
     * string (default "0")
     * 			local to window
     * 	When and how to draw the foldcolumn. Valid values are:
     * 	    "auto":       resize to the maximum amount of folds to display.
     * 	    "auto:[1-9]": resize to accommodate multiple folds up to the
     * 			  selected level
     *             0:            to disable foldcolumn
     * 	    "[1-9]":      to display a fixed number of columns
     * 	See |folding|.
     */
    foldcolumn: string;
    /**
     * boolean (default on)
     * 			local to window
     * 	When off, all folds are open.  This option can be used to quickly
     * 	switch between showing all text unfolded and viewing the text with
     * 	folds (including manually opened or closed folds).  It can be toggled
     * 	with the |zi| command.  The 'foldcolumn' will remain blank when
     * 	'foldenable' is off.
     * 	This option is set by commands that create a new fold or close a fold.
     * 	See |folding|.
     */
    foldenable: boolean;
    /**
     * string (default: "0")
     * 			local to window
     * 	The expression used for when 'foldmethod' is "expr".  It is evaluated
     * 	for each line to obtain its fold level.  See |fold-expr|.
     */
    foldexpr: string;
    /**
     * string (default: "#")
     * 			local to window
     * 	Used only when 'foldmethod' is "indent".  Lines starting with
     * 	characters in 'foldignore' will get their fold level from surrounding
     * 	lines.  White space is skipped before checking for this character.
     * 	The default "#" works well for C programs.  See |fold-indent|.
     */
    foldignore: string;
    /**
     * number (default: 0)
     * 			local to window
     * 	Sets the fold level: Folds with a higher level will be closed.
     * 	Setting this option to zero will close all folds.  Higher numbers will
     * 	close fewer folds.
     * 	This option is set by commands like |zm|, |zM| and |zR|.
     * 	See |fold-foldlevel|.
     */
    foldlevel: number;
    /**
     * number (default: -1)
     * 			global
     * 	Sets 'foldlevel' when starting to edit another buffer in a window.
     * 	Useful to always start editing with all folds closed (value zero),
     * 	some folds closed (one) or no folds closed (99).
     * 	This is done before reading any modeline, thus a setting in a modeline
     * 	overrules this option.  Starting to edit a file for |diff-mode| also
     * 	ignores this option and closes all folds.
     * 	It is also done before BufReadPre autocommands, to allow an autocmd to
     * 	overrule the 'foldlevel' value for specific files.
     * 	When the value is negative, it is not used.
     */
    foldlevelstart: number;
    /**
     * string (default: "{{{,}}}")
     * 			local to window
     * 	The start and end marker used when 'foldmethod' is "marker".  There
     * 	must be one comma, which separates the start and end marker.  The
     * 	marker is a literal string (a regular expression would be too slow).
     * 	See |fold-marker|.
     */
    foldmarker: string;
    /**
     * string (default: "manual")
     * 			local to window
     * 	The kind of folding used for the current window.  Possible values:
     * 	|fold-manual|	manual	    Folds are created manually.
     * 	|fold-indent|	indent	    Lines with equal indent form a fold.
     * 	|fold-expr|	expr	    'foldexpr' gives the fold level of a line.
     * 	|fold-marker|	marker	    Markers are used to specify folds.
     * 	|fold-syntax|	syntax	    Syntax highlighting items specify folds.
     * 	|fold-diff|	diff	    Fold text that is not changed.
     */
    foldmethod: string;
    /**
     * number (default: 1)
     * 			local to window
     * 	Sets the number of screen lines above which a fold can be displayed
     * 	closed.  Also for manually closed folds.  With the default value of
     * 	one a fold can only be closed if it takes up two or more screen lines.
     * 	Set to zero to be able to close folds of just one screen line.
     * 	Note that this only has an effect on what is displayed.  After using
     * 	"zc" to close a fold, which is displayed open because it's smaller
     * 	than 'foldminlines', a following "zc" may close a containing fold.
     */
    foldminlines: number;
    /**
     * number (default: 20)
     * 			local to window
     * 	Sets the maximum nesting of folds for the "indent" and "syntax"
     * 	methods.  This avoids that too many folds will be created.  Using more
     * 	than 20 doesn't work, because the internal limit is 20.
     */
    foldnestmax: number;
    /**
     * string (default: "foldtext()")
     * 			local to window
     * 	An expression which is used to specify the text displayed for a closed
     * 	fold.  See |fold-foldtext|.
     */
    foldtext: string;
    /**
     * string (default "")
     * 			local to buffer
     * 	Expression which is evaluated to format a range of lines for the |gq|
     * 	operator or automatic formatting (see 'formatoptions').  When this
     * 	option is empty 'formatprg' is used.
     */
    formatexpr: string;
    /**
     * string (default: "^\s*\d\+[\]:.)}\t ]\s*")
     * 			local to buffer
     * 	A pattern that is used to recognize a list header.  This is used for
     * 	the "n" flag in 'formatoptions'.
     * 	The pattern must match exactly the text that will be the indent for
     * 	the line below it.  You can use |/\ze| to mark the end of the match
     * 	while still checking more characters.  There must be a character
     * 	following the pattern, when it matches the whole line it is handled
     * 	like there is no match.
     * 	The default recognizes a number, followed by an optional punctuation
     * 	character and white space.
     */
    formatlistpat: string;
    /**
     * string (default: "tcqj", Vi default: "vt")
     * 			local to buffer
     * 	This is a sequence of letters which describes how automatic
     * 	formatting is to be done.  See |fo-table|.  When the 'paste' option is
     * 	on, no formatting is done (like 'formatoptions' is empty).  Commas can
     * 	be inserted for readability.
     * 	To avoid problems with flags that are added in the future, use the
     * 	"+=" and "-=" feature of ":set" |add-option-flags|.
     */
    formatoptions: string;
    /**
     * string (default "")
     * 			global or local to buffer |global-local|
     * 	The name of an external program that will be used to format the lines
     * 	selected with the |gq| operator.  The program must take the input on
     * 	stdin and produce the output on stdout.  The Unix program "fmt" is
     * 	such a program.
     * 	If the 'formatexpr' option is not empty it will be used instead.
     * 	Otherwise, if 'formatprg' option is an empty string, the internal
     * 	format function will be used |C-indenting|.
     * 	Environment variables are expanded |:set_env|.  See |option-backslash|
     * 	about including spaces and backslashes.
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    formatprg: string;
    /**
     * boolean	(default off)
     * 			global
     * 	When on, the OS function fsync() will be called after saving a file
     * 	(|:write|, |writefile()|, …), |swap-file| and |shada-file|. This
     * 	flushes the file to disk, ensuring that it is safely written.
     * 	Slow on some systems: writing buffers, quitting Nvim, and other
     * 	operations may sometimes take a few seconds.
     */
    fsync: boolean;
    /**
     * boolean	(default off)
     * 			global
     * 	When on, the ":substitute" flag 'g' is default on.  This means that
     * 	all matches in a line are substituted instead of one.  When a 'g' flag
     * 	is given to a ":substitute" command, this will toggle the substitution
     * 	of all or one match.  See |complex-change|.
     */
    gdefault: boolean;
    /**
     * string	(default "%f:%l:%m,%f:%l%m,%f  %l%m")
     * 			global
     * 	Format to recognize for the ":grep" command output.
     * 	This is a scanf-like string that uses the same format as the
     * 	'errorformat' option: see |errorformat|.
     */
    grepformat: string;
    /**
     * string	(default "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20")
     * 			global
     * 	Configures the cursor style for each mode. Works in the GUI and many
     * 	terminals.  See |tui-cursor-shape|.
     */
    guicursor: string;
    /**
     * string	(default "")
     * 			global
     * 	This is a list of fonts which will be used for the GUI version of Vim.
     * 	In its simplest form the value is just one font name.  When
     * 	the font cannot be found you will get an error message.  To try other
     * 	font names a list can be specified, font names separated with commas.
     * 	The first valid font is used.
     */
    guifont: string;
    /**
     * string	(default "")
     * 			global
     * 	When not empty, specifies two (or more) fonts to be used.  The first
     * 	one for normal English, the second one for your special language.  See
     * 	|xfontset|.
     * 	Setting this option also means that all font names will be handled as
     * 	a fontset name.  Also the ones used for the "font" argument of the
     * 	|:highlight| command.
     * 	The fonts must match with the current locale.  If fonts for the
     * 	character sets that the current locale uses are not included, setting
     * 	'guifontset' will fail.
     * 	Note the difference between 'guifont' and 'guifontset': In 'guifont'
     * 	the comma-separated names are alternative names, one of which will be
     * 	used.  In 'guifontset' the whole string is one fontset name,
     * 	including the commas.  It is not possible to specify alternative
     * 	fontset names.
     * 	This example works on many X11 systems: >
     * 		:set guifontset=-*-*-medium-r-normal--16-*-*-*-c-*-*-*
     * <
     * 				*'guifontwide'* *'gfw'* *E231* *E533* *E534*
     */
    guifontset: string;
    /**
     * string	(default "")
     * 			global
     * 	When not empty, specifies a comma-separated list of fonts to be used
     * 	for double-width characters.  The first font that can be loaded is
     * 	used.
     * 	Note: The size of these fonts must be exactly twice as wide as the one
     * 	specified with 'guifont' and the same height.
     */
    guifontwide: string;
    /**
     * string	(default "egmrLT"   (MS-Windows))
     * 			global
     * 	This option only has an effect in the GUI version of Vim.  It is a
     * 	sequence of letters which describes what components and options of the
     * 	GUI should be used.
     * 	To avoid problems with flags that are added in the future, use the
     * 	"+=" and "-=" feature of ":set" |add-option-flags|.
     */
    guioptions: string;
    /**
     * string	(default empty)
     * 			global
     * 	When nonempty describes the text to use in a label of the GUI tab
     * 	pages line.  When empty and when the result is empty Vim will use a
     * 	default label.  See |setting-guitablabel| for more info.
     */
    guitablabel: string;
    /**
     * string	(default empty)
     * 			global
     * 	When nonempty describes the text to use in a tooltip for the GUI tab
     * 	pages line.  When empty Vim will use a default tooltip.
     * 	This option is otherwise just like 'guitablabel' above.
     * 	You can include a line break.  Simplest method is to use |:let|: >
     * 		:let &guitabtooltip = "line one\nline two"
     * <
     */
    guitabtooltip: string;
    /**
     * number	(default 20)
     * 			global
     * 	Minimal initial height of the help window when it is opened with the
     * 	":help" command.  The initial height of the help window is half of the
     * 	current window, or (when the 'ea' option is on) the same as other
     * 	windows.  When the height is less than 'helpheight', the height is
     * 	set to 'helpheight'.  Set to zero to disable.
     */
    helpheight: number;
    /**
     * string	(default: messages language or empty)
     * 			global
     * 	Comma separated list of languages.  Vim will use the first language
     * 	for which the desired help can be found.  The English help will always
     * 	be used as a last resort.  You can add "en" to prefer English over
     * 	another language, but that will only find tags that exist in that
     * 	language and not in the English help.
     * 	Example: >
     * 		:set helplang=de,it
     * <	This will first search German, then Italian and finally English help
     * 	files.
     * 	When using |CTRL-]| and ":help!" in a non-English help file Vim will
     * 	try to find the tag in the current language before using this option.
     * 	See |help-translated|.
     */
    helplang: string;
    /**
     * boolean	(default off)
     * 			global
     * 	When off a buffer is unloaded when it is |abandon|ed.  When on a
     * 	buffer becomes hidden when it is |abandon|ed.  If the buffer is still
     * 	displayed in another window, it does not become hidden, of course.
     * 	The commands that move through the buffer list sometimes make a buffer
     * 	hidden although the 'hidden' option is off: When the buffer is
     * 	modified, 'autowrite' is off or writing is not possible, and the '!'
     * 	flag was used.  See also |windows.txt|.
     * 	To only make one buffer hidden use the 'bufhidden' option.
     * 	This option is set for one command with ":hide {command}" |:hide|.
     * 	WARNING: It's easy to forget that you have changes in hidden buffers.
     * 	Think twice when using ":q!" or ":qa!".
     */
    hidden: boolean;
    /**
     * number	(Vim default: 10000, Vi default: 0)
     * 			global
     * 	A history of ":" commands, and a history of previous search patterns
     * 	is remembered.  This option decides how many entries may be stored in
     * 	each of these histories (see |cmdline-editing|).
     * 	The maximum value is 10000.
     */
    history: number;
    /**
     * boolean (default off)
     * 			global
     * 	When on, the keyboard is mapped for the Hebrew character set.
     * 	Normally you would set 'allowrevins' and use CTRL-_ in insert mode to
     * 	toggle this option.  See |rileft.txt|.
     */
    hkmap: boolean;
    /**
     * boolean (default off)
     * 			global
     * 	When on, phonetic keyboard mapping is used.  'hkmap' must also be on.
     * 	This is useful if you have a non-Hebrew keyboard.
     * 	See |rileft.txt|.
     */
    hkmapp: boolean;
    /**
     * boolean	(default on)
     * 			global
     * 	When there is a previous search pattern, highlight all its matches.
     * 	The |hl-Search| highlight group determines the highlighting. Note that
     * 	only the matching text is highlighted, any offsets are not applied.
     * 	See also: 'incsearch' and |:match|.
     * 	When you get bored looking at the highlighted matches, you can turn it
     * 	off with |:nohlsearch|.  This does not change the option value, as
     * 	soon as you use a search command, the highlighting comes back.
     * 	'redrawtime' specifies the maximum time spent on finding matches.
     * 	When the search pattern can match an end-of-line, Vim will try to
     * 	highlight all of the matched text.  However, this depends on where the
     * 	search starts.  This will be the first line in the window or the first
     * 	line below a closed fold.  A match in a previous line which is not
     * 	drawn may not continue in a newly drawn line.
     * 	You can specify whether the highlight status is restored on startup
     * 	with the 'h' flag in 'shada' |shada-h|.
     */
    hlsearch: boolean;
    /**
     * boolean	(default off, on when title can be restored)
     * 			global
     * 	When on, the icon text of the window will be set to the value of
     * 	'iconstring' (if it is not empty), or to the name of the file
     * 	currently being edited.  Only the last part of the name is used.
     * 	Overridden by the 'iconstring' option.
     * 	Only works if the terminal supports setting window icons.
     */
    icon: boolean;
    /**
     * string	(default "")
     * 			global
     * 	When this option is not empty, it will be used for the icon text of
     * 	the window.  This happens only when the 'icon' option is on.
     * 	Only works if the terminal supports setting window icon text
     * 	When this option contains printf-style '%' items, they will be
     * 	expanded according to the rules used for 'statusline'.  See
     * 	'titlestring' for example settings.
     * 	This option cannot be set in a modeline when 'modelineexpr' is off.
     */
    iconstring: string;
    /**
     * boolean	(default off)
     * 			global
     * 	Ignore case in search patterns.  Also used when searching in the tags
     * 	file.
     * 	Also see 'smartcase' and 'tagcase'.
     * 	Can be overruled by using "\c" or "\C" in the pattern, see
     * 	|/ignorecase|.
     */
    ignorecase: boolean;
    /**
     * boolean (default off)
     * 			global
     * 	When set the Input Method is always on when starting to edit a command
     * 	line, unless entering a search pattern (see 'imsearch' for that).
     * 	Setting this option is useful when your input method allows entering
     * 	English characters directly, e.g., when it's used to type accented
     * 	characters with dead keys.
     */
    imcmdline: boolean;
    /**
     * boolean (default off, on for some systems (SGI))
     * 			global
     * 	When set the Input Method is never used.  This is useful to disable
     * 	the IM when it doesn't work properly.
     * 	Currently this option is on by default for SGI/IRIX machines.  This
     * 	may change in later releases.
     */
    imdisable: boolean;
    /**
     * number (default 0)
     * 			local to buffer
     * 	Specifies whether :lmap or an Input Method (IM) is to be used in
     * 	Insert mode.  Valid values:
     * 		0	:lmap is off and IM is off
     * 		1	:lmap is ON and IM is off
     * 		2	:lmap is off and IM is ON
     * 	To always reset the option to zero when leaving Insert mode with <Esc>
     * 	this can be used: >
     * 		:inoremap <ESC> <ESC>:set iminsert=0<CR>
     * <	This makes :lmap and IM turn off automatically when leaving Insert
     * 	mode.
     * 	Note that this option changes when using CTRL-^ in Insert mode
     * 	|i_CTRL-^|.
     * 	The value is set to 1 when setting 'keymap' to a valid keymap name.
     * 	It is also used for the argument of commands like "r" and "f".
     */
    iminsert: number;
    /**
     * number (default -1)
     * 			local to buffer
     * 	Specifies whether :lmap or an Input Method (IM) is to be used when
     * 	entering a search pattern.  Valid values:
     * 		-1	the value of 'iminsert' is used, makes it look like
     * 			'iminsert' is also used when typing a search pattern
     * 		0	:lmap is off and IM is off
     * 		1	:lmap is ON and IM is off
     * 		2	:lmap is off and IM is ON
     * 	Note that this option changes when using CTRL-^ in Command-line mode
     * 	|c_CTRL-^|.
     * 	The value is set to 1 when it is not -1 and setting the 'keymap'
     * 	option to a valid keymap name.
     */
    imsearch: number;
    /**
     * string	(default "")
     * 			global
     */
    inccommand: string;
    /**
     * string	(default "^\s*#\s*include")
     * 			global or local to buffer |global-local|
     * 	Pattern to be used to find an include command.  It is a search
     * 	pattern, just like for the "/" command (See |pattern|).  The default
     * 	value is for C programs.  This option is used for the commands "[i",
     * 	"]I", "[d", etc.
     * 	Normally the 'isfname' option is used to recognize the file name that
     * 	comes after the matched pattern.  But if "\zs" appears in the pattern
     * 	then the text matched from "\zs" to the end, or until "\ze" if it
     * 	appears, is used as the file name.  Use this to include characters
     * 	that are not in 'isfname', such as a space.  You can then use
     * 	'includeexpr' to process the matched text.
     * 	See |option-backslash| about including spaces and backslashes.
     */
    include: string;
    /**
     * string	(default "")
     * 			local to buffer
     * 	Expression to be used to transform the string found with the 'include'
     * 	option to a file name.  Mostly useful to change "." to "/" for Java: >
     * 		:set includeexpr=substitute(v:fname,'\\.','/','g')
     * <	The "v:fname" variable will be set to the file name that was detected.
     */
    includeexpr: string;
    /**
     * boolean	(default on)
     * 			global
     * 	While typing a search command, show where the pattern, as it was typed
     * 	so far, matches.  The matched string is highlighted.  If the pattern
     * 	is invalid or not found, nothing is shown.  The screen will be updated
     * 	often, this is only useful on fast terminals.
     * 	Note that the match will be shown, but the cursor will return to its
     * 	original position when no match is found and when pressing <Esc>.  You
     * 	still need to finish the search command with <Enter> to move the
     * 	cursor to the match.
     * 	You can use the CTRL-G and CTRL-T keys to move to the next and
     * 	previous match. |c_CTRL-G| |c_CTRL-T|
     * 	Vim only searches for about half a second.  With a complicated
     * 	pattern and/or a lot of text the match may not be found.  This is to
     * 	avoid that Vim hangs while you are typing the pattern.
     * 	The |hl-IncSearch| highlight group determines the highlighting.
     * 	When 'hlsearch' is on, all matched strings are highlighted too while
     * 	typing a search command. See also: 'hlsearch'.
     * 	If you don't want to turn 'hlsearch' on, but want to highlight all
     * 	matches while searching, you can turn on and off 'hlsearch' with
     * 	autocmd.  Example: >
     * 		augroup vimrc-incsearch-highlight
     * 		  autocmd!
     * 		  autocmd CmdlineEnter /,\? :set hlsearch
     * 		  autocmd CmdlineLeave /,\? :set nohlsearch
     * 		augroup END
     * <
     * 	CTRL-L can be used to add one character from after the current match
     * 	to the command line.  If 'ignorecase' and 'smartcase' are set and the
     * 	command line has no uppercase characters, the added character is
     * 	converted to lowercase.
     * 	CTRL-R CTRL-W can be used to add the word at the end of the current
     * 	match, excluding the characters that were already typed.
     */
    incsearch: boolean;
    /**
     * string	(default "")
     * 			local to buffer
     * 	Expression which is evaluated to obtain the proper indent for a line.
     * 	It is used when a new line is created, for the |=| operator and
     * 	in Insert mode as specified with the 'indentkeys' option.
     * 	When this option is not empty, it overrules the 'cindent' and
     * 	'smartindent' indenting.  When 'lisp' is set, this option is
     * 	overridden by the Lisp indentation algorithm.
     * 	When 'paste' is set this option is not used for indenting.
     * 	The expression is evaluated with |v:lnum| set to the line number for
     * 	which the indent is to be computed.  The cursor is also in this line
     * 	when the expression is evaluated (but it may be moved around).
     * 	The expression must return the number of spaces worth of indent.  It
     * 	can return "-1" to keep the current indent (this means 'autoindent' is
     * 	used for the indent).
     * 	Functions useful for computing the indent are |indent()|, |cindent()|
     * 	and |lispindent()|.
     * 	The evaluation of the expression must not have side effects!  It must
     * 	not change the text, jump to another window, etc.  Afterwards the
     * 	cursor position is always restored, thus the cursor may be moved.
     * 	Normally this option would be set to call a function: >
     * 		:set indentexpr=GetMyIndent()
     * <	Error messages will be suppressed, unless the 'debug' option contains
     * 	"msg".
     * 	See |indent-expression|.
     */
    indentexpr: string;
    /**
     * string	(default "0{,0},0),0],:,0#,!^F,o,O,e")
     * 			local to buffer
     * 	A list of keys that, when typed in Insert mode, cause reindenting of
     * 	the current line.  Only happens if 'indentexpr' isn't empty.
     * 	The format is identical to 'cinkeys', see |indentkeys-format|.
     * 	See |C-indenting| and |indent-expression|.
     */
    indentkeys: string;
    /**
     * boolean	(default off)
     * 			local to buffer
     * 	When doing keyword completion in insert mode |ins-completion|, and
     * 	'ignorecase' is also on, the case of the match is adjusted depending
     * 	on the typed text.  If the typed text contains a lowercase letter
     * 	where the match has an upper case letter, the completed part is made
     * 	lowercase.  If the typed text has no lowercase letters and the match
     * 	has a lowercase letter where the typed text has an uppercase letter,
     * 	and there is a letter before it, the completed part is made uppercase.
     * 	With 'noinfercase' the match is used as-is.
     */
    infercase: boolean;
    /**
     * boolean	(default off)
     * 			global
     * 	Makes Vim work in a way that Insert mode is the default mode.  Useful
     * 	if you want to use Vim as a modeless editor.
     * 	These Insert mode commands will be useful:
     * 	- Use the cursor keys to move around.
     * 	- Use CTRL-O to execute one Normal mode command |i_CTRL-O|.  When
     * 	  this is a mapping, it is executed as if 'insertmode' was off.
     * 	  Normal mode remains active until the mapping is finished.
     * 	- Use CTRL-L to execute a number of Normal mode commands, then use
     * 	  <Esc> to get back to Insert mode.  Note that CTRL-L moves the cursor
     * 	  left, like <Esc> does when 'insertmode' isn't set.  |i_CTRL-L|
     */
    insertmode: boolean;
    /**
     * string	(default: "@,161-255")
     * 			global
     * 	The characters given by this option are displayed directly on the
     * 	screen.  It is also used for "\p" in a |pattern|.  The characters from
     * 	space (ASCII 32) to '~' (ASCII 126) are always displayed directly,
     * 	even when they are not included in 'isprint' or excluded.  See
     * 	'isfname' for a description of the format of this option.
     */
    isprint: string;
    /**
     * string	(default "")
     * 			global
     * 	List of words that change the behavior of the |jumplist|.
     * 	  stack         Make the jumplist behave like the tagstack or like a
     * 	                web browser.  Relative location of entries in the
     * 			jumplist is preserved at the cost of discarding
     * 			subsequent entries when navigating backwards in the
     * 			jumplist and then jumping to a location.
     * 			|jumplist-stack|
     */
    jumpoptions: string;
    /**
     * boolean	(default on)
     * 			global
     * 	Insert two spaces after a '.', '?' and '!' with a join command.
     * 	Otherwise only one space is inserted.
     */
    joinspaces: boolean;
    /**
     * string	(default "")
     * 			local to buffer
     * 	Name of a keyboard mapping.  See |mbyte-keymap|.
     * 	Setting this option to a valid keymap name has the side effect of
     * 	setting 'iminsert' to one, so that the keymap becomes effective.
     * 	'imsearch' is also set to one, unless it was -1
     * 	Only normal file name characters can be used, "/\*?[|<>" are illegal.
     */
    keymap: string;
    /**
     * string	(default "")
     * 			global
     * 	List of comma separated words, which enable special things that keys
     * 	can do.  These values can be used:
     * 	   startsel	Using a shifted special key starts selection (either
     * 			Select mode or Visual mode, depending on "key" being
     * 			present in 'selectmode').
     * 	   stopsel	Using a not-shifted special key stops selection.
     * 	Special keys in this context are the cursor keys, <End>, <Home>,
     * 	<PageUp> and <PageDown>.
     * 	The 'keymodel' option is set by the |:behave| command.
     */
    keymodel: string;
    /**
     * string	(default ":Man", Windows: ":help")
     * 			global or local to buffer |global-local|
     * 	Program to use for the |K| command.  Environment variables are
     * 	expanded |:set_env|.  ":help" may be used to access the Vim internal
     * 	help.  (Note that previously setting the global option to the empty
     * 	value did this, which is now deprecated.)
     * 	When the first character is ":", the command is invoked as a Vim
     * 	command prefixed with [count].
     * 	When "man" or "man -s" is used, Vim will automatically translate
     * 	a [count] for the "K" command to a section number.
     * 	See |option-backslash| about including spaces and backslashes.
     * 	Example: >
     * 		:set keywordprg=man\ -s
     * 		:set keywordprg=:Man
     * <	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    keywordprg: string;
    /**
     * string	(default "")
     * 			global
     * 	This option allows switching your keyboard into a special language
     * 	mode.  When you are typing text in Insert mode the characters are
     * 	inserted directly.  When in Normal mode the 'langmap' option takes
     * 	care of translating these special characters to the original meaning
     * 	of the key.  This means you don't have to change the keyboard mode to
     * 	be able to execute Normal mode commands.
     * 	This is the opposite of the 'keymap' option, where characters are
     * 	mapped in Insert mode.
     * 	Also consider resetting 'langremap' to avoid 'langmap' applies to
     * 	characters resulting from a mapping.
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    langmap: string;
    /**
     * string	(default "")
     * 			global
     * 	Language to use for menu translation.  Tells which file is loaded
     * 	from the "lang" directory in 'runtimepath': >
     * 		"lang/menu_" . &langmenu . ".vim"
     * <	(without the spaces).  For example, to always use the Dutch menus, no
     * 	matter what $LANG is set to: >
     * 		:set langmenu=nl_NL.ISO_8859-1
     * <	When 'langmenu' is empty, |v:lang| is used.
     * 	Only normal file name characters can be used, "/\*?[|<>" are illegal.
     * 	If your $LANG is set to a non-English language but you do want to use
     * 	the English menus: >
     * 		:set langmenu=none
     * <	This option must be set before loading menus, switching on filetype
     * 	detection or syntax highlighting.  Once the menus are defined setting
     * 	this option has no effect.  But you could do this: >
     * 		:source $VIMRUNTIME/delmenu.vim
     * 		:set langmenu=de_DE.ISO_8859-1
     * 		:source $VIMRUNTIME/menu.vim
     * <	Warning: This deletes all menus that you defined yourself!
     */
    langmenu: string;
    /**
     * boolean (default off)
     * 			global
     * 	When off, setting 'langmap' does not apply to characters resulting from
     * 	a mapping.  If setting 'langmap' disables some of your mappings, make
     * 	sure this option is off.
     */
    langremap: boolean;
    /**
     * number	(default 2)
     * 			global
     * 	The value of this option influences when the last window will have a
     * 	status line:
     * 		0: never
     * 		1: only if there are at least two windows
     * 		2: always
     * 	The screen looks nicer with a status line if you have several
     * 	windows, but it takes another screen line. |status-line|
     */
    laststatus: number;
    /**
     * boolean	(default off)
     * 			global
     * 	When this option is set, the screen will not be redrawn while
     * 	executing macros, registers and other commands that have not been
     * 	typed.  Also, updating the window title is postponed.  To force an
     * 	update use |:redraw|.
     */
    lazyredraw: boolean;
    /**
     * boolean	(default off)
     * 			local to window
     * 	If on, Vim will wrap long lines at a character in 'breakat' rather
     * 	than at the last character that fits on the screen.  Unlike
     * 	'wrapmargin' and 'textwidth', this does not insert <EOL>s in the file,
     * 	it only affects the way the file is displayed, not its contents.
     * 	If 'breakindent' is set, line is visually indented. Then, the value
     * 	of 'showbreak' is used to put in front of wrapped lines. This option
     * 	is not used when the 'wrap' option is off.
     * 	Note that <Tab> characters after an <EOL> are mostly not displayed
     * 	with the right amount of white space.
     */
    linebreak: boolean;
    /**
     * number	(default 24 or terminal height)
     * 			global
     * 	Number of lines of the Vim window.
     * 	Normally you don't need to set this.  It is done automatically by the
     * 	terminal initialization code.
     * 	When Vim is running in the GUI or in a resizable window, setting this
     * 	option will cause the window size to be changed.  When you only want
     * 	to use the size for the GUI, put the command in your |gvimrc| file.
     * 	Vim limits the number of lines to what fits on the screen.  You can
     * 	use this command to get the tallest window possible: >
     * 		:set lines=999
     * <	Minimum value is 2, maximum value is 1000.
     */
    lines: number;
    /**
     * number	(default 0)
     * 			global
     * 			{only in the GUI}
     * 	Number of pixel lines inserted between characters.  Useful if the font
     * 	uses the full character cell height, making lines touch each other.
     * 	When non-zero there is room for underlining.
     * 	With some fonts there can be too much room between lines (to have
     * 	space for ascents and descents).  Then it makes sense to set
     * 	'linespace' to a negative value.  This may cause display problems
     * 	though!
     */
    linespace: number;
    /**
     * boolean	(default off)
     * 			local to buffer
     * 	Lisp mode: When <Enter> is typed in insert mode set the indent for
     * 	the next line to Lisp standards (well, sort of).  Also happens with
     * 	"cc" or "S".  'autoindent' must also be on for this to work.  The 'p'
     * 	flag in 'cpoptions' changes the method of indenting: Vi compatible or
     * 	better.  Also see 'lispwords'.
     * 	The '-' character is included in keyword characters.  Redefines the
     * 	"=" operator to use this same indentation algorithm rather than
     * 	calling an external program if 'equalprg' is empty.
     * 	This option is not used when 'paste' is set.
     */
    lisp: boolean;
    /**
     * string	(default is very long)
     * 			global or local to buffer |global-local|
     * 	Comma separated list of words that influence the Lisp indenting.
     * 	|'lisp'|
     */
    lispwords: string;
    /**
     * boolean	(default off)
     * 			local to window
     * 	List mode: Show tabs as CTRL-I is displayed, display $ after end of
     * 	line.  Useful to see the difference between tabs and spaces and for
     * 	trailing blanks.  Further changed by the 'listchars' option.
     */
    list: boolean;
    /**
     * boolean	(default on)
     * 			global
     * 	When on the plugin scripts are loaded when starting up |load-plugins|.
     * 	This option can be reset in your |vimrc| file to disable the loading
     * 	of plugins.
     * 	Note that using the "-u NONE" and "--noplugin" command line arguments
     * 	reset this option. |-u| |--noplugin|
     */
    loadplugins: boolean;
    /**
     * boolean	(default on)
     * 			global
     * 	Changes the special characters that can be used in search patterns.
     * 	See |pattern|.
     * 	WARNING: Switching this option off most likely breaks plugins!  That
     * 	is because many patterns assume it's on and will fail when it's off.
     * 	Only switch it off when working with old Vi scripts.  In any other
     * 	situation write patterns that work when 'magic' is on.  Include "\M"
     * 	when you want to |/\M|.
     */
    magic: boolean;
    /**
     * string	(default: "")
     * 			global
     * 	Name of the errorfile for the |:make| command (see |:make_makeprg|)
     * 	and the |:grep| command.
     * 	When it is empty, an internally generated temp file will be used.
     * 	When "##" is included, it is replaced by a number to make the name
     * 	unique.  This makes sure that the ":make" command doesn't overwrite an
     * 	existing file.
     * 	NOT used for the ":cf" command.  See 'errorfile' for that.
     * 	Environment variables are expanded |:set_env|.
     * 	See |option-backslash| about including spaces and backslashes.
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    makeef: string;
    /**
     * string	(default "")
     * 			global or local to buffer |global-local|
     * 	Encoding used for reading the output of external commands.  When empty,
     * 	encoding is not converted.
     * 	This is used for `:make`, `:lmake`, `:grep`, `:lgrep`, `:grepadd`,
     * 	`:lgrepadd`, `:cfile`, `:cgetfile`, `:caddfile`, `:lfile`, `:lgetfile`,
     * 	and `:laddfile`.
     */
    makeencoding: string;
    /**
     * string	(default "make")
     * 			global or local to buffer |global-local|
     * 	Program to use for the ":make" command.  See |:make_makeprg|.
     * 	This option may contain '%' and '#' characters (see  |:_%| and |:_#|),
     * 	which are expanded to the current and alternate file name.  Use |::S|
     * 	to escape file names in case they contain special characters.
     * 	Environment variables are expanded |:set_env|.  See |option-backslash|
     * 	about including spaces and backslashes.
     * 	Note that a '|' must be escaped twice: once for ":set" and once for
     * 	the interpretation of a command.  When you use a filter called
     * 	"myfilter" do it like this: >
     * 	    :set makeprg=gmake\ \\\|\ myfilter
     * <	The placeholder "$*" can be given (even multiple times) to specify
     * 	where the arguments will be included, for example: >
     * 	    :set makeprg=latex\ \\\\nonstopmode\ \\\\input\\{$*}
     * <	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    makeprg: string;
    /**
     * string	(default "(:),{:},[:]")
     * 			local to buffer
     * 	Characters that form pairs.  The |%| command jumps from one to the
     * 	other.
     * 	Only character pairs are allowed that are different, thus you cannot
     * 	jump between two double quotes.
     * 	The characters must be separated by a colon.
     * 	The pairs must be separated by a comma.  Example for including '<' and
     * 	'>' (HTML): >
     * 		:set mps+=<:>
     */
    matchpairs: string;
    /**
     * number	(default 5)
     * 			global
     * 	Tenths of a second to show the matching paren, when 'showmatch' is
     * 	set.  Note that this is not in milliseconds, like other options that
     * 	set a time.  This is to be compatible with Nvi.
     */
    matchtime: number;
    /**
     * number	(default 100)
     * 			global
     * 	Maximum depth of function calls for user functions.  This normally
     * 	catches endless recursion.  When using a recursive function with
     * 	more depth, set 'maxfuncdepth' to a bigger number.  But this will use
     * 	more memory, there is the danger of failing when memory is exhausted.
     * 	Increasing this limit above 200 also changes the maximum for Ex
     * 	command recursion, see |E169|.
     * 	See also |:function|.
     */
    maxfuncdepth: number;
    /**
     * number	(default 1000)
     * 			global
     * 	Maximum number of times a mapping is done without resulting in a
     * 	character to be used.  This normally catches endless mappings, like
     * 	":map x y" with ":map y x".  It still does not catch ":map g wg",
     * 	because the 'w' is used before the next mapping is done.  See also
     * 	|key-mapping|.
     */
    maxmapdepth: number;
    /**
     * number	(default 1000)
     * 			global
     * 	Maximum amount of memory (in Kbyte) to use for pattern matching.
     * 	The maximum value is about 2000000.  Use this to work without a limit.
     * 							*E363*
     * 	When Vim runs into the limit it gives an error message and mostly
     * 	behaves like CTRL-C was typed.
     * 	Running into the limit often means that the pattern is very
     * 	inefficient or too complex.  This may already happen with the pattern
     * 	"\(.\)*" on a very long line.  ".*" works much better.
     * 	Might also happen on redraw, when syntax rules try to match a complex
     * 	text structure.
     * 	Vim may run out of memory before hitting the 'maxmempattern' limit, in
     * 	which case you get an "Out of memory" error instead.
     */
    maxmempattern: number;
    /**
     * number	(default 25)
     * 			global
     * 	Maximum number of items to use in a menu.  Used for menus that are
     * 	generated from a list of items, e.g., the Buffers menu.  Changing this
     * 	option has no direct effect, the menu must be refreshed first.
     */
    menuitems: number;
    /**
     * string	(default "460000,2000,500")
     * 			global
     * 	Parameters for |:mkspell|.  This tunes when to start compressing the
     * 	word tree.  Compression can be slow when there are many words, but
     * 	it's needed to avoid running out of memory.  The amount of memory used
     * 	per word depends very much on how similar the words are, that's why
     * 	this tuning is complicated.
     */
    mkspellmem: string;
    /**
     * boolean (default: off)
     * 			global
     * 	When on allow some options that are an expression to be set in the
     * 	modeline.  Check the option for whether it is affected by
     * 	'modelineexpr'.  Also see |modeline|.
     */
    modelineexpr: boolean;
    /**
     * number	(default 5)
     * 			global
     * 	If 'modeline' is on 'modelines' gives the number of lines that is
     * 	checked for set commands.  If 'modeline' is off or 'modelines' is zero
     * 	no lines are checked.  See |modeline|.
     */
    modelines: number;
    /**
     * boolean	(default on)
     * 			local to buffer
     * 	When off the buffer contents cannot be changed.  The 'fileformat' and
     * 	'fileencoding' options also can't be changed.
     * 	Can be reset on startup with the |-M| command line argument.
     */
    modifiable: boolean;
    /**
     * boolean	(default off)
     * 			local to buffer
     * 	When on, the buffer is considered to be modified.  This option is set
     * 	when:
     * 	1. A change was made to the text since it was last written.  Using the
     * 	   |undo| command to go back to the original text will reset the
     * 	   option.  But undoing changes that were made before writing the
     * 	   buffer will set the option again, since the text is different from
     * 	   when it was written.
     * 	2. 'fileformat' or 'fileencoding' is different from its original
     * 	   value.  The original value is set when the buffer is read or
     * 	   written.  A ":set nomodified" command also resets the original
     * 	   values to the current values and the 'modified' option will be
     * 	   reset.
     * 	   Similarly for 'eol' and 'bomb'.
     * 	This option is not set when a change is made to the buffer as the
     * 	result of a BufNewFile, BufRead/BufReadPost, BufWritePost,
     * 	FileAppendPost or VimLeave autocommand event.  See |gzip-example| for
     * 	an explanation.
     * 	When 'buftype' is "nowrite" or "nofile" this option may be set, but
     * 	will be ignored.
     * 	Note that the text may actually be the same, e.g. 'modified' is set
     * 	when using "rA" on an "A".
     */
    modified: boolean;
    /**
     * boolean	(Vim default: on, Vi default: off)
     * 			global
     * 	When on, listings pause when the whole screen is filled.  You will get
     * 	the |more-prompt|.  When this option is off there are no pauses, the
     * 	listing continues until finished.
     */
    more: boolean;
    /**
     * string	(default "")
     * 			global
     */
    mouse: string;
    /**
     * boolean	(default off)
     * 			global
     * 			{only works in the GUI}
     * 	The window that the mouse pointer is on is automatically activated.
     * 	When changing the window layout or window focus in another way, the
     * 	mouse pointer is moved to the window with keyboard focus.  Off is the
     * 	default because it makes using the pull down menus a little goofy, as
     * 	a pointer transit may activate a window unintentionally.
     */
    mousefocus: boolean;
    /**
     * boolean	(default on)
     * 			global
     * 			{only works in the GUI}
     * 	When on, the mouse pointer is hidden when characters are typed.
     * 	The mouse pointer is restored when the mouse is moved.
     */
    mousehide: boolean;
    /**
     * string	(default "extend")
     * 			global
     * 	Sets the model to use for the mouse.  The name mostly specifies what
     * 	the right mouse button is used for:
     * 	   extend	Right mouse button extends a selection.  This works
     * 			like in an xterm.
     * 	   popup	Right mouse button pops up a menu.  The shifted left
     * 			mouse button extends a selection.  This works like
     * 			with Microsoft Windows.
     * 	   popup_setpos Like "popup", but the cursor will be moved to the
     * 			position where the mouse was clicked, and thus the
     * 			selected operation will act upon the clicked object.
     * 			If clicking inside a selection, that selection will
     * 			be acted upon, i.e. no cursor move.  This implies of
     * 			course, that right clicking outside a selection will
     * 			end Visual mode.
     * 	Overview of what button does what for each model:
     * 	mouse		    extend		popup(_setpos) ~
     * 	left click	    place cursor	place cursor
     * 	left drag	    start selection	start selection
     * 	shift-left	    search word		extend selection
     * 	right click	    extend selection	popup menu (place cursor)
     * 	right drag	    extend selection	-
     * 	middle click	    paste		paste
     */
    mousemodel: string;
    /**
     * number	(default 500)
     * 			global
     * 	Defines the maximum time in msec between two mouse clicks for the
     * 	second click to be recognized as a multi click.
     */
    mousetime: number;
    /**
     * string	(default "bin,hex")
     * 			local to buffer
     * 	This defines what bases Vim will consider for numbers when using the
     * 	CTRL-A and CTRL-X commands for adding to and subtracting from a number
     * 	respectively; see |CTRL-A| for more info on these commands.
     * 	alpha	If included, single alphabetical characters will be
     * 		incremented or decremented.  This is useful for a list with a
     * 		letter index a), b), etc.		*octal-nrformats*
     * 	octal	If included, numbers that start with a zero will be considered
     * 		to be octal.  Example: Using CTRL-A on "007" results in "010".
     * 	hex	If included, numbers starting with "0x" or "0X" will be
     * 		considered to be hexadecimal.  Example: Using CTRL-X on
     * 		"0x100" results in "0x0ff".
     * 	bin	If included, numbers starting with "0b" or "0B" will be
     * 		considered to be binary.  Example: Using CTRL-X on
     * 		"0b1000" subtracts one, resulting in "0b0111".
     * 	Numbers which simply begin with a digit in the range 1-9 are always
     * 	considered decimal.  This also happens for numbers that are not
     * 	recognized as octal or hex.
     */
    nrformats: string;
    /**
     * boolean	(default off)
     * 			local to window
     * 	Print the line number in front of each line.  When the 'n' option is
     * 	excluded from 'cpoptions' a wrapped line will not use the column of
     * 	line numbers.
     * 	Use the 'numberwidth' option to adjust the room for the line number.
     * 	When a long, wrapped line doesn't start with the first character, '-'
     * 	characters are put before the number.
     * 	For highlighting see |hl-LineNr|, |hl-CursorLineNr|, and the
     * 	|:sign-define| "numhl" argument.
     * 						*number_relativenumber*
     * 	The 'relativenumber' option changes the displayed number to be
     * 	relative to the cursor.  Together with 'number' there are these
     * 	four combinations (cursor in line 3):
     */
    number: boolean;
    /**
     * number	(Vim default: 4  Vi default: 8)
     * 			local to window
     * 	Minimal number of columns to use for the line number.  Only relevant
     * 	when the 'number' or 'relativenumber' option is set or printing lines
     * 	with a line number. Since one space is always between the number and
     * 	the text, there is one less character for the number itself.
     * 	The value is the minimum width.  A bigger width is used when needed to
     * 	fit the highest line number in the buffer respectively the number of
     * 	rows in the window, depending on whether 'number' or 'relativenumber'
     * 	is set. Thus with the Vim default of 4 there is room for a line number
     * 	up to 999. When the buffer has 1000 lines five columns will be used.
     * 	The minimum value is 1, the maximum value is 20.
     */
    numberwidth: number;
    /**
     * string	(default: empty)
     * 			local to buffer
     * 	This option specifies a function to be used for Insert mode omni
     * 	completion with CTRL-X CTRL-O. |i_CTRL-X_CTRL-O|
     * 	See |complete-functions| for an explanation of how the function is
     * 	invoked and what it should return.
     * 	This option is usually set by a filetype plugin:
     * 	|:filetype-plugin-on|
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    omnifunc: string;
    /**
     * boolean	(default off)
     * 			global
     * 			{only for Windows}
     * 	Enable reading and writing from devices.  This may get Vim stuck on a
     * 	device that can be opened but doesn't actually do the I/O.  Therefore
     * 	it is off by default.
     * 	Note that on Windows editing "aux.h", "lpt1.txt" and the like also
     * 	result in editing a device.
     */
    opendevice: boolean;
    /**
     * string	(default: empty)
     * 			global
     * 	This option specifies a function to be called by the |g@| operator.
     * 	See |:map-operator| for more info and an example.
     */
    operatorfunc: string;
    /**
     * string	(default: see 'runtimepath')
     * 	Directories used to find packages.  See |packages|.
     */
    packpath: string;
    /**
     * string	(default "IPLPPPQPP TPHPLIPpLpItpplpipbp")
     * 			global
     * 	Specifies the nroff macros that separate paragraphs.  These are pairs
     * 	of two letters (see |object-motions|).
     */
    paragraphs: string;
    /**
     * boolean	(default off)
     * 			global
     * 	This option is obsolete; |bracketed-paste-mode| is built-in.
     */
    paste: boolean;
    /**
     * string	(default "")
     * 			global
     * 	When non-empty, specifies the key sequence that toggles the 'paste'
     * 	option.  This is like specifying a mapping: >
     * 	    :map {keys} :set invpaste<CR>
     * <	Where {keys} is the value of 'pastetoggle'.
     * 	The difference is that it will work even when 'paste' is set.
     * 	'pastetoggle' works in Insert mode and Normal mode, but not in
     * 	Command-line mode.
     * 	Mappings are checked first, thus overrule 'pastetoggle'.  However,
     * 	when 'paste' is on mappings are ignored in Insert mode, thus you can do
     * 	this: >
     * 	    :map <F10> :set paste<CR>
     * 	    :map <F11> :set nopaste<CR>
     * 	    :imap <F10> <C-O>:set paste<CR>
     * 	    :imap <F11> <nop>
     * 	    :set pastetoggle=<F11>
     * <	This will make <F10> start paste mode and <F11> stop paste mode.
     * 	Note that typing <F10> in paste mode inserts "<F10>", since in paste
     * 	mode everything is inserted literally, except the 'pastetoggle' key
     * 	sequence.
     * 	No timeout is used, this means that a multi-key 'pastetoggle' can not
     * 	be triggered manually.
     */
    pastetoggle: string;
    /**
     * string	(default "")
     * 			global
     * 	Expression which is evaluated to apply a patch to a file and generate
     * 	the resulting new version of the file.  See |diff-patchexpr|.
     */
    patchexpr: string;
    /**
     * string	(default "")
     * 			global
     * 	When non-empty the oldest version of a file is kept.  This can be used
     * 	to keep the original version of a file if you are changing files in a
     * 	source distribution.  Only the first time that a file is written a
     * 	copy of the original file will be kept.  The name of the copy is the
     * 	name of the original file with the string in the 'patchmode' option
     * 	appended.  This option should start with a dot.  Use a string like
     * 	".orig" or ".org".  'backupdir' must not be empty for this to work
     * 	(Detail: The backup file is renamed to the patchmode file after the
     * 	new file has been successfully written, that's why it must be possible
     * 	to write a backup file).  If there was no file to be backed up, an
     * 	empty file is created.
     * 	When the 'backupskip' pattern matches, a patchmode file is not made.
     * 	Using 'patchmode' for compressed files appends the extension at the
     * 	end (e.g., "file.gz.orig"), thus the resulting name isn't always
     * 	recognized as a compressed file.
     * 	Only normal file name characters can be used, "/\*?[|<>" are illegal.
     */
    patchmode: string;
    /**
     * boolean	(default off)
     * 			local to buffer
     * 	When changing the indent of the current line, preserve as much of the
     * 	indent structure as possible.  Normally the indent is replaced by a
     * 	series of tabs followed by spaces as required (unless |'expandtab'| is
     * 	enabled, in which case only spaces are used).  Enabling this option
     * 	means the indent will preserve as many existing characters as possible
     * 	for indenting, and only add additional tabs or spaces as required.
     * 	'expandtab' does not apply to the preserved white space, a Tab remains
     * 	a Tab.
     * 	NOTE: When using ">>" multiple times the resulting indent is a mix of
     * 	tabs and spaces.  You might not like this.
     * 	Also see 'copyindent'.
     * 	Use |:retab| to clean up white space.
     */
    preserveindent: boolean;
    /**
     * number (default 12)
     * 			global
     * 	Default height for a preview window.  Used for |:ptag| and associated
     * 	commands.  Used for |CTRL-W_}| when no count is given.
     */
    previewheight: number;
    /**
     * boolean (default off)
     * 			local to window
     * 	Identifies the preview window.  Only one window can have this option
     * 	set.  It's normally not set directly, but by using one of the commands
     * 	|:ptag|, |:pedit|, etc.
     */
    previewwindow: boolean;
    /**
     * string	(default empty)
     * 			global
     * 	The name of the printer to be used for |:hardcopy|.
     * 	See |pdev-option|.
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    printdevice: string;
    /**
     * string	(default empty, except for some systems)
     * 			global
     * 	Sets the character encoding used when printing.
     * 	See |penc-option|.
     */
    printencoding: string;
    /**
     * string	(default: see below)
     * 			global
     * 	Expression used to print the PostScript produced with |:hardcopy|.
     * 	See |pexpr-option|.
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    printexpr: string;
    /**
     * string	(default "courier")
     * 			global
     * 	The name of the font that will be used for |:hardcopy|.
     * 	See |pfn-option|.
     */
    printfont: string;
    /**
     * string  (default "%<%f%h%m%=Page %N")
     * 			global
     * 	The format of the header produced in |:hardcopy| output.
     * 	See |pheader-option|.
     */
    printheader: string;
    /**
     * string (default "")
     * 			global
     * 	The CJK character set to be used for CJK output from |:hardcopy|.
     * 	See |pmbcs-option|.
     */
    printmbcharset: string;
    /**
     * string (default "")
     * 			global
     * 	List of font names to be used for CJK output from |:hardcopy|.
     * 	See |pmbfn-option|.
     */
    printmbfont: string;
    /**
     * string (default "")
     * 			global
     * 	List of items that control the format of the output of |:hardcopy|.
     * 	See |popt-option|.
     */
    printoptions: string;
    /**
     * boolean	(default on)
     * 			global
     * 	When on a ":" prompt is used in Ex mode.
     */
    prompt: boolean;
    /**
     * number	(default 0)
     * 			global
     * 	Enables pseudo-transparency for the |popup-menu|. Valid values are in
     * 	the range of 0 for fully opaque popupmenu (disabled) to 100 for fully
     * 	transparent background. Values between 0-30 are typically most useful.
     */
    pumblend: number;
    /**
     * number	(default 0)
     * 			global
     * 	Maximum number of items to show in the popup menu
     * 	(|ins-completion-menu|). Zero means "use available screen space".
     */
    pumheight: number;
    /**
     * number	(default 15)
     * 			global
     * 	Minimum width for the popup menu (|ins-completion-menu|).  If the
     * 	cursor column + 'pumwidth' exceeds screen width, the popup menu is
     * 	nudged to fit on the screen.
     */
    pumwidth: number;
    /**
     * number	(default depends on the build)
     * 			global
     * 	Specifies the python version used for pyx* functions and commands
     * 	|python_x|.  The default value is as follows:
     */
    pyxversion: number;
    /**
     * string	(default "\")
     * 			local to buffer
     * 	The characters that are used to escape quotes in a string.  Used for
     * 	objects like a', a" and a` |a'|.
     * 	When one of the characters in this option is found inside a string,
     * 	the following character will be skipped.  The default value makes the
     * 	text "foo\"bar\\" considered to be one string.
     */
    quoteescape: string;
    /**
     * boolean	(default off)
     * 			local to buffer
     * 	If on, writes fail unless you use a '!'.  Protects you from
     * 	accidentally overwriting a file.  Default on when Vim is started
     * 	in read-only mode ("vim -R") or when the executable is called "view".
     * 	When using ":w!" the 'readonly' option is reset for the current
     * 	buffer, unless the 'Z' flag is in 'cpoptions'.
     * 	When using the ":view" command the 'readonly' option is
     * 	set for the newly edited buffer.
     * 	See 'modifiable' for disallowing changes to the buffer.
     */
    readonly: boolean;
    /**
     * string	(default '')
     * 			global
     * 	Flags to change the way redrawing works, for debugging purposes.
     * 	Most useful with 'writedelay' set to some reasonable value.
     * 	Supports the following flags:
     * 	    compositor	Indicate what redraws come from the compositor
     * 			by briefly flashing the redrawn regions in colors
     * 			indicating the redraw type. These are the highlight
     * 			groups used (and their default colors):
     * 		RedrawDebugNormal   gui=reverse   normal redraw passed through
     * 		RedrawDebugClear    guibg=Yellow  clear event passed through
     * 		RedrawDebugComposed guibg=Green   redraw event modified by the
     * 						  compositor (due to
     * 						  overlapping grids, etc)
     * 		RedrawDebugRecompose guibg=Red    redraw generated by the
     * 						  compositor itself, due to a
     * 						  grid being moved or deleted.
     * 	    nothrottle	Turn off throttling of the message grid. This is an
     * 			optimization that joins many small scrolls to one
     * 			larger scroll when drawing the message area (with
     * 			'display' msgsep flag active).
     * 	    invalid	Enable stricter checking (abort) of inconsistencies
     * 			of the internal screen state. This is mostly
     * 			useful when running nvim inside a debugger (and
     * 			the test suite).
     * 	    nodelta	Send all internally redrawn cells to the UI, even if
     * 	                they are unchanged from the already displayed state.
     */
    redrawdebug: string;
    /**
     * number	(default 2000)
     * 			global
     * 	Time in milliseconds for redrawing the display.  Applies to
     * 	'hlsearch', 'inccommand', |:match| highlighting and syntax
     * 	highlighting.
     * 	When redrawing takes more than this many milliseconds no further
     * 	matches will be highlighted.
     * 	For syntax highlighting the time applies per window.  When over the
     * 	limit syntax highlighting is disabled until |CTRL-L| is used.
     * 	This is used to avoid that Vim hangs when using a very complicated
     * 	pattern.
     */
    redrawtime: number;
    /**
     * number	(default 0)
     * 			global
     * 	This selects the default regexp engine. |two-engines|
     * 	The possible values are:
     * 		0	automatic selection
     * 		1	old engine
     * 		2	NFA engine
     * 	Note that when using the NFA engine and the pattern contains something
     * 	that is not supported the pattern will not match.  This is only useful
     * 	for debugging the regexp engine.
     * 	Using automatic selection enables Vim to switch the engine, if the
     * 	default engine becomes too costly.  E.g., when the NFA engine uses too
     * 	many states.  This should prevent Vim from hanging on a combination of
     * 	a complex pattern with long text.
     */
    regexpengine: number;
    /**
     * boolean	(default off)
     * 			local to window
     * 	Show the line number relative to the line with the cursor in front of
     * 	each line. Relative line numbers help you use the |count| you can
     * 	precede some vertical motion commands (e.g. j k + -) with, without
     * 	having to calculate it yourself. Especially useful in combination with
     * 	other commands (e.g. y d c < > gq gw =).
     * 	When the 'n' option is excluded from 'cpoptions' a wrapped
     * 	line will not use the column of line numbers.
     * 	The 'numberwidth' option can be used to set the room used for the line
     * 	number.
     * 	When a long, wrapped line doesn't start with the first character, '-'
     * 	characters are put before the number.
     * 	See |hl-LineNr|  and |hl-CursorLineNr| for the highlighting used for
     * 	the number.
     */
    relativenumber: boolean;
    /**
     * boolean	(default on)
     * 			global
     * 	Allows for mappings to work recursively.  If you do not want this for
     * 	a single entry, use the :noremap[!] command.
     * 	NOTE: To avoid portability problems with Vim scripts, always keep
     * 	this option at the default "on".  Only switch it off when working with
     * 	old Vi scripts.
     */
    remap: boolean;
    /**
     * number	(default 2)
     * 			global
     * 	Threshold for reporting number of lines changed.  When the number of
     * 	changed lines is more than 'report' a message will be given for most
     * 	":" commands.  If you want it always, set 'report' to 0.
     * 	For the ":substitute" command the number of substitutions is used
     * 	instead of the number of lines.
     */
    report: number;
    /**
     * boolean	(default off)
     * 			global
     * 	Inserting characters in Insert mode will work backwards.  See "typing
     * 	backwards" |ins-reverse|.  This option can be toggled with the CTRL-_
     * 	command in Insert mode, when 'allowrevins' is set.
     * 	This option is reset when 'paste' is set and restored when 'paste' is
     * 	reset.
     */
    revins: boolean;
    /**
     * boolean	(default off)
     * 			local to window
     * 	When on, display orientation becomes right-to-left, i.e., characters
     * 	that are stored in the file appear from the right to the left.
     * 	Using this option, it is possible to edit files for languages that
     * 	are written from the right to the left such as Hebrew and Arabic.
     * 	This option is per window, so it is possible to edit mixed files
     * 	simultaneously, or to view the same file in both ways (this is
     * 	useful whenever you have a mixed text file with both right-to-left
     * 	and left-to-right strings so that both sets are displayed properly
     * 	in different windows).  Also see |rileft.txt|.
     */
    rightleft: boolean;
    /**
     * string	(default "search")
     * 			local to window
     * 	Each word in this option enables the command line editing to work in
     * 	right-to-left mode for a group of commands:
     */
    rightleftcmd: string;
    /**
     * boolean	(default on)
     * 			global
     * 	Show the line and column number of the cursor position, separated by a
     * 	comma.  When there is room, the relative position of the displayed
     * 	text in the file is shown on the far right:
     * 		Top	first line is visible
     * 		Bot	last line is visible
     * 		All	first and last line are visible
     * 		45%	relative position in the file
     * 	If 'rulerformat' is set, it will determine the contents of the ruler.
     * 	Each window has its own ruler.  If a window has a status line, the
     * 	ruler is shown there.  Otherwise it is shown in the last line of the
     * 	screen.  If the statusline is given by 'statusline' (i.e. not empty),
     * 	this option takes precedence over 'ruler' and 'rulerformat'
     * 	If the number of characters displayed is different from the number of
     * 	bytes in the text (e.g., for a TAB or a multi-byte character), both
     * 	the text column (byte number) and the screen column are shown,
     * 	separated with a dash.
     * 	For an empty line "0-1" is shown.
     * 	For an empty buffer the line number will also be zero: "0,0-1".
     * 	This option is reset when 'paste' is set and restored when 'paste' is
     * 	reset.
     * 	If you don't want to see the ruler all the time but want to know where
     * 	you are, use "g CTRL-G" |g_CTRL-G|.
     */
    ruler: boolean;
    /**
     * string	(default empty)
     * 			global
     * 	When this option is not empty, it determines the content of the ruler
     * 	string, as displayed for the 'ruler' option.
     * 	The format of this option is like that of 'statusline'.
     * 	This option cannot be set in a modeline when 'modelineexpr' is off.
     */
    rulerformat: string;
    /**
     * number	(default: half the window height)
     * 			local to window
     * 	Number of lines to scroll with CTRL-U and CTRL-D commands.  Will be
     * 	set to half the number of lines in the window when the window size
     * 	changes.  If you give a count to the CTRL-U or CTRL-D command it will
     * 	be used as the new value for 'scroll'.  Reset to half the window
     * 	height with ":set scroll=0".
     */
    scroll: number;
    /**
     * number	(default: 10000)
     * 			local to buffer
     * 	Maximum number of lines kept beyond the visible screen. Lines at the
     * 	top are deleted if new lines exceed this limit.
     * 	Minimum is 1, maximum is 100000.
     * 	Only in |terminal| buffers.
     */
    scrollback: number;
    /**
     * boolean  (default off)
     * 			local to window
     * 	See also |scroll-binding|.  When this option is set, the current
     * 	window scrolls as other scrollbind windows (windows that also have
     * 	this option set) scroll.  This option is useful for viewing the
     * 	differences between two versions of a file, see 'diff'.
     * 	See |'scrollopt'| for options that determine how this option should be
     * 	interpreted.
     * 	This option is mostly reset when splitting a window to edit another
     * 	file.  This means that ":split | edit file" results in two windows
     * 	with scroll-binding, but ":split file" does not.
     */
    scrollbind: boolean;
    /**
     * number	(default 1)
     * 			global
     * 	Minimal number of lines to scroll when the cursor gets off the
     * 	screen (e.g., with "j").  Not used for scroll commands (e.g., CTRL-E,
     * 	CTRL-D).  Useful if your terminal scrolls very slowly.
     * 	When set to a negative number from -1 to -100 this is used as the
     * 	percentage of the window height.  Thus -50 scrolls half the window
     * 	height.
     */
    scrolljump: number;
    /**
     * number	(default 0)
     * 			global or local to window |global-local|
     * 	Minimal number of screen lines to keep above and below the cursor.
     * 	This will make some context visible around where you are working.  If
     * 	you set it to a very large value (999) the cursor line will always be
     * 	in the middle of the window (except at the start or end of the file or
     * 	when long lines wrap).
     * 	After using the local value, go back the global value with one of
     * 	these two: >
     * 		setlocal scrolloff<
     * 		setlocal scrolloff=-1
     * <	For scrolling horizontally see 'sidescrolloff'.
     */
    scrolloff: number;
    /**
     * string	(default "ver,jump")
     * 			global
     * 	This is a comma-separated list of words that specifies how
     * 	'scrollbind' windows should behave.  'sbo' stands for ScrollBind
     * 	Options.
     * 	The following words are available:
     * 	    ver		Bind vertical scrolling for 'scrollbind' windows
     * 	    hor		Bind horizontal scrolling for 'scrollbind' windows
     * 	    jump	Applies to the offset between two windows for vertical
     * 			scrolling.  This offset is the difference in the first
     * 			displayed line of the bound windows.  When moving
     * 			around in a window, another 'scrollbind' window may
     * 			reach a position before the start or after the end of
     * 			the buffer.  The offset is not changed though, when
     * 			moving back the 'scrollbind' window will try to scroll
     * 			to the desired position when possible.
     * 			When now making that window the current one, two
     * 			things can be done with the relative offset:
     * 			1. When "jump" is not included, the relative offset is
     * 			   adjusted for the scroll position in the new current
     * 			   window.  When going back to the other window, the
     * 			   new relative offset will be used.
     * 			2. When "jump" is included, the other windows are
     * 			   scrolled to keep the same relative offset.  When
     * 			   going back to the other window, it still uses the
     * 			   same relative offset.
     * 	Also see |scroll-binding|.
     * 	When 'diff' mode is active there always is vertical scroll binding,
     * 	even when "ver" isn't there.
     */
    scrollopt: string;
    /**
     * string	(default "SHNHH HUnhsh")
     * 			global
     * 	Specifies the nroff macros that separate sections.  These are pairs of
     * 	two letters (See |object-motions|).  The default makes a section start
     * 	at the nroff macros ".SH", ".NH", ".H", ".HU", ".nh" and ".sh".
     */
    sections: string;
    /**
     * boolean	(default off)
     * 			global
     * 	When on, ":autocmd", shell and write commands are not allowed in
     * 	".nvimrc" and ".exrc" in the current directory and map commands are
     * 	displayed.  Switch it off only if you know that you will not run into
     * 	problems, or when the 'exrc' option is off.  On Unix this option is
     * 	only used if the ".nvimrc" or ".exrc" is not owned by you.  This can be
     * 	dangerous if the systems allows users to do a "chown".  You better set
     * 	'secure' at the end of your |init.vim| then.
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    secure: boolean;
    /**
     * string	(default "inclusive")
     * 			global
     * 	This option defines the behavior of the selection.  It is only used
     * 	in Visual and Select mode.
     * 	Possible values:
     * 	   value	past line     inclusive ~
     * 	   old		   no		yes
     * 	   inclusive	   yes		yes
     * 	   exclusive	   yes		no
     * 	"past line" means that the cursor is allowed to be positioned one
     * 	character past the line.
     * 	"inclusive" means that the last character of the selection is included
     * 	in an operation.  For example, when "x" is used to delete the
     * 	selection.
     * 	When "old" is used and 'virtualedit' allows the cursor to move past
     * 	the end of line the line break still isn't included.
     * 	Note that when "exclusive" is used and selecting from the end
     * 	backwards, you cannot include the last character of a line, when
     * 	starting in Normal mode and 'virtualedit' empty.
     */
    selection: string;
    /**
     * string	(default "")
     * 			global
     * 	This is a comma separated list of words, which specifies when to start
     * 	Select mode instead of Visual mode, when a selection is started.
     * 	Possible values:
     * 	   mouse	when using the mouse
     * 	   key		when using shifted special keys
     * 	   cmd		when using "v", "V" or CTRL-V
     * 	See |Select-mode|.
     * 	The 'selectmode' option is set by the |:behave| command.
     */
    selectmode: string;
    /**
     * string	(default: "")
     * 			global
     * 	When non-empty, overrides the file name used for |shada| (viminfo).
     * 	When equal to "NONE" no shada file will be read or written.
     * 	This option can be set with the |-i| command line flag.  The |--clean|
     * 	command line flag sets it to "NONE".
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    shadafile: string;
    /**
     * string	(default: "-c"; Windows: "/s /c")
     * 			global
     * 	Flag passed to the shell to execute "!" and ":!" commands; e.g.,
     * 	`bash.exe -c ls` or `cmd.exe /s /c "dir"`.  For Windows
     * 	systems, the default is set according to the value of 'shell', to
     * 	reduce the need to set this option by the user.
     * 	On Unix it can have more than one flag.  Each white space separated
     * 	part is passed as an argument to the shell command.
     * 	See |option-backslash| about including spaces and backslashes.
     * 	See |shell-unquoting| which talks about separating this option into
     * 	multiple arguments.
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    shellcmdflag: string;
    /**
     * string	(default ">", "| tee", "|& tee" or "2>&1| tee")
     * 			global
     * 	String to be used to put the output of the ":make" command in the
     * 	error file.  See also |:make_makeprg|.  See |option-backslash| about
     * 	including spaces and backslashes.
     * 	The name of the temporary file can be represented by "%s" if necessary
     * 	(the file name is appended automatically if no %s appears in the value
     * 	of this option).
     * 	For Windows the default is ">".  The output is directly saved in a file
     * 	and not echoed to the screen.
     * 	For Unix the default it "| tee".  The stdout of the compiler is saved
     * 	in a file and echoed to the screen.  If the 'shell' option is "csh" or
     * 	"tcsh" after initializations, the default becomes "|& tee".  If the
     * 	'shell' option is "sh", "ksh", "mksh", "pdksh", "zsh" or "bash" the
     * 	default becomes "2>&1| tee".  This means that stderr is also included.
     * 	Before using the 'shell' option a path is removed, thus "/bin/sh" uses
     * 	"sh".
     * 	The initialization of this option is done after reading the vimrc
     * 	and the other initializations, so that when the 'shell' option is set
     * 	there, the 'shellpipe' option changes automatically, unless it was
     * 	explicitly set before.
     * 	When 'shellpipe' is set to an empty string, no redirection of the
     * 	":make" output will be done.  This is useful if you use a 'makeprg'
     * 	that writes to 'makeef' by itself.  If you want no piping, but do
     * 	want to include the 'makeef', set 'shellpipe' to a single space.
     * 	Don't forget to precede the space with a backslash: ":set sp=\ ".
     * 	In the future pipes may be used for filtering and this option will
     * 	become obsolete (at least for Unix).
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    shellpipe: string;
    /**
     * string	(default ">", ">&" or ">%s 2>&1")
     * 			global
     * 	String to be used to put the output of a filter command in a temporary
     * 	file.  See also |:!|.  See |option-backslash| about including spaces
     * 	and backslashes.
     * 	The name of the temporary file can be represented by "%s" if necessary
     * 	(the file name is appended automatically if no %s appears in the value
     * 	of this option).
     * 	The default is ">".  For Unix, if the 'shell' option is "csh", "tcsh"
     * 	or "zsh" during initializations, the default becomes ">&".  If the
     * 	'shell' option is "sh", "ksh" or "bash" the default becomes
     * 	">%s 2>&1".  This means that stderr is also included.
     * 	For Win32, the Unix checks are done and additionally "cmd" is checked
     * 	for, which makes the default ">%s 2>&1".  Also, the same names with
     * 	".exe" appended are checked for.
     * 	The initialization of this option is done after reading the vimrc
     * 	and the other initializations, so that when the 'shell' option is set
     * 	there, the 'shellredir' option changes automatically unless it was
     * 	explicitly set before.
     * 	In the future pipes may be used for filtering and this option will
     * 	become obsolete (at least for Unix).
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    shellredir: string;
    /**
     * boolean	(default off)
     * 			global
     * 			{only for Windows}
     * 	When set, a forward slash is used when expanding file names.  This is
     * 	useful when a Unix-like shell is used instead of command.com or
     * 	cmd.exe.  Backward slashes can still be typed, but they are changed to
     * 	forward slashes by Vim.
     * 	Note that setting or resetting this option has no effect for some
     * 	existing file names, thus this option needs to be set before opening
     * 	any file for best results.  This might change in the future.
     * 	'shellslash' only works when a backslash can be used as a path
     * 	separator.  To test if this is so use: >
     * 		if exists('+shellslash')
     * <
     * 			*'shelltemp'* *'stmp'* *'noshelltemp'* *'nostmp'*
     */
    shellslash: boolean;
    /**
     * boolean	(Vim default on, Vi default off)
     * 			global
     * 	When on, use temp files for shell commands.  When off use a pipe.
     * 	When using a pipe is not possible temp files are used anyway.
     * 	The advantage of using a pipe is that nobody can read the temp file
     * 	and the 'shell' command does not need to support redirection.
     * 	The advantage of using a temp file is that the file type and encoding
     * 	can be detected.
     * 	The |FilterReadPre|, |FilterReadPost| and |FilterWritePre|,
     * 	|FilterWritePost| autocommands event are not triggered when
     * 	'shelltemp' is off.
     * 	|system()| does not respect this option, it always uses pipes.
     */
    shelltemp: boolean;
    /**
     * string	(default: "")
     * 			global
     * 	When 'shellxquote' is set to "(" then the characters listed in this
     * 	option will be escaped with a '^' character.  This makes it possible
     * 	to execute most external commands with cmd.exe.
     */
    shellxescape: string;
    /**
     * string	(default: "", Windows: "\"")
     * 			global
     * 	Quoting character(s), put around the command passed to the shell, for
     * 	the "!" and ":!" commands.  Includes the redirection.  See
     * 	'shellquote' to exclude the redirection.  It's probably not useful
     * 	to set both options.
     * 	When the value is '(' then ')' is appended. When the value is '"('
     * 	then ')"' is appended.
     * 	When the value is '(' then also see 'shellxescape'.
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    shellxquote: string;
    /**
     * boolean	(default off)
     * 			global
     * 	Round indent to multiple of 'shiftwidth'.  Applies to > and <
     * 	commands.  CTRL-T and CTRL-D in Insert mode always round the indent to
     * 	a multiple of 'shiftwidth' (this is Vi compatible).
     */
    shiftround: boolean;
    /**
     * number	(default 8)
     * 			local to buffer
     * 	Number of spaces to use for each step of (auto)indent.  Used for
     * 	|'cindent'|, |>>|, |<<|, etc.
     * 	When zero the 'ts' value will be used.  Use the |shiftwidth()|
     * 	function to get the effective shiftwidth value.
     */
    shiftwidth: number;
    /**
     * string	(Vim default "filnxtToOF", Vi default: "S")
     * 			global
     * 	This option helps to avoid all the |hit-enter| prompts caused by file
     * 	messages, for example  with CTRL-G, and to avoid some other messages.
     * 	It is a list of flags:
     * 	 flag	meaning when present	~
     * 	  f	use "(3 of 5)" instead of "(file 3 of 5)"
     * 	  i	use "[noeol]" instead of "[Incomplete last line]"
     * 	  l	use "999L, 888C" instead of "999 lines, 888 characters"
     * 	  m	use "[+]" instead of "[Modified]"
     * 	  n	use "[New]" instead of "[New File]"
     * 	  r	use "[RO]" instead of "[readonly]"
     * 	  w	use "[w]" instead of "written" for file write message
     * 		and "[a]" instead of "appended" for ':w >> file' command
     * 	  x	use "[dos]" instead of "[dos format]", "[unix]" instead of
     * 		"[unix format]" and "[mac]" instead of "[mac format]".
     * 	  a	all of the above abbreviations
     */
    shortmess: string;
    /**
     * string	(default "")
     * 			global
     * 	String to put at the start of lines that have been wrapped.  Useful
     * 	values are "> " or "+++ ": >
     * 		:set showbreak=>\
     * <	Note the backslash to escape the trailing space.  It's easier like
     * 	this: >
     * 		:let &showbreak = '+++ '
     * <	Only printable single-cell characters are allowed, excluding <Tab> and
     * 	comma (in a future version the comma might be used to separate the
     * 	part that is shown at the end and at the start of a line).
     * 	The |hl-NonText| highlight group determines the highlighting.
     * 	Note that tabs after the showbreak will be displayed differently.
     * 	If you want the 'showbreak' to appear in between line numbers, add the
     * 	"n" flag to 'cpoptions'.
     */
    showbreak: string;
    /**
     * boolean	(Vim default: on, Vi default: off)
     * 			global
     * 	Show (partial) command in the last line of the screen.  Set this
     * 	option off if your terminal is slow.
     * 	In Visual mode the size of the selected area is shown:
     * 	- When selecting characters within a line, the number of characters.
     * 	  If the number of bytes is different it is also displayed: "2-6"
     * 	  means two characters and six bytes.
     * 	- When selecting more than one line, the number of lines.
     * 	- When selecting a block, the size in screen characters:
     * 	  {lines}x{columns}.
     */
    showcmd: boolean;
    /**
     * boolean (default off)
     * 			global
     * 	When completing a word in insert mode (see |ins-completion|) from the
     * 	tags file, show both the tag name and a tidied-up form of the search
     * 	pattern (if there is one) as possible matches.  Thus, if you have
     * 	matched a C function, you can see a template for what arguments are
     * 	required (coding style permitting).
     * 	Note that this doesn't work well together with having "longest" in
     * 	'completeopt', because the completion from the search pattern may not
     * 	match the typed text.
     */
    showfulltag: boolean;
    /**
     * boolean	(default off)
     * 			global
     * 	When a bracket is inserted, briefly jump to the matching one.  The
     * 	jump is only done if the match can be seen on the screen.  The time to
     * 	show the match can be set with 'matchtime'.
     * 	A Beep is given if there is no match (no matter if the match can be
     * 	seen or not).
     * 	This option is reset when 'paste' is set and restored when 'paste' is
     * 	reset.
     * 	When the 'm' flag is not included in 'cpoptions', typing a character
     * 	will immediately move the cursor back to where it belongs.
     * 	See the "sm" field in 'guicursor' for setting the cursor shape and
     * 	blinking when showing the match.
     * 	The 'matchpairs' option can be used to specify the characters to show
     * 	matches for.  'rightleft' and 'revins' are used to look for opposite
     * 	matches.
     * 	Also see the matchparen plugin for highlighting the match when moving
     * 	around |pi_paren.txt|.
     * 	Note: Use of the short form is rated PG.
     */
    showmatch: boolean;
    /**
     * boolean	(Vim default: on, Vi default: off)
     * 			global
     * 	If in Insert, Replace or Visual mode put a message on the last line.
     * 	The |hl-ModeMsg| highlight group determines the highlighting.
     */
    showmode: boolean;
    /**
     * number	(default 1)
     * 			global
     * 	The value of this option specifies when the line with tab page labels
     * 	will be displayed:
     * 		0: never
     * 		1: only if there are at least two tab pages
     * 		2: always
     * 	This is both for the GUI and non-GUI implementation of the tab pages
     * 	line.
     * 	See |tab-page| for more information about tab pages.
     */
    showtabline: number;
    /**
     * number	(default 1)
     * 			global
     * 	The minimal number of columns to scroll horizontally.  Used only when
     * 	the 'wrap' option is off and the cursor is moved off of the screen.
     * 	When it is zero the cursor will be put in the middle of the screen.
     * 	When using a slow terminal set it to a large number or 0.  Not used
     * 	for "zh" and "zl" commands.
     */
    sidescroll: number;
    /**
     * number (default 0)
     * 			global or local to window |global-local|
     * 	The minimal number of screen columns to keep to the left and to the
     * 	right of the cursor if 'nowrap' is set.  Setting this option to a
     * 	value greater than 0 while having |'sidescroll'| also at a non-zero
     * 	value makes some context visible in the line you are scrolling in
     * 	horizontally (except at beginning of the line).  Setting this option
     * 	to a large value (like 999) has the effect of keeping the cursor
     * 	horizontally centered in the window, as long as one does not come too
     * 	close to the beginning of the line.
     * 	After using the local value, go back the global value with one of
     * 	these two: >
     * 		setlocal sidescrolloff<
     * 		setlocal sidescrolloff=-1
     * <
     * 	Example: Try this together with 'sidescroll' and 'listchars' as
     * 		 in the following example to never allow the cursor to move
     * 		 onto the "extends" character: >
     */
    sidescrolloff: number;
    /**
     * string	(default "auto")
     * 			local to window
     * 	When and how to draw the signcolumn. Valid values are:
     * 	   "auto"   	only when there is a sign to display
     * 	   "auto:[1-9]" resize to accommodate multiple signs up to the
     * 	                given number (maximum 9), e.g. "auto:4"
     * 	   "no"	    	never
     * 	   "yes"    	always
     * 	   "yes:[1-9]"  always, with fixed space for signs up to the given
     * 	                number (maximum 9), e.g. "yes:3"
     */
    signcolumn: string;
    /**
     * boolean	(default off)
     * 			global
     * 	Override the 'ignorecase' option if the search pattern contains upper
     * 	case characters.  Only used when the search pattern is typed and
     * 	'ignorecase' option is on.  Used for the commands "/", "?", "n", "N",
     * 	":g" and ":s".  Not used for "*", "#", "gd", tag search, etc.  After
     * 	"*" and "#" you can make 'smartcase' used by doing a "/" command,
     * 	recalling the search pattern from history and hitting <Enter>.
     */
    smartcase: boolean;
    /**
     * boolean	(default off)
     * 			local to buffer
     * 	Do smart autoindenting when starting a new line.  Works for C-like
     * 	programs, but can also be used for other languages.  'cindent' does
     * 	something like this, works better in most cases, but is more strict,
     * 	see |C-indenting|.  When 'cindent' is on or 'indentexpr' is set,
     * 	setting 'si' has no effect.  'indentexpr' is a more advanced
     * 	alternative.
     * 	Normally 'autoindent' should also be on when using 'smartindent'.
     * 	An indent is automatically inserted:
     * 	- After a line ending in '{'.
     * 	- After a line starting with a keyword from 'cinwords'.
     * 	- Before a line starting with '}' (only with the "O" command).
     * 	When typing '}' as the first character in a new line, that line is
     * 	given the same indent as the matching '{'.
     * 	When typing '#' as the first character in a new line, the indent for
     * 	that line is removed, the '#' is put in the first column.  The indent
     * 	is restored for the next line.  If you don't want this, use this
     * 	mapping: ":inoremap # X^H#", where ^H is entered with CTRL-V CTRL-H.
     * 	When using the ">>" command, lines starting with '#' are not shifted
     * 	right.
     * 	This option is reset when 'paste' is set and restored when 'paste' is
     * 	reset.
     */
    smartindent: boolean;
    /**
     * boolean	(default on)
     * 			global
     * 	When on, a <Tab> in front of a line inserts blanks according to
     * 	'shiftwidth'.  'tabstop' or 'softtabstop' is used in other places.  A
     * 	<BS> will delete a 'shiftwidth' worth of space at the start of the
     * 	line.
     * 	When off, a <Tab> always inserts blanks according to 'tabstop' or
     * 	'softtabstop'.  'shiftwidth' is only used for shifting text left or
     * 	right |shift-left-right|.
     * 	What gets inserted (a <Tab> or spaces) depends on the 'expandtab'
     * 	option.  Also see |ins-expandtab|.  When 'expandtab' is not set, the
     * 	number of spaces is minimized by using <Tab>s.
     * 	This option is reset when 'paste' is set and restored when 'paste' is
     * 	reset.
     */
    smarttab: boolean;
    /**
     * number	(default 0)
     * 			local to buffer
     * 	Number of spaces that a <Tab> counts for while performing editing
     * 	operations, like inserting a <Tab> or using <BS>.  It "feels" like
     * 	<Tab>s are being inserted, while in fact a mix of spaces and <Tab>s is
     * 	used.  This is useful to keep the 'ts' setting at its standard value
     * 	of 8, while being able to edit like it is set to 'sts'.  However,
     * 	commands like "x" still work on the actual characters.
     * 	When 'sts' is zero, this feature is off.
     * 	When 'sts' is negative, the value of 'shiftwidth' is used.
     * 	'softtabstop' is set to 0 when the 'paste' option is set and restored
     * 	when 'paste' is reset.
     * 	See also |ins-expandtab|.  When 'expandtab' is not set, the number of
     * 	spaces is minimized by using <Tab>s.
     * 	The 'L' flag in 'cpoptions' changes how tabs are used when 'list' is
     * 	set.
     */
    softtabstop: number;
    /**
     * boolean	(default off)
     * 			local to window
     * 	When on spell checking will be done.  See |spell|.
     * 	The languages are specified with 'spelllang'.
     */
    spell: boolean;
    /**
     * string	(default "[.?!]\_[\])'" \t]\+")
     * 			local to buffer
     * 	Pattern to locate the end of a sentence.  The following word will be
     * 	checked to start with a capital letter.  If not then it is highlighted
     * 	with SpellCap |hl-SpellCap| (unless the word is also badly spelled).
     * 	When this check is not wanted make this option empty.
     * 	Only used when 'spell' is set.
     * 	Be careful with special characters, see |option-backslash| about
     * 	including spaces and backslashes.
     * 	To set this option automatically depending on the language, see
     * 	|set-spc-auto|.
     */
    spellcapcheck: string;
    /**
     * string	(default empty)
     * 			local to buffer
     * 	Name of the word list file where words are added for the |zg| and |zw|
     * 	commands.  It must end in ".{encoding}.add".  You need to include the
     * 	path, otherwise the file is placed in the current directory.
     * 								*E765*
     * 	It may also be a comma separated list of names.  A count before the
     * 	|zg| and |zw| commands can be used to access each.  This allows using
     * 	a personal word list file and a project word list file.
     * 	When a word is added while this option is empty Vim will set it for
     * 	you: Using the first directory in 'runtimepath' that is writable.  If
     * 	there is no "spell" directory yet it will be created.  For the file
     * 	name the first language name that appears in 'spelllang' is used,
     * 	ignoring the region.
     * 	The resulting ".spl" file will be used for spell checking, it does not
     * 	have to appear in 'spelllang'.
     * 	Normally one file is used for all regions, but you can add the region
     * 	name if you want to.  However, it will then only be used when
     * 	'spellfile' is set to it, for entries in 'spelllang' only files
     * 	without region name will be found.
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    spellfile: string;
    /**
     * string	(default "en")
     * 			local to buffer
     * 	A comma separated list of word list names.  When the 'spell' option is
     * 	on spellchecking will be done for these languages.  Example: >
     * 		set spelllang=en_us,nl,medical
     * <	This means US English, Dutch and medical words are recognized.  Words
     * 	that are not recognized will be highlighted.
     * 	The word list name must consist of alphanumeric characters, a dash or
     * 	an underscore.  It should not include a comma or dot.  Using a dash is
     * 	recommended to separate the two letter language name from a
     * 	specification.  Thus "en-rare" is used for rare English words.
     * 	A region name must come last and have the form "_xx", where "xx" is
     * 	the two-letter, lower case region name.  You can use more than one
     * 	region by listing them: "en_us,en_ca" supports both US and Canadian
     * 	English, but not words specific for Australia, New Zealand or Great
     * 	Britain. (Note: currently en_au and en_nz dictionaries are older than
     * 	en_ca, en_gb and en_us).
     * 	If the name "cjk" is included East Asian characters are excluded from
     * 	spell checking.  This is useful when editing text that also has Asian
     * 	words.
     * 							*E757*
     * 	As a special case the name of a .spl file can be given as-is.  The
     * 	first "_xx" in the name is removed and used as the region name
     * 	(_xx is an underscore, two letters and followed by a non-letter).
     * 	This is mainly for testing purposes.  You must make sure the correct
     * 	encoding is used, Vim doesn't check it.
     * 	How the related spell files are found is explained here: |spell-load|.
     */
    spelllang: string;
    /**
     * string	(default "best")
     * 			global
     * 	Methods used for spelling suggestions.  Both for the |z=| command and
     * 	the |spellsuggest()| function.  This is a comma-separated list of
     * 	items:
     */
    spellsuggest: string;
    /**
     * boolean	(default off)
     * 			global
     * 	When on, splitting a window will put the new window below the current
     * 	one. |:split|
     */
    splitbelow: boolean;
    /**
     * boolean	(default off)
     * 			global
     * 	When on, splitting a window will put the new window right of the
     * 	current one. |:vsplit|
     */
    splitright: boolean;
    /**
     * boolean	(default off)
     * 			global
     * 	When "on" the commands listed below move the cursor to the first
     * 	non-blank of the line.  When off the cursor is kept in the same column
     * 	(if possible).  This applies to the commands: CTRL-D, CTRL-U, CTRL-B,
     * 	CTRL-F, "G", "H", "M", "L", gg, and to the commands "d", "<<" and ">>"
     * 	with a linewise operator, with "%" with a count and to buffer changing
     * 	commands (CTRL-^, :bnext, :bNext, etc.).  Also for an Ex command that
     * 	only has a line number, e.g., ":25" or ":+".
     * 	In case of buffer changing commands the cursor is placed at the column
     * 	where it was the last time the buffer was edited.
     */
    startofline: boolean;
    /**
     * string	(default empty)
     * 			global or local to window |global-local|
     * 	When nonempty, this option determines the content of the status line.
     * 	Also see |status-line|.
     */
    statusline: string;
    /**
     * string	(default ".bak,~,.o,.h,.info,.swp,.obj")
     * 			global
     * 	Files with these suffixes get a lower priority when multiple files
     * 	match a wildcard.  See |suffixes|.  Commas can be used to separate the
     * 	suffixes.  Spaces after the comma are ignored.  A dot is also seen as
     * 	the start of a suffix.  To avoid a dot or comma being recognized as a
     * 	separator, precede it with a backslash (see |option-backslash| about
     * 	including spaces and backslashes).
     * 	See 'wildignore' for completely ignoring files.
     * 	The use of |:set+=| and |:set-=| is preferred when adding or removing
     * 	suffixes from the list.  This avoids problems when a future version
     * 	uses another default.
     */
    suffixes: string;
    /**
     * string	(default "")
     * 			local to buffer
     * 	Comma separated list of suffixes, which are used when searching for a
     * 	file for the "gf", "[I", etc. commands.  Example: >
     * 		:set suffixesadd=.java
     * <
     * 				*'swapfile'* *'swf'* *'noswapfile'* *'noswf'*
     */
    suffixesadd: string;
    /**
     * boolean (default on)
     * 			local to buffer
     * 	Use a swapfile for the buffer.  This option can be reset when a
     * 	swapfile is not wanted for a specific buffer.  For example, with
     * 	confidential information that even root must not be able to access.
     * 	Careful: All text will be in memory:
     * 		- Don't use this for big files.
     * 		- Recovery will be impossible!
     * 	A swapfile will only be present when |'updatecount'| is non-zero and
     * 	'swapfile' is set.
     * 	When 'swapfile' is reset, the swap file for the current buffer is
     * 	immediately deleted.  When 'swapfile' is set, and 'updatecount' is
     * 	non-zero, a swap file is immediately created.
     * 	Also see |swap-file|.
     * 	If you want to open a new buffer without creating a swap file for it,
     * 	use the |:noswapfile| modifier.
     * 	See 'directory' for where the swap file is created.
     */
    swapfile: boolean;
    /**
     * string	(default "")
     * 			global
     * 	This option controls the behavior when switching between buffers.
     * 	Possible values (comma separated list):
     * 	   useopen	If included, jump to the first open window that
     * 			contains the specified buffer (if there is one).
     * 			Otherwise: Do not examine other windows.
     * 			This setting is checked with |quickfix| commands, when
     * 			jumping to errors (":cc", ":cn", "cp", etc.).  It is
     * 			also used in all buffer related split commands, for
     * 			example ":sbuffer", ":sbnext", or ":sbrewind".
     * 	   usetab	Like "useopen", but also consider windows in other tab
     * 			pages.
     * 	   split	If included, split the current window before loading
     * 			a buffer for a |quickfix| command that display errors.
     * 			Otherwise: do not split, use current window (when used
     * 			in the quickfix window: the previously used window or
     * 			split if there is no other window).
     * 	   vsplit	Just like "split" but split vertically.
     * 	   newtab	Like "split", but open a new tab page.  Overrules
     * 			"split" when both are present.
     * 	   uselast	If included, jump to the previously used window when
     * 			jumping to errors with |quickfix| commands.
     */
    switchbuf: string;
    /**
     * number	(default 3000)
     * 			local to buffer
     * 	Maximum column in which to search for syntax items.  In long lines the
     * 	text after this column is not highlighted and following lines may not
     * 	be highlighted correctly, because the syntax state is cleared.
     * 	This helps to avoid very slow redrawing for an XML file that is one
     * 	long line.
     * 	Set to zero to remove the limit.
     */
    synmaxcol: number;
    /**
     * string	(default empty)
     * 			local to buffer
     * 	When this option is set, the syntax with this name is loaded, unless
     * 	syntax highlighting has been switched off with ":syntax off".
     * 	Otherwise this option does not always reflect the current syntax (the
     * 	b:current_syntax variable does).
     * 	This option is most useful in a modeline, for a file which syntax is
     * 	not automatically recognized.  Example, in an IDL file:
     * 		/* vim: set syntax=idl : *\/ ~
     * 	When a dot appears in the value then this separates two filetype
     * 	names.  Example:
     * 		/* vim: set syntax=c.doxygen : *\/ ~
     * 	This will use the "c" syntax first, then the "doxygen" syntax.
     * 	Note that the second one must be prepared to be loaded as an addition,
     * 	otherwise it will be skipped.  More than one dot may appear.
     * 	To switch off syntax highlighting for the current file, use: >
     * 		:set syntax=OFF
     * <	To switch syntax highlighting on according to the current value of the
     * 	'filetype' option: >
     * 		:set syntax=ON
     * <	What actually happens when setting the 'syntax' option is that the
     * 	Syntax autocommand event is triggered with the value as argument.
     * 	This option is not copied to another buffer, independent of the 's' or
     * 	'S' flag in 'cpoptions'.
     * 	Only normal file name characters can be used, "/\*?[|<>" are illegal.
     */
    syntax: string;
    /**
     * string	(default empty)
     * 			global
     * 	When nonempty, this option determines the content of the tab pages
     * 	line at the top of the Vim window.  When empty Vim will use a default
     * 	tab pages line.  See |setting-tabline| for more info.
     */
    tabline: string;
    /**
     * number	(default 50)
     * 			global
     * 	Maximum number of tab pages to be opened by the |-p| command line
     * 	argument or the ":tab all" command. |tabpage|
     */
    tabpagemax: number;
    /**
     * number	(default 8)
     * 			local to buffer
     * 	Number of spaces that a <Tab> in the file counts for.  Also see
     * 	|:retab| command, and 'softtabstop' option.
     */
    tabstop: number;
    /**
     * boolean	(default on)
     * 			global
     * 	When searching for a tag (e.g., for the |:ta| command), Vim can either
     * 	use a binary search or a linear search in a tags file.  Binary
     * 	searching makes searching for a tag a LOT faster, but a linear search
     * 	will find more tags if the tags file wasn't properly sorted.
     * 	Vim normally assumes that your tags files are sorted, or indicate that
     * 	they are not sorted.  Only when this is not the case does the
     * 	'tagbsearch' option need to be switched off.
     */
    tagbsearch: boolean;
    /**
     * string	(default "followic")
     * 			global or local to buffer |global-local|
     * 	This option specifies how case is handled when searching the tags
     * 	file:
     * 	   followic	Follow the 'ignorecase' option
     * 	   followscs    Follow the 'smartcase' and 'ignorecase' options
     * 	   ignore	Ignore case
     * 	   match	Match case
     * 	   smart	Ignore case unless an upper case letter is used
     */
    tagcase: string;
    /**
     * string	(default: empty)
     * 			local to buffer
     * 	This option specifies a function to be used to perform tag searches.
     * 	The function gets the tag pattern and should return a List of matching
     * 	tags.  See |tag-function| for an explanation of how to write the
     * 	function and an example.
     */
    tagfunc: string;
    /**
     * number	(default 0)
     * 			global
     * 	If non-zero, tags are significant up to this number of characters.
     */
    taglength: number;
    /**
     * boolean	(Vim default: on, Vi default: off)
     * 			global
     * 	If on and using a tags file in another directory, file names in that
     * 	tags file are relative to the directory where the tags file is.
     */
    tagrelative: boolean;
    /**
     * string	(default "./tags;,tags")
     * 			global or local to buffer |global-local|
     * 	Filenames for the tag command, separated by spaces or commas.  To
     * 	include a space or comma in a file name, precede it with a backslash
     * 	(see |option-backslash| about including spaces and backslashes).
     * 	When a file name starts with "./", the '.' is replaced with the path
     * 	of the current file.  But only when the 'd' flag is not included in
     * 	'cpoptions'.  Environment variables are expanded |:set_env|.  Also see
     * 	|tags-option|.
     * 	"*", "**" and other wildcards can be used to search for tags files in
     * 	a directory tree.  See |file-searching|.  E.g., "/lib/**\/tags" will
     * 	find all files named "tags" below "/lib".  The filename itself cannot
     * 	contain wildcards, it is used as-is.  E.g., "/lib/**\/tags?" will find
     * 	files called "tags?".
     * 	The |tagfiles()| function can be used to get a list of the file names
     * 	actually used.
     * 	The use of |:set+=| and |:set-=| is preferred when adding or removing
     * 	file names from the list.  This avoids problems when a future version
     * 	uses another default.
     */
    tags: string;
    /**
     * boolean	(default on)
     * 			global
     * 	When on, the |tagstack| is used normally.  When off, a ":tag" or
     * 	":tselect" command with an argument will not push the tag onto the
     * 	tagstack.  A following ":tag" without an argument, a ":pop" command or
     * 	any other command that uses the tagstack will use the unmodified
     * 	tagstack, but does change the pointer to the active entry.
     * 	Resetting this option is useful when using a ":tag" command in a
     * 	mapping which should not change the tagstack.
     */
    tagstack: boolean;
    /**
     * boolean (default off)
     * 			global
     * 	The terminal is in charge of Bi-directionality of text (as specified
     * 	by Unicode).  The terminal is also expected to do the required shaping
     * 	that some languages (such as Arabic) require.
     * 	Setting this option implies that 'rightleft' will not be set when
     * 	'arabic' is set and the value of 'arabicshape' will be ignored.
     * 	Note that setting 'termbidi' has the immediate effect that
     * 	'arabicshape' is ignored, but 'rightleft' isn't changed automatically.
     * 	For further details see |arabic.txt|.
     */
    termbidi: boolean;
    /**
     * boolean (default off)
     * 			global
     * 	Enables 24-bit RGB color in the |TUI|.  Uses "gui" |:highlight|
     * 	attributes instead of "cterm" attributes. |highlight-guifg|
     * 	Requires an ISO-8613-3 compatible terminal.
     */
    termguicolors: boolean;
    /**
     * boolean	(default off)
     * 			global
     * 	When set: Add 's' flag to 'shortmess' option (this makes the message
     * 	for a search that hits the start or end of the file not being
     * 	displayed).  When reset: Remove 's' flag from 'shortmess' option.
     */
    terse: boolean;
    /**
     * number	(default 0)
     * 			local to buffer
     * 	Maximum width of text that is being inserted.  A longer line will be
     * 	broken after white space to get this width.  A zero value disables
     * 	this.
     * 	'textwidth' is set to 0 when the 'paste' option is set and restored
     * 	when 'paste' is reset.
     * 	When 'textwidth' is zero, 'wrapmargin' may be used.  See also
     * 	'formatoptions' and |ins-textwidth|.
     * 	When 'formatexpr' is set it will be used to break the line.
     */
    textwidth: number;
    /**
     * string	(default "")
     * 			global or local to buffer |global-local|
     * 	List of file names, separated by commas, that are used to lookup words
     * 	for thesaurus completion commands |i_CTRL-X_CTRL-T|.
     */
    thesaurus: string;
    /**
     * boolean	(default off)
     * 			global
     * 	When on: The tilde command "~" behaves like an operator.
     */
    tildeop: boolean;
    /**
     * boolean (default on)
     * 			global
     * 	This option and 'timeoutlen' determine the behavior when part of a
     * 	mapped key sequence has been received. For example, if <c-f> is
     * 	pressed and 'timeout' is set, Nvim will wait 'timeoutlen' milliseconds
     * 	for any key that can follow <c-f> in a mapping.
     */
    timeout: boolean;
    /**
     * boolean (default on)
     * 			global
     * 	This option and 'ttimeoutlen' determine the behavior when part of a
     * 	key code sequence has been received by the |TUI|.
     */
    ttimeout: boolean;
    /**
     * number	(default 1000)
     * 			global
     * 	Time in milliseconds to wait for a mapped sequence to complete.
     */
    timeoutlen: number;
    /**
     * number	(default 50)
     * 			global
     * 	Time in milliseconds to wait for a key code sequence to complete. Also
     * 	used for CTRL-\ CTRL-N and CTRL-\ CTRL-G when part of a command has
     * 	been typed.
     */
    ttimeoutlen: number;
    /**
     * boolean	(default off)
     * 			global
     * 	When on, the title of the window will be set to the value of
     * 	'titlestring' (if it is not empty), or to:
     * 		filename [+=-] (path) - NVIM
     * 	Where:
     * 		filename	the name of the file being edited
     * 		-		indicates the file cannot be modified, 'ma' off
     * 		+		indicates the file was modified
     * 		=		indicates the file is read-only
     * 		=+		indicates the file is read-only and modified
     * 		(path)		is the path of the file being edited
     * 		- NVIM		the server name |v:servername| or "NVIM"
     */
    title: boolean;
    /**
     * number	(default 85)
     * 			global
     * 	Gives the percentage of 'columns' to use for the length of the window
     * 	title.  When the title is longer, only the end of the path name is
     * 	shown.  A '<' character before the path name is used to indicate this.
     * 	Using a percentage makes this adapt to the width of the window.  But
     * 	it won't work perfectly, because the actual number of characters
     * 	available also depends on the font used and other things in the title
     * 	bar.  When 'titlelen' is zero the full path is used.  Otherwise,
     * 	values from 1 to 30000 percent can be used.
     * 	'titlelen' is also used for the 'titlestring' option.
     */
    titlelen: number;
    /**
     * string	(default "")
     * 			global
     * 	If not empty, this option will be used to set the window title when
     * 	exiting.  Only if 'title' is enabled.
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     * 						*'titlestring'*
     */
    titleold: string;
    /**
     * string	(default "")
     * 			global
     * 	When this option is not empty, it will be used for the title of the
     * 	window.  This happens only when the 'title' option is on.
     */
    titlestring: string;
    /**
     * string	(default "$XDG_DATA_HOME/nvim/undo")
     * 			global
     * 	List of directory names for undo files, separated with commas.
     * 	See |'backupdir'| for details of the format.
     * 	"." means using the directory of the file.  The undo file name for
     * 	"file.txt" is ".file.txt.un~".
     * 	For other directories the file name is the full path of the edited
     * 	file, with path separators replaced with "%".
     * 	When writing: The first directory that exists is used.  "." always
     * 	works, no directories after "." will be used for writing.  If none of
     * 	the directories exist Neovim will attempt to create last directory in
     * 	the list.
     * 	When reading all entries are tried to find an undo file.  The first
     * 	undo file that exists is used.  When it cannot be read an error is
     * 	given, no further entry is used.
     * 	See |undo-persistence|.
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    undodir: string;
    /**
     * boolean	(default off)
     * 			local to buffer
     * 	When on, Vim automatically saves undo history to an undo file when
     * 	writing a buffer to a file, and restores undo history from the same
     * 	file on buffer read.
     * 	The directory where the undo file is stored is specified by 'undodir'.
     * 	For more information about this feature see |undo-persistence|.
     * 	The undo file is not read when 'undoreload' causes the buffer from
     * 	before a reload to be saved for undo.
     * 	When 'undofile' is turned off the undo file is NOT deleted.
     */
    undofile: boolean;
    /**
     * number	(default 1000)
     * 			global or local to buffer |global-local|
     * 	Maximum number of changes that can be undone.  Since undo information
     * 	is kept in memory, higher numbers will cause more memory to be used
     * 	(nevertheless, a single change can use an unlimited amount of memory).
     * 	Set to 0 for Vi compatibility: One level of undo and "u" undoes
     * 	itself: >
     * 		set ul=0
     * <	But you can also get Vi compatibility by including the 'u' flag in
     * 	'cpoptions', and still be able to use CTRL-R to repeat undo.
     * 	Also see |undo-two-ways|.
     * 	Set to -1 for no undo at all.  You might want to do this only for the
     * 	current buffer: >
     * 		setlocal ul=-1
     * <	This helps when you run out of memory for a single change.
     */
    undolevels: number;
    /**
     * number	(default 10000)
     * 			global
     * 	Save the whole buffer for undo when reloading it.  This applies to the
     * 	":e!" command and reloading for when the buffer changed outside of
     * 	Vim. |FileChangedShell|
     * 	The save only happens when this option is negative or when the number
     * 	of lines is smaller than the value of this option.
     * 	Set this option to zero to disable undo for a reload.
     */
    undoreload: number;
    /**
     * number	(default: 200)
     * 			global
     * 	After typing this many characters the swap file will be written to
     * 	disk.  When zero, no swap file will be created at all (see chapter on
     * 	recovery |crash-recovery|).  'updatecount' is set to zero by starting
     * 	Vim with the "-n" option, see |startup|.  When editing in readonly
     * 	mode this option will be initialized to 10000.
     * 	The swapfile can be disabled per buffer with |'swapfile'|.
     * 	When 'updatecount' is set from zero to non-zero, swap files are
     * 	created for all buffers that have 'swapfile' set.  When 'updatecount'
     * 	is set to zero, existing swap files are not deleted.
     * 	This option has no meaning in buffers where |'buftype'| is "nofile"
     * 	or "nowrite".
     */
    updatecount: number;
    /**
     * number	(default 4000)
     * 			global
     * 	If this many milliseconds nothing is typed the swap file will be
     * 	written to disk (see |crash-recovery|).  Also used for the
     * 	|CursorHold| autocommand event.
     */
    updatetime: number;
    /**
     * number	(default 0)
     * 			global
     * 	When bigger than zero, Vim will give messages about what it is doing.
     * 	Currently, these messages are given:
     * 	>= 1	When the shada file is read or written.
     * 	>= 2	When a file is ":source"'ed.
     * 	>= 3	UI info, terminal capabilities
     * 	>= 5	Every searched tags file and include file.
     * 	>= 8	Files for which a group of autocommands is executed.
     * 	>= 9	Every executed autocommand.
     * 	>= 12	Every executed function.
     * 	>= 13	When an exception is thrown, caught, finished, or discarded.
     * 	>= 14	Anything pending in a ":finally" clause.
     * 	>= 15	Every executed Ex command (truncated at 200 characters).
     */
    verbose: number;
    /**
     * string	(default empty)
     * 			global
     * 	When not empty all messages are written in a file with this name.
     * 	When the file exists messages are appended.
     * 	Writing to the file ends when Vim exits or when 'verbosefile' is made
     * 	empty.  Writes are buffered, thus may not show up for some time.
     * 	Setting 'verbosefile' to a new value is like making it empty first.
     * 	The difference with |:redir| is that verbose messages are not
     * 	displayed when 'verbosefile' is set.
     */
    verbosefile: string;
    /**
     * string	(default: "$XDG_DATA_HOME/nvim/view")
     * 			global
     * 	Name of the directory where to store files for |:mkview|.
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    viewdir: string;
    /**
     * string	(default: "folds,options,cursor,curdir")
     * 			global
     * 	Changes the effect of the |:mkview| command.  It is a comma separated
     * 	list of words.  Each word enables saving and restoring something:
     * 	   word		save and restore ~
     * 	   cursor	cursor position in file and in window
     * 	   curdir	local current directory, if set with |:lcd|
     * 	   folds	manually created folds, opened/closed folds and local
     * 			fold options
     * 	   options	options and mappings local to a window or buffer (not
     * 			global values for local options)
     * 	   localoptions same as "options"
     * 	   slash	backslashes in file names replaced with forward
     * 			slashes
     * 	   unix		with Unix end-of-line format (single <NL>), even when
     * 			on Windows or DOS
     */
    viewoptions: string;
    /**
     * string	(default "")
     * 			global
     * 	A comma separated list of these words:
     * 	    block	Allow virtual editing in Visual block mode.
     * 	    insert	Allow virtual editing in Insert mode.
     * 	    all		Allow virtual editing in all modes.
     * 	    onemore	Allow the cursor to move just past the end of the line
     */
    virtualedit: string;
    /**
     * boolean	(default off)
     * 			global
     * 	Use visual bell instead of beeping.  Also see 'errorbells'.
     */
    visualbell: boolean;
    /**
     * boolean	(default on)
     * 			global
     * 	Give a warning message when a shell command is used while the buffer
     * 	has been changed.
     */
    warn: boolean;
    /**
     * string	(Vim default: "b,s", Vi default: "")
     * 			global
     * 	Allow specified keys that move the cursor left/right to move to the
     * 	previous/next line when the cursor is on the first/last character in
     * 	the line.  Concatenate characters to allow this for these keys:
     * 		char   key	  mode	~
     * 		 b    <BS>	 Normal and Visual
     * 		 s    <Space>	 Normal and Visual
     * 		 h    "h"	 Normal and Visual (not recommended)
     * 		 l    "l"	 Normal and Visual (not recommended)
     * 		 <    <Left>	 Normal and Visual
     * 		 >    <Right>	 Normal and Visual
     * 		 ~    "~"	 Normal
     * 		 [    <Left>	 Insert and Replace
     * 		 ]    <Right>	 Insert and Replace
     * 	For example: >
     * 		:set ww=<,>,[,]
     * <	allows wrap only when cursor keys are used.
     * 	When the movement keys are used in combination with a delete or change
     * 	operator, the <EOL> also counts for a character.  This makes "3h"
     * 	different from "3dh" when the cursor crosses the end of a line.  This
     * 	is also true for "x" and "X", because they do the same as "dl" and
     * 	"dh".  If you use this, you may also want to use the mapping
     * 	":map <BS> X" to make backspace delete the character in front of the
     * 	cursor.
     * 	When 'l' is included and it is used after an operator at the end of a
     * 	line then it will not move to the next line.  This makes "dl", "cl",
     * 	"yl" etc. work normally.
     */
    whichwrap: string;
    /**
     * number	(Vim default: <Tab>, Vi default: CTRL-E)
     * 			global
     * 	Character you have to type to start wildcard expansion in the
     * 	command-line, as specified with 'wildmode'.
     * 	More info here: |cmdline-completion|.
     * 	The character is not recognized when used inside a macro.  See
     * 	'wildcharm' for that.
     * 	Although 'wc' is a number option, you can set it to a special key: >
     * 		:set wc=<Esc>
     * <
     */
    wildchar: number;
    /**
     * number	(default: none (0))
     * 			global
     * 	'wildcharm' works exactly like 'wildchar', except that it is
     * 	recognized when used inside a macro.  You can find "spare" command-line
     * 	keys suitable for this option by looking at |ex-edit-index|.  Normally
     * 	you'll never actually type 'wildcharm', just use it in mappings that
     * 	automatically invoke completion mode, e.g.: >
     * 		:set wcm=<C-Z>
     * 		:cnoremap ss so $vim/sessions/*.vim<C-Z>
     * <	Then after typing :ss you can use CTRL-P & CTRL-N.
     */
    wildcharm: number;
    /**
     * string	(default "")
     * 			global
     * 	A list of file patterns.  A file that matches with one of these
     * 	patterns is ignored when expanding |wildcards|, completing file or
     * 	directory names, and influences the result of |expand()|, |glob()| and
     * 	|globpath()| unless a flag is passed to disable this.
     * 	The pattern is used like with |:autocmd|, see |autocmd-pattern|.
     * 	Also see 'suffixes'.
     * 	Example: >
     * 		:set wildignore=*.o,*.obj
     * <	The use of |:set+=| and |:set-=| is preferred when adding or removing
     * 	a pattern from the list.  This avoids problems when a future version
     * 	uses another default.
     */
    wildignore: string;
    /**
     * boolean	(default off)
     * 			global
     * 	When set case is ignored when completing file names and directories.
     * 	Has no effect when 'fileignorecase' is set.
     * 	Does not apply when the shell is used to expand wildcards, which
     * 	happens when there are special characters.
     */
    wildignorecase: boolean;
    /**
     * boolean	(default on)
     * 			global
     * 	Enables "enhanced mode" of command-line completion. When user hits
     * 	<Tab> (or 'wildchar') to invoke completion, the possible matches are
     * 	shown in a menu just above the command-line (see 'wildoptions'), with
     * 	the first match highlighted (overwriting the statusline).  Keys that
     * 	show the previous/next match (<Tab>/CTRL-P/CTRL-N) highlight the
     * 	match.
     * 	'wildmode' must specify "full": "longest" and "list" do not start
     * 	'wildmenu' mode. You can check the current mode with |wildmenumode()|.
     * 	The menu is canceled when a key is hit that is not used for selecting
     * 	a completion.
     */
    wildmenu: boolean;
    /**
     * string	(default: "full")
     * 			global
     * 	Completion mode that is used for the character specified with
     * 	'wildchar'.  It is a comma separated list of up to four parts.  Each
     * 	part specifies what to do for each consecutive use of 'wildchar'.  The
     * 	first part specifies the behavior for the first use of 'wildchar',
     * 	The second part for the second use, etc.
     * 	These are the possible values for each part:
     * 	""		Complete only the first match.
     * 	"full"		Complete the next full match.  After the last match,
     * 			the original string is used and then the first match
     * 			again.
     * 	"longest"	Complete till longest common string.  If this doesn't
     * 			result in a longer string, use the next part.
     * 	"longest:full"	Like "longest", but also start 'wildmenu' if it is
     * 			enabled.
     * 	"list"		When more than one match, list all matches.
     * 	"list:full"	When more than one match, list all matches and
     * 			complete first match.
     * 	"list:longest"	When more than one match, list all matches and
     * 			complete till longest common string.
     * 	When there is only a single match, it is fully completed in all cases.
     */
    wildmode: string;
    /**
     * string	(default "pum,tagfile")
     * 			global
     * 	List of words that change how |cmdline-completion| is done.
     * 	  pum		Display the completion matches using the popupmenu
     * 			in the same style as the |ins-completion-menu|.
     * 	  tagfile	When using CTRL-D to list matching tags, the kind of
     * 			tag and the file of the tag is listed.	Only one match
     * 			is displayed per line.  Often used tag kinds are:
     * 				d	#define
     * 				f	function
     */
    wildoptions: string;
    /**
     * string	(default "menu")
     * 			global
     * 			{only used in Win32}
     * 	Some GUI versions allow the access to menu entries by using the ALT
     * 	key in combination with a character that appears underlined in the
     * 	menu.  This conflicts with the use of the ALT key for mappings and
     * 	entering special characters.  This option tells what to do:
     * 	  no	Don't use ALT keys for menus.  ALT key combinations can be
     * 		mapped, but there is no automatic handling.
     * 	  yes	ALT key handling is done by the windowing system.  ALT key
     * 		combinations cannot be mapped.
     * 	  menu	Using ALT in combination with a character that is a menu
     * 		shortcut key, will be handled by the windowing system.  Other
     * 		keys can be mapped.
     * 	If the menu is disabled by excluding 'm' from 'guioptions', the ALT
     * 	key is never used for the menu.
     * 	This option is not used for <F10>; on Win32.
     */
    winaltkeys: string;
    /**
     * number	(default 0)
     * 			local to window
     * 	Enables pseudo-transparency for a floating window. Valid values are in
     * 	the range of 0 for fully opaque window (disabled) to 100 for fully
     * 	transparent background. Values between 0-30 are typically most useful.
     */
    winblend: number;
    /**
     * number  (default screen height - 1)
     * 			global
     * 	Window height.  Do not confuse this with the height of the Vim window,
     * 	use 'lines' for that.
     * 	Used for |CTRL-F| and |CTRL-B| when there is only one window and the
     * 	value is smaller than 'lines' minus one.  The screen will scroll
     * 	'window' minus two lines, with a minimum of one.
     * 	When 'window' is equal to 'lines' minus one CTRL-F and CTRL-B scroll
     * 	in a much smarter way, taking care of wrapping lines.
     * 	When resizing the Vim window, the value is smaller than 1 or more than
     * 	or equal to 'lines' it will be set to 'lines' minus 1.
     */
    window: number;
    /**
     * number	(default 1)
     * 			global
     * 	Minimal number of lines for the current window.  This is not a hard
     * 	minimum, Vim will use fewer lines if there is not enough room.  If the
     * 	focus goes to a window that is smaller, its size is increased, at the
     * 	cost of the height of other windows.
     * 	Set 'winheight' to a small number for normal editing.
     * 	Set it to 999 to make the current window fill most of the screen.
     * 	Other windows will be only 'winminheight' high.  This has the drawback
     * 	that ":all" will create only two windows.  To avoid "vim -o 1 2 3 4"
     * 	to create only two windows, set the option after startup is done,
     * 	using the |VimEnter| event: >
     * 		au VimEnter * set winheight=999
     * <	Minimum value is 1.
     * 	The height is not adjusted after one of the commands that change the
     * 	height of the current window.
     * 	'winheight' applies to the current window.  Use 'winminheight' to set
     * 	the minimal height for other windows.
     */
    winheight: number;
    /**
     * string (default empty)
     * 			local to window
     * 	Window-local highlights.  Comma-delimited list of highlight
     * 	|group-name| pairs "{hl-builtin}:{hl},..." where each {hl-builtin} is
     * 	a built-in |highlight-groups| item to be overridden by {hl} group in
     * 	the window.  Only built-in |highlight-groups| are supported, not
     * 	syntax highlighting (use |:ownsyntax| for that).
     */
    winhighlight: string;
    /**
     * boolean	(default off)
     * 			local to window
     * 	Keep the window height when windows are opened or closed and
     * 	'equalalways' is set.  Also for |CTRL-W_=|.  Set by default for the
     * 	|preview-window| and |quickfix-window|.
     * 	The height may be changed anyway when running out of room.
     */
    winfixheight: boolean;
    /**
     * boolean	(default off)
     * 			local to window
     * 	Keep the window width when windows are opened or closed and
     * 	'equalalways' is set.  Also for |CTRL-W_=|.
     * 	The width may be changed anyway when running out of room.
     */
    winfixwidth: boolean;
    /**
     * number	(default 1)
     * 			global
     * 	The minimal height of a window, when it's not the current window.
     * 	This is a hard minimum, windows will never become smaller.
     * 	When set to zero, windows may be "squashed" to zero lines (i.e. just a
     * 	status bar) if necessary.  They will return to at least one line when
     * 	they become active (since the cursor has to have somewhere to go.)
     * 	Use 'winheight' to set the minimal height of the current window.
     * 	This option is only checked when making a window smaller.  Don't use a
     * 	large number, it will cause errors when opening more than a few
     * 	windows.  A value of 0 to 3 is reasonable.
     */
    winminheight: number;
    /**
     * number	(default 1)
     * 			global
     * 	The minimal width of a window, when it's not the current window.
     * 	This is a hard minimum, windows will never become smaller.
     * 	When set to zero, windows may be "squashed" to zero columns (i.e. just
     * 	a vertical separator) if necessary.  They will return to at least one
     * 	line when they become active (since the cursor has to have somewhere
     * 	to go.)
     * 	Use 'winwidth' to set the minimal width of the current window.
     * 	This option is only checked when making a window smaller.  Don't use a
     * 	large number, it will cause errors when opening more than a few
     * 	windows.  A value of 0 to 12 is reasonable.
     */
    winminwidth: number;
    /**
     * number	(default 20)
     * 			global
     * 	Minimal number of columns for the current window.  This is not a hard
     * 	minimum, Vim will use fewer columns if there is not enough room.  If
     * 	the current window is smaller, its size is increased, at the cost of
     * 	the width of other windows.  Set it to 999 to make the current window
     * 	always fill the screen.  Set it to a small number for normal editing.
     * 	The width is not adjusted after one of the commands to change the
     * 	width of the current window.
     * 	'winwidth' applies to the current window.  Use 'winminwidth' to set
     * 	the minimal width for other windows.
     */
    winwidth: number;
    /**
     * boolean	(default on)
     * 			local to window
     * 	This option changes how text is displayed.  It doesn't change the text
     * 	in the buffer, see 'textwidth' for that.
     * 	When on, lines longer than the width of the window will wrap and
     * 	displaying continues on the next line.  When off lines will not wrap
     * 	and only part of long lines will be displayed.  When the cursor is
     * 	moved to a part that is not shown, the screen will scroll
     * 	horizontally.
     * 	The line will be broken in the middle of a word if necessary.  See
     * 	'linebreak' to get the break at a word boundary.
     * 	To make scrolling horizontally a bit more useful, try this: >
     * 		:set sidescroll=5
     * 		:set listchars+=precedes:<,extends:>
     * <	See 'sidescroll', 'listchars' and |wrap-off|.
     * 	This option can't be set from a |modeline| when the 'diff' option is
     * 	on.
     */
    wrap: boolean;
    /**
     * number	(default 0)
     * 			local to buffer
     * 	Number of characters from the right window border where wrapping
     * 	starts.  When typing text beyond this limit, an <EOL> will be inserted
     * 	and inserting continues on the next line.
     * 	Options that add a margin, such as 'number' and 'foldcolumn', cause
     * 	the text width to be further reduced.  This is Vi compatible.
     * 	When 'textwidth' is non-zero, this option is not used.
     * 	See also 'formatoptions' and |ins-textwidth|.
     */
    wrapmargin: number;
    /**
     * boolean	(default on)
     * 			global
     * 	Allows writing files.  When not set, writing a file is not allowed.
     * 	Can be used for a view-only mode, where modifications to the text are
     * 	still allowed.  Can be reset with the |-m| or |-M| command line
     * 	argument.  Filtering text is still possible, even though this requires
     * 	writing a temporary file.
     */
    write: boolean;
    /**
     * boolean	(default off)
     * 			global
     * 	Allows writing to any file with no need for "!" override.
     */
    writeany: boolean;
    /**
     * number	(default 0)
     * 			global
     * 	The number of milliseconds to wait for each character sent to the
     * 	screen.  When positive, characters are sent to the UI one by one.
     * 	See 'redrawdebug' for more options.  For debugging purposes.
     */
    writedelay: number;
    /**
     * boolean (default off)
     * 			global
     * 			{only available when compiled with the |+farsi|
     * 			feature}
     * 	This option was for using Farsi, which has been removed.  See
     * 	|farsi.txt|.
     */
    altkeymap: boolean;
    /**
     * boolean (default: off)
     * 			global
     * 			{only available when compiled with GUI enabled
     * 			on Mac OS X}
     * 	This option only has an effect in the GUI version of Vim on Mac OS X
     * 	v10.2 or later.  When on, Vim will use smooth ("antialiased") fonts,
     * 	which can be easier to read at certain sizes on certain displays.
     * 	Setting this option can sometimes cause problems if 'guifont' is set
     * 	to its default (empty string).
     * 	NOTE: This option is reset when 'compatible' is set.
     */
    antialias: boolean;
    /**
     * boolean	(default off)
     * 			global
     * 			{only available when compiled with the
     * 			|+balloon_eval_term| feature}
     * 	Switch on the |balloon-eval| functionality for the terminal.
     */
    balloonevalterm: boolean;
    /**
     * boolean	(default on)
     * 			global
     * 			{only for MS-DOS}
     * 	This was for MS-DOS and is no longer supported.
     */
    bioskey: boolean;
    /**
     * string	(default: "")
     * 			local to buffer
     * 			{only for MS-Windows}
     * 	When this option is set it overrules 'shellslash' for completion:
     * 	- When this option is set to "slash", a forward slash is used for path
     * 	  completion in insert mode. This is useful when editing HTML tag, or
     * 	  Makefile with 'noshellslash' on Windows.
     * 	- When this option is set to "backslash", backslash is used. This is
     * 	  useful when editing a batch file with 'shellslash' set on Windows.
     * 	- When this option is empty, same character is used as for
     * 	  'shellslash'.
     * 	For Insert mode completion the buffer-local value is used.  For
     * 	command line completion the global value is used.
     */
    completeslash: string;
    /**
     * string (default empty)
     * 			global
     * 			{not available when compiled without the |+textprop|
     * 			or |+quickfix| feature}
     * 	When 'completeopt' contains "popup" then this option is used for the
     * 	properties of the info popup when it is created.  You can also use
     * 	|popup_findinfo()| and then set properties for an existing info popup
     * 	with |popup_setoptions()|.  See |complete-popup|.
     */
    completepopup: string;
    /**
     * boolean	(default off)
     * 			global
     * 	This was for MS-DOS and is no longer supported.
     */
    conskey: boolean;
    /**
     * string	(default "blowfish2")
     * 			global or local to buffer |global-local|
     * 	Method used for encryption when the buffer is written to a file:
     * 							*pkzip*
     * 	   zip		PkZip compatible method.  A weak kind of encryption.
     * 			Backwards compatible with Vim 7.2 and older.
     * 							*blowfish*
     * 	   blowfish	Blowfish method.  Medium strong encryption but it has
     * 			an implementation flaw.  Requires Vim 7.3 or later,
     * 			files can NOT be read by Vim 7.2 and older.  This adds
     * 			a "seed" to the file, every time you write the file
     * 			the encrypted bytes will be different.
     * 							*blowfish2*
     * 	   blowfish2	Blowfish method.  Medium strong encryption.  Requires
     * 			Vim 7.4.401 or later, files can NOT be read by Vim 7.3
     * 			and older.  This adds a "seed" to the file, every time
     * 			you write the file the encrypted bytes will be
     * 			different.  The whole undo file is encrypted, not just
     * 			the pieces of text.
     */
    cryptmethod: string;
    /**
     * boolean (default off)
     * 			global
     * 			{not available when compiled without the |+cscope|
     * 			feature}
     * 	Give messages when adding a cscope database.  See |cscopeverbose|.
     * 	NOTE: This option is reset when 'compatible' is set.
     */
    cscopeverbose: boolean;
    /**
     * string (default: "number,line")
     * 			local to window
     * 			{not available when compiled without the |+syntax|
     * 			feature}
     * 	Comma separated list of settings for how 'cursorline' is displayed.
     * 	Valid values:
     * 	"line"		Highlight the text line of the cursor with
     * 			CursorLine |hl-CursorLine|.
     * 	"screenline"	Highlight only the screen line of the cursor with
     * 			CursorLine |hl-CursorLine|.
     * 	"number"	Highlight the line number of the cursor with
     * 			CursorLineNr |hl-CursorLineNr|.
     */
    cursorlineopt: string;
    /**
     * boolean	(default off)
     * 			global
     * 	Makes the 'g' and 'c' flags of the ":substitute" command to be
     * 	toggled each time the flag is given.  See |complex-change|.  See
     * 	also 'gdefault' option.
     * 	Switching this option on may break plugins!
     */
    edcompatible: boolean;
    /**
     * string (default: "latin1" or value from $LANG)
     * 			global
     * 	Sets the character encoding used inside Vim.  It applies to text in
     * 	the buffers, registers, Strings in expressions, text stored in the
     * 	viminfo file, etc.  It sets the kind of characters which Vim can work
     * 	with.  See |encoding-names| for the possible values.
     */
    encoding: string;
    /**
     * boolean	(Vim default: on, Vi default: off)
     * 			global
     * 	Function keys that start with an <Esc> are recognized in Insert
     * 	mode.  When this option is off, the cursor and function keys cannot be
     * 	used in Insert mode if they start with an <Esc>.  The advantage of
     * 	this is that the single <Esc> is recognized immediately, instead of
     * 	after one second.  Instead of resetting this option, you might want to
     * 	try changing the values for 'timeoutlen' and 'ttimeoutlen'.  Note that
     * 	when 'esckeys' is off, you can still map anything, but the cursor keys
     * 	won't work by default.
     * 	NOTE: This option is set to the Vi default value when 'compatible' is
     * 	set and to the Vim default value when 'compatible' is reset.
     * 	NOTE: when this option is off then the |modifyOtherKeys| functionality
     * 	is disabled while in Insert mode to avoid ending Insert mode with any
     * 	key that has a modifier.
     */
    esckeys: boolean;
    /**
     * boolean (default off)
     * 			global
     * 	Enables the reading of .vimrc, .exrc and .gvimrc in the current
     * 	directory.
     */
    exrc: boolean;
    /**
     * number	(default 50)
     * 			global
     * 			{only for GTK and X11 GUI}
     * 	The number of pixels subtracted from the screen height when fitting
     * 	the GUI window on the screen.  Set this before the GUI is started,
     * 	e.g., in your |gvimrc| file.  When zero, the whole screen height will
     * 	be used by the window.  When positive, the specified number of pixel
     * 	lines will be left for window decorations and other items on the
     * 	screen.  Set it to a negative value to allow windows taller than the
     * 	screen.
     */
    guiheadroom: number;
    /**
     * boolean	(default on)
     * 			global
     * 			{only available when compiled with GUI enabled}
     * 	Only in the GUI: If on, an attempt is made to open a pseudo-tty for
     * 	I/O to/from shell commands.  See |gui-pty|.
     */
    guipty: boolean;
    /**
     * string (default "")
     * 			global
     * 	This option specifies a function that will be called to
     * 	activate or deactivate the Input Method.
     * 	It is not used in the GUI.
     * 	The expression will be evaluated in the |sandbox| when set from a
     * 	modeline, see |sandbox-option|.
     */
    imactivatefunc: string;
    /**
     * string (default "")
     * 			global
     * 			{only available when compiled with |+xim| and
     * 			|+GUI_GTK|}				*E599*
     * 	Specifies the key that your Input Method in X-Windows uses for
     * 	activation.  When this is specified correctly, vim can fully control
     * 	IM with 'imcmdline', 'iminsert' and 'imsearch'.
     * 	You can't use this option to change the activation key, the option
     * 	tells Vim what the key is.
     * 	Format:
     * 		[MODIFIER_FLAG-]KEY_STRING
     */
    imactivatekey: string;
    /**
     * string (default "")
     * 			global
     * 	This option specifies a function that is called to obtain the status
     * 	of Input Method.  It must return a positive number when IME is active.
     * 	It is not used in the GUI.
     */
    imstatusfunc: string;
    /**
     * number (default 1)
     * 			global
     * 			{only available when compiled with |+xim| and
     * 			|+GUI_GTK|}
     * 	This option specifies the input style of Input Method:
     * 	0   use on-the-spot style
     * 	1   over-the-spot style
     * 	See: |xim-input-style|
     */
    imstyle: number;
    /**
     * string	(default "")
     * 			local to buffer
     * 			{only available when compiled with the |+cryptv|
     * 			feature}
     * 	The key that is used for encrypting and decrypting the current buffer.
     * 	See |encryption| and 'cryptmethod'.
     * 	Careful: Do not set the key value by hand, someone might see the typed
     * 	key.  Use the |:X| command.  But you can make 'key' empty: >
     * 		:set key=
     * <	It is not possible to get the value of this option with ":set key" or
     * 	"echo &key".  This is to avoid showing it to someone who shouldn't
     * 	know.  It also means you cannot see it yourself once you have set it,
     * 	be careful not to make a typing error!
     * 	You can use "&key" in an expression to detect whether encryption is
     * 	enabled.  When 'key' is set it returns "*****" (five stars).
     */
    key: string;
    /**
     * boolean (default off, set in |defaults.vim|)
     * 			global
     * 			{only available when compiled with the |+langmap|
     * 			feature}
     * 	This is just like 'langremap' but with the value inverted.  It only
     * 	exists for backwards compatibility.  When setting 'langremap' then
     * 	'langnoremap' is set to the inverted value, and the other way around.
     */
    langnoremap: boolean;
    /**
     * string	(default depends on the build)
     * 			global
     * 			{only available when compiled with the |+lua/dyn|
     * 			feature}
     * 	Specifies the name of the Lua shared library. The default is
     * 	DYNAMIC_LUA_DLL, which was specified at compile time.
     * 	Environment variables are expanded |:set_env|.
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    luadll: string;
    /**
     * boolean	(default on)
     * 			global
     * 			{only available in Mac GUI version}
     * 	This is a workaround for when drawing doesn't work properly.  When set
     * 	and compiled with multi-byte support ATSUI text drawing is used.  When
     * 	not set ATSUI text drawing is not used.  Switch this option off when
     * 	you experience drawing problems.  In a future version the problems may
     * 	be solved and this option becomes obsolete.  Therefore use this method
     * 	to unset it: >
     * 		if exists('&macatsui')
     * 		   set nomacatsui
     * 		endif
     * <	Another option to check if you have drawing problems is
     * 	'termencoding'.
     */
    macatsui: boolean;
    /**
     * string	(default depends on the build)
     * 			global
     * 			{only available when compiled with the |+mzscheme/dyn|
     * 			feature}
     * 	Specifies the name of the MzScheme shared library. The default is
     * 	DYNAMIC_MZSCH_DLL which was specified at compile time.
     * 	Environment variables are expanded |:set_env|.
     * 	The value must be set in the |vimrc| script or earlier.  In the
     * 	startup, before the |load-plugins| step.
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    mzschemedll: string;
    /**
     * string	(default depends on the build)
     * 			global
     * 			{only available when compiled with the |+mzscheme/dyn|
     * 			feature}
     * 	Specifies the name of the MzScheme GC shared library. The default is
     * 	DYNAMIC_MZGC_DLL which was specified at compile time.
     * 	The value can be equal to 'mzschemedll' if it includes the GC code.
     * 	Environment variables are expanded |:set_env|.
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    mzschemegcdll: string;
    /**
     * number	(default 100)
     * 			global
     * 			{not available when compiled without the |+mzscheme|
     * 			feature}
     * 	The number of milliseconds between polls for MzScheme threads.
     * 	Negative or zero value means no thread scheduling.
     * 	NOTE: This option is set to the Vim default value when 'compatible'
     * 	is reset.
     */
    mzquantum: number;
    /**
     * string (default: "")
     * 			local to buffer
     * 	This option was supported on RISC OS, which has been removed.
     */
    osfiletype: string;
    /**
     * string	(default depends on the build)
     * 			global
     * 			{only available when compiled with the |+perl/dyn|
     * 			feature}
     * 	Specifies the name of the Perl shared library. The default is
     * 	DYNAMIC_PERL_DLL, which was specified at compile time.
     * 	Environment variables are expanded |:set_env|.
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    perldll: string;
    /**
     * string (default empty)
     * 			global
     * 			{not available when compiled without the |+textprop|
     * 			or |+quickfix| feature}
     * 	When not empty a popup window is used for commands that would open a
     * 	preview window.  See |preview-popup|.
     * 	Not used for the insert completion info, add "popup" to
     * 	'completeopt' for that.
     */
    previewpopup: string;
    /**
     * string	(default depends on the build)
     * 			global
     * 			{only available when compiled with the |+python/dyn|
     * 			feature}
     * 	Specifies the name of the Python 2.x shared library. The default is
     * 	DYNAMIC_PYTHON_DLL, which was specified at compile time.
     * 	Environment variables are expanded |:set_env|.
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    pythondll: string;
    /**
     * string	(default "")
     * 			global
     * 			{only available when compiled with the |+python/dyn|
     * 			feature}
     * 	Specifies the name of the Python 2.x home directory. When 'pythonhome'
     * 	and the PYTHONHOME environment variable are not set, PYTHON_HOME,
     * 	which was specified at compile time, will be used for the Python 2.x
     * 	home directory.
     * 	Environment variables are expanded |:set_env|.
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    pythonhome: string;
    /**
     * string  (default: empty)
     * 			global
     * 			{only available when compiled with GUI and DIRECTX on
     * 			MS-Windows}
     * 	Select a text renderer and set its options.  The options depend on the
     * 	renderer.
     */
    renderoptions: string;
    /**
     * boolean	(default on)
     * 			global
     * 			{only in Windows 95/NT console version}
     * 	When set, the screen contents is restored when exiting Vim.  This also
     * 	happens when executing external commands.
     */
    restorescreen: boolean;
    /**
     * string	(default: depends on the build)
     * 			global
     * 			{only available when compiled with the |+ruby/dyn|
     * 			feature}
     * 	Specifies the name of the Ruby shared library. The default is
     * 	DYNAMIC_RUBY_DLL, which was specified at compile time.
     * 	Environment variables are expanded |:set_env|.
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    rubydll: string;
    /**
     * boolean  (default off)
     * 			global
     * 			{only for MS-Windows GUI}
     * 	When using the scroll wheel and this option is set, the window under
     * 	the mouse pointer is scrolled.  With this option off the current
     * 	window is scrolled.
     * 	Systems other than MS-Windows always behave like this option is on.
     */
    scrollfocus: boolean;
    /**
     * number	(default 0)
     * 			global
     * 			{only for the Amiga}
     * 	On the Amiga this option influences the way how the commands work
     * 	which use a shell.
     * 	0 and 1: always use the shell
     * 	2 and 3: use the shell only to filter lines
     * 	4 and 5: use shell only for ':sh' command
     * 	When not using the shell, the command is executed directly.
     */
    shelltype: number;
    /**
     * boolean	(default off)
     * 			local to buffer
     * 	Filenames are assumed to be 8 characters plus one extension of 3
     * 	characters.  Multiple dots in file names are not allowed.  When this
     * 	option is on, dots in file names are replaced with underscores when
     * 	adding an extension (".~" or ".swp").  This option is not available
     * 	for MS-DOS, because then it would always be on.  This option is useful
     * 	when editing files on an MS-DOS compatible filesystem, e.g., messydos
     * 	or crossdos.  When running the Win32 GUI version under Win32s, this
     * 	option is always on by default.
     */
    shortname: boolean;
    /**
     * string	(default "fsync")
     * 			global
     * 	When this option is not empty a swap file is synced to disk after
     * 	writing to it.  This takes some time, especially on busy unix systems.
     * 	When this option is empty parts of the swap file may be in memory and
     * 	not written to disk.  When the system crashes you may lose more work.
     * 	On Unix the system does a sync now and then without Vim asking for it,
     * 	so the disadvantage of setting this option off is small.  On some
     * 	systems the swap file will not be written at all.  For a unix system
     * 	setting it to "sync" will use the sync() call instead of the default
     * 	fsync(), which may work better on some systems.
     * 	The 'fsync' option is used for the actual file.
     */
    swapsync: string;
    /**
     * string	(default depends on the build)
     * 			global
     * 			{only available when compiled with the |+tcl/dyn|
     * 			feature}
     * 	Specifies the name of the Tcl shared library. The default is
     * 	DYNAMIC_TCL_DLL, which was specified at compile time.
     * 	Environment variables are expanded |:set_env|.
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    tcldll: string;
    /**
     * string	(default "")
     * 			local to window
     * 	The key that starts a CTRL-W command in a terminal window.  Other keys
     * 	are sent to the job running in the window.
     * 	The <> notation can be used, e.g.: >
     * 		:set termwinkey=<C-L>
     * <	The string must be one key stroke but can be multiple bytes.
     * 	When not set CTRL-W is used, so that CTRL-W : gets you to the command
     * 	line.  If 'termwinkey' is set to CTRL-L then CTRL-L : gets you to the
     * 	command line.
     */
    termwinkey: string;
    /**
     * number	(default 10000)
     * 			local to buffer
     * 			{not available when compiled without the
     * 			|+terminal| feature}
     * 	Number of scrollback lines to keep.  When going over this limit the
     * 	first 10% of the scrollback lines are deleted.  This is just to reduce
     * 	the memory usage.  See |Terminal-Normal|.
     */
    termwinscroll: number;
    /**
     * string	(default "")
     * 			local to window
     * 	Size of the |terminal| window.  Format: {rows}x{columns} or
     * 	{rows}*{columns}.
     * 	- When empty the terminal gets the size from the window.
     * 	- When set with a "x" (e.g., "24x80") the terminal size is not
     * 	  adjusted to the window size.  If the window is smaller only the
     * 	  top-left part is displayed.
     * 	- When set with a "*" (e.g., "10*50") the terminal size follows the
     * 	  window size, but will not be smaller than the specified rows and/or
     * 	  columns.
     * 	- When rows is zero then use the height of the window.
     * 	- When columns is zero then use the width of the window.
     * 	- Using "0x0" or "0*0" is the same as empty.
     */
    termwinsize: string;
    /**
     * string  (default "")
     * 			global
     * 			{only available when compiled with the |terminal|
     * 			feature on MS-Windows}
     * 	Specify the virtual console (pty) used when opening the terminal
     * 	window.
     */
    termwintype: string;
    /**
     * boolean	(Vim default: on, Vi default: off)
     * 			global
     * 	This option is obsolete.  Use 'fileformats'.
     * 	For backwards compatibility, when 'textauto' is set, 'fileformats' is
     * 	set to the default value for the current system.  When 'textauto' is
     * 	reset, 'fileformats' is made empty.
     * 	NOTE: This option is set to the Vi default value when 'compatible' is
     * 	set and to the Vim default value when 'compatible' is reset.
     */
    textauto: boolean;
    /**
     * string	(default "icons,tooltips")
     * 			global
     * 			{only for |+GUI_GTK|, |+GUI_Athena|, |+GUI_Motif| and
     * 			|+GUI_Photon|}
     * 	The contents of this option controls various toolbar settings.  The
     * 	possible values are:
     * 		icons		Toolbar buttons are shown with icons.
     * 		text		Toolbar buttons shown with text.
     * 		horiz		Icon and text of a toolbar button are
     * 				horizontally arranged.  {only in GTK+ 2 GUI}
     * 		tooltips	Tooltips are active for toolbar buttons.
     * 	Tooltips refer to the popup help text which appears after the mouse
     * 	cursor is placed over a toolbar button for a brief moment.
     */
    toolbar: string;
    /**
     * string	(default "small")
     * 				global
     * 				{only in the GTK+ GUI}
     * 	Controls the size of toolbar icons.  The possible values are:
     * 		tiny		Use tiny icons.
     * 		small		Use small icons (default).
     * 		medium		Use medium-sized icons.
     * 		large		Use large icons.
     * 		huge		Use even larger icons.
     * 		giant		Use very big icons.
     * 	The exact dimensions in pixels of the various icon sizes depend on
     * 	the current theme.  Common dimensions are giant=48x48, huge=32x32,
     * 	large=24x24, medium=24x24, small=20x20 and tiny=16x16.
     */
    toolbariconsize: string;
    /**
     * boolean	(default on)
     * 			global
     * 	When on, the builtin termcaps are searched before the external ones.
     * 	When off the builtin termcaps are searched after the external ones.
     * 	When this option is changed, you should set the 'term' option next for
     * 	the change to take effect, for example: >
     * 		:set notbi term=$TERM
     * <	See also |termcap|.
     * 	Rationale: The default for this option is "on", because the builtin
     * 	termcap entries are generally better (many systems contain faulty
     * 	xterm entries...).
     */
    ttybuiltin: boolean;
    /**
     * string	(default depends on 'term')
     * 			global
     * 			{only in Unix and VMS, doesn't work in the GUI; not
     * 			available when compiled without |+mouse|}
     * 	Name of the terminal type for which mouse codes are to be recognized.
     * 	Currently these strings are valid:
     * 							*xterm-mouse*
     * 	   xterm	xterm-like mouse handling.  The mouse generates
     * 			"<Esc>[Mscr", where "scr" is three bytes:
     * 				"s"  = button state
     * 				"c"  = column plus 33
     * 				"r"  = row plus 33
     * 			This only works up to 223 columns!  See "dec",
     * 			"urxvt", and "sgr" for solutions.
     * 	   xterm2	Works like "xterm", but with the xterm reporting the
     * 			mouse position while the mouse is dragged.  This works
     * 			much faster and more precise.  Your xterm must at
     * 			least at patchlevel 88 / XFree 3.3.3 for this to
     * 			work.  See below for how Vim detects this
     * 			automatically.
     * 							*netterm-mouse*
     * 	   netterm	NetTerm mouse handling.  A left mouse click generates
     * 			"<Esc>}r,c<CR>", where "r,c" are two decimal numbers
     * 			for the row and column.  No other mouse events are
     * 			supported.
     * 							*dec-mouse*
     * 	   dec		DEC terminal mouse handling.  The mouse generates a
     * 			rather complex sequence, starting with "<Esc>[".
     * 			This is also available for an Xterm, if it was
     * 			configured with "--enable-dec-locator".
     * 							*jsbterm-mouse*
     * 	   jsbterm	JSB term mouse handling.
     * 							*pterm-mouse*
     * 	   pterm	QNX pterm mouse handling.
     * 							*urxvt-mouse*
     * 	   urxvt	Mouse handling for the urxvt (rxvt-unicode) terminal.
     * 			The mouse works only if the terminal supports this
     * 			encoding style, but it does not have 223 columns limit
     * 			unlike "xterm" or "xterm2".
     * 							*sgr-mouse*
     * 	   sgr		Mouse handling for the terminal that emits SGR-styled
     * 			mouse reporting.  The mouse works even in columns
     * 			beyond 223.  This option is backward compatible with
     * 			"xterm2" because it can also decode "xterm2" style
     * 			mouse codes.
     */
    ttymouse: string;
    /**
     * number	(default 999)
     * 			global
     * 	Maximum number of lines to scroll the screen.  If there are more lines
     * 	to scroll the window is redrawn.  For terminals where scrolling is
     * 	very slow and redrawing is not slow this can be set to a small number,
     * 	e.g., 3, to speed up displaying.
     */
    ttyscroll: number;
    /**
     * string	(default from $TERM)
     * 			global
     * 	Alias for 'term', see above.
     */
    ttytype: string;
    /**
     * string	(default "")
     * 			local to buffer
     * 			{only available when compiled with the |+vartabs|
     * 			feature}
     * 	A list of the number of spaces that a <Tab> counts for while editing,
     * 	such as inserting a <Tab> or using <BS>.  It "feels" like variable-
     * 	width <Tab>s are being inserted, while in fact a mixture of spaces
     * 	and <Tab>s is used.  Tab widths are separated with commas, with the
     * 	final value applying to all subsequent tabs.
     */
    varsofttabstop: string;
    /**
     * string	(default "")
     * 			local to buffer
     * 			{only available when compiled with the |+vartabs|
     * 			feature}
     * 	A list of the number of spaces that a <Tab> in the file counts for,
     * 	separated by commas.  Each value corresponds to one tab, with the
     * 	final value applying to all subsequent tabs. For example: >
     * 		:set vartabstop=4,20,10,8
     * <	This will make the first tab 4 spaces wide, the second 20 spaces,
     * 	the third 10 spaces, and all following tabs 8 spaces.
     */
    vartabstop: string;
    /**
     * string	(default: "")
     * 			global
     * 			{not available when compiled without the |+viminfo|
     * 			feature}
     * 	When non-empty, overrides the file name used for viminfo.
     * 	When equal to "NONE" no viminfo file will be read or written.
     * 	This option can be set with the |-i| command line flag.  The |--clean|
     * 	command line flag sets it to "NONE".
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    viminfofile: string;
    /**
     * boolean	(default off)
     * 			global
     * 	This option has the same effect as the 't_xs' terminal option.
     * 	It is provided for backwards compatibility with version 4.x.
     * 	Setting 'weirdinvert' has the effect of making 't_xs' non-empty, and
     * 	vice versa.  Has no effect when the GUI is running.
     */
    weirdinvert: boolean;
    /**
     * string (default empty)
     * 			local to window
     * 	Highlight group name to use for this window instead of the Normal
     * 	color |hl-Normal|.
     */
    wincolor: string;
    /**
     * string	(default "winpty32.dll" or "winpty64.dll")
     * 			global
     * 			{only available when compiled with the |terminal|
     * 			feature on MS-Windows}
     * 	Specifies the name of the winpty shared library, used for the
     * 	|:terminal| command. The default depends on whether was build as a
     * 	32-bit or 64-bit executable.  If not found, "winpty.dll" is tried as
     * 	a fallback.
     * 	Environment variables are expanded |:set_env|.
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    winptydll: string;
}
/** @noSelf */
export interface Global {
    /**
     * boolean	(default on)
     * 			global or local to buffer |global-local|
     * 	When a file has been detected to have been changed outside of Vim and
     * 	it has not been changed inside of Vim, automatically read it again.
     * 	When the file has been deleted this is not done, so you have the text
     * 	from before it was deleted.  When it appears again then it is read.
     * 	|timestamp|
     * 	If this option has a local value, use this command to switch back to
     * 	using the global value: >
     * 		:set autoread<
     * <
     * 				 *'autowrite'* *'aw'* *'noautowrite'* *'noaw'*
     */
    autoread: boolean;
    /**
     * string	(Vi default for Unix: "yes", otherwise: "auto")
     * 			global or local to buffer |global-local|
     * 	When writing a file and a backup is made, this option tells how it's
     * 	done.  This is a comma separated list of words.
     */
    backupcopy: string;
    /**
     * string	(default "^\s*#\s*define")
     * 			global or local to buffer |global-local|
     * 	Pattern to be used to find a macro definition.  It is a search
     * 	pattern, just like for the "/" command.  This option is used for the
     * 	commands like "[i" and "[d" |include-search|.  The 'isident' option is
     * 	used to recognize the defined name after the match:
     * 		{match with 'define'}{non-ID chars}{defined name}{non-ID char}
     * 	See |option-backslash| about inserting backslashes to include a space
     * 	or backslash.
     * 	The default value is for C programs.  For C++ this value would be
     * 	useful, to include const type declarations: >
     * 		^\(#\s*define\|[a-z]*\s*const\s*[a-z]*\)
     * <	You can also use "\ze" just before the name and continue the pattern
     * 	to check what is following.  E.g. for Javascript, if a function is
     * 	defined with "func_name = function(args)": >
     * 		^\s*\ze\i\+\s*=\s*function(
     * <	If the function is defined with "func_name : function() {...": >
     * 	        ^\s*\ze\i\+\s*[:]\s*(*function\s*(
     * <	When using the ":set" command, you need to double the backslashes!
     * 	To avoid that use `:let` with a single quote string: >
     * 		let &l:define = '^\s*\ze\k\+\s*=\s*function('
     * <
     */
    define: string;
    /**
     * string	(default "")
     * 			global or local to buffer |global-local|
     * 	List of file names, separated by commas, that are used to lookup words
     * 	for keyword completion commands |i_CTRL-X_CTRL-K|.  Each file should
     * 	contain a list of words.  This can be one word per line, or several
     * 	words per line, separated by non-keyword characters (white space is
     * 	preferred).  Maximum line length is 510 bytes.
     */
    dictionary: string;
    /**
     * string	(default "")
     * 			global or local to buffer |global-local|
     * 	External program to use for "=" command.  When this option is empty
     * 	the internal formatting functions are used; either 'lisp', 'cindent'
     * 	or 'indentexpr'.  When Vim was compiled without internal formatting,
     * 	the "indent" program is used.
     * 	Environment variables are expanded |:set_env|.  See |option-backslash|
     * 	about including spaces and backslashes.
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    equalprg: string;
    /**
     * string	(default is very long)
     * 			global or local to buffer |global-local|
     * 	Scanf-like description of the format for the lines in the error file
     * 	(see |errorformat|).
     */
    errorformat: string;
    /**
     * string	(default "")
     * 			global or local to window |global-local|
     * 	Characters to fill the statuslines and vertical separators.
     * 	It is a comma separated list of items:
     */
    fillchars: string;
    /**
     * string (default "")
     * 			global or local to buffer |global-local|
     * 	The name of an external program that will be used to format the lines
     * 	selected with the |gq| operator.  The program must take the input on
     * 	stdin and produce the output on stdout.  The Unix program "fmt" is
     * 	such a program.
     * 	If the 'formatexpr' option is not empty it will be used instead.
     * 	Otherwise, if 'formatprg' option is an empty string, the internal
     * 	format function will be used |C-indenting|.
     * 	Environment variables are expanded |:set_env|.  See |option-backslash|
     * 	about including spaces and backslashes.
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    formatprg: string;
    /**
     * string	(default "^\s*#\s*include")
     * 			global or local to buffer |global-local|
     * 	Pattern to be used to find an include command.  It is a search
     * 	pattern, just like for the "/" command (See |pattern|).  The default
     * 	value is for C programs.  This option is used for the commands "[i",
     * 	"]I", "[d", etc.
     * 	Normally the 'isfname' option is used to recognize the file name that
     * 	comes after the matched pattern.  But if "\zs" appears in the pattern
     * 	then the text matched from "\zs" to the end, or until "\ze" if it
     * 	appears, is used as the file name.  Use this to include characters
     * 	that are not in 'isfname', such as a space.  You can then use
     * 	'includeexpr' to process the matched text.
     * 	See |option-backslash| about including spaces and backslashes.
     */
    include: string;
    /**
     * string	(default ":Man", Windows: ":help")
     * 			global or local to buffer |global-local|
     * 	Program to use for the |K| command.  Environment variables are
     * 	expanded |:set_env|.  ":help" may be used to access the Vim internal
     * 	help.  (Note that previously setting the global option to the empty
     * 	value did this, which is now deprecated.)
     * 	When the first character is ":", the command is invoked as a Vim
     * 	command prefixed with [count].
     * 	When "man" or "man -s" is used, Vim will automatically translate
     * 	a [count] for the "K" command to a section number.
     * 	See |option-backslash| about including spaces and backslashes.
     * 	Example: >
     * 		:set keywordprg=man\ -s
     * 		:set keywordprg=:Man
     * <	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    keywordprg: string;
    /**
     * string	(default is very long)
     * 			global or local to buffer |global-local|
     * 	Comma separated list of words that influence the Lisp indenting.
     * 	|'lisp'|
     */
    lispwords: string;
    /**
     * string	(default "")
     * 			global or local to buffer |global-local|
     * 	Encoding used for reading the output of external commands.  When empty,
     * 	encoding is not converted.
     * 	This is used for `:make`, `:lmake`, `:grep`, `:lgrep`, `:grepadd`,
     * 	`:lgrepadd`, `:cfile`, `:cgetfile`, `:caddfile`, `:lfile`, `:lgetfile`,
     * 	and `:laddfile`.
     */
    makeencoding: string;
    /**
     * string	(default "make")
     * 			global or local to buffer |global-local|
     * 	Program to use for the ":make" command.  See |:make_makeprg|.
     * 	This option may contain '%' and '#' characters (see  |:_%| and |:_#|),
     * 	which are expanded to the current and alternate file name.  Use |::S|
     * 	to escape file names in case they contain special characters.
     * 	Environment variables are expanded |:set_env|.  See |option-backslash|
     * 	about including spaces and backslashes.
     * 	Note that a '|' must be escaped twice: once for ":set" and once for
     * 	the interpretation of a command.  When you use a filter called
     * 	"myfilter" do it like this: >
     * 	    :set makeprg=gmake\ \\\|\ myfilter
     * <	The placeholder "$*" can be given (even multiple times) to specify
     * 	where the arguments will be included, for example: >
     * 	    :set makeprg=latex\ \\\\nonstopmode\ \\\\input\\{$*}
     * <	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    makeprg: string;
    /**
     * number	(default 0)
     * 			global or local to window |global-local|
     * 	Minimal number of screen lines to keep above and below the cursor.
     * 	This will make some context visible around where you are working.  If
     * 	you set it to a very large value (999) the cursor line will always be
     * 	in the middle of the window (except at the start or end of the file or
     * 	when long lines wrap).
     * 	After using the local value, go back the global value with one of
     * 	these two: >
     * 		setlocal scrolloff<
     * 		setlocal scrolloff=-1
     * <	For scrolling horizontally see 'sidescrolloff'.
     */
    scrolloff: number;
    /**
     * number (default 0)
     * 			global or local to window |global-local|
     * 	The minimal number of screen columns to keep to the left and to the
     * 	right of the cursor if 'nowrap' is set.  Setting this option to a
     * 	value greater than 0 while having |'sidescroll'| also at a non-zero
     * 	value makes some context visible in the line you are scrolling in
     * 	horizontally (except at beginning of the line).  Setting this option
     * 	to a large value (like 999) has the effect of keeping the cursor
     * 	horizontally centered in the window, as long as one does not come too
     * 	close to the beginning of the line.
     * 	After using the local value, go back the global value with one of
     * 	these two: >
     * 		setlocal sidescrolloff<
     * 		setlocal sidescrolloff=-1
     * <
     * 	Example: Try this together with 'sidescroll' and 'listchars' as
     * 		 in the following example to never allow the cursor to move
     * 		 onto the "extends" character: >
     */
    sidescrolloff: number;
    /**
     * string	(default empty)
     * 			global or local to window |global-local|
     * 	When nonempty, this option determines the content of the status line.
     * 	Also see |status-line|.
     */
    statusline: string;
    /**
     * string	(default "followic")
     * 			global or local to buffer |global-local|
     * 	This option specifies how case is handled when searching the tags
     * 	file:
     * 	   followic	Follow the 'ignorecase' option
     * 	   followscs    Follow the 'smartcase' and 'ignorecase' options
     * 	   ignore	Ignore case
     * 	   match	Match case
     * 	   smart	Ignore case unless an upper case letter is used
     */
    tagcase: string;
    /**
     * string	(default "./tags;,tags")
     * 			global or local to buffer |global-local|
     * 	Filenames for the tag command, separated by spaces or commas.  To
     * 	include a space or comma in a file name, precede it with a backslash
     * 	(see |option-backslash| about including spaces and backslashes).
     * 	When a file name starts with "./", the '.' is replaced with the path
     * 	of the current file.  But only when the 'd' flag is not included in
     * 	'cpoptions'.  Environment variables are expanded |:set_env|.  Also see
     * 	|tags-option|.
     * 	"*", "**" and other wildcards can be used to search for tags files in
     * 	a directory tree.  See |file-searching|.  E.g., "/lib/**\/tags" will
     * 	find all files named "tags" below "/lib".  The filename itself cannot
     * 	contain wildcards, it is used as-is.  E.g., "/lib/**\/tags?" will find
     * 	files called "tags?".
     * 	The |tagfiles()| function can be used to get a list of the file names
     * 	actually used.
     * 	The use of |:set+=| and |:set-=| is preferred when adding or removing
     * 	file names from the list.  This avoids problems when a future version
     * 	uses another default.
     */
    tags: string;
    /**
     * string	(default "")
     * 			global or local to buffer |global-local|
     * 	List of file names, separated by commas, that are used to lookup words
     * 	for thesaurus completion commands |i_CTRL-X_CTRL-T|.
     */
    thesaurus: string;
    /**
     * number	(default 1000)
     * 			global or local to buffer |global-local|
     * 	Maximum number of changes that can be undone.  Since undo information
     * 	is kept in memory, higher numbers will cause more memory to be used
     * 	(nevertheless, a single change can use an unlimited amount of memory).
     * 	Set to 0 for Vi compatibility: One level of undo and "u" undoes
     * 	itself: >
     * 		set ul=0
     * <	But you can also get Vi compatibility by including the 'u' flag in
     * 	'cpoptions', and still be able to use CTRL-R to repeat undo.
     * 	Also see |undo-two-ways|.
     * 	Set to -1 for no undo at all.  You might want to do this only for the
     * 	current buffer: >
     * 		setlocal ul=-1
     * <	This helps when you run out of memory for a single change.
     */
    undolevels: number;
    /**
     * string	(default "blowfish2")
     * 			global or local to buffer |global-local|
     * 	Method used for encryption when the buffer is written to a file:
     * 							*pkzip*
     * 	   zip		PkZip compatible method.  A weak kind of encryption.
     * 			Backwards compatible with Vim 7.2 and older.
     * 							*blowfish*
     * 	   blowfish	Blowfish method.  Medium strong encryption but it has
     * 			an implementation flaw.  Requires Vim 7.3 or later,
     * 			files can NOT be read by Vim 7.2 and older.  This adds
     * 			a "seed" to the file, every time you write the file
     * 			the encrypted bytes will be different.
     * 							*blowfish2*
     * 	   blowfish2	Blowfish method.  Medium strong encryption.  Requires
     * 			Vim 7.4.401 or later, files can NOT be read by Vim 7.3
     * 			and older.  This adds a "seed" to the file, every time
     * 			you write the file the encrypted bytes will be
     * 			different.  The whole undo file is encrypted, not just
     * 			the pieces of text.
     */
    cryptmethod: string;
}
/** @noSelf */
export interface Buffer {
    /**
     * boolean	(default on)
     * 			local to buffer
     * 	Copy indent from current line when starting a new line (typing <CR>
     * 	in Insert mode or when using the "o" or "O" command).  If you do not
     * 	type anything on the new line except <BS> or CTRL-D and then type
     * 	<Esc>, CTRL-O or <CR>, the indent is deleted again.  Moving the cursor
     * 	to another line has the same effect, unless the 'I' flag is included
     * 	in 'cpoptions'.
     * 	When autoindent is on, formatting (with the "gq" command or when you
     * 	reach 'textwidth' in Insert mode) uses the indentation of the first
     * 	line.
     * 	When 'smartindent' or 'cindent' is on the indent is changed in
     * 	a different way.
     * 	The 'autoindent' option is reset when the 'paste' option is set and
     * 	restored when 'paste' is reset.
     * 	{small difference from Vi: After the indent is deleted when typing
     * 	<Esc> or <CR>, the cursor position when moving up or down is after the
     * 	deleted indent; Vi puts the cursor somewhere in the deleted indent}.
     */
    autoindent: boolean;
    /**
     * boolean	(default on)
     * 			global or local to buffer |global-local|
     * 	When a file has been detected to have been changed outside of Vim and
     * 	it has not been changed inside of Vim, automatically read it again.
     * 	When the file has been deleted this is not done, so you have the text
     * 	from before it was deleted.  When it appears again then it is read.
     * 	|timestamp|
     * 	If this option has a local value, use this command to switch back to
     * 	using the global value: >
     * 		:set autoread<
     * <
     * 				 *'autowrite'* *'aw'* *'noautowrite'* *'noaw'*
     */
    autoread: boolean;
    /**
     * string	(Vi default for Unix: "yes", otherwise: "auto")
     * 			global or local to buffer |global-local|
     * 	When writing a file and a backup is made, this option tells how it's
     * 	done.  This is a comma separated list of words.
     */
    backupcopy: string;
    /**
     * boolean	(default off)
     * 			local to buffer
     * 	This option should be set before editing a binary file.  You can also
     * 	use the |-b| Vim argument.  When this option is switched on a few
     * 	options will be changed (also when it already was on):
     * 		'textwidth'  will be set to 0
     * 		'wrapmargin' will be set to 0
     * 		'modeline'   will be off
     * 		'expandtab'  will be off
     * 	Also, 'fileformat' and 'fileformats' options will not be used, the
     * 	file is read and written like 'fileformat' was "unix" (a single <NL>
     * 	separates lines).
     * 	The 'fileencoding' and 'fileencodings' options will not be used, the
     * 	file is read without conversion.
     * 	NOTE: When you start editing a(nother) file while the 'bin' option is
     * 	on, settings from autocommands may change the settings again (e.g.,
     * 	'textwidth'), causing trouble when editing.  You might want to set
     * 	'bin' again when the file has been loaded.
     * 	The previous values of these options are remembered and restored when
     * 	'bin' is switched from on to off.  Each buffer has its own set of
     * 	saved option values.
     * 	To edit a file with 'binary' set you can use the |++bin| argument.
     * 	This avoids you have to do ":set bin", which would have effect for all
     * 	files you edit.
     * 	When writing a file the <EOL> for the last line is only written if
     * 	there was one in the original file (normally Vim appends an <EOL> to
     * 	the last line if there is none; this would make the file longer).  See
     * 	the 'endofline' option.
     */
    binary: boolean;
    /**
     * boolean	(default off)
     * 			local to buffer
     * 	When writing a file and the following conditions are met, a BOM (Byte
     * 	Order Mark) is prepended to the file:
     * 	- this option is on
     * 	- the 'binary' option is off
     * 	- 'fileencoding' is "utf-8", "ucs-2", "ucs-4" or one of the little/big
     * 	  endian variants.
     * 	Some applications use the BOM to recognize the encoding of the file.
     * 	Often used for UCS-2 files on MS-Windows.  For other applications it
     * 	causes trouble, for example: "cat file1 file2" makes the BOM of file2
     * 	appear halfway through the resulting file.  Gcc doesn't accept a BOM.
     * 	When Vim reads a file and 'fileencodings' starts with "ucs-bom", a
     * 	check for the presence of the BOM is done and 'bomb' set accordingly.
     * 	Unless 'binary' is set, it is removed from the first line, so that you
     * 	don't see it when editing.  When you don't change the options, the BOM
     * 	will be restored when writing the file.
     */
    bomb: boolean;
    /**
     * string (default: "")
     * 			local to buffer
     * 	This option specifies what happens when a buffer is no longer
     * 	displayed in a window:
     * 	  <empty>	follow the global 'hidden' option
     * 	  hide		hide the buffer (don't unload it), also when 'hidden'
     * 			is not set
     * 	  unload	unload the buffer, also when 'hidden' is set or using
     * 			|:hide|
     * 	  delete	delete the buffer from the buffer list, also when
     * 			'hidden' is set or using |:hide|, like using
     * 			|:bdelete|
     * 	  wipe		wipe out the buffer from the buffer list, also when
     * 			'hidden' is set or using |:hide|, like using
     * 			|:bwipeout|
     */
    bufhidden: string;
    /**
     * boolean (default: on)
     * 			local to buffer
     * 	When this option is set, the buffer shows up in the buffer list.  If
     * 	it is reset it is not used for ":bnext", "ls", the Buffers menu, etc.
     * 	This option is reset by Vim for buffers that are only used to remember
     * 	a file name or marks.  Vim sets it when starting to edit a buffer.
     * 	But not when moving to a buffer with ":buffer".
     */
    buflisted: boolean;
    /**
     * string (default: "")
     * 			local to buffer
     * 	The value of this option specifies the type of a buffer:
     * 	  <empty>	normal buffer
     * 	  acwrite	buffer will always be written with |BufWriteCmd|s
     * 	  help		help buffer (do not set this manually)
     * 	  nofile	buffer is not related to a file, will not be written
     * 	  nowrite	buffer will not be written
     * 	  quickfix	list of errors |:cwindow| or locations |:lwindow|
     * 	  terminal	|terminal-emulator| buffer
     * 	  prompt	buffer where only the last line can be edited, meant
     * 			to be used by a plugin, see |prompt-buffer|
     */
    buftype: string;
    /**
     * number (default: 0)
     * 			local to buffer
     * 	|channel| connected to the buffer, or 0 if no channel is connected.
     * 	In a |:terminal| buffer this is the terminal channel.
     * 	Read-only.
     */
    channel: number;
    /**
     * boolean	(default off)
     * 			local to buffer
     * 	Enables automatic C program indenting.  See 'cinkeys' to set the keys
     * 	that trigger reindenting in insert mode and 'cinoptions' to set your
     * 	preferred indent style.
     * 	If 'indentexpr' is not empty, it overrules 'cindent'.
     * 	If 'lisp' is not on and both 'indentexpr' and 'equalprg' are empty,
     * 	the "=" operator indents using this algorithm rather than calling an
     * 	external program.
     * 	See |C-indenting|.
     * 	When you don't like the way 'cindent' works, try the 'smartindent'
     * 	option or 'indentexpr'.
     * 	This option is not used when 'paste' is set.
     */
    cindent: boolean;
    /**
     * string	(default "0{,0},0),0],:,0#,!^F,o,O,e")
     * 			local to buffer
     * 	A list of keys that, when typed in Insert mode, cause reindenting of
     * 	the current line.  Only used if 'cindent' is on and 'indentexpr' is
     * 	empty.
     * 	For the format of this option see |cinkeys-format|.
     * 	See |C-indenting|.
     */
    cinkeys: string;
    /**
     * string	(default "")
     * 			local to buffer
     * 	The 'cinoptions' affect the way 'cindent' reindents lines in a C
     * 	program.  See |cinoptions-values| for the values of this option, and
     * 	|C-indenting| for info on C indenting in general.
     */
    cinoptions: string;
    /**
     * string	(default "if,else,while,do,for,switch")
     * 			local to buffer
     * 	These keywords start an extra indent in the next line when
     * 	'smartindent' or 'cindent' is set.  For 'cindent' this is only done at
     * 	an appropriate place (inside {}).
     * 	Note that 'ignorecase' isn't used for 'cinwords'.  If case doesn't
     * 	matter, include the keyword both the uppercase and lowercase:
     * 	"if,If,IF".
     */
    cinwords: string;
    /**
     * string	(default "/*%s*\/")
     * 			local to buffer
     * 	A template for a comment.  The "%s" in the value is replaced with the
     * 	comment text.  Currently only used to add markers for folding, see
     * 	|fold-marker|.
     */
    commentstring: string;
    /**
     * string	(default: ".,w,b,u,t")
     * 			local to buffer
     * 	This option specifies how keyword completion |ins-completion| works
     * 	when CTRL-P or CTRL-N are used.  It is also used for whole-line
     * 	completion |i_CTRL-X_CTRL-L|.  It indicates the type of completion
     * 	and the places to scan.  It is a comma separated list of flags:
     * 	.	scan the current buffer ('wrapscan' is ignored)
     * 	w	scan buffers from other windows
     * 	b	scan other loaded buffers that are in the buffer list
     * 	u	scan the unloaded buffers that are in the buffer list
     * 	U	scan the buffers that are not in the buffer list
     * 	k	scan the files given with the 'dictionary' option
     * 	kspell  use the currently active spell checking |spell|
     * 	k{dict}	scan the file {dict}.  Several "k" flags can be given,
     * 		patterns are valid too.  For example: >
     * 			:set cpt=k/usr/dict/*,k~/spanish
     * <	s	scan the files given with the 'thesaurus' option
     * 	s{tsr}	scan the file {tsr}.  Several "s" flags can be given, patterns
     * 		are valid too.
     * 	i	scan current and included files
     * 	d	scan current and included files for defined name or macro
     * 		|i_CTRL-X_CTRL-D|
     * 	]	tag completion
     * 	t	same as "]"
     */
    complete: string;
    /**
     * string	(default: empty)
     * 			local to buffer
     * 	This option specifies a function to be used for Insert mode completion
     * 	with CTRL-X CTRL-U. |i_CTRL-X_CTRL-U|
     * 	See |complete-functions| for an explanation of how the function is
     * 	invoked and what it should return.
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    completefunc: string;
    /**
     * boolean	(default off)
     * 			local to buffer
     * 	Copy the structure of the existing lines indent when autoindenting a
     * 	new line.  Normally the new indent is reconstructed by a series of
     * 	tabs followed by spaces as required (unless |'expandtab'| is enabled,
     * 	in which case only spaces are used).  Enabling this option makes the
     * 	new line copy whatever characters were used for indenting on the
     * 	existing line.  'expandtab' has no effect on these characters, a Tab
     * 	remains a Tab.  If the new indent is greater than on the existing
     * 	line, the remaining space is filled in the normal manner.
     * 	See 'preserveindent'.
     */
    copyindent: boolean;
    /**
     * string	(default "^\s*#\s*define")
     * 			global or local to buffer |global-local|
     * 	Pattern to be used to find a macro definition.  It is a search
     * 	pattern, just like for the "/" command.  This option is used for the
     * 	commands like "[i" and "[d" |include-search|.  The 'isident' option is
     * 	used to recognize the defined name after the match:
     * 		{match with 'define'}{non-ID chars}{defined name}{non-ID char}
     * 	See |option-backslash| about inserting backslashes to include a space
     * 	or backslash.
     * 	The default value is for C programs.  For C++ this value would be
     * 	useful, to include const type declarations: >
     * 		^\(#\s*define\|[a-z]*\s*const\s*[a-z]*\)
     * <	You can also use "\ze" just before the name and continue the pattern
     * 	to check what is following.  E.g. for Javascript, if a function is
     * 	defined with "func_name = function(args)": >
     * 		^\s*\ze\i\+\s*=\s*function(
     * <	If the function is defined with "func_name : function() {...": >
     * 	        ^\s*\ze\i\+\s*[:]\s*(*function\s*(
     * <	When using the ":set" command, you need to double the backslashes!
     * 	To avoid that use `:let` with a single quote string: >
     * 		let &l:define = '^\s*\ze\k\+\s*=\s*function('
     * <
     */
    define: string;
    /**
     * string	(default "")
     * 			global or local to buffer |global-local|
     * 	List of file names, separated by commas, that are used to lookup words
     * 	for keyword completion commands |i_CTRL-X_CTRL-K|.  Each file should
     * 	contain a list of words.  This can be one word per line, or several
     * 	words per line, separated by non-keyword characters (white space is
     * 	preferred).  Maximum line length is 510 bytes.
     */
    dictionary: string;
    /**
     * boolean	(default on)
     * 			local to buffer
     * 	When writing a file and this option is off and the 'binary' option
     * 	is on, or 'fixeol' option is off, no <EOL> will be written for the
     * 	last line in the file.  This option is automatically set or reset when
     * 	starting to edit a new file, depending on whether file has an <EOL>
     * 	for the last line in the file.  Normally you don't have to set or
     * 	reset this option.
     * 	When 'binary' is off and 'fixeol' is on the value is not used when
     * 	writing the file.  When 'binary' is on or 'fixeol' is off it is used
     * 	to remember the presence of a <EOL> for the last line in the file, so
     * 	that when you write the file the situation from the original file can
     * 	be kept.  But you can change it if you want to.
     */
    endofline: boolean;
    /**
     * string	(default "")
     * 			global or local to buffer |global-local|
     * 	External program to use for "=" command.  When this option is empty
     * 	the internal formatting functions are used; either 'lisp', 'cindent'
     * 	or 'indentexpr'.  When Vim was compiled without internal formatting,
     * 	the "indent" program is used.
     * 	Environment variables are expanded |:set_env|.  See |option-backslash|
     * 	about including spaces and backslashes.
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    equalprg: string;
    /**
     * string	(default is very long)
     * 			global or local to buffer |global-local|
     * 	Scanf-like description of the format for the lines in the error file
     * 	(see |errorformat|).
     */
    errorformat: string;
    /**
     * boolean	(default off)
     * 			local to buffer
     * 	In Insert mode: Use the appropriate number of spaces to insert a
     * 	<Tab>.  Spaces are used in indents with the '>' and '<' commands and
     * 	when 'autoindent' is on.  To insert a real tab when 'expandtab' is
     * 	on, use CTRL-V<Tab>.  See also |:retab| and |ins-expandtab|.
     * 	This option is reset when the 'paste' option is set and restored when
     * 	the 'paste' option is reset.
     */
    expandtab: boolean;
    /**
     * string (default: "")
     * 			local to buffer
     * 	File-content encoding for the current buffer. Conversion is done with
     * 	iconv() or as specified with 'charconvert'.
     */
    fileencoding: string;
    /**
     * string (default: "")
     * 			local to buffer
     * 	When this option is set, the FileType autocommand event is triggered.
     * 	All autocommands that match with the value of this option will be
     * 	executed.  Thus the value of 'filetype' is used in place of the file
     * 	name.
     * 	Otherwise this option does not always reflect the current file type.
     * 	This option is normally set when the file type is detected.  To enable
     * 	this use the ":filetype on" command. |:filetype|
     * 	Setting this option to a different value is most useful in a modeline,
     * 	for a file for which the file type is not automatically recognized.
     * 	Example, for in an IDL file:
     * 		/* vim: set filetype=idl : *\/ ~
     * 	|FileType| |filetypes|
     * 	When a dot appears in the value then this separates two filetype
     * 	names.  Example:
     * 		/* vim: set filetype=c.doxygen : *\/ ~
     * 	This will use the "c" filetype first, then the "doxygen" filetype.
     * 	This works both for filetype plugins and for syntax files.  More than
     * 	one dot may appear.
     * 	This option is not copied to another buffer, independent of the 's' or
     * 	'S' flag in 'cpoptions'.
     * 	Only normal file name characters can be used, "/\*?[|<>" are illegal.
     */
    filetype: string;
    /**
     * boolean	(default on)
     * 			local to buffer
     * 	When writing a file and this option is on, <EOL> at the end of file
     * 	will be restored if missing. Turn this option off if you want to
     * 	preserve the situation from the original file.
     * 	When the 'binary' option is set the value of this option doesn't
     * 	matter.
     * 	See the 'endofline' option.
     */
    fixendofline: boolean;
    /**
     * string (default "")
     * 			local to buffer
     * 	Expression which is evaluated to format a range of lines for the |gq|
     * 	operator or automatic formatting (see 'formatoptions').  When this
     * 	option is empty 'formatprg' is used.
     */
    formatexpr: string;
    /**
     * string (default: "^\s*\d\+[\]:.)}\t ]\s*")
     * 			local to buffer
     * 	A pattern that is used to recognize a list header.  This is used for
     * 	the "n" flag in 'formatoptions'.
     * 	The pattern must match exactly the text that will be the indent for
     * 	the line below it.  You can use |/\ze| to mark the end of the match
     * 	while still checking more characters.  There must be a character
     * 	following the pattern, when it matches the whole line it is handled
     * 	like there is no match.
     * 	The default recognizes a number, followed by an optional punctuation
     * 	character and white space.
     */
    formatlistpat: string;
    /**
     * string (default: "tcqj", Vi default: "vt")
     * 			local to buffer
     * 	This is a sequence of letters which describes how automatic
     * 	formatting is to be done.  See |fo-table|.  When the 'paste' option is
     * 	on, no formatting is done (like 'formatoptions' is empty).  Commas can
     * 	be inserted for readability.
     * 	To avoid problems with flags that are added in the future, use the
     * 	"+=" and "-=" feature of ":set" |add-option-flags|.
     */
    formatoptions: string;
    /**
     * string (default "")
     * 			global or local to buffer |global-local|
     * 	The name of an external program that will be used to format the lines
     * 	selected with the |gq| operator.  The program must take the input on
     * 	stdin and produce the output on stdout.  The Unix program "fmt" is
     * 	such a program.
     * 	If the 'formatexpr' option is not empty it will be used instead.
     * 	Otherwise, if 'formatprg' option is an empty string, the internal
     * 	format function will be used |C-indenting|.
     * 	Environment variables are expanded |:set_env|.  See |option-backslash|
     * 	about including spaces and backslashes.
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    formatprg: string;
    /**
     * number (default 0)
     * 			local to buffer
     * 	Specifies whether :lmap or an Input Method (IM) is to be used in
     * 	Insert mode.  Valid values:
     * 		0	:lmap is off and IM is off
     * 		1	:lmap is ON and IM is off
     * 		2	:lmap is off and IM is ON
     * 	To always reset the option to zero when leaving Insert mode with <Esc>
     * 	this can be used: >
     * 		:inoremap <ESC> <ESC>:set iminsert=0<CR>
     * <	This makes :lmap and IM turn off automatically when leaving Insert
     * 	mode.
     * 	Note that this option changes when using CTRL-^ in Insert mode
     * 	|i_CTRL-^|.
     * 	The value is set to 1 when setting 'keymap' to a valid keymap name.
     * 	It is also used for the argument of commands like "r" and "f".
     */
    iminsert: number;
    /**
     * number (default -1)
     * 			local to buffer
     * 	Specifies whether :lmap or an Input Method (IM) is to be used when
     * 	entering a search pattern.  Valid values:
     * 		-1	the value of 'iminsert' is used, makes it look like
     * 			'iminsert' is also used when typing a search pattern
     * 		0	:lmap is off and IM is off
     * 		1	:lmap is ON and IM is off
     * 		2	:lmap is off and IM is ON
     * 	Note that this option changes when using CTRL-^ in Command-line mode
     * 	|c_CTRL-^|.
     * 	The value is set to 1 when it is not -1 and setting the 'keymap'
     * 	option to a valid keymap name.
     */
    imsearch: number;
    /**
     * string	(default "^\s*#\s*include")
     * 			global or local to buffer |global-local|
     * 	Pattern to be used to find an include command.  It is a search
     * 	pattern, just like for the "/" command (See |pattern|).  The default
     * 	value is for C programs.  This option is used for the commands "[i",
     * 	"]I", "[d", etc.
     * 	Normally the 'isfname' option is used to recognize the file name that
     * 	comes after the matched pattern.  But if "\zs" appears in the pattern
     * 	then the text matched from "\zs" to the end, or until "\ze" if it
     * 	appears, is used as the file name.  Use this to include characters
     * 	that are not in 'isfname', such as a space.  You can then use
     * 	'includeexpr' to process the matched text.
     * 	See |option-backslash| about including spaces and backslashes.
     */
    include: string;
    /**
     * string	(default "")
     * 			local to buffer
     * 	Expression to be used to transform the string found with the 'include'
     * 	option to a file name.  Mostly useful to change "." to "/" for Java: >
     * 		:set includeexpr=substitute(v:fname,'\\.','/','g')
     * <	The "v:fname" variable will be set to the file name that was detected.
     */
    includeexpr: string;
    /**
     * string	(default "")
     * 			local to buffer
     * 	Expression which is evaluated to obtain the proper indent for a line.
     * 	It is used when a new line is created, for the |=| operator and
     * 	in Insert mode as specified with the 'indentkeys' option.
     * 	When this option is not empty, it overrules the 'cindent' and
     * 	'smartindent' indenting.  When 'lisp' is set, this option is
     * 	overridden by the Lisp indentation algorithm.
     * 	When 'paste' is set this option is not used for indenting.
     * 	The expression is evaluated with |v:lnum| set to the line number for
     * 	which the indent is to be computed.  The cursor is also in this line
     * 	when the expression is evaluated (but it may be moved around).
     * 	The expression must return the number of spaces worth of indent.  It
     * 	can return "-1" to keep the current indent (this means 'autoindent' is
     * 	used for the indent).
     * 	Functions useful for computing the indent are |indent()|, |cindent()|
     * 	and |lispindent()|.
     * 	The evaluation of the expression must not have side effects!  It must
     * 	not change the text, jump to another window, etc.  Afterwards the
     * 	cursor position is always restored, thus the cursor may be moved.
     * 	Normally this option would be set to call a function: >
     * 		:set indentexpr=GetMyIndent()
     * <	Error messages will be suppressed, unless the 'debug' option contains
     * 	"msg".
     * 	See |indent-expression|.
     */
    indentexpr: string;
    /**
     * string	(default "0{,0},0),0],:,0#,!^F,o,O,e")
     * 			local to buffer
     * 	A list of keys that, when typed in Insert mode, cause reindenting of
     * 	the current line.  Only happens if 'indentexpr' isn't empty.
     * 	The format is identical to 'cinkeys', see |indentkeys-format|.
     * 	See |C-indenting| and |indent-expression|.
     */
    indentkeys: string;
    /**
     * boolean	(default off)
     * 			local to buffer
     * 	When doing keyword completion in insert mode |ins-completion|, and
     * 	'ignorecase' is also on, the case of the match is adjusted depending
     * 	on the typed text.  If the typed text contains a lowercase letter
     * 	where the match has an upper case letter, the completed part is made
     * 	lowercase.  If the typed text has no lowercase letters and the match
     * 	has a lowercase letter where the typed text has an uppercase letter,
     * 	and there is a letter before it, the completed part is made uppercase.
     * 	With 'noinfercase' the match is used as-is.
     */
    infercase: boolean;
    /**
     * string	(default "")
     * 			local to buffer
     * 	Name of a keyboard mapping.  See |mbyte-keymap|.
     * 	Setting this option to a valid keymap name has the side effect of
     * 	setting 'iminsert' to one, so that the keymap becomes effective.
     * 	'imsearch' is also set to one, unless it was -1
     * 	Only normal file name characters can be used, "/\*?[|<>" are illegal.
     */
    keymap: string;
    /**
     * string	(default ":Man", Windows: ":help")
     * 			global or local to buffer |global-local|
     * 	Program to use for the |K| command.  Environment variables are
     * 	expanded |:set_env|.  ":help" may be used to access the Vim internal
     * 	help.  (Note that previously setting the global option to the empty
     * 	value did this, which is now deprecated.)
     * 	When the first character is ":", the command is invoked as a Vim
     * 	command prefixed with [count].
     * 	When "man" or "man -s" is used, Vim will automatically translate
     * 	a [count] for the "K" command to a section number.
     * 	See |option-backslash| about including spaces and backslashes.
     * 	Example: >
     * 		:set keywordprg=man\ -s
     * 		:set keywordprg=:Man
     * <	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    keywordprg: string;
    /**
     * boolean	(default off)
     * 			local to buffer
     * 	Lisp mode: When <Enter> is typed in insert mode set the indent for
     * 	the next line to Lisp standards (well, sort of).  Also happens with
     * 	"cc" or "S".  'autoindent' must also be on for this to work.  The 'p'
     * 	flag in 'cpoptions' changes the method of indenting: Vi compatible or
     * 	better.  Also see 'lispwords'.
     * 	The '-' character is included in keyword characters.  Redefines the
     * 	"=" operator to use this same indentation algorithm rather than
     * 	calling an external program if 'equalprg' is empty.
     * 	This option is not used when 'paste' is set.
     */
    lisp: boolean;
    /**
     * string	(default is very long)
     * 			global or local to buffer |global-local|
     * 	Comma separated list of words that influence the Lisp indenting.
     * 	|'lisp'|
     */
    lispwords: string;
    /**
     * string	(default "")
     * 			global or local to buffer |global-local|
     * 	Encoding used for reading the output of external commands.  When empty,
     * 	encoding is not converted.
     * 	This is used for `:make`, `:lmake`, `:grep`, `:lgrep`, `:grepadd`,
     * 	`:lgrepadd`, `:cfile`, `:cgetfile`, `:caddfile`, `:lfile`, `:lgetfile`,
     * 	and `:laddfile`.
     */
    makeencoding: string;
    /**
     * string	(default "make")
     * 			global or local to buffer |global-local|
     * 	Program to use for the ":make" command.  See |:make_makeprg|.
     * 	This option may contain '%' and '#' characters (see  |:_%| and |:_#|),
     * 	which are expanded to the current and alternate file name.  Use |::S|
     * 	to escape file names in case they contain special characters.
     * 	Environment variables are expanded |:set_env|.  See |option-backslash|
     * 	about including spaces and backslashes.
     * 	Note that a '|' must be escaped twice: once for ":set" and once for
     * 	the interpretation of a command.  When you use a filter called
     * 	"myfilter" do it like this: >
     * 	    :set makeprg=gmake\ \\\|\ myfilter
     * <	The placeholder "$*" can be given (even multiple times) to specify
     * 	where the arguments will be included, for example: >
     * 	    :set makeprg=latex\ \\\\nonstopmode\ \\\\input\\{$*}
     * <	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    makeprg: string;
    /**
     * string	(default "(:),{:},[:]")
     * 			local to buffer
     * 	Characters that form pairs.  The |%| command jumps from one to the
     * 	other.
     * 	Only character pairs are allowed that are different, thus you cannot
     * 	jump between two double quotes.
     * 	The characters must be separated by a colon.
     * 	The pairs must be separated by a comma.  Example for including '<' and
     * 	'>' (HTML): >
     * 		:set mps+=<:>
     */
    matchpairs: string;
    /**
     * boolean	(default on)
     * 			local to buffer
     * 	When off the buffer contents cannot be changed.  The 'fileformat' and
     * 	'fileencoding' options also can't be changed.
     * 	Can be reset on startup with the |-M| command line argument.
     */
    modifiable: boolean;
    /**
     * boolean	(default off)
     * 			local to buffer
     * 	When on, the buffer is considered to be modified.  This option is set
     * 	when:
     * 	1. A change was made to the text since it was last written.  Using the
     * 	   |undo| command to go back to the original text will reset the
     * 	   option.  But undoing changes that were made before writing the
     * 	   buffer will set the option again, since the text is different from
     * 	   when it was written.
     * 	2. 'fileformat' or 'fileencoding' is different from its original
     * 	   value.  The original value is set when the buffer is read or
     * 	   written.  A ":set nomodified" command also resets the original
     * 	   values to the current values and the 'modified' option will be
     * 	   reset.
     * 	   Similarly for 'eol' and 'bomb'.
     * 	This option is not set when a change is made to the buffer as the
     * 	result of a BufNewFile, BufRead/BufReadPost, BufWritePost,
     * 	FileAppendPost or VimLeave autocommand event.  See |gzip-example| for
     * 	an explanation.
     * 	When 'buftype' is "nowrite" or "nofile" this option may be set, but
     * 	will be ignored.
     * 	Note that the text may actually be the same, e.g. 'modified' is set
     * 	when using "rA" on an "A".
     */
    modified: boolean;
    /**
     * string	(default "bin,hex")
     * 			local to buffer
     * 	This defines what bases Vim will consider for numbers when using the
     * 	CTRL-A and CTRL-X commands for adding to and subtracting from a number
     * 	respectively; see |CTRL-A| for more info on these commands.
     * 	alpha	If included, single alphabetical characters will be
     * 		incremented or decremented.  This is useful for a list with a
     * 		letter index a), b), etc.		*octal-nrformats*
     * 	octal	If included, numbers that start with a zero will be considered
     * 		to be octal.  Example: Using CTRL-A on "007" results in "010".
     * 	hex	If included, numbers starting with "0x" or "0X" will be
     * 		considered to be hexadecimal.  Example: Using CTRL-X on
     * 		"0x100" results in "0x0ff".
     * 	bin	If included, numbers starting with "0b" or "0B" will be
     * 		considered to be binary.  Example: Using CTRL-X on
     * 		"0b1000" subtracts one, resulting in "0b0111".
     * 	Numbers which simply begin with a digit in the range 1-9 are always
     * 	considered decimal.  This also happens for numbers that are not
     * 	recognized as octal or hex.
     */
    nrformats: string;
    /**
     * string	(default: empty)
     * 			local to buffer
     * 	This option specifies a function to be used for Insert mode omni
     * 	completion with CTRL-X CTRL-O. |i_CTRL-X_CTRL-O|
     * 	See |complete-functions| for an explanation of how the function is
     * 	invoked and what it should return.
     * 	This option is usually set by a filetype plugin:
     * 	|:filetype-plugin-on|
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    omnifunc: string;
    /**
     * boolean	(default off)
     * 			local to buffer
     * 	When changing the indent of the current line, preserve as much of the
     * 	indent structure as possible.  Normally the indent is replaced by a
     * 	series of tabs followed by spaces as required (unless |'expandtab'| is
     * 	enabled, in which case only spaces are used).  Enabling this option
     * 	means the indent will preserve as many existing characters as possible
     * 	for indenting, and only add additional tabs or spaces as required.
     * 	'expandtab' does not apply to the preserved white space, a Tab remains
     * 	a Tab.
     * 	NOTE: When using ">>" multiple times the resulting indent is a mix of
     * 	tabs and spaces.  You might not like this.
     * 	Also see 'copyindent'.
     * 	Use |:retab| to clean up white space.
     */
    preserveindent: boolean;
    /**
     * string	(default "\")
     * 			local to buffer
     * 	The characters that are used to escape quotes in a string.  Used for
     * 	objects like a', a" and a` |a'|.
     * 	When one of the characters in this option is found inside a string,
     * 	the following character will be skipped.  The default value makes the
     * 	text "foo\"bar\\" considered to be one string.
     */
    quoteescape: string;
    /**
     * boolean	(default off)
     * 			local to buffer
     * 	If on, writes fail unless you use a '!'.  Protects you from
     * 	accidentally overwriting a file.  Default on when Vim is started
     * 	in read-only mode ("vim -R") or when the executable is called "view".
     * 	When using ":w!" the 'readonly' option is reset for the current
     * 	buffer, unless the 'Z' flag is in 'cpoptions'.
     * 	When using the ":view" command the 'readonly' option is
     * 	set for the newly edited buffer.
     * 	See 'modifiable' for disallowing changes to the buffer.
     */
    readonly: boolean;
    /**
     * number	(default: 10000)
     * 			local to buffer
     * 	Maximum number of lines kept beyond the visible screen. Lines at the
     * 	top are deleted if new lines exceed this limit.
     * 	Minimum is 1, maximum is 100000.
     * 	Only in |terminal| buffers.
     */
    scrollback: number;
    /**
     * number	(default 8)
     * 			local to buffer
     * 	Number of spaces to use for each step of (auto)indent.  Used for
     * 	|'cindent'|, |>>|, |<<|, etc.
     * 	When zero the 'ts' value will be used.  Use the |shiftwidth()|
     * 	function to get the effective shiftwidth value.
     */
    shiftwidth: number;
    /**
     * boolean	(default off)
     * 			local to buffer
     * 	Do smart autoindenting when starting a new line.  Works for C-like
     * 	programs, but can also be used for other languages.  'cindent' does
     * 	something like this, works better in most cases, but is more strict,
     * 	see |C-indenting|.  When 'cindent' is on or 'indentexpr' is set,
     * 	setting 'si' has no effect.  'indentexpr' is a more advanced
     * 	alternative.
     * 	Normally 'autoindent' should also be on when using 'smartindent'.
     * 	An indent is automatically inserted:
     * 	- After a line ending in '{'.
     * 	- After a line starting with a keyword from 'cinwords'.
     * 	- Before a line starting with '}' (only with the "O" command).
     * 	When typing '}' as the first character in a new line, that line is
     * 	given the same indent as the matching '{'.
     * 	When typing '#' as the first character in a new line, the indent for
     * 	that line is removed, the '#' is put in the first column.  The indent
     * 	is restored for the next line.  If you don't want this, use this
     * 	mapping: ":inoremap # X^H#", where ^H is entered with CTRL-V CTRL-H.
     * 	When using the ">>" command, lines starting with '#' are not shifted
     * 	right.
     * 	This option is reset when 'paste' is set and restored when 'paste' is
     * 	reset.
     */
    smartindent: boolean;
    /**
     * number	(default 0)
     * 			local to buffer
     * 	Number of spaces that a <Tab> counts for while performing editing
     * 	operations, like inserting a <Tab> or using <BS>.  It "feels" like
     * 	<Tab>s are being inserted, while in fact a mix of spaces and <Tab>s is
     * 	used.  This is useful to keep the 'ts' setting at its standard value
     * 	of 8, while being able to edit like it is set to 'sts'.  However,
     * 	commands like "x" still work on the actual characters.
     * 	When 'sts' is zero, this feature is off.
     * 	When 'sts' is negative, the value of 'shiftwidth' is used.
     * 	'softtabstop' is set to 0 when the 'paste' option is set and restored
     * 	when 'paste' is reset.
     * 	See also |ins-expandtab|.  When 'expandtab' is not set, the number of
     * 	spaces is minimized by using <Tab>s.
     * 	The 'L' flag in 'cpoptions' changes how tabs are used when 'list' is
     * 	set.
     */
    softtabstop: number;
    /**
     * string	(default "[.?!]\_[\])'" \t]\+")
     * 			local to buffer
     * 	Pattern to locate the end of a sentence.  The following word will be
     * 	checked to start with a capital letter.  If not then it is highlighted
     * 	with SpellCap |hl-SpellCap| (unless the word is also badly spelled).
     * 	When this check is not wanted make this option empty.
     * 	Only used when 'spell' is set.
     * 	Be careful with special characters, see |option-backslash| about
     * 	including spaces and backslashes.
     * 	To set this option automatically depending on the language, see
     * 	|set-spc-auto|.
     */
    spellcapcheck: string;
    /**
     * string	(default empty)
     * 			local to buffer
     * 	Name of the word list file where words are added for the |zg| and |zw|
     * 	commands.  It must end in ".{encoding}.add".  You need to include the
     * 	path, otherwise the file is placed in the current directory.
     * 								*E765*
     * 	It may also be a comma separated list of names.  A count before the
     * 	|zg| and |zw| commands can be used to access each.  This allows using
     * 	a personal word list file and a project word list file.
     * 	When a word is added while this option is empty Vim will set it for
     * 	you: Using the first directory in 'runtimepath' that is writable.  If
     * 	there is no "spell" directory yet it will be created.  For the file
     * 	name the first language name that appears in 'spelllang' is used,
     * 	ignoring the region.
     * 	The resulting ".spl" file will be used for spell checking, it does not
     * 	have to appear in 'spelllang'.
     * 	Normally one file is used for all regions, but you can add the region
     * 	name if you want to.  However, it will then only be used when
     * 	'spellfile' is set to it, for entries in 'spelllang' only files
     * 	without region name will be found.
     * 	This option cannot be set from a |modeline| or in the |sandbox|, for
     * 	security reasons.
     */
    spellfile: string;
    /**
     * string	(default "en")
     * 			local to buffer
     * 	A comma separated list of word list names.  When the 'spell' option is
     * 	on spellchecking will be done for these languages.  Example: >
     * 		set spelllang=en_us,nl,medical
     * <	This means US English, Dutch and medical words are recognized.  Words
     * 	that are not recognized will be highlighted.
     * 	The word list name must consist of alphanumeric characters, a dash or
     * 	an underscore.  It should not include a comma or dot.  Using a dash is
     * 	recommended to separate the two letter language name from a
     * 	specification.  Thus "en-rare" is used for rare English words.
     * 	A region name must come last and have the form "_xx", where "xx" is
     * 	the two-letter, lower case region name.  You can use more than one
     * 	region by listing them: "en_us,en_ca" supports both US and Canadian
     * 	English, but not words specific for Australia, New Zealand or Great
     * 	Britain. (Note: currently en_au and en_nz dictionaries are older than
     * 	en_ca, en_gb and en_us).
     * 	If the name "cjk" is included East Asian characters are excluded from
     * 	spell checking.  This is useful when editing text that also has Asian
     * 	words.
     * 							*E757*
     * 	As a special case the name of a .spl file can be given as-is.  The
     * 	first "_xx" in the name is removed and used as the region name
     * 	(_xx is an underscore, two letters and followed by a non-letter).
     * 	This is mainly for testing purposes.  You must make sure the correct
     * 	encoding is used, Vim doesn't check it.
     * 	How the related spell files are found is explained here: |spell-load|.
     */
    spelllang: string;
    /**
     * string	(default "")
     * 			local to buffer
     * 	Comma separated list of suffixes, which are used when searching for a
     * 	file for the "gf", "[I", etc. commands.  Example: >
     * 		:set suffixesadd=.java
     * <
     * 				*'swapfile'* *'swf'* *'noswapfile'* *'noswf'*
     */
    suffixesadd: string;
    /**
     * boolean (default on)
     * 			local to buffer
     * 	Use a swapfile for the buffer.  This option can be reset when a
     * 	swapfile is not wanted for a specific buffer.  For example, with
     * 	confidential information that even root must not be able to access.
     * 	Careful: All text will be in memory:
     * 		- Don't use this for big files.
     * 		- Recovery will be impossible!
     * 	A swapfile will only be present when |'updatecount'| is non-zero and
     * 	'swapfile' is set.
     * 	When 'swapfile' is reset, the swap file for the current buffer is
     * 	immediately deleted.  When 'swapfile' is set, and 'updatecount' is
     * 	non-zero, a swap file is immediately created.
     * 	Also see |swap-file|.
     * 	If you want to open a new buffer without creating a swap file for it,
     * 	use the |:noswapfile| modifier.
     * 	See 'directory' for where the swap file is created.
     */
    swapfile: boolean;
    /**
     * number	(default 3000)
     * 			local to buffer
     * 	Maximum column in which to search for syntax items.  In long lines the
     * 	text after this column is not highlighted and following lines may not
     * 	be highlighted correctly, because the syntax state is cleared.
     * 	This helps to avoid very slow redrawing for an XML file that is one
     * 	long line.
     * 	Set to zero to remove the limit.
     */
    synmaxcol: number;
    /**
     * string	(default empty)
     * 			local to buffer
     * 	When this option is set, the syntax with this name is loaded, unless
     * 	syntax highlighting has been switched off with ":syntax off".
     * 	Otherwise this option does not always reflect the current syntax (the
     * 	b:current_syntax variable does).
     * 	This option is most useful in a modeline, for a file which syntax is
     * 	not automatically recognized.  Example, in an IDL file:
     * 		/* vim: set syntax=idl : *\/ ~
     * 	When a dot appears in the value then this separates two filetype
     * 	names.  Example:
     * 		/* vim: set syntax=c.doxygen : *\/ ~
     * 	This will use the "c" syntax first, then the "doxygen" syntax.
     * 	Note that the second one must be prepared to be loaded as an addition,
     * 	otherwise it will be skipped.  More than one dot may appear.
     * 	To switch off syntax highlighting for the current file, use: >
     * 		:set syntax=OFF
     * <	To switch syntax highlighting on according to the current value of the
     * 	'filetype' option: >
     * 		:set syntax=ON
     * <	What actually happens when setting the 'syntax' option is that the
     * 	Syntax autocommand event is triggered with the value as argument.
     * 	This option is not copied to another buffer, independent of the 's' or
     * 	'S' flag in 'cpoptions'.
     * 	Only normal file name characters can be used, "/\*?[|<>" are illegal.
     */
    syntax: string;
    /**
     * number	(default 8)
     * 			local to buffer
     * 	Number of spaces that a <Tab> in the file counts for.  Also see
     * 	|:retab| command, and 'softtabstop' option.
     */
    tabstop: number;
    /**
     * string	(default "followic")
     * 			global or local to buffer |global-local|
     * 	This option specifies how case is handled when searching the tags
     * 	file:
     * 	   followic	Follow the 'ignorecase' option
     * 	   followscs    Follow the 'smartcase' and 'ignorecase' options
     * 	   ignore	Ignore case
     * 	   match	Match case
     * 	   smart	Ignore case unless an upper case letter is used
     */
    tagcase: string;
    /**
     * string	(default: empty)
     * 			local to buffer
     * 	This option specifies a function to be used to perform tag searches.
     * 	The function gets the tag pattern and should return a List of matching
     * 	tags.  See |tag-function| for an explanation of how to write the
     * 	function and an example.
     */
    tagfunc: string;
    /**
     * string	(default "./tags;,tags")
     * 			global or local to buffer |global-local|
     * 	Filenames for the tag command, separated by spaces or commas.  To
     * 	include a space or comma in a file name, precede it with a backslash
     * 	(see |option-backslash| about including spaces and backslashes).
     * 	When a file name starts with "./", the '.' is replaced with the path
     * 	of the current file.  But only when the 'd' flag is not included in
     * 	'cpoptions'.  Environment variables are expanded |:set_env|.  Also see
     * 	|tags-option|.
     * 	"*", "**" and other wildcards can be used to search for tags files in
     * 	a directory tree.  See |file-searching|.  E.g., "/lib/**\/tags" will
     * 	find all files named "tags" below "/lib".  The filename itself cannot
     * 	contain wildcards, it is used as-is.  E.g., "/lib/**\/tags?" will find
     * 	files called "tags?".
     * 	The |tagfiles()| function can be used to get a list of the file names
     * 	actually used.
     * 	The use of |:set+=| and |:set-=| is preferred when adding or removing
     * 	file names from the list.  This avoids problems when a future version
     * 	uses another default.
     */
    tags: string;
    /**
     * number	(default 0)
     * 			local to buffer
     * 	Maximum width of text that is being inserted.  A longer line will be
     * 	broken after white space to get this width.  A zero value disables
     * 	this.
     * 	'textwidth' is set to 0 when the 'paste' option is set and restored
     * 	when 'paste' is reset.
     * 	When 'textwidth' is zero, 'wrapmargin' may be used.  See also
     * 	'formatoptions' and |ins-textwidth|.
     * 	When 'formatexpr' is set it will be used to break the line.
     */
    textwidth: number;
    /**
     * string	(default "")
     * 			global or local to buffer |global-local|
     * 	List of file names, separated by commas, that are used to lookup words
     * 	for thesaurus completion commands |i_CTRL-X_CTRL-T|.
     */
    thesaurus: string;
    /**
     * boolean	(default off)
     * 			local to buffer
     * 	When on, Vim automatically saves undo history to an undo file when
     * 	writing a buffer to a file, and restores undo history from the same
     * 	file on buffer read.
     * 	The directory where the undo file is stored is specified by 'undodir'.
     * 	For more information about this feature see |undo-persistence|.
     * 	The undo file is not read when 'undoreload' causes the buffer from
     * 	before a reload to be saved for undo.
     * 	When 'undofile' is turned off the undo file is NOT deleted.
     */
    undofile: boolean;
    /**
     * number	(default 1000)
     * 			global or local to buffer |global-local|
     * 	Maximum number of changes that can be undone.  Since undo information
     * 	is kept in memory, higher numbers will cause more memory to be used
     * 	(nevertheless, a single change can use an unlimited amount of memory).
     * 	Set to 0 for Vi compatibility: One level of undo and "u" undoes
     * 	itself: >
     * 		set ul=0
     * <	But you can also get Vi compatibility by including the 'u' flag in
     * 	'cpoptions', and still be able to use CTRL-R to repeat undo.
     * 	Also see |undo-two-ways|.
     * 	Set to -1 for no undo at all.  You might want to do this only for the
     * 	current buffer: >
     * 		setlocal ul=-1
     * <	This helps when you run out of memory for a single change.
     */
    undolevels: number;
    /**
     * number	(default 0)
     * 			local to buffer
     * 	Number of characters from the right window border where wrapping
     * 	starts.  When typing text beyond this limit, an <EOL> will be inserted
     * 	and inserting continues on the next line.
     * 	Options that add a margin, such as 'number' and 'foldcolumn', cause
     * 	the text width to be further reduced.  This is Vi compatible.
     * 	When 'textwidth' is non-zero, this option is not used.
     * 	See also 'formatoptions' and |ins-textwidth|.
     */
    wrapmargin: number;
    /**
     * string	(default: "")
     * 			local to buffer
     * 			{only for MS-Windows}
     * 	When this option is set it overrules 'shellslash' for completion:
     * 	- When this option is set to "slash", a forward slash is used for path
     * 	  completion in insert mode. This is useful when editing HTML tag, or
     * 	  Makefile with 'noshellslash' on Windows.
     * 	- When this option is set to "backslash", backslash is used. This is
     * 	  useful when editing a batch file with 'shellslash' set on Windows.
     * 	- When this option is empty, same character is used as for
     * 	  'shellslash'.
     * 	For Insert mode completion the buffer-local value is used.  For
     * 	command line completion the global value is used.
     */
    completeslash: string;
    /**
     * string	(default "blowfish2")
     * 			global or local to buffer |global-local|
     * 	Method used for encryption when the buffer is written to a file:
     * 							*pkzip*
     * 	   zip		PkZip compatible method.  A weak kind of encryption.
     * 			Backwards compatible with Vim 7.2 and older.
     * 							*blowfish*
     * 	   blowfish	Blowfish method.  Medium strong encryption but it has
     * 			an implementation flaw.  Requires Vim 7.3 or later,
     * 			files can NOT be read by Vim 7.2 and older.  This adds
     * 			a "seed" to the file, every time you write the file
     * 			the encrypted bytes will be different.
     * 							*blowfish2*
     * 	   blowfish2	Blowfish method.  Medium strong encryption.  Requires
     * 			Vim 7.4.401 or later, files can NOT be read by Vim 7.3
     * 			and older.  This adds a "seed" to the file, every time
     * 			you write the file the encrypted bytes will be
     * 			different.  The whole undo file is encrypted, not just
     * 			the pieces of text.
     */
    cryptmethod: string;
    /**
     * string	(default "")
     * 			local to buffer
     * 			{only available when compiled with the |+cryptv|
     * 			feature}
     * 	The key that is used for encrypting and decrypting the current buffer.
     * 	See |encryption| and 'cryptmethod'.
     * 	Careful: Do not set the key value by hand, someone might see the typed
     * 	key.  Use the |:X| command.  But you can make 'key' empty: >
     * 		:set key=
     * <	It is not possible to get the value of this option with ":set key" or
     * 	"echo &key".  This is to avoid showing it to someone who shouldn't
     * 	know.  It also means you cannot see it yourself once you have set it,
     * 	be careful not to make a typing error!
     * 	You can use "&key" in an expression to detect whether encryption is
     * 	enabled.  When 'key' is set it returns "*****" (five stars).
     */
    key: string;
    /**
     * string (default: "")
     * 			local to buffer
     * 	This option was supported on RISC OS, which has been removed.
     */
    osfiletype: string;
    /**
     * boolean	(default off)
     * 			local to buffer
     * 	Filenames are assumed to be 8 characters plus one extension of 3
     * 	characters.  Multiple dots in file names are not allowed.  When this
     * 	option is on, dots in file names are replaced with underscores when
     * 	adding an extension (".~" or ".swp").  This option is not available
     * 	for MS-DOS, because then it would always be on.  This option is useful
     * 	when editing files on an MS-DOS compatible filesystem, e.g., messydos
     * 	or crossdos.  When running the Win32 GUI version under Win32s, this
     * 	option is always on by default.
     */
    shortname: boolean;
    /**
     * number	(default 10000)
     * 			local to buffer
     * 			{not available when compiled without the
     * 			|+terminal| feature}
     * 	Number of scrollback lines to keep.  When going over this limit the
     * 	first 10% of the scrollback lines are deleted.  This is just to reduce
     * 	the memory usage.  See |Terminal-Normal|.
     */
    termwinscroll: number;
    /**
     * string	(default "")
     * 			local to buffer
     * 			{only available when compiled with the |+vartabs|
     * 			feature}
     * 	A list of the number of spaces that a <Tab> counts for while editing,
     * 	such as inserting a <Tab> or using <BS>.  It "feels" like variable-
     * 	width <Tab>s are being inserted, while in fact a mixture of spaces
     * 	and <Tab>s is used.  Tab widths are separated with commas, with the
     * 	final value applying to all subsequent tabs.
     */
    varsofttabstop: string;
    /**
     * string	(default "")
     * 			local to buffer
     * 			{only available when compiled with the |+vartabs|
     * 			feature}
     * 	A list of the number of spaces that a <Tab> in the file counts for,
     * 	separated by commas.  Each value corresponds to one tab, with the
     * 	final value applying to all subsequent tabs. For example: >
     * 		:set vartabstop=4,20,10,8
     * <	This will make the first tab 4 spaces wide, the second 20 spaces,
     * 	the third 10 spaces, and all following tabs 8 spaces.
     */
    vartabstop: string;
}
/** @noSelf */
export interface Window {
    /**
     * boolean (default off)
     * 			local to window
     * 	This option can be set to start editing Arabic text.
     * 	Setting this option will:
     * 	- Set the 'rightleft' option, unless 'termbidi' is set.
     * 	- Set the 'arabicshape' option, unless 'termbidi' is set.
     * 	- Set the 'keymap' option to "arabic"; in Insert mode CTRL-^ toggles
     * 	  between typing English and Arabic key mapping.
     * 	- Set the 'delcombine' option
     */
    arabic: boolean;
    /**
     * boolean (default off)
     * 			local to window
     * 	Every wrapped line will continue visually indented (same amount of
     * 	space as the beginning of that line), thus preserving horizontal blocks
     * 	of text.
     */
    breakindent: boolean;
    /**
     * string (default empty)
     * 			local to window
     * 	Settings for 'breakindent'. It can consist of the following optional
     * 	items and must be separated by a comma:
     * 		min:{n}	    Minimum text width that will be kept after
     * 			    applying 'breakindent', even if the resulting
     * 			    text should normally be narrower. This prevents
     * 			    text indented almost to the right window border
     * 			    occupying lot of vertical space when broken.
     * 		shift:{n}   After applying 'breakindent', the wrapped line's
     * 			    beginning will be shifted by the given number of
     * 			    characters.  It permits dynamic French paragraph
     * 			    indentation (negative) or emphasizing the line
     * 			    continuation (positive).
     * 		sbr	    Display the 'showbreak' value before applying the
     * 			    additional indent.
     * 	The default value for min is 20 and shift is 0.
     */
    breakindentopt: string;
    /**
     * string	(default "")
     * 			local to window
     * 	'colorcolumn' is a comma separated list of screen columns that are
     * 	highlighted with ColorColumn |hl-ColorColumn|.  Useful to align
     * 	text.  Will make screen redrawing slower.
     * 	The screen column can be an absolute number, or a number preceded with
     * 	'+' or '-', which is added to or subtracted from 'textwidth'. >
     */
    colorcolumn: string;
    /**
     * string (default: "")
     * 			local to window
     * 	Sets the modes in which text in the cursor line can also be concealed.
     * 	When the current mode is listed then concealing happens just like in
     * 	other lines.
     * 	  n		Normal mode
     * 	  v		Visual mode
     * 	  i		Insert mode
     * 	  c		Command line editing, for 'incsearch'
     */
    concealcursor: string;
    /**
     * number (default 0)
     * 			local to window
     * 	Determine how text with the "conceal" syntax attribute |:syn-conceal|
     * 	is shown:
     */
    conceallevel: number;
    /**
     * boolean  (default off)
     * 			local to window
     * 	When this option is set, as the cursor in the current
     * 	window moves other cursorbound windows (windows that also have
     * 	this option set) move their cursors to the corresponding line and
     * 	column.  This option is useful for viewing the
     * 	differences between two versions of a file (see 'diff'); in diff mode,
     * 	inserted and deleted lines (though not characters within a line) are
     * 	taken into account.
     */
    cursorbind: boolean;
    /**
     * boolean	(default off)
     * 			local to window
     * 	Highlight the screen column of the cursor with CursorColumn
     * 	|hl-CursorColumn|.  Useful to align text.  Will make screen redrawing
     * 	slower.
     * 	If you only want the highlighting in the current window you can use
     * 	these autocommands: >
     * 		au WinLeave * set nocursorline nocursorcolumn
     * 		au WinEnter * set cursorline cursorcolumn
     * <
     */
    cursorcolumn: boolean;
    /**
     * boolean	(default off)
     * 			local to window
     * 	Highlight the screen line of the cursor with CursorLine
     * 	|hl-CursorLine|.  Useful to easily spot the cursor.  Will make screen
     * 	redrawing slower.
     * 	When Visual mode is active the highlighting isn't used to make it
     * 	easier to see the selected text.
     */
    cursorline: boolean;
    /**
     * boolean	(default off)
     * 			local to window
     * 	Join the current window in the group of windows that shows differences
     * 	between files.  See |diff-mode|.
     */
    diff: boolean;
    /**
     * string	(default "")
     * 			global or local to window |global-local|
     * 	Characters to fill the statuslines and vertical separators.
     * 	It is a comma separated list of items:
     */
    fillchars: string;
    /**
     * string (default "0")
     * 			local to window
     * 	When and how to draw the foldcolumn. Valid values are:
     * 	    "auto":       resize to the maximum amount of folds to display.
     * 	    "auto:[1-9]": resize to accommodate multiple folds up to the
     * 			  selected level
     *             0:            to disable foldcolumn
     * 	    "[1-9]":      to display a fixed number of columns
     * 	See |folding|.
     */
    foldcolumn: string;
    /**
     * boolean (default on)
     * 			local to window
     * 	When off, all folds are open.  This option can be used to quickly
     * 	switch between showing all text unfolded and viewing the text with
     * 	folds (including manually opened or closed folds).  It can be toggled
     * 	with the |zi| command.  The 'foldcolumn' will remain blank when
     * 	'foldenable' is off.
     * 	This option is set by commands that create a new fold or close a fold.
     * 	See |folding|.
     */
    foldenable: boolean;
    /**
     * string (default: "0")
     * 			local to window
     * 	The expression used for when 'foldmethod' is "expr".  It is evaluated
     * 	for each line to obtain its fold level.  See |fold-expr|.
     */
    foldexpr: string;
    /**
     * string (default: "#")
     * 			local to window
     * 	Used only when 'foldmethod' is "indent".  Lines starting with
     * 	characters in 'foldignore' will get their fold level from surrounding
     * 	lines.  White space is skipped before checking for this character.
     * 	The default "#" works well for C programs.  See |fold-indent|.
     */
    foldignore: string;
    /**
     * number (default: 0)
     * 			local to window
     * 	Sets the fold level: Folds with a higher level will be closed.
     * 	Setting this option to zero will close all folds.  Higher numbers will
     * 	close fewer folds.
     * 	This option is set by commands like |zm|, |zM| and |zR|.
     * 	See |fold-foldlevel|.
     */
    foldlevel: number;
    /**
     * string (default: "{{{,}}}")
     * 			local to window
     * 	The start and end marker used when 'foldmethod' is "marker".  There
     * 	must be one comma, which separates the start and end marker.  The
     * 	marker is a literal string (a regular expression would be too slow).
     * 	See |fold-marker|.
     */
    foldmarker: string;
    /**
     * string (default: "manual")
     * 			local to window
     * 	The kind of folding used for the current window.  Possible values:
     * 	|fold-manual|	manual	    Folds are created manually.
     * 	|fold-indent|	indent	    Lines with equal indent form a fold.
     * 	|fold-expr|	expr	    'foldexpr' gives the fold level of a line.
     * 	|fold-marker|	marker	    Markers are used to specify folds.
     * 	|fold-syntax|	syntax	    Syntax highlighting items specify folds.
     * 	|fold-diff|	diff	    Fold text that is not changed.
     */
    foldmethod: string;
    /**
     * number (default: 1)
     * 			local to window
     * 	Sets the number of screen lines above which a fold can be displayed
     * 	closed.  Also for manually closed folds.  With the default value of
     * 	one a fold can only be closed if it takes up two or more screen lines.
     * 	Set to zero to be able to close folds of just one screen line.
     * 	Note that this only has an effect on what is displayed.  After using
     * 	"zc" to close a fold, which is displayed open because it's smaller
     * 	than 'foldminlines', a following "zc" may close a containing fold.
     */
    foldminlines: number;
    /**
     * number (default: 20)
     * 			local to window
     * 	Sets the maximum nesting of folds for the "indent" and "syntax"
     * 	methods.  This avoids that too many folds will be created.  Using more
     * 	than 20 doesn't work, because the internal limit is 20.
     */
    foldnestmax: number;
    /**
     * string (default: "foldtext()")
     * 			local to window
     * 	An expression which is used to specify the text displayed for a closed
     * 	fold.  See |fold-foldtext|.
     */
    foldtext: string;
    /**
     * boolean	(default off)
     * 			local to window
     * 	If on, Vim will wrap long lines at a character in 'breakat' rather
     * 	than at the last character that fits on the screen.  Unlike
     * 	'wrapmargin' and 'textwidth', this does not insert <EOL>s in the file,
     * 	it only affects the way the file is displayed, not its contents.
     * 	If 'breakindent' is set, line is visually indented. Then, the value
     * 	of 'showbreak' is used to put in front of wrapped lines. This option
     * 	is not used when the 'wrap' option is off.
     * 	Note that <Tab> characters after an <EOL> are mostly not displayed
     * 	with the right amount of white space.
     */
    linebreak: boolean;
    /**
     * boolean	(default off)
     * 			local to window
     * 	List mode: Show tabs as CTRL-I is displayed, display $ after end of
     * 	line.  Useful to see the difference between tabs and spaces and for
     * 	trailing blanks.  Further changed by the 'listchars' option.
     */
    list: boolean;
    /**
     * boolean	(default off)
     * 			local to window
     * 	Print the line number in front of each line.  When the 'n' option is
     * 	excluded from 'cpoptions' a wrapped line will not use the column of
     * 	line numbers.
     * 	Use the 'numberwidth' option to adjust the room for the line number.
     * 	When a long, wrapped line doesn't start with the first character, '-'
     * 	characters are put before the number.
     * 	For highlighting see |hl-LineNr|, |hl-CursorLineNr|, and the
     * 	|:sign-define| "numhl" argument.
     * 						*number_relativenumber*
     * 	The 'relativenumber' option changes the displayed number to be
     * 	relative to the cursor.  Together with 'number' there are these
     * 	four combinations (cursor in line 3):
     */
    number: boolean;
    /**
     * number	(Vim default: 4  Vi default: 8)
     * 			local to window
     * 	Minimal number of columns to use for the line number.  Only relevant
     * 	when the 'number' or 'relativenumber' option is set or printing lines
     * 	with a line number. Since one space is always between the number and
     * 	the text, there is one less character for the number itself.
     * 	The value is the minimum width.  A bigger width is used when needed to
     * 	fit the highest line number in the buffer respectively the number of
     * 	rows in the window, depending on whether 'number' or 'relativenumber'
     * 	is set. Thus with the Vim default of 4 there is room for a line number
     * 	up to 999. When the buffer has 1000 lines five columns will be used.
     * 	The minimum value is 1, the maximum value is 20.
     */
    numberwidth: number;
    /**
     * boolean (default off)
     * 			local to window
     * 	Identifies the preview window.  Only one window can have this option
     * 	set.  It's normally not set directly, but by using one of the commands
     * 	|:ptag|, |:pedit|, etc.
     */
    previewwindow: boolean;
    /**
     * boolean	(default off)
     * 			local to window
     * 	Show the line number relative to the line with the cursor in front of
     * 	each line. Relative line numbers help you use the |count| you can
     * 	precede some vertical motion commands (e.g. j k + -) with, without
     * 	having to calculate it yourself. Especially useful in combination with
     * 	other commands (e.g. y d c < > gq gw =).
     * 	When the 'n' option is excluded from 'cpoptions' a wrapped
     * 	line will not use the column of line numbers.
     * 	The 'numberwidth' option can be used to set the room used for the line
     * 	number.
     * 	When a long, wrapped line doesn't start with the first character, '-'
     * 	characters are put before the number.
     * 	See |hl-LineNr|  and |hl-CursorLineNr| for the highlighting used for
     * 	the number.
     */
    relativenumber: boolean;
    /**
     * boolean	(default off)
     * 			local to window
     * 	When on, display orientation becomes right-to-left, i.e., characters
     * 	that are stored in the file appear from the right to the left.
     * 	Using this option, it is possible to edit files for languages that
     * 	are written from the right to the left such as Hebrew and Arabic.
     * 	This option is per window, so it is possible to edit mixed files
     * 	simultaneously, or to view the same file in both ways (this is
     * 	useful whenever you have a mixed text file with both right-to-left
     * 	and left-to-right strings so that both sets are displayed properly
     * 	in different windows).  Also see |rileft.txt|.
     */
    rightleft: boolean;
    /**
     * string	(default "search")
     * 			local to window
     * 	Each word in this option enables the command line editing to work in
     * 	right-to-left mode for a group of commands:
     */
    rightleftcmd: string;
    /**
     * number	(default: half the window height)
     * 			local to window
     * 	Number of lines to scroll with CTRL-U and CTRL-D commands.  Will be
     * 	set to half the number of lines in the window when the window size
     * 	changes.  If you give a count to the CTRL-U or CTRL-D command it will
     * 	be used as the new value for 'scroll'.  Reset to half the window
     * 	height with ":set scroll=0".
     */
    scroll: number;
    /**
     * boolean  (default off)
     * 			local to window
     * 	See also |scroll-binding|.  When this option is set, the current
     * 	window scrolls as other scrollbind windows (windows that also have
     * 	this option set) scroll.  This option is useful for viewing the
     * 	differences between two versions of a file, see 'diff'.
     * 	See |'scrollopt'| for options that determine how this option should be
     * 	interpreted.
     * 	This option is mostly reset when splitting a window to edit another
     * 	file.  This means that ":split | edit file" results in two windows
     * 	with scroll-binding, but ":split file" does not.
     */
    scrollbind: boolean;
    /**
     * number	(default 0)
     * 			global or local to window |global-local|
     * 	Minimal number of screen lines to keep above and below the cursor.
     * 	This will make some context visible around where you are working.  If
     * 	you set it to a very large value (999) the cursor line will always be
     * 	in the middle of the window (except at the start or end of the file or
     * 	when long lines wrap).
     * 	After using the local value, go back the global value with one of
     * 	these two: >
     * 		setlocal scrolloff<
     * 		setlocal scrolloff=-1
     * <	For scrolling horizontally see 'sidescrolloff'.
     */
    scrolloff: number;
    /**
     * number (default 0)
     * 			global or local to window |global-local|
     * 	The minimal number of screen columns to keep to the left and to the
     * 	right of the cursor if 'nowrap' is set.  Setting this option to a
     * 	value greater than 0 while having |'sidescroll'| also at a non-zero
     * 	value makes some context visible in the line you are scrolling in
     * 	horizontally (except at beginning of the line).  Setting this option
     * 	to a large value (like 999) has the effect of keeping the cursor
     * 	horizontally centered in the window, as long as one does not come too
     * 	close to the beginning of the line.
     * 	After using the local value, go back the global value with one of
     * 	these two: >
     * 		setlocal sidescrolloff<
     * 		setlocal sidescrolloff=-1
     * <
     * 	Example: Try this together with 'sidescroll' and 'listchars' as
     * 		 in the following example to never allow the cursor to move
     * 		 onto the "extends" character: >
     */
    sidescrolloff: number;
    /**
     * string	(default "auto")
     * 			local to window
     * 	When and how to draw the signcolumn. Valid values are:
     * 	   "auto"   	only when there is a sign to display
     * 	   "auto:[1-9]" resize to accommodate multiple signs up to the
     * 	                given number (maximum 9), e.g. "auto:4"
     * 	   "no"	    	never
     * 	   "yes"    	always
     * 	   "yes:[1-9]"  always, with fixed space for signs up to the given
     * 	                number (maximum 9), e.g. "yes:3"
     */
    signcolumn: string;
    /**
     * boolean	(default off)
     * 			local to window
     * 	When on spell checking will be done.  See |spell|.
     * 	The languages are specified with 'spelllang'.
     */
    spell: boolean;
    /**
     * string	(default empty)
     * 			global or local to window |global-local|
     * 	When nonempty, this option determines the content of the status line.
     * 	Also see |status-line|.
     */
    statusline: string;
    /**
     * number	(default 0)
     * 			local to window
     * 	Enables pseudo-transparency for a floating window. Valid values are in
     * 	the range of 0 for fully opaque window (disabled) to 100 for fully
     * 	transparent background. Values between 0-30 are typically most useful.
     */
    winblend: number;
    /**
     * string (default empty)
     * 			local to window
     * 	Window-local highlights.  Comma-delimited list of highlight
     * 	|group-name| pairs "{hl-builtin}:{hl},..." where each {hl-builtin} is
     * 	a built-in |highlight-groups| item to be overridden by {hl} group in
     * 	the window.  Only built-in |highlight-groups| are supported, not
     * 	syntax highlighting (use |:ownsyntax| for that).
     */
    winhighlight: string;
    /**
     * boolean	(default off)
     * 			local to window
     * 	Keep the window height when windows are opened or closed and
     * 	'equalalways' is set.  Also for |CTRL-W_=|.  Set by default for the
     * 	|preview-window| and |quickfix-window|.
     * 	The height may be changed anyway when running out of room.
     */
    winfixheight: boolean;
    /**
     * boolean	(default off)
     * 			local to window
     * 	Keep the window width when windows are opened or closed and
     * 	'equalalways' is set.  Also for |CTRL-W_=|.
     * 	The width may be changed anyway when running out of room.
     */
    winfixwidth: boolean;
    /**
     * boolean	(default on)
     * 			local to window
     * 	This option changes how text is displayed.  It doesn't change the text
     * 	in the buffer, see 'textwidth' for that.
     * 	When on, lines longer than the width of the window will wrap and
     * 	displaying continues on the next line.  When off lines will not wrap
     * 	and only part of long lines will be displayed.  When the cursor is
     * 	moved to a part that is not shown, the screen will scroll
     * 	horizontally.
     * 	The line will be broken in the middle of a word if necessary.  See
     * 	'linebreak' to get the break at a word boundary.
     * 	To make scrolling horizontally a bit more useful, try this: >
     * 		:set sidescroll=5
     * 		:set listchars+=precedes:<,extends:>
     * <	See 'sidescroll', 'listchars' and |wrap-off|.
     * 	This option can't be set from a |modeline| when the 'diff' option is
     * 	on.
     */
    wrap: boolean;
    /**
     * string (default: "number,line")
     * 			local to window
     * 			{not available when compiled without the |+syntax|
     * 			feature}
     * 	Comma separated list of settings for how 'cursorline' is displayed.
     * 	Valid values:
     * 	"line"		Highlight the text line of the cursor with
     * 			CursorLine |hl-CursorLine|.
     * 	"screenline"	Highlight only the screen line of the cursor with
     * 			CursorLine |hl-CursorLine|.
     * 	"number"	Highlight the line number of the cursor with
     * 			CursorLineNr |hl-CursorLineNr|.
     */
    cursorlineopt: string;
    /**
     * string	(default "")
     * 			local to window
     * 	The key that starts a CTRL-W command in a terminal window.  Other keys
     * 	are sent to the job running in the window.
     * 	The <> notation can be used, e.g.: >
     * 		:set termwinkey=<C-L>
     * <	The string must be one key stroke but can be multiple bytes.
     * 	When not set CTRL-W is used, so that CTRL-W : gets you to the command
     * 	line.  If 'termwinkey' is set to CTRL-L then CTRL-L : gets you to the
     * 	command line.
     */
    termwinkey: string;
    /**
     * string	(default "")
     * 			local to window
     * 	Size of the |terminal| window.  Format: {rows}x{columns} or
     * 	{rows}*{columns}.
     * 	- When empty the terminal gets the size from the window.
     * 	- When set with a "x" (e.g., "24x80") the terminal size is not
     * 	  adjusted to the window size.  If the window is smaller only the
     * 	  top-left part is displayed.
     * 	- When set with a "*" (e.g., "10*50") the terminal size follows the
     * 	  window size, but will not be smaller than the specified rows and/or
     * 	  columns.
     * 	- When rows is zero then use the height of the window.
     * 	- When columns is zero then use the width of the window.
     * 	- Using "0x0" or "0*0" is the same as empty.
     */
    termwinsize: string;
    /**
     * string (default empty)
     * 			local to window
     * 	Highlight group name to use for this window instead of the Normal
     * 	color |hl-Normal|.
     */
    wincolor: string;
}