Imports System
Imports Tinkerforge

Module ExampleCallback
    Const HOST As String = "localhost"
    Const PORT As Integer = 4223
    Const UID As String = "XYZ" ' Change XYZ to the UID of your Distance US Bricklet

    ' Callback subroutine for distance value callback
    Sub DistanceCB(ByVal sender As BrickletDistanceUS, ByVal distance As Integer)
        Console.WriteLine("Distance Value: " + distance.ToString())
    End Sub

    Sub Main()
        Dim ipcon As New IPConnection() ' Create IP connection
        Dim dus As New BrickletDistanceUS(UID, ipcon) ' Create device object

        ipcon.Connect(HOST, PORT) ' Connect to brickd
        ' Don't use device before ipcon is connected

        ' Register distance value callback to subroutine DistanceCB
        AddHandler dus.DistanceCallback, AddressOf DistanceCB

        ' Set period for distance value callback to 0.2s (200ms)
        ' Note: The distance value callback is only called every 0.2 seconds
        '       if the distance value has changed since the last call!
        dus.SetDistanceCallbackPeriod(200)

        Console.WriteLine("Press key to exit")
        Console.ReadLine()
        ipcon.Disconnect()
    End Sub
End Module
