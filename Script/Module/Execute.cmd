@echo off

set ClassFold=..\Class\Out\Class

pushd %ClassFold%
Class.Test-0.00.00
echo Status: %errorlevel%
popd