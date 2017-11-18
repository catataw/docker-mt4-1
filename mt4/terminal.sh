#!/bin/bash
export WINEDEBUG=-ntdll,-ieframe,-win,-nls,-toolbar,-module,-mountmgr,-secur32,-mshtml,-imm,-winediag,-winsock,-iphlpapi,-ver
# export WINEDEBUG=+all
wine ./terminal.exe start.ini
# wine ./terminal.exe
