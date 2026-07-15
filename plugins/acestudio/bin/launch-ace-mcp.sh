#!/bin/sh
# Locate the ace_mcp_server binary shipped inside ACE Studio and run it in
# stdio mode. The server reads the bridge socket + auth token from the
# credentials file ACE Studio writes when the MCP server is enabled
# (Settings → General → MCP Server), so this script needs no arguments.
#
# Override the binary location with ACE_MCP_SERVER if ACE Studio is installed
# somewhere non-standard.

if [ -n "$ACE_MCP_SERVER" ] && [ -x "$ACE_MCP_SERVER" ]; then
  exec "$ACE_MCP_SERVER" --stdio "$@"
fi

for candidate in \
  "/Applications/ACE Studio.app/Contents/Helpers/ace_mcp_server" \
  "$HOME/Applications/ACE Studio.app/Contents/Helpers/ace_mcp_server"
do
  if [ -x "$candidate" ]; then
    exec "$candidate" --stdio "$@"
  fi
done

echo "ace_mcp_server not found." >&2
echo "Install ACE Studio (https://www.acestudio.ai), or set ACE_MCP_SERVER to the binary path." >&2
echo "Then enable the MCP server in ACE Studio (Settings → General → MCP Server) and retry." >&2
exit 1
