/** This is automatically generated file. Do not modify this file manually. */
/** @noResolution */
/** @noSelfInFile */
import type { INvimFloatWinConfig } from "./utils";
/** @noSelf */
export interface Lsp {
    /**
     * Add the folder at path to the workspace folders. If {path} is
     * not provided, the user will be prompted for a path using
     * |input()|.
     * @signature `add_workspace_folder({workspace_folder})`
     */
    add_workspace_folder: (workspace_folder: unknown) => unknown;
    /**
     * Applies a `TextDocumentEdit`, which is a list of changes to a
     * single document.
     * @param text_document_edit table: a `TextDocumentEdit` object
     * @param index number: Optional index of the edit,
     *                           if from a list of edits (or nil, if
     *                           not from a list)
     * @signature `apply_text_document_edit({text_document_edit}, {index}, {offset_encoding})`
     * @reference https://microsoft.github.io/language-server-protocol/specifications/specification-current/#textDocumentEdit
     */
    apply_text_document_edit: (text_document_edit: unknown, index: unknown, offset_encoding: unknown) => unknown;
    /**
     * Applies a list of text edits to a buffer.
     * @param text_edits table list of `TextEdit` objects
     * @param bufnr number Buffer id
     * @param offset_encoding string utf-8|utf-16|utf-32
     * @signature `apply_text_edits({text_edits}, {bufnr}, {offset_encoding})`
     * @reference https://microsoft.github.io/language-server-protocol/specifications/specification-current/#textEdit
     */
    apply_text_edits: (text_edits: unknown, bufnr: unknown, offset_encoding: unknown) => unknown;
    /**
     * Applies a `WorkspaceEdit`.
     * @param workspace_edit table `WorkspaceEdit`
     * @param offset_encoding string utf-8|utf-16|utf-32 (required)
     * @signature `apply_workspace_edit({workspace_edit}, {offset_encoding})`
     */
    apply_workspace_edit: (workspace_edit: unknown, offset_encoding: unknown) => unknown;
    /**
     * Implements the `textDocument/did…` notifications required to
     * track a buffer for any language server.
     * Without calling this, the server won't be notified of changes
     * to a buffer.
     * @param bufnr (number) Buffer handle, or 0 for current
     * @param client_id (number) Client id
     * @signature `buf_attach_client({bufnr}, {client_id})`
     */
    buf_attach_client: (bufnr: unknown, client_id: unknown) => unknown;
    /**
     * Removes document highlights from a buffer.
     * @param bufnr number Buffer id
     * @signature `buf_clear_references({bufnr})`
     */
    buf_clear_references: (bufnr: unknown) => unknown;
    /**
     * Detaches client from the specified buffer. Note: While the
     * server is notified that the text document (buffer) was closed,
     * it is still able to send notifications should it ignore this
     * notification.
     * @param bufnr number Buffer handle, or 0 for current
     * @param client_id number Client id
     * @signature `buf_detach_client({bufnr}, {client_id})`
     */
    buf_detach_client: (bufnr: unknown, client_id: unknown) => unknown;
    /**
     * Gets a map of client_id:client pairs for the given buffer,
     * where each value is a |vim.lsp.client| object.
     * @param bufnr (optional, number): Buffer handle, or 0 for
     *              current
     * @signature `buf_get_clients({bufnr})`
     */
    buf_get_clients: (bufnr: unknown) => unknown;
    /**
     * Shows a list of document highlights for a certain buffer.
     * @param bufnr number Buffer id
     * @param references table List of `DocumentHighlight`
     *                        objects to highlight
     * @param offset_encoding string One of "utf-8", "utf-16",
     *                        "utf-32".
     * @signature `buf_highlight_references({bufnr}, {references}, {offset_encoding})`
     * @reference https://microsoft.github.io/language-server-protocol/specifications/specification-3-17/#documentHighlight
     */
    buf_highlight_references: (bufnr: unknown, references: unknown, offset_encoding: unknown) => unknown;
    /**
     * Checks if a buffer is attached for a particular client.
     * @param bufnr (number) Buffer handle, or 0 for current
     * @param client_id (number) the client id
     * @signature `buf_is_attached({bufnr}, {client_id})`
     */
    buf_is_attached: (bufnr: unknown, client_id: unknown) => unknown;
    /**
     * Send a notification to a server
     * @param bufnr [number] (optional): The number of the buffer
     * @param method [string]: Name of the request method
     * @param params [string]: Arguments to send to the server
     * @returns true if any client returns true; false otherwise
     * @signature `buf_notify({bufnr}, {method}, {params})`
     */
    buf_notify: (bufnr: unknown, method: unknown, params: unknown) => unknown;
    /**
     * Sends an async request for all active clients attached to the
     * buffer.
     * @param bufnr (number) Buffer handle, or 0 for current.
     * @param method (string) LSP method name
     * @param params (optional, table) Parameters to send to the
     *                server
     * @param handler (optional, function) See |lsp-handler| If nil,
     *                follows resolution strategy defined in
     *                |lsp-handler-configuration|
     * @returns 2-tuple:
     *     • Map of client-id:request-id pairs for all successful
     *       requests.
     *     • Function which can be used to cancel all the requests.
     *       You could instead iterate all clients and call their
     *       `cancel_request()` methods.
     *
     * @signature `buf_request({bufnr}, {method}, {params}, {handler})`
     */
    buf_request: (bufnr: unknown, method: unknown, params: unknown, handler: unknown) => unknown;
    /**
     * Sends an async request for all active clients attached to the
     * buffer. Executes the callback on the combined result.
     * Parameters are the same as |vim.lsp.buf_request()| but the
     * return result and callback are different.
     * @param bufnr (number) Buffer handle, or 0 for current.
     * @param method (string) LSP method name
     * @param params (optional, table) Parameters to send to the
     *                 server
     * @param callback (function) The callback to call when all
     *                 requests are finished.
     * @returns (function) A function that will cancel all requests which
     *     is the same as the one returned from `buf_request`.
     * @signature `buf_request_all({bufnr}, {method}, {params}, {callback})`
     */
    buf_request_all: (bufnr: unknown, method: unknown, params: unknown, callback: unknown) => unknown;
    /**
     * Sends a request to all server and waits for the response of
     * all of them.
     * Calls |vim.lsp.buf_request_all()| but blocks Nvim while
     * awaiting the result. Parameters are the same as
     * |vim.lsp.buf_request()| but the return result is different.
     * Wait maximum of {timeout_ms} (default 1000) ms.
     * @param bufnr (number) Buffer handle, or 0 for current.
     * @param method (string) LSP method name
     * @param params (optional, table) Parameters to send to the
     *                   server
     * @param timeout_ms (optional, number, default=1000) Maximum
     *                   time in milliseconds to wait for a result.
     * @returns Map of client_id:request_result. On timeout, cancel or
     *     error, returns `(nil, err)` where `err` is a string
     *     describing the failure reason.
     * @signature `buf_request_sync({bufnr}, {method}, {params}, {timeout_ms})`
     */
    buf_request_sync: (bufnr: unknown, method: unknown, params: unknown, timeout_ms: unknown) => unknown;
    /**
     * Returns the UTF-32 and UTF-16 offsets for a position in a
     * certain buffer.
     * @param buf buffer id (0 for current)
     * @param row 0-indexed line
     * @param col 0-indexed byte offset in line
     * @param offset_encoding string utf-8|utf-16|utf-32|nil defaults
     *                        to `offset_encoding` of first client of
     *                        `buf`
     * @returns (number, number) `offset_encoding` index of the character
     *     in line {row} column {col} in buffer {buf}
     * @signature `character_offset({buf}, {row}, {col}, {offset_encoding})`
     */
    character_offset: (buf: unknown, row: unknown, col: unknown, offset_encoding: unknown) => unknown;
    /**
     * Removes document highlights from current buffer.
     * @signature `clear_references()`
     */
    clear_references: () => unknown;
    /**
     * LSP client object. You can get an active client object via
     * |vim.lsp.get_client_by_id()| or
     * |vim.lsp.get_active_clients()|.
     *
     * • Methods:
     *   • request(method, params, [handler], bufnr) Sends a request
     *     to the server. This is a thin wrapper around
     *     {client.rpc.request} with some additional checking. If
     *     {handler} is not specified, If one is not found there,
     *     then an error will occur. Returns: {status},
     *     {[client_id]}. {status} is a boolean indicating if the
     *     notification was successful. If it is `false`, then it
     *     will always be `false` (the client has shutdown). If
     *     {status} is `true`, the function returns {request_id} as
     *     the second result. You can use this with
     *     `client.cancel_request(request_id)` to cancel the request.
     *   • request_sync(method, params, timeout_ms, bufnr) Sends a
     *     request to the server and synchronously waits for the
     *     response. This is a wrapper around {client.request}
     *     Returns: { err=err, result=result }, a dictionary, where
     *     `err` and `result` come from the |lsp-handler|. On
     *     timeout, cancel or error, returns `(nil, err)` where `err`
     *     is a string describing the failure reason. If the request
     *     was unsuccessful returns `nil`.
     *   • notify(method, params) Sends a notification to an LSP
     *     server. Returns: a boolean to indicate if the notification
     *     was successful. If it is false, then it will always be
     *     false (the client has shutdown).
     *   • cancel_request(id) Cancels a request with a given request
     *     id. Returns: same as `notify()`.
     *   • stop([force]) Stops a client, optionally with force. By
     *     default, it will just ask the server to shutdown without
     *     force. If you request to stop a client which has
     *     previously been requested to shutdown, it will
     *     automatically escalate and force shutdown.
     *   • is_stopped() Checks whether a client is stopped. Returns:
     *     true if the client is fully stopped.
     *   • on_attach(client, bufnr) Runs the on_attach function from
     *     the client's config if it was defined. Useful for
     *     buffer-local setup.
     *
     * • Members
     *   • {id} (number): The id allocated to the client.
     *   • {name} (string): If a name is specified on creation, that
     *     will be used. Otherwise it is just the client id. This is
     *     used for logs and messages.
     *   • {rpc} (table): RPC client object, for low level
     *     interaction with the client. See |vim.lsp.rpc.start()|.
     *   • {offset_encoding} (string): The encoding used for
     *     communicating with the server. You can modify this in the
     *     `config`'s `on_init` method before text is sent to the
     *     server.
     *   • {handlers} (table): The handlers used by the client as
     *     described in |lsp-handler|.
     *   • {requests} (table): The current pending requests in flight
     *     to the server. Entries are key-value pairs with the key
     *     being the request ID while the value is a table with
     *     `type`, `bufnr`, and `method` key-value pairs. `type` is
     *     either "pending" for an active request, or "cancel" for a
     *     cancel request.
     *   • {config} (table): copy of the table that was passed by the
     *     user to |vim.lsp.start_client()|.
     *   • {server_capabilities} (table): Response from the server
     *     sent on `initialize` describing the server's capabilities.
     *   • {resolved_capabilities} (table): Normalized table of
     *     capabilities that we have detected based on the initialize
     *     response from the server in `server_capabilities`.
     *
     *
     * @signature `client()`
     */
    client: () => unknown;
    /**
     * Checks whether a client is stopped.
     * @param client_id (Number)
     * @returns true if client is stopped, false otherwise.
     * @signature `client_is_stopped({client_id})`
     */
    client_is_stopped: (client_id: unknown) => unknown;
    /**
     * Selects a code action available at the current cursor
     * position.
     * @param context table|nil `CodeActionContext` of the LSP specification:
     *                • diagnostics: (table|nil) LSP`Diagnostic[]` . Inferred from the current position if not
     *                  provided.
     *                • only: (string|nil) LSP `CodeActionKind` used
     *                  to filter the code actions. Most language
     *                  servers support values like `refactor` or
     *                  `quickfix`.
     * @signature `code_action({context})`
     * @reference https://microsoft.github.io/language-server-protocol/specifications/specification-current/#textDocument_codeAction
     */
    code_action: (context: unknown) => unknown;
    /**
     * Retrieves the completion items at the current cursor position.
     * Can only be called in Insert mode.
     * @param context (context support not yet implemented)
     *                Additional information about the context in
     *                which a completion was triggered (how it was
     *                triggered, and by which trigger character, if
     *                applicable)
     * @signature `completion({context})`
     * @reference |vim.lsp.protocol.constants.CompletionTriggerKind|
     */
    completion: (context: unknown) => unknown;
    /**
     * Returns the range table for the difference between prev and
     * curr lines
     * @param prev_lines table list of lines
     * @param curr_lines table list of lines
     * @param firstline number line to begin search for first
     *                        difference
     * @param lastline number line to begin search in
     *                        old_lines for last difference
     * @param new_lastline number line to begin search in
     *                        new_lines for last difference
     * @param offset_encoding string encoding requested by language
     *                        server
     * @returns table TextDocumentContentChangeEvent see https://microsoft.github.io/language-server-protocol/specifications/specification-3-17/#textDocumentContentChangeEvent
     * @signature `compute_diff({prev_lines}, {curr_lines}, {firstline}, {lastline}, {new_lastline}, {offset_encoding}, {line_ending})`
     */
    compute_diff: (prev_lines: unknown, curr_lines: unknown, firstline: unknown, lastline: unknown, new_lastline: unknown, offset_encoding: unknown, line_ending: unknown) => unknown;
    /**
     * Converts any of `MarkedString` | `MarkedString[]` |
     * `MarkupContent` into a list of lines containing valid
     * markdown. Useful to populate the hover window for
     * `textDocument/hover`, for parsing the result of
     * `textDocument/signatureHelp`, and potentially others.
     * @param input (`MarkedString` | `MarkedString[]` |
     *                 `MarkupContent`)
     * @param contents (table, optional, default `{}`) List of
     *                 strings to extend with converted lines
     * @returns {contents}, extended with lines of converted markdown.
     * @signature `convert_input_to_markdown_lines({input}, {contents})`
     * @reference https://microsoft.github.io/language-server-protocol/specifications/specification-current/#textDocument_hover
     */
    convert_input_to_markdown_lines: (input: unknown, contents: unknown) => unknown;
    /**
     * Converts `textDocument/SignatureHelp` response to markdown
     * lines.
     * @param signature_help Response of `textDocument/SignatureHelp`
     * @param ft optional filetype that will be use as
     *                       the `lang` for the label markdown code
     *                       block
     * @param triggers optional list of trigger characters from
     *                       the lsp server. used to better determine
     *                       parameter offsets
     * @returns list of lines of converted markdown.
     * @signature `convert_signature_help_to_markdown_lines({signature_help}, {ft}, {triggers})`
     * @reference https://microsoft.github.io/language-server-protocol/specifications/specification-current/#textDocument_signatureHelp
     */
    convert_signature_help_to_markdown_lines: (signature_help: unknown, ft: unknown, triggers: unknown) => unknown;
    /**
     * Jumps to the declaration of the symbol under the cursor.
     * Note:
     *     Many servers do not implement this method. Generally, see
     *     |vim.lsp.buf.definition()| instead.
     *
     * @signature `declaration()`
     */
    declaration: () => unknown;
    /**
     * Jumps to the definition of the symbol under the cursor.
     * @signature `definition()`
     */
    definition: () => unknown;
    /**
     * Display the lenses using virtual text
     * @param lenses table of lenses to display (`CodeLens[] |
     *                  null`)
     * @param bufnr number
     * @param client_id number
     * @signature `display({lenses}, {bufnr}, {client_id})`
     */
    display: (lenses: unknown, bufnr: unknown, client_id: unknown) => unknown;
    /**
     * Send request to the server to resolve document highlights for
     * the current text document position. This request can be
     * triggered by a key mapping or by events such as `CursorHold`,
     * e.g.:
     * >
     * autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
     * autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
     * autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
     *
     * <
     * Note: Usage of |vim.lsp.buf.document_highlight()| requires the
     * following highlight groups to be defined or you won't be able
     * to see the actual highlights. |LspReferenceText|
     * |LspReferenceRead| |LspReferenceWrite|
     * @signature `document_highlight()`
     */
    document_highlight: () => unknown;
    /**
     * Lists all symbols in the current buffer in the quickfix
     * window.
     * @signature `document_symbol()`
     */
    document_symbol: () => unknown;
    /**
     * Executes an LSP server command.
     * @param command_params table A valid `ExecuteCommandParams`
     *                       object
     * @signature `execute_command({command_params})`
     * @reference https://microsoft.github.io/language-server-protocol/specifications/specification-current/#workspace_executeCommand
     */
    execute_command: (command_params: unknown) => unknown;
    /**
     * Can be used to extract the completion items from a `textDocument/completion` request, which may return one of `CompletionItem[]` , `CompletionList` or null.
     * @param result (table) The result of a
     *               `textDocument/completion` request
     * @returns (table) List of completion items
     * @signature `extract_completion_items({result})`
     * @reference https://microsoft.github.io/language-server-protocol/specification#textDocument_completion
     */
    extract_completion_items: (result: unknown) => unknown;
    /**
     * Invokes a function for each LSP client attached to a buffer.
     * @param bufnr number Buffer number
     * @param fn function Function to run on each client attached
     *              to buffer {bufnr}. The function takes the client,
     *              client ID, and buffer number as arguments.
     *              Example: >
     *
     *                vim.lsp.for_each_buffer_client(0, function(client, client_id, bufnr)
     *                  print(vim.inspect(client))
     *                end)
     *
     * <
     * @signature `for_each_buffer_client({bufnr}, {fn})`
     */
    for_each_buffer_client: (bufnr: unknown, fn: unknown) => unknown;
    /**
     * Mapping of error codes used by the client.
     * Constructs an error message from an LSP error object.
     * @param err (table) The error object
     * @returns (string) The formatted error message
     * @signature `format_rpc_error({err})`
     */
    format_rpc_error: (err: unknown) => unknown;
    /**
     * Provides an interface between the built-in client and a
     * `formatexpr` function.
     * Currently only supports a single client. This can be set via
     * `setlocal formatexpr=v:lua.vim.lsp.formatexpr()` but will
     * typically or in `on_attach` via
     * `vim.api.nvim_buf_set_option(bufnr, 'formatexpr',
     * 'v:lua.vim.lsp.formatexpr(#{timeout_ms:250})')`.
     * @param opts table options for customizing the formatting
     *             expression which takes the following optional
     *             keys:
     *             • timeout_ms (default 500ms). The timeout period
     *               for the formatting request.
     * @signature `formatexpr({opts})`
     */
    formatexpr: (opts: unknown) => unknown;
    /**
     * Formats the current buffer.
     * @param options (optional, table) Can be used to specify
     *                FormattingOptions. Some unspecified options
     *                will be automatically derived from the current
     *                Neovim options.
     * @signature `formatting({options})`
     * @reference https://microsoft.github.io/language-server-protocol/specification#textDocument_formatting
     */
    formatting: (options: unknown) => unknown;
    /**
     * Formats the current buffer by sequentially requesting
     * formatting from attached clients.
     * Useful when multiple clients with formatting capability are
     * attached.
     * Since it's synchronous, can be used for running on save, to
     * make sure buffer is formatted prior to being saved.
     * {timeout_ms} is passed on to the |vim.lsp.client| `request_sync` method. Example: >
     *
     *  vim.api.nvim_command[[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
     *
     * <
     * @param options (optional, table) `FormattingOptions`
     *                   entries
     * @param timeout_ms (optional, number) Request timeout
     * @param order (optional, table) List of client names.
     *                   Formatting is requested from clients in the
     *                   following order: first all clients that are
     *                   not in the `order` list, then the remaining
     *                   clients in the order as they occur in the
     *                   `order` list.
     * @signature `formatting_seq_sync({options}, {timeout_ms}, {order})`
     */
    formatting_seq_sync: (options: unknown, timeout_ms: unknown, order: unknown) => unknown;
    /**
     * Performs |vim.lsp.buf.formatting()| synchronously.
     * Useful for running on save, to make sure buffer is formatted
     * prior to being saved. {timeout_ms} is passed on to
     * |vim.lsp.buf_request_sync()|. Example:
     * >
     *
     *  autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
     *
     * <
     * @param options Table with valid `FormattingOptions` entries
     * @param timeout_ms (number) Request timeout
     * @signature `formatting_sync({options}, {timeout_ms})`
     * @reference |vim.lsp.buf.formatting_seq_sync|
     */
    formatting_sync: (options: unknown, timeout_ms: unknown) => unknown;
    /**
     * Return all lenses for the given buffer
     * @param bufnr number Buffer number. 0 can be used for the
     *              current buffer.
     * @returns table (`CodeLens[]`)
     * @signature `get({bufnr})`
     */
    get: (bufnr: unknown) => unknown;
    /**
     * Gets all active clients.
     * @returns Table of |vim.lsp.client| objects
     * @signature `get_active_clients()`
     */
    get_active_clients: () => unknown;
    /**
     * Returns list of buffers attached to client_id.
     * @param client_id number client id
     * @returns list of buffer ids
     * @signature `get_buffers_by_client_id({client_id})`
     */
    get_buffers_by_client_id: (client_id: unknown) => unknown;
    /**
     * Gets a client by id, or nil if the id is invalid. The returned
     * client may not yet be fully initialized.
     * @param client_id number client id
     * @returns |vim.lsp.client| object, or nil
     * @signature `get_client_by_id({client_id})`
     */
    get_client_by_id: (client_id: unknown) => unknown;
    /**
     * Returns indentation size.
     * @param bufnr (optional, number): Buffer handle, defaults to
     *              current
     * @returns (number) indentation size
     * @signature `get_effective_tabstop({bufnr})`
     * @reference |shiftwidth|
     */
    get_effective_tabstop: (bufnr: unknown) => unknown;
    /**
     * Returns the log filename.
     * @returns (string) log filename
     * @signature `get_filename()`
     */
    get_filename: () => unknown;
    /**
     * Gets the current log level.
     * @returns string current log level
     * @signature `get_level()`
     */
    get_level: () => unknown;
    /**
     * Gets the path of the logfile used by the LSP client.
     * @returns (String) Path to logfile.
     * @signature `get_log_path()`
     */
    get_log_path: () => unknown;
    /**
     * Get the diagnostic namespace associated with an LSP client
     * |vim.diagnostic|.
     * @param client_id number The id of the LSP client
     * @signature `get_namespace({client_id})`
     */
    get_namespace: (client_id: unknown) => unknown;
    /**
     * |lsp-handler| for the method "textDocument/hover" >
     *
     *  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
     *    vim.lsp.handlers.hover, {
     *      -- Use a sharp border with `FloatBorder` highlights
     *      border = "single"
     *    }
     *  )
     *
     * <
     * @param config table Configuration table.
     *               • border: (default=nil)
     *                 • Add borders to the floating window
     *                 • See |nvim_open_win()|
     * @signature `hover({_}, {result}, {ctx}, {config})`
     */
    hover: (_: unknown, result: unknown, ctx: unknown, config: unknown) => unknown;
    /**
     * Lists all the implementations for the symbol under the cursor
     * in the quickfix window.
     * @signature `implementation()`
     */
    implementation: () => unknown;
    /**
     * Lists all the call sites of the symbol under the cursor in the
     * |quickfix| window. If the symbol can resolve to multiple
     * items, the user can pick one in the |inputlist|.
     * @signature `incoming_calls()`
     */
    incoming_calls: () => unknown;
    /**
     * Jumps to a location.
     * @param location table (`Location`|`LocationLink`)
     * @param offset_encoding string utf-8|utf-16|utf-32 (required)
     * @returns `true` if the jump succeeded
     * @signature `jump_to_location({location}, {offset_encoding})`
     */
    jump_to_location: (location: unknown, offset_encoding: unknown) => unknown;
    /**
     * List workspace folders.
     * @signature `list_workspace_folders()`
     */
    list_workspace_folders: () => unknown;
    /**
     * Returns the items with the byte position calculated correctly
     * and in sorted order, for display in quickfix and location
     * lists.
     * The result can be passed to the {list} argument of
     * |setqflist()| or |setloclist()|.
     * @param locations table list of `Location`s or
     *                        `LocationLink`s
     * @param offset_encoding string offset_encoding for locations
     *                        utf-8|utf-16|utf-32
     * @returns (table) list of items
     * @signature `locations_to_items({locations}, {offset_encoding})`
     */
    locations_to_items: (locations: unknown, offset_encoding: unknown) => unknown;
    /**
     * Helper function to return nested values in language server
     * settings
     * @param settings a table of language server settings
     * @param section a string indicating the field of the settings
     *                 table
     * @returns (table or string) The value of settings accessed via
     *     section
     * @signature `lookup_section({settings}, {section})`
     */
    lookup_section: (settings: unknown, section: unknown) => unknown;
    /**
     * Gets a new ClientCapabilities object describing the LSP client
     * capabilities.
     * @signature `make_client_capabilities()`
     */
    make_client_capabilities: () => unknown;
    /**
     * Creates a table with sensible default options for a floating
     * window. The table can be passed to |nvim_open_win()|.
     * @param width (number) window width (in character cells)
     * @param height (number) window height (in character cells)
     * @param opts (table, optional)
     *               • offset_x (number) offset to add to `col`
     *               • offset_y (number) offset to add to `row`
     *               • border (string or table) override `border`
     *               • focusable (string or table) override
     *                 `focusable`
     *               • zindex (string or table) override `zindex`,
     *                 defaults to 50
     * @returns (table) Options
     * @signature `make_floating_popup_options({width}, {height}, {opts})`
     */
    make_floating_popup_options: (width: unknown, height: unknown, opts: unknown) => unknown;
    /**
     * Creates a `DocumentFormattingParams` object for the current
     * buffer and cursor position.
     * @param options Table with valid `FormattingOptions` entries
     * @returns `DocumentFormattingParams` object
     * @signature `make_formatting_params({options})`
     * @reference https://microsoft.github.io/language-server-protocol/specifications/specification-current/#textDocument_formatting
     */
    make_formatting_params: (options: unknown) => unknown;
    /**
     * Using the given range in the current buffer, creates an object
     * that is similar to |vim.lsp.util.make_range_params()|.
     * @param start_pos ({number, number}, optional)
     *                        mark-indexed position. Defaults to the
     *                        start of the last visual selection.
     * @param end_pos ({number, number}, optional)
     *                        mark-indexed position. Defaults to the
     *                        end of the last visual selection.
     * @param bufnr (optional, number): buffer handle or 0
     *                        for current, defaults to current
     * @param offset_encoding string utf-8|utf-16|utf-32|nil defaults
     *                        to `offset_encoding` of first client of
     *                        `bufnr`
     * @returns { textDocument = { uri = `current_file_uri` }, range = {
     *     start = `start_position`, end = `end_position` } }
     * @signature `make_given_range_params({start_pos}, {end_pos}, {bufnr}, {offset_encoding})`
     */
    make_given_range_params: (start_pos: unknown, end_pos: unknown, bufnr: unknown, offset_encoding: unknown) => unknown;
    /**
     * Creates a `TextDocumentPositionParams` object for the current
     * buffer and cursor position.
     * @param window (optional, number): window handle or 0
     *                        for current, defaults to current
     * @param offset_encoding string utf-8|utf-16|utf-32|nil defaults
     *                        to `offset_encoding` of first client of
     *                        buffer of `window`
     * @returns `TextDocumentPositionParams` object
     * @signature `make_position_params({window}, {offset_encoding})`
     * @reference https://microsoft.github.io/language-server-protocol/specifications/specification-current/#textDocumentPositionParams
     */
    make_position_params: (window: unknown, offset_encoding: unknown) => unknown;
    /**
     * Using the current position in the current buffer, creates an
     * object that can be used as a building block for several LSP
     * requests, such as `textDocument/codeAction`,
     * `textDocument/colorPresentation`,
     * `textDocument/rangeFormatting`.
     * @param window (optional, number): window handle or 0
     *                        for current, defaults to current
     * @param offset_encoding string utf-8|utf-16|utf-32|nil defaults
     *                        to `offset_encoding` of first client of
     *                        buffer of `window`
     * @returns { textDocument = { uri = `current_file_uri` }, range = {
     *     start = `current_position`, end = `current_position` } }
     * @signature `make_range_params({window}, {offset_encoding})`
     */
    make_range_params: (window: unknown, offset_encoding: unknown) => unknown;
    /**
     * Creates a `TextDocumentIdentifier` object for the current
     * buffer.
     * @param bufnr (optional, number): Buffer handle, defaults to
     *              current
     * @returns `TextDocumentIdentifier`
     * @signature `make_text_document_params({bufnr})`
     * @reference https://microsoft.github.io/language-server-protocol/specifications/specification-current/#textDocumentIdentifier
     */
    make_text_document_params: (bufnr: unknown) => unknown;
    /**
     * Create the workspace params
     * @param added
     * @param removed
     * @signature `make_workspace_params({added}, {removed})`
     */
    make_workspace_params: (added: unknown, removed: unknown) => unknown;
    /**
     * Sends a notification to the LSP server.
     * @param method (string) The invoked LSP method
     * @param params (table): Parameters for the invoked LSP method
     * @returns (bool) `true` if notification could be sent, `false` if
     *     not
     * @signature `notify({method}, {params})`
     */
    notify: (method: unknown, params: unknown) => unknown;
    /**
     * Implements 'omnifunc' compatible LSP completion.
     * @param findstart 0 or 1, decides behavior
     * @param base If findstart=0, text to match against
     * @returns (number) Decided by {findstart}:
     *     • findstart=0: column where the completion starts, or -2
     *       or -3
     *     • findstart=1: list of matches (actually just calls
     *       |complete()|)
     *
     * @signature `omnifunc({findstart}, {base})`
     * @reference |complete-functions|
     * |complete-items|
     * |CompleteDone|
     */
    omnifunc: (findstart: unknown, base: unknown) => unknown;
    /**
     * |lsp-handler| for the method `textDocument/codeLens`
     * @signature `on_codelens({err}, {result}, {ctx}, {_})`
     */
    on_codelens: (err: unknown, result: unknown, ctx: unknown, _: unknown) => unknown;
    /**
     * |lsp-handler| for the method "textDocument/publishDiagnostics"
     * See |vim.diagnostic.config()| for configuration options.
     * Handler-specific configuration can be set using
     * |vim.lsp.with()|: >
     *
     *  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
     *    vim.lsp.diagnostic.on_publish_diagnostics, {
     *      -- Enable underline, use default values
     *      underline = true,
     *      -- Enable virtual text, override spacing to 4
     *      virtual_text = {
     *        spacing = 4,
     *      },
     *      -- Use a function to dynamically turn signs off
     *      -- and on, using buffer local variables
     *      signs = function(namespace, bufnr)
     *        return vim.b[bufnr].show_signs == true
     *      end,
     *      -- Disable a feature
     *      update_in_insert = false,
     *    }
     *  )
     *
     * <
     * @param config table Configuration table (see
     *               |vim.diagnostic.config()|).
     * @signature `on_publish_diagnostics({_}, {result}, {ctx}, {config})`
     */
    on_publish_diagnostics: (_: unknown, result: unknown, ctx: unknown, config: unknown) => unknown;
    /**
     * Shows contents in a floating window.
     * @param contents table of lines to show in window
     * @param syntax string of syntax to set for opened buffer
     * @param opts table with optional fields (additional keys
     *                 are passed on to |vim.api.nvim_open_win()|)
     *                 • height: (number) height of floating window
     *                 • width: (number) width of floating window
     *                 • wrap: (boolean, default true) wrap long
     *                   lines
     *                 • wrap_at: (string) character to wrap at for
     *                   computing height when wrap is enabled
     *                 • max_width: (number) maximal width of
     *                   floating window
     *                 • max_height: (number) maximal height of
     *                   floating window
     *                 • pad_top: (number) number of lines to pad
     *                   contents at top
     *                 • pad_bottom: (number) number of lines to pad
     *                   contents at bottom
     *                 • focus_id: (string) if a popup with this id
     *                   is opened, then focus it
     *                 • close_events: (table) list of events that
     *                   closes the floating window
     *                 • focusable: (boolean, default true) Make
     *                   float focusable
     *                 • focus: (boolean, default true) If `true`,
     *                   and if {focusable} is also `true`, focus an
     *                   existing floating window with the same
     *                   {focus_id}
     * @returns bufnr,winnr buffer and window number of the newly created
     *     floating preview window
     * @signature `open_floating_preview({contents}, {syntax}, {opts})`
     */
    open_floating_preview: (contents: unknown, syntax: unknown, opts: unknown) => unknown;
    /**
     * Lists all the items that are called by the symbol under the
     * cursor in the |quickfix| window. If the symbol can resolve to
     * multiple items, the user can pick one in the |inputlist|.
     * @signature `outgoing_calls()`
     */
    outgoing_calls: () => unknown;
    /**
     * Parses snippets in a completion entry.
     * @param input string unparsed snippet
     * @returns string parsed snippet
     * @signature `parse_snippet({input})`
     */
    parse_snippet: (input: unknown) => unknown;
    /**
     * Jump to new location (adjusting for UTF-16 encoding of
     * characters)
     * Previews a location in a floating window
     * behavior depends on type of location:
     * • for Location, range is shown (e.g., function definition)
     * • for LocationLink, targetRange is shown (e.g., body of
     *   function definition)
     *
     * @param location a single `Location` or `LocationLink`
     * @returns (bufnr,winnr) buffer and window number of floating window
     *     or nil
     * @signature `preview_location({location}, {opts})`
     */
    preview_location: (location: unknown, opts: unknown) => unknown;
    /**
     * Performs |vim.lsp.buf.code_action()| for a given range.
     * @param context table|nil `CodeActionContext` of the LSP specification:
     *                  • diagnostics: (table|nil) LSP`Diagnostic[]` . Inferred from the current position if not
     *                    provided.
     *                  • only: (string|nil) LSP `CodeActionKind`
     *                    used to filter the code actions. Most
     *                    language servers support values like
     *                    `refactor` or `quickfix`.
     * @param start_pos ({number, number}, optional) mark-indexed
     *                  position. Defaults to the start of the last
     *                  visual selection.
     * @param end_pos ({number, number}, optional) mark-indexed
     *                  position. Defaults to the end of the last
     *                  visual selection.
     * @signature `range_code_action({context}, {start_pos}, {end_pos})`
     */
    range_code_action: (context: unknown, start_pos: unknown, end_pos: unknown) => unknown;
    /**
     * Formats a given range.
     * @param options Table with valid `FormattingOptions` entries.
     * @param start_pos ({number, number}, optional) mark-indexed
     *                  position. Defaults to the start of the last
     *                  visual selection.
     * @param end_pos ({number, number}, optional) mark-indexed
     *                  position. Defaults to the end of the last
     *                  visual selection.
     * @signature `range_formatting({options}, {start_pos}, {end_pos})`
     */
    range_formatting: (options: unknown, start_pos: unknown, end_pos: unknown) => unknown;
    /**
     * Lists all the references to the symbol under the cursor in the
     * quickfix window.
     * @param context (table) Context for the request
     * @signature `references({context})`
     * @reference https://microsoft.github.io/language-server-protocol/specifications/specification-current/#textDocument_references
     */
    references: (context: unknown) => unknown;
    /**
     * Refresh the codelens for the current buffer
     * It is recommended to trigger this using an autocmd or via
     * keymap.
     * >
     *   autocmd BufEnter,CursorHold,InsertLeave <buffer> lua vim.lsp.codelens.refresh()
     *
     * <
     * @signature `refresh()`
     */
    refresh: () => unknown;
    /**
     * Remove the folder at path from the workspace folders. If
     * {path} is not provided, the user will be prompted for a path
     * using |input()|.
     * @signature `remove_workspace_folder({workspace_folder})`
     */
    remove_workspace_folder: (workspace_folder: unknown) => unknown;
    /**
     * Rename old_fname to new_fname
     * @param opts (table)
     * @signature `rename({old_fname}, {new_fname}, {opts})`
     */
    rename: (old_fname: unknown, new_fname: unknown, opts: unknown) => unknown;
    /**
     * Sends a request to the LSP server and runs {callback} upon
     * response.
     * @param method (string) The invoked LSP method
     * @param params (table) Parameters for the
     *                              invoked LSP method
     * @param callback (function) Callback to invoke
     * @param notify_reply_callback (function) Callback to invoke as
     *                              soon as a request is no longer
     *                              pending
     * @returns (bool, number) `(true, message_id)` if request could be
     *     sent, `false` if not
     * @signature `request({method}, {params}, {callback}, {notify_reply_callback})`
     */
    request: (method: unknown, params: unknown, callback: unknown, notify_reply_callback: unknown) => unknown;
    /**
     * Creates a normalized object describing LSP server
     * capabilities.
     * @param server_capabilities table Table of capabilities
     *                            supported by the server
     * @returns table Normalized table of capabilities
     * @signature `resolve_capabilities({server_capabilities})`
     */
    resolve_capabilities: (server_capabilities: unknown) => unknown;
    /**
     * Creates an RPC response object/table.
     * @param code RPC error code defined in
     *                `vim.lsp.protocol.ErrorCodes`
     * @param message (optional) arbitrary message to send to server
     * @param data (optional) arbitrary data to send to server
     * @signature `rpc_response_error({code}, {message}, {data})`
     */
    rpc_response_error: (code: unknown, message: unknown, data: unknown) => unknown;
    /**
     * Run the code lens in the current line
     * @signature `run()`
     */
    run: () => unknown;
    /**
     * Store lenses for a specific buffer and client
     * @param lenses table of lenses to store (`CodeLens[] |
     *                  null`)
     * @param bufnr number
     * @param client_id number
     * @signature `save({lenses}, {bufnr}, {client_id})`
     */
    save: (lenses: unknown, bufnr: unknown, client_id: unknown) => unknown;
    /**
     * Checks whether the language servers attached to the current
     * buffer are ready.
     * @returns `true` if server responds.
     * @signature `server_ready()`
     */
    server_ready: () => unknown;
    /**
     * Sets formatting function used to format logs
     * @param handle function function to apply to logging arguments,
     *               pass vim.inspect for multi-line formatting
     * @signature `set_format_func({handle})`
     */
    set_format_func: (handle: unknown) => unknown;
    /**
     * Sets the current log level.
     * @param level (string or number) One of `vim.lsp.log.levels`
     * @signature `set_level({level})`
     */
    set_level: (level: unknown) => unknown;
    /**
     * Replaces text in a range with new text.
     * CAUTION: Changes in-place!
     * @param lines (table) Original list of strings
     * @param A (table) Start position; a 2-tuple of {line,
     *                  col} numbers
     * @param B (table) End position; a 2-tuple of {line,
     *                  col} numbers
     * @param new_lines A list of strings to replace the original
     * @returns (table) The modified {lines} object
     * @signature `set_lines({lines}, {A}, {B}, {new_lines})`
     */
    set_lines: (lines: unknown, A: unknown, B: unknown, new_lines: unknown) => unknown;
    /**
     * Sets the global log level for LSP logging.
     * Levels by name: "TRACE", "DEBUG", "INFO", "WARN", "ERROR"
     * Level numbers begin with "TRACE" at 0
     * Use `lsp.log_levels` for reverse lookup.
     * @param level [number|string] the case insensitive level name
     *              or number
     * @signature `set_log_level({level})`
     * @reference |vim.lsp.log_levels|
     */
    set_log_level: (level: unknown) => unknown;
    /**
     * Checks whether the level is sufficient for logging.
     * @param level number log level
     * @returns (bool) true if would log, false if not
     * @signature `should_log({level})`
     */
    should_log: (level: unknown) => unknown;
    /**
     * |lsp-handler| for the method "textDocument/signatureHelp". The
     * active parameter is highlighted with
     * |hl-LspSignatureActiveParameter|. >
     *
     *  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
     *    vim.lsp.handlers.signature_help, {
     *      -- Use a sharp border with `FloatBorder` highlights
     *      border = "single"
     *    }
     *  )
     *
     * <
     * @param config table Configuration table.
     *               • border: (default=nil)
     *                 • Add borders to the floating window
     *                 • See |vim.api.nvim_open_win()|
     * @signature `signature_help({_}, {result}, {ctx}, {config})`
     */
    signature_help: (_: unknown, result: unknown, ctx: unknown, config: unknown) => unknown;
    /**
     * Starts an LSP server process and create an LSP RPC client
     * object to interact with it. Communication with the server is
     * currently limited to stdio.
     * @param cmd (string) Command to start the LSP
     *                           server.
     * @param cmd_args (table) List of additional string
     *                           arguments to pass to {cmd}.
     * @param dispatchers (table, optional) Dispatchers for
     *                           LSP message types. Valid dispatcher
     *                           names are:
     *                           • `"notification"`
     *                           • `"server_request"`
     *                           • `"on_error"`
     *                           • `"on_exit"`
     * @param extra_spawn_params (table, optional) Additional context
     *                           for the LSP server process. May
     *                           contain:
     *                           • {cwd} (string) Working directory
     *                             for the LSP server process
     *                           • {env} (table) Additional
     *                             environment variables for LSP
     *                             server process
     * @returns Client RPC object.
     * Methods:
     *     • `notify()` |vim.lsp.rpc.notify()|
     *     • `request()` |vim.lsp.rpc.request()|
     *
     * Members:
     *     • {pid} (number) The LSP server's PID.
     *     • {handle} A handle for low-level interaction with the LSP
     *       server process |vim.loop|.
     *
     * @signature `start({cmd}, {cmd_args}, {dispatchers}, {extra_spawn_params})`
     */
    start: (cmd: unknown, cmd_args: unknown, dispatchers: unknown, extra_spawn_params: unknown) => unknown;
    /**
     * Starts and initializes a client with the given configuration.
     * Parameter `cmd` is required.
     * The following parameters describe fields in the {config}
     * table.
     * @param cmd (required, string or list treated
     *                          like |jobstart()|) Base command that
     *                          initiates the LSP client.
     * @param cmd_cwd (string, default=|getcwd()|)
     *                          Directory to launch the `cmd`
     *                          process. Not related to `root_dir`.
     * @param cmd_env (table) Environment flags to pass to
     *                          the LSP on spawn. Can be specified
     *                          using keys like a map or as a list
     *                          with `k=v` pairs or both. Non-string values are
     *                          coerced to string. Example: >
     *
     *  { "PRODUCTION=true"; "TEST=123"; PORT = 8080; HOST = "0.0.0.0"; }
     *
     * <
     * @param workspace_folders (table) List of workspace folders
     *                          passed to the language server. For
     *                          backwards compatibility rootUri and
     *                          rootPath will be derived from the
     *                          first workspace folder in this list.
     *                          See `workspaceFolders` in the LSP
     *                          spec.
     * @param capabilities Map overriding the default
     *                          capabilities defined by
     *                          |vim.lsp.protocol.make_client_capabilities()|,
     *                          passed to the language server on
     *                          initialization. Hint: use
     *                          make_client_capabilities() and modify
     *                          its result.
     *                          • Note: To send an empty dictionary
     *                            use
     *                            `{[vim.type_idx]=vim.types.dictionary}`,
     *                            else it will be encoded as an
     *                            array.
     * @param handlers Map of language server method names
     *                          to |lsp-handler|
     * @param settings Map with language server specific
     *                          settings. These are returned to the
     *                          language server if requested via
     *                          `workspace/configuration`. Keys are
     *                          case-sensitive.
     * @param commands table Table that maps string of
     *                          clientside commands to user-defined
     *                          functions. Commands passed to
     *                          start_client take precedence over the
     *                          global command registry. Each key
     *                          must be a unique command name, and
     *                          the value is a function which is
     *                          called if any LSP action (code
     *                          action, code lenses, ...) triggers
     *                          the command.
     * @param init_options Values to pass in the initialization
     *                          request as `initializationOptions`.
     *                          See `initialize` in the LSP spec.
     * @param name (string, default=client-id) Name in
     *                          log messages.
     * @param get_language_id function(bufnr, filetype) -> language
     *                          ID as string. Defaults to the
     *                          filetype.
     * @param offset_encoding (default="utf-16") One of "utf-8",
     *                          "utf-16", or "utf-32" which is the
     *                          encoding that the LSP server expects.
     *                          Client does not verify this is
     *                          correct.
     * @param on_error Callback with parameters (code, ...),
     *                          invoked when the client operation
     *                          throws an error. `code` is a number
     *                          describing the error. Other arguments
     *                          may be passed depending on the error
     *                          kind. See |vim.lsp.rpc.client_errors|
     *                          for possible errors. Use
     *                          `vim.lsp.rpc.client_errors[code]` to
     *                          get human-friendly name.
     * @param before_init Callback with parameters
     *                          (initialize_params, config) invoked
     *                          before the LSP "initialize" phase,
     *                          where `params` contains the
     *                          parameters being sent to the server
     *                          and `config` is the config that was
     *                          passed to |vim.lsp.start_client()|.
     *                          You can use this to modify parameters
     *                          before they are sent.
     * @param on_init Callback (client, initialize_result)
     *                          invoked after LSP "initialize", where
     *                          `result` is a table of `capabilities`
     *                          and anything else the server may
     *                          send. For example, clangd sends
     *                          `initialize_result.offsetEncoding` if
     *                          `capabilities.offsetEncoding` was
     *                          sent to it. You can only modify the
     *                          `client.offset_encoding` here before
     *                          any notifications are sent. Most
     *                          language servers expect to be sent
     *                          client specified settings after
     *                          initialization. Neovim does not make
     *                          this assumption. A
     *                          `workspace/didChangeConfiguration`
     *                          notification should be sent to the
     *                          server during on_init.
     * @param on_exit Callback (code, signal, client_id)
     *                          invoked on client exit.
     *                          • code: exit code of the process
     *                          • signal: number describing the
     *                            signal used to terminate (if any)
     *                          • client_id: client handle
     * @param on_attach Callback (client, bufnr) invoked when
     *                          client attaches to a buffer.
     * @param trace "off" | "messages" | "verbose" | nil
     *                          passed directly to the language
     *                          server in the initialize request.
     *                          Invalid/empty values will default to
     *                          "off"
     * @param flags A table with flags for the client.
     *                          The current (experimental) flags are:
     *                          • allow_incremental_sync (bool,
     *                            default true): Allow using
     *                            incremental sync for buffer edits
     *                          • debounce_text_changes (number,
     *                            default nil): Debounce didChange
     *                            notifications to the server by the
     *                            given number in milliseconds. No
     *                            debounce occurs if nil
     *                          • exit_timeout (number, default 500):
     *                            Milliseconds to wait for server to
     *                            exit cleanly after sending the
     *                            'shutdown' request before sending
     *                            kill -15. If set to false, nvim
     *                            exits immediately after sending the
     *                            'shutdown' request to the server.
     * @param root_dir string Directory where the LSP server
     *                          will base its workspaceFolders,
     *                          rootUri, and rootPath on
     *                          initialization.
     * @returns Client id. |vim.lsp.get_client_by_id()| Note: client may
     *     not be fully initialized. Use `on_init` to do any actions
     *     once the client has been initialized.
     * @signature `start_client({config})`
     */
    start_client: (config: unknown) => unknown;
    /**
     * Stops a client(s).
     * You can also use the `stop()` function on a |vim.lsp.client|
     * object. To stop all clients:
     * >
     *
     *  vim.lsp.stop_client(vim.lsp.get_active_clients())
     *
     * <
     * By default asks the server to shutdown, unless stop was
     * requested already for this client, then force-shutdown is
     * attempted.
     * @param client_id client id or |vim.lsp.client| object, or list
     *                  thereof
     * @param force boolean (optional) shutdown forcefully
     * @signature `stop_client({client_id}, {force})`
     */
    stop_client: (client_id: unknown, force: unknown) => unknown;
    /**
     * Converts markdown into syntax highlighted regions by stripping
     * the code blocks and converting them into highlighted code.
     * This will by default insert a blank line separator after those
     * code block regions to improve readability.
     * This method configures the given buffer and returns the lines
     * to set.
     * If you want to open a popup with fancy markdown, use
     * `open_floating_preview` instead
     * @param contents table of lines to show in window
     * @param opts dictionary with optional fields
     *                 • height of floating window
     *                 • width of floating window
     *                 • wrap_at character to wrap at for computing
     *                   height
     *                 • max_width maximal width of floating window
     *                 • max_height maximal height of floating window
     *                 • pad_top number of lines to pad contents at
     *                   top
     *                 • pad_bottom number of lines to pad contents
     *                   at bottom
     *                 • separator insert separator after code block
     * @returns width,height size of float
     * @signature `stylize_markdown({bufnr}, {contents}, {opts})`
     */
    stylize_markdown: (bufnr: unknown, contents: unknown, opts: unknown) => unknown;
    /**
     * Converts symbols to quickfix list items.
     * @param symbols DocumentSymbol[] or SymbolInformation[]
     * @signature `symbols_to_items({symbols}, {bufnr})`
     */
    symbols_to_items: (symbols: unknown, bufnr: unknown) => unknown;
    /**
     * Provides an interface between the built-in client and
     * 'tagfunc'.
     * When used with normal mode commands (e.g. |CTRL-]|) this will
     * invoke the "textDocument/definition" LSP method to find the
     * tag under the cursor. Otherwise, uses "workspace/symbol". If
     * no results are returned from any LSP servers, falls back to
     * using built-in tags.
     * @param pattern Pattern used to find a workspace symbol
     * @param flags See |tag-function|
     * @returns A list of matching tags
     * @signature `tagfunc({...})`
     */
    tagfunc: (args: unknown[]) => unknown;
    /**
     * Turns the result of a `textDocument/completion` request into
     * vim-compatible |complete-items|.
     * @param result The result of a `textDocument/completion` call,
     *               e.g. from |vim.lsp.buf.completion()|, which may
     *               be one of `CompletionItem[]`, `CompletionList`
     *               or `null`
     * @param prefix (string) the prefix to filter the completion
     *               items
     * @returns { matches = complete-items table, incomplete = bool }
     * @signature `text_document_completion_list_to_complete_items({result}, {prefix})`
     * @reference |complete-items|
     */
    text_document_completion_list_to_complete_items: (result: unknown, prefix: unknown) => unknown;
    /**
     * Removes empty lines from the beginning and end.
     * @param lines (table) list of lines to trim
     * @returns (table) trimmed list of lines
     * @signature `trim_empty_lines({lines})`
     */
    trim_empty_lines: (lines: unknown) => unknown;
    /**
     * Accepts markdown lines and tries to reduce them to a filetype
     * if they comprise just a single code block.
     * CAUTION: Modifies the input in-place!
     * @param lines (table) list of lines
     * @returns (string) filetype or 'markdown' if it was unchanged.
     * @signature `try_trim_markdown_code_blocks({lines})`
     */
    try_trim_markdown_code_blocks: (lines: unknown) => unknown;
    /**
     * Jumps to the definition of the type of the symbol under the
     * cursor.
     * @signature `type_definition()`
     */
    type_definition: () => unknown;
    /**
     * Function to manage overriding defaults for LSP handlers.
     * @param handler (function) See |lsp-handler|
     * @param override_config (table) Table containing the keys to
     *                        override behavior of the {handler}
     * @signature `with({handler}, {override_config})`
     */
    with: (handler: unknown, override_config: unknown) => unknown;
    /**
     * Lists all symbols in the current workspace in the quickfix
     * window.
     * The list is filtered against {query}; if the argument is
     * omitted from the call, the user is prompted to enter a string
     * on the command line. An empty string means no filtering is
     * done.
     * @param query (string, optional)
     * @signature `workspace_symbol({query})`
     */
    workspace_symbol: (query: unknown) => unknown;
}