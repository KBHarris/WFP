Add-Type -AssemblyName PresentationFramework

[xml]$Form =@"
    <Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    Title="Event Viewer" Height="350" Width="525" Background="#FF262626">
        <Grid>
            <TextBox Name="EID" HorizontalAlignment="Left" Height="25" Margin="79,10,0,0" TextWrapping="Wrap" Text=" " VerticalAlignment="Top" Width="155" BorderBrush="#FFF96816" />
            <TextBox Name="Comp" HorizontalAlignment="Left" Height="26" Margin="79,41,0,0" TextWrapping="Wrap" Text=" " VerticalAlignment="Top" Width="155" BorderBrush="#FFF96816" />
            <DatePicker Name="Date" HorizontalAlignment="Left" Height="27" Margin="79,72,0,0" VerticalAlignment="Top" Width="155"/>
            <TextBox Name="Results" HorizontalAlignment="Left" Height="156" Margin="10,141,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="495" BorderBrush="#FFF96816" />
            <Button Name="Start" Content="START" HorizontalAlignment="Left" Height="89" Margin="279,10,0,0" VerticalAlignment="Top" Width="226" Background="#FFF96816" Foreground="#FFFDFDFD" FontSize="36" FontWeight="Bold" />
        </Grid>
    </Window>
"@


$NR=(New-Object System.Xml.XmlNodeReader $Form)
$Win=[Windows.Markup.XamlReader]::Load($NR)

$Win.Showdialog()