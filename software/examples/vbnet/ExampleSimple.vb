Imports System
Imports Tinkerforge

Module ExampleSimple
    Const HOST As String = "localhost"
    Const PORT As Integer = 4223
    Const UID As String = "XYZ" ' Change XYZ to the UID of your Distance US Bricklet

    Sub Main()
        Dim ipcon As New IPConnection() ' Create IP connection
        Dim dus As New BrickletDistanceUS(UID, ipcon) ' Create device object

        ipcon.Connect(HOST, PORT) ' Connect to brickd
        ' Don't use device before ipcon is connected

        ' Get current distance value
        Dim distance As Integer = dus.GetDistanceValue()
        Console.WriteLine("Distance Value: " + distance.ToString())

        Console.WriteLine("Press key to exit")
        Console.ReadLine()
        ipcon.Disconnect()
    End Sub
End Module
