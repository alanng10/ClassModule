@echo off

set Module=%~1
set DotNetOutFold=..\Class\Out\net8.0

echo Make Module %Module%
pushd %DotNetOutFold%
saber make ../../../View/Module/Class.%Module%
echo Status: %errorlevel%
popd