Add-Type -AssemblyName PresentationFramework

Function Check-Event($ev, $co, $da){
    $comp=$co.trim()
    $re = Get-EventLog -LogName Application -ComputerName "$comp" -After $da | Where-Object {$_.EventID -eq $ev}
    $res.text += "There are "+$re.count+" events of EventID $ev on computer $comp after the time $da `r`n"
}

[xml]$Form =@"
    <Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    Title="Event Viewer" Height="350" Width="525" Background="#FF262626">
        <Grid>
            <Label Name="EventID" Content="EventID" HorizontalAlignment="Left" Height="25" Margin="10,10,0,0" VerticalAlignment="Top" Width="69" FontFamily="Segoe UI" Foreground="White"/>
            <Label Name="Computer" Content="Computer" HorizontalAlignment="Left" Height="26" Margin="10,41,0,0" VerticalAlignment="Top" Width="69" Foreground="White"/>
            <Label Name="STime" Content="Start Time" HorizontalAlignment="Left" Height="28" Margin="10,71,0,0" VerticalAlignment="Top" Width="69" Foreground="White"/>
            <TextBox Name="EID" HorizontalAlignment="Left" Height="25" Margin="79,10,0,0" TextWrapping="Wrap" Text="" VerticalAlignment="Top" Width="155" BorderBrush="#FFF96816" />
            <TextBox Name="Comp" HorizontalAlignment="Left" Height="26" Margin="79,41,0,0" TextWrapping="Wrap" Text="" VerticalAlignment="Top" Width="155" BorderBrush="#FFF96816" />
            <DatePicker Name="Date" HorizontalAlignment="Left" Height="27" Margin="79,72,0,0" VerticalAlignment="Top" Width="155"/>
            <Label Name="Res" Content="Results" HorizontalAlignment="Left" Height="24" Margin="10,114,0,0" VerticalAlignment="Top" Width="92" Foreground="White" FontWeight="Bold"/>
            <TextBox Name="Results" HorizontalAlignment="Left" Height="156" Margin="10,141,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="495" BorderBrush="#FFF96816" />
            <Button Name="Start" Content="START" HorizontalAlignment="Left" Height="89" Margin="279,10,0,0" VerticalAlignment="Top" Width="226" Background="#FFF96816" Foreground="#FFFDFDFD" FontSize="36" FontWeight="Bold" />
        </Grid>
    </Window>
"@


$NR=(New-Object System.Xml.XmlNodeReader $Form)
$Win=[Windows.Markup.XamlReader]::Load($NR)

$Start = $Win.FindName("Start")
$eid = $Win.FindName("EID")
$date = $win.FindName("Date")
$comp = $Win.FindName("Comp")
$res = $Win.FindName("Results")

$start.Add_Click({
    $event =$eid.text
    $computer = $comp.text
    $da = $date.SelectedDate
    $d = Get-date $da
    if($event -eq "" -or $comp -eq "" -or $date -eq $null){
        [System.Windows.MessageBox]::Show("Please make sure all values are entered", "Missing Values")
    }else {
    $d = Get-date $da
    Check-Event $event $computer $d
    }
})

$Win.Showdialog()