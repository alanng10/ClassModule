@echo off

call Script\Module\MakeModule Infra
call Script\Module\MakeModule Port
call Script\Module\MakeModule Token
call Script\Module\MakeModule Node
call Script\Module\MakeModule Module