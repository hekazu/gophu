# Gophu

## What
A learning project based on some of what was learned going through the Sockets
and Pipes book, ditching the HTTP protocol in favour of Gopher.

The executable itself is a command line tool for Gopher browsing. No
interactivity has been planned as of now.

## Why
To test the limit of my abilities (and learn to Nix Haskell properly)

## How
1. `nix-build` the executable
2. The executable takes one argument, which is the URL for the Gopher resource
to access, e.g. `gophu example.org`.
