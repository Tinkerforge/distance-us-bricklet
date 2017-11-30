Imports System
Imports Tinkerforge

Module ExampleThreshold
    Const HOST As String = "localhost"
    Const PORT As Integer = 4223
    Const UID As String = "XYZ" ' Change XYZ to the UID of your Distance US Bricklet

    ' Callback subroutine for distance value reached callback
    Sub DistanceReachedCB(ByVal sender As BrickletDistanceUS, ByVal distance As Integer)
        Console.WriteLine("Distance Value: " + distance.ToString())
    End Sub

    Sub Main()
        Dim ipcon As New IPConnection() ' Create IP connection
        Dim dus As New BrickletDistanceUS(UID, ipcon) ' Create device object

        ipcon.Connect(HOST, PORT) ' Connect to brickd
        ' Don't use device before ipcon is connected

        ' Get threshold callbacks with a debounce time of 10 seconds (10000ms)
        dus.SetDebouncePeriod(10000)

        ' Register distance value reached callback to subroutine DistanceReachedCB
        AddHandler dus.DistanceReachedCallback, AddressOf DistanceReachedCB

        ' Configure threshold for distance "smaller than 200"
        dus.SetDistanceCallbackThreshold("<"C, 200, 0)

        Console.WriteLine("Press key to exit")
        Console.ReadLine()
        ipcon.Disconnect()
    End Sub
End Module
