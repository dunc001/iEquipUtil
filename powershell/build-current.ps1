param([string]$filePath)

# USER DEFINED
$sse = "D:\Games\SteamLibrary\steamapps\common\Skyrim Special Edition"
$outDir = "D:\Mods\ModOrganizer2_SkyrimSE\mods\iEquip_SoulSeeker"


# GRAB DIRECTORIES
$sseSrc = $sse + "\Data\Scripts\Source"
$usrSrc = (Get-Location)
$papyrus = $sse + "\Papyrus Compiler\PapyrusCompiler.exe"
$flags = $sseSrc + "\TESV_Papyrus_Flags.flg"


# COMPILE PAPYRUS SCRIPTS
& "$papyrus" "$filePath" -f="$flags" -i="$sseSrc;$usrSrc\Scripts\Source" -o="$outDir\Scripts"


# MOVE ESPS
Get-ChildItem "$outDir" -Filter *.esp |
Foreach-Object {
	$filePath = $_.FullName
	$fileName = $_.Name
	Copy-Item -Path "$filePath" -Destination "$usrSrc"
	Write-Output "CP $usrSrc\$fileName"
}