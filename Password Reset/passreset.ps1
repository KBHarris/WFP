Add-Type -AssemblyName PresentationFramework

[xml]$Form =@"
    <Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    Title="Password Reset" Height="350" Width="525" Background="#FF262626">
        <Grid>
            
        </Grid>
    </Window>
"@


$NR=(New-Object System.Xml.XmlNodeReader $Form)
$Win=[Windows.Markup.XamlReader]::Load($NR)

$Win.ShowDialog()