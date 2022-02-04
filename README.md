# ShareX

[![License](https://img.shields.io/github/license/ShareX/ShareX?label=License&color=brightgreen&cacheSeconds=3600)](./LICENSE.txt)
[![Discord](https://img.shields.io/discord/194170124859736065?label=Discord&cacheSeconds=3600)](https://discord.gg/ShareX)

This branch is for experiments towards building ShareX natively on/for Linux

> Note: **rebasing branch**, force pushed routinely. Prefer doing a clean [shallow clone](https://github.blog/2020-12-21-get-up-to-speed-with-partial-clone-and-shallow-clone/#user-content-quick-summary) instead of ``git pull``-ing to an exising clone.


## THE RESULTS ARE LESS STABLE THAN RUNNING WINDOWS VERSION USING WINE

## Building

```bash
nuget restore
```
```bash
msbuild -verbosity:normal -noLogo -m -property:Configuration=Release -t:rebuild
```
Same as a normal build process on Windows. This produces a dotnet binary runnable on Windows or through wine.
Dotnet binaries are also runnable on Linux using ``mono`` command.

To produce a native Linux binary:
```bash
cd ShareX/bin/Release
sudo mkbundle -o sharex --simple ./ShareX.exe --aot-mode full --machine-config /etc/mono/4.5/machine.config --config ./ShareX.exe.config
```
There should now be a portable Linux binary ``./sharex``. It should not require mono or dotnet present on target machine in order to run, this still needs testing to know for sure.
> Note: ``sudo`` is only required because mkbundle wants to create ``.dll.aot_out`` next to every ``.dll`` file it handles in the process, and some of those ``.dll``s are normally in ``/usr/lib/mono/4.5/``

