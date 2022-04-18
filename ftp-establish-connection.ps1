<#
.SYNOPSIS
	Access FTP server connection.

.DESCRIPTION
	This PowerShell script will access the FTP server and access the files within the server.

.EXAMPLE
	PS> ./ftp-establish-connection

#>

$URL = Read-Host -Prompt "FTP URL of the file"
$Path = Read-Host -Prompt "Location of where the file is downloaded ex. C:\documents"
$User = Read-Host -Prompt "Enter a Username: "
$Password = Read-Host -Prompt "Enter the Password: "

$FTPRequest = [System.Net.FtpWebRequest]::create($URL)
$FTPRequest.Credentials =
    New-Object System.Net.NetworkCredential($User,$Password)

$FTPRequest.Method = [System.Net.WebRequestMethods+Ftp]::DownloadFile
$FTPRequest.UseBinary = $true
$FTPRequest.KeepAlive = $false

$FTPResponse = $FTPRequest.GetResponse()
$Result = $FTPResponse.GetResponseStream()

$File = New-Object IO.FileStream ($Path,[IO.FileMode]::Create)
[byte[]]$Readbuffer = New-Object byte[] 1024

do {
    $Readlength = $Result.Read($Readbuffer,0,1024)
    $File.Write($Readbuffer,0,$Readlength)
}
while ($Readlength -ne 0)

$File.close()