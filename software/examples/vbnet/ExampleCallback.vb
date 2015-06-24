Imports Tinkerforge

Module ExampleCallback
    Const HOST As String = "localhost"
    Const PORT As Integer = 4223
    Const UID As String = "XYZ" ' Change to your UID

    ' Callback function for distance value
    Sub DistanceCB(ByVal sender As BrickletDistanceUS, ByVal distance As Integer)
        System.Console.WriteLine("Distance Value: " + distance.ToString())
    End Sub

    Sub Main()
        Dim ipcon As New IPConnection() ' Create IP connection
        Dim dus As New BrickletDistanceUS(UID, ipcon) ' Create device object

        ipcon.Connect(HOST, PORT) ' Connect to brickd
        ' Don't use device before ipcon is connected

        ' Set Period for distance callback to 1s (1000ms)
        ' Note: The distance callback is only called every second if the 
        '       distance has changed since the last call!
        dus.SetDistanceCallbackPeriod(1000)

        ' Register distance callback to function DistanceCB
        AddHandler dus.Distance, AddressOf DistanceCB

        System.Console.WriteLine("Press key to exit")
        System.Console.ReadLine()
        ipcon.Disconnect()
    End Sub
End Module
