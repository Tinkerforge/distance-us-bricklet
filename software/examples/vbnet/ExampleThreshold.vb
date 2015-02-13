Imports Tinkerforge

Module ExampleThreshold
    Const HOST As String = "localhost"
    Const PORT As Integer = 4223
    Const UID As String = "XYZ" ' Change to your UID

    ' Callback for distance value smaller than 200
    Sub ReachedCB(ByVal sender As BrickletDistanceUS, ByVal distance As Integer)
        System.Console.WriteLine("Distance is smaller than 200: " + distance.ToString())
    End Sub

    Sub Main()
        Dim ipcon As New IPConnection() ' Create IP connection
        Dim di As New BrickletDistanceUS(UID, ipcon) ' Create device object

        ipcon.Connect(HOST, PORT) ' Connect to brickd
        ' Don't use device before ipcon is connected

        ' Get threshold callbacks with a debounce time of 10 seconds (10000ms)
        di.SetDebouncePeriod(10000)

        ' Register threshold reached callback to function ReachedCB
        AddHandler di.DistanceReached, AddressOf ReachedCB

        ' Configure threshold for "smaller than 200"
        di.SetDistanceCallbackThreshold("<"C, 200, 0)

        System.Console.WriteLine("Press key to exit")
        System.Console.ReadLine()
        ipcon.Disconnect()
    End Sub
End Module
