Add-Type -AssemblyName PresentationFramework

[xml]$Form = Get-content "C:\Users\Kyle\Documents\Projects\Powershell\WPF\Password Reset\App.xaml"
$NR=(New-Object System.Xml.XmlNodeReader $Form)
$Win=[Windows.Markup.XamlReader]::Load($NR)

$user = $Win.FindName("UserName")
$pwd = $Win.FindName("Password")
$gen = $Win.FindName("GeneratePassword")
$update = $Win.FindName("Update")

$Win.ShowDialog()