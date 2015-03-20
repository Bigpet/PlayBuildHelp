$PSScriptRoot = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition

Copy-Item $PSScriptRoot\..\Framework\build_win32\ExternalDependenciesOpenAl.userprops.template $PSScriptRoot\..\Framework\build_win32\ExternalDependenciesOpenAl.userprops
Copy-Item $PSScriptRoot\..\CodeGen\build_win32\ExternalDependencies.userprops.template $PSScriptRoot\..\CodeGen\build_win32\ExternalDependencies.userprops
Copy-Item $PSScriptRoot\..\Play\build_win32\ExternalDependencies.userprops.template $PSScriptRoot\..\Play\build_win32\ExternalDependencies.userprops

$path = $PSScriptRoot + '\..\CodeGen\build_win32\ExternalDependencies.userprops'
$xml = [xml](Get-Content $path)
$node = $xml.Project.PropertyGroup | where {$_.Label -eq 'UserMacros'}
$node.FRAMEWORK_PATH = '..\..\Framework'
$xml.Save($path)

$path = $PSScriptRoot + '\..\Play\build_win32\ExternalDependencies.userprops'
$xml = [xml](Get-Content $path)
$node = $xml.Project.PropertyGroup | where {$_.Label -eq 'UserMacros'}
$node.FRAMEWORK_PATH = '..\..\Framework'
$node.CODEGEN_PATH = '..\..\CodeGen'
$node.BZLIB_PATH = '..\..\Dependencies\build_win32'
$xml.Save($path)
