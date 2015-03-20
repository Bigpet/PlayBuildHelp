Copy-Item ..\Framework\build_win32\ExternalDependenciesOpenAl.userprops.template ..\Framework\build_win32\ExternalDependenciesOpenAl.userprops
Copy-Item ..\CodeGen\build_win32\ExternalDependencies.userprops.template ..\CodeGen\build_win32\ExternalDependencies.userprops
Copy-Item ..\Play\build_win32\ExternalDependencies.userprops.template ..\Play\build_win32\ExternalDependencies.userprops

$path = '..\CodeGen\build_win32\ExternalDependencies.userprops'
$xml = [xml](Get-Content $path)
$node = $xml.Project.PropertyGroup | where {$_.Label -eq 'UserMacros'}
$node.FRAMEWORK.Value = '..\..\Framework'
$xml.Save($path)

$path = '..\Play\build_win32\ExternalDependencies.userprops'
$xml = [xml](Get-Content $path)
$node = $xml.Project.PropertyGroup | where {$_.Label -eq 'UserMacros'}
$node.FRAMEWORK.Value = '..\..\Framework'
$node.CODEGEN.Value = '..\..\CodeGen'
$node.BZLIB_PATH.Value = '..\..\Dependencies\build_win32'
$xml.Save($path)

