EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:tinkerforge
LIBS:distance_us-cache
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Distance US Bricklet"
Date "15 oct 2013"
Rev "1.0"
Comp "Tinkerforge GmbH"
Comment1 "Licensed under CERN OHL v.1.1"
Comment2 "Copyright (©) 2013, B.Nordmeyer <bastian@tinkerforge.com>"
Comment3 ""
Comment4 ""
$EndDescr
NoConn ~ 4100 3650
$Comp
L GND #PWR01
U 1 1 509A86EF
P 4500 3250
F 0 "#PWR01" H 4500 3250 30  0001 C CNN
F 1 "GND" H 4500 3180 30  0001 C CNN
F 2 "" H 4500 3250 60  0001 C CNN
F 3 "" H 4500 3250 60  0001 C CNN
	1    4500 3250
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR02
U 1 1 509A86E5
P 4100 3100
F 0 "#PWR02" H 4100 3200 30  0001 C CNN
F 1 "VCC" H 4100 3200 30  0000 C CNN
F 2 "" H 4100 3100 60  0001 C CNN
F 3 "" H 4100 3100 60  0001 C CNN
	1    4100 3100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 509A86CD
P 4900 3900
F 0 "#PWR03" H 4900 3900 30  0001 C CNN
F 1 "GND" H 4900 3830 30  0001 C CNN
F 2 "" H 4900 3900 60  0001 C CNN
F 3 "" H 4900 3900 60  0001 C CNN
	1    4900 3900
	1    0    0    -1  
$EndComp
Text Notes 550  7200 0    40   ~ 0
Copyright Tinkerforge GmbH 2013.\nThis documentation describes Open Hardware and is licensed under the\nCERN OHL v. 1.1.\nYou may redistribute and modify this documentation under the terms of the\nCERN OHL v.1.1. (http://ohwr.org/cernohl). This documentation is distributed\nWITHOUT ANY EXPRESS OR IMPLIED WARRANTY, INCLUDING OF\nMERCHANTABILITY, SATISFACTORY QUALITY AND FITNESS FOR A\nPARTICULAR PURPOSE. Please see the CERN OHL v.1.1 for applicable\nconditions\n
$Comp
L DRILL U3
U 1 1 4C6050A5
P 10700 6500
F 0 "U3" H 10750 6550 60  0001 C CNN
F 1 "DRILL" H 10700 6500 60  0000 C CNN
F 2 "DRILL_NP" H 10700 6500 60  0001 C CNN
F 3 "" H 10700 6500 60  0001 C CNN
	1    10700 6500
	1    0    0    -1  
$EndComp
$Comp
L DRILL U4
U 1 1 4C6050A2
P 10700 6700
F 0 "U4" H 10750 6750 60  0001 C CNN
F 1 "DRILL" H 10700 6700 60  0000 C CNN
F 2 "DRILL_NP" H 10700 6700 60  0001 C CNN
F 3 "" H 10700 6700 60  0001 C CNN
	1    10700 6700
	1    0    0    -1  
$EndComp
$Comp
L DRILL U6
U 1 1 4C60509F
P 11050 6700
F 0 "U6" H 11100 6750 60  0001 C CNN
F 1 "DRILL" H 11050 6700 60  0000 C CNN
F 2 "DRILL_NP" H 11050 6700 60  0001 C CNN
F 3 "" H 11050 6700 60  0001 C CNN
	1    11050 6700
	1    0    0    -1  
$EndComp
$Comp
L DRILL U5
U 1 1 4C605099
P 11050 6500
F 0 "U5" H 11100 6550 60  0001 C CNN
F 1 "DRILL" H 11050 6500 60  0000 C CNN
F 2 "DRILL_NP" H 11050 6500 60  0001 C CNN
F 3 "" H 11050 6500 60  0001 C CNN
	1    11050 6500
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 4C5FD6ED
P 4300 3200
F 0 "C4" V 4450 3200 50  0000 L CNN
F 1 "100nF" V 4150 3100 50  0000 L CNN
F 2 "0603" H 4300 3200 60  0001 C CNN
F 3 "" H 4300 3200 60  0001 C CNN
	1    4300 3200
	0    -1   -1   0   
$EndComp
$Comp
L CAT24C U2
U 1 1 4C5FD337
P 4500 3950
F 0 "U2" H 4350 4450 60  0000 C CNN
F 1 "M24C64" H 4500 3950 60  0000 C CNN
F 2 "SOIC8" H 4500 3950 60  0001 C CNN
F 3 "" H 4500 3950 60  0001 C CNN
	1    4500 3950
	-1   0    0    -1  
$EndComp
$Comp
L VCC #PWR04
U 1 1 4C5FCFB4
P 3550 3350
F 0 "#PWR04" H 3550 3450 30  0001 C CNN
F 1 "VCC" H 3550 3450 30  0000 C CNN
F 2 "" H 3550 3350 60  0001 C CNN
F 3 "" H 3550 3350 60  0001 C CNN
	1    3550 3350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 4C5FCF5E
P 3650 3700
F 0 "#PWR05" H 3650 3700 30  0001 C CNN
F 1 "GND" H 3650 3630 30  0001 C CNN
F 2 "" H 3650 3700 60  0001 C CNN
F 3 "" H 3650 3700 60  0001 C CNN
	1    3650 3700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 4C5FCF4F
P 2950 4600
F 0 "#PWR06" H 2950 4600 30  0001 C CNN
F 1 "GND" H 2950 4530 30  0001 C CNN
F 2 "" H 2950 4600 60  0001 C CNN
F 3 "" H 2950 4600 60  0001 C CNN
	1    2950 4600
	1    0    0    -1  
$EndComp
$Comp
L CON-SENSOR P1
U 1 1 4C5FCF27
P 2950 3900
F 0 "P1" H 2700 4450 60  0000 C CNN
F 1 "CON-SENSOR" V 3100 3900 60  0000 C CNN
F 2 "CON-SENSOR" H 2950 3900 60  0001 C CNN
F 3 "" H 2950 3900 60  0001 C CNN
	1    2950 3900
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4500 3200 4500 3250
Wire Wire Line
	5000 3850 4900 3850
Wire Wire Line
	5000 3850 5000 3650
Wire Wire Line
	5000 3650 4900 3650
Wire Wire Line
	4100 3850 3400 3850
Wire Wire Line
	3550 3350 3550 3650
Wire Wire Line
	3550 3650 3400 3650
Wire Wire Line
	2950 4600 2950 4500
Wire Wire Line
	3400 3550 3650 3550
Wire Wire Line
	3650 3550 3650 3700
Wire Wire Line
	4100 3750 3400 3750
Wire Wire Line
	4900 3850 4900 3900
Wire Wire Line
	4900 3650 4900 3550
Connection ~ 4900 3650
Connection ~ 4900 3850
Wire Wire Line
	4100 3550 4100 3100
Connection ~ 4100 3200
Wire Wire Line
	3400 3950 5050 3950
Wire Wire Line
	5050 3950 5050 3750
Wire Wire Line
	5050 3750 4900 3750
NoConn ~ 3400 4350
$Comp
L LM358 U1
U 3 1 51F12493
P 3200 2300
F 0 "U1" H 3150 2500 60  0000 L CNN
F 1 "LMV358LI" H 3150 2050 60  0000 L CNN
F 2 "SOIC8" H 3200 2300 60  0001 C CNN
F 3 "" H 3200 2300 60  0000 C CNN
	3    3200 2300
	1    0    0    -1  
$EndComp
$Comp
L VAA #PWR4
U 1 1 51F12BFA
P 3100 1550
F 0 "#PWR4" H 3100 1610 30  0001 C CNN
F 1 "VAA" H 3100 1660 30  0000 C CNN
F 2 "" H 3100 1550 60  0000 C CNN
F 3 "" H 3100 1550 60  0000 C CNN
	1    3100 1550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 51F12C26
P 3100 2800
F 0 "#PWR07" H 3100 2800 30  0001 C CNN
F 1 "GND" H 3100 2730 30  0001 C CNN
F 2 "" H 3100 2800 60  0001 C CNN
F 3 "" H 3100 2800 60  0001 C CNN
	1    3100 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 1850 3100 1550
Wire Wire Line
	3100 2800 3100 2750
$Comp
L C C3
U 1 1 51F12CC1
P 3900 1900
F 0 "C3" H 3950 2000 50  0000 L CNN
F 1 "2.2uF 10V" H 3950 1800 50  0000 L CNN
F 2 "0805" H 3900 1900 60  0001 C CNN
F 3 "" H 3900 1900 60  0000 C CNN
	1    3900 1900
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 51F12CC7
P 3600 1900
F 0 "C2" V 3750 1900 50  0000 L CNN
F 1 "100nF" V 3450 1800 50  0000 L CNN
F 2 "0603" H 3600 1900 60  0001 C CNN
F 3 "" H 3600 1900 60  0001 C CNN
	1    3600 1900
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR08
U 1 1 51F12CF0
P 3600 2250
F 0 "#PWR08" H 3600 2250 30  0001 C CNN
F 1 "GND" H 3600 2180 30  0001 C CNN
F 2 "" H 3600 2250 60  0001 C CNN
F 3 "" H 3600 2250 60  0001 C CNN
	1    3600 2250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR09
U 1 1 51F12CF6
P 3900 2250
F 0 "#PWR09" H 3900 2250 30  0001 C CNN
F 1 "GND" H 3900 2180 30  0001 C CNN
F 2 "" H 3900 2250 60  0001 C CNN
F 3 "" H 3900 2250 60  0001 C CNN
	1    3900 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 2250 3900 2100
Wire Wire Line
	3600 2250 3600 2100
Wire Wire Line
	3050 1600 3900 1600
Wire Wire Line
	3600 1600 3600 1700
Connection ~ 3100 1600
Wire Wire Line
	3900 1600 3900 1700
Connection ~ 3600 1600
$Comp
L INDUCTOR L1
U 1 1 51F13494
P 2750 1600
F 0 "L1" V 2700 1600 40  0000 C CNN
F 1 "FB" V 2850 1600 40  0000 C CNN
F 2 "0603" H 2750 1600 60  0001 C CNN
F 3 "" H 2750 1600 60  0000 C CNN
	1    2750 1600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2450 1550 2450 1700
$Comp
L C C1
U 1 1 51F13556
P 2450 1900
F 0 "C1" V 2600 1900 50  0000 L CNN
F 1 "100nF" V 2300 1800 50  0000 L CNN
F 2 "0603" H 2450 1900 60  0001 C CNN
F 3 "" H 2450 1900 60  0001 C CNN
	1    2450 1900
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR010
U 1 1 51F1355C
P 2450 2250
F 0 "#PWR010" H 2450 2250 30  0001 C CNN
F 1 "GND" H 2450 2180 30  0001 C CNN
F 2 "" H 2450 2250 60  0001 C CNN
F 3 "" H 2450 2250 60  0001 C CNN
	1    2450 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 2250 2450 2100
Connection ~ 2450 1600
$Comp
L +5V #PWR011
U 1 1 52016BE0
P 3400 3050
F 0 "#PWR011" H 3400 3140 20  0001 C CNN
F 1 "+5V" H 3400 3140 30  0000 C CNN
F 2 "" H 3400 3050 60  0000 C CNN
F 3 "" H 3400 3050 60  0000 C CNN
	1    3400 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 3450 3400 3050
$Comp
L +5V #PWR012
U 1 1 52016C3C
P 2450 1550
F 0 "#PWR012" H 2450 1640 20  0001 C CNN
F 1 "+5V" H 2450 1640 30  0000 C CNN
F 2 "" H 2450 1550 60  0000 C CNN
F 3 "" H 2450 1550 60  0000 C CNN
	1    2450 1550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR013
U 1 1 52016E9B
P 10650 5700
F 0 "#PWR013" H 10650 5700 30  0001 C CNN
F 1 "GND" H 10650 5630 30  0001 C CNN
F 2 "" H 10650 5700 60  0001 C CNN
F 3 "" H 10650 5700 60  0001 C CNN
	1    10650 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	10650 4000 10650 5700
$Comp
L VAA #PWR20
U 1 1 52016F16
P 10450 3700
F 0 "#PWR20" H 10450 3760 30  0001 C CNN
F 1 "VAA" H 10450 3810 30  0000 C CNN
F 2 "" H 10450 3700 60  0000 C CNN
F 3 "" H 10450 3700 60  0000 C CNN
	1    10450 3700
	1    0    0    -1  
$EndComp
$Comp
L C C7
U 1 1 52016F53
P 10450 4550
F 0 "C7" V 10600 4550 50  0000 L CNN
F 1 "100nF" V 10300 4450 50  0000 L CNN
F 2 "0603" H 10450 4550 60  0001 C CNN
F 3 "" H 10450 4550 60  0001 C CNN
	1    10450 4550
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR014
U 1 1 52016F59
P 10450 5700
F 0 "#PWR014" H 10450 5700 30  0001 C CNN
F 1 "GND" H 10450 5630 30  0001 C CNN
F 2 "" H 10450 5700 60  0001 C CNN
F 3 "" H 10450 5700 60  0001 C CNN
	1    10450 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	10450 5700 10450 4750
Wire Wire Line
	10450 3700 10450 4350
$Comp
L CONN_4 P2
U 1 1 52017127
P 11000 3850
F 0 "P2" V 10950 3850 50  0000 C CNN
F 1 "CONN_4" V 11050 3850 50  0000 C CNN
F 2 "pin_array_4x1" H 11000 3850 60  0001 C CNN
F 3 "" H 11000 3850 60  0000 C CNN
	1    11000 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	10650 3700 10450 3700
Connection ~ 10450 3700
Text GLabel 5450 4800 2    60   Output ~ 0
Trigger
Wire Wire Line
	3650 4250 3400 4250
Text GLabel 10350 3800 0    60   Input ~ 0
Trigger
Wire Wire Line
	10350 3800 10650 3800
Wire Wire Line
	5450 4800 5350 4800
$Comp
L MOSFET_N Q1
U 1 1 52017164
P 5250 5050
F 0 "Q1" H 5260 5220 60  0000 R CNN
F 1 "2N7002P" H 5260 4900 60  0000 R CNN
F 2 "SOT23GDS" H 5250 5050 60  0001 C CNN
F 3 "" H 5250 5050 60  0000 C CNN
	1    5250 5050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR015
U 1 1 52017171
P 5350 5300
F 0 "#PWR015" H 5350 5300 30  0001 C CNN
F 1 "GND" H 5350 5230 30  0001 C CNN
F 2 "" H 5350 5300 60  0001 C CNN
F 3 "" H 5350 5300 60  0001 C CNN
	1    5350 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 5300 5350 5250
Wire Wire Line
	5350 3800 5350 4850
Connection ~ 5350 4800
$Comp
L MOSFET_N Q2
U 1 1 521F4D44
P 8200 5000
F 0 "Q2" H 8210 5170 60  0000 R CNN
F 1 "2N7002P" H 8210 4850 60  0000 R CNN
F 2 "SOT23GDS" H 8200 5000 60  0001 C CNN
F 3 "" H 8200 5000 60  0000 C CNN
	1    8200 5000
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 521F53B9
P 9000 3900
F 0 "R1" V 9080 3900 50  0000 C CNN
F 1 "160k" V 9000 3900 50  0000 C CNN
F 2 "0603" H 9000 3900 60  0001 C CNN
F 3 "" H 9000 3900 60  0000 C CNN
	1    9000 3900
	0    -1   -1   0   
$EndComp
$Comp
L C C6
U 1 1 521F53BF
P 8750 4500
F 0 "C6" H 8800 4600 50  0000 L CNN
F 1 "0,1µF NC0" H 8800 4400 50  0000 L CNN
F 2 "1206" H 8750 4500 60  0001 C CNN
F 3 "" H 8750 4500 60  0000 C CNN
	1    8750 4500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR016
U 1 1 521F53C5
P 8750 5700
F 0 "#PWR016" H 8750 5700 30  0001 C CNN
F 1 "GND" H 8750 5630 30  0001 C CNN
F 2 "" H 8750 5700 60  0001 C CNN
F 3 "" H 8750 5700 60  0001 C CNN
	1    8750 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 3900 8750 4300
Connection ~ 8750 3900
Wire Wire Line
	8750 5700 8750 4700
Wire Wire Line
	7350 3900 8750 3900
$Comp
L LM358 U1
U 2 1 521F53DB
P 6850 4000
F 0 "U1" H 6800 4200 60  0000 L CNN
F 1 "LMV358LI" H 6800 3750 60  0000 L CNN
F 2 "SOIC8" H 6850 4000 60  0001 C CNN
F 3 "" H 6850 4000 60  0000 C CNN
	2    6850 4000
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6350 4000 6350 4350
Wire Wire Line
	6350 4350 7350 4350
Wire Wire Line
	7350 4350 7350 4100
Wire Wire Line
	6100 4000 6350 4000
$Comp
L C C5
U 1 1 521F53ED
P 6100 4550
F 0 "C5" V 6250 4550 50  0000 L CNN
F 1 "100nF" V 5950 4450 50  0000 L CNN
F 2 "0603" H 6100 4550 60  0001 C CNN
F 3 "" H 6100 4550 60  0001 C CNN
	1    6100 4550
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR017
U 1 1 521F53F3
P 6100 5850
F 0 "#PWR017" H 6100 5850 30  0001 C CNN
F 1 "GND" H 6100 5780 30  0001 C CNN
F 2 "" H 6100 5850 60  0001 C CNN
F 3 "" H 6100 5850 60  0001 C CNN
	1    6100 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 5850 6100 4750
Connection ~ 6350 4000
$Comp
L GND #PWR018
U 1 1 521F540F
P 8300 5700
F 0 "#PWR018" H 8300 5700 30  0001 C CNN
F 1 "GND" H 8300 5630 30  0001 C CNN
F 2 "" H 8300 5700 60  0001 C CNN
F 3 "" H 8300 5700 60  0001 C CNN
	1    8300 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 4800 8300 3900
Connection ~ 8300 3900
Wire Wire Line
	8300 5700 8300 5200
$Comp
L DIODESCH D1
U 1 1 521F55F7
P 9600 3900
F 0 "D1" H 9600 4000 40  0000 C CNN
F 1 "BAS16H" H 9600 3800 40  0000 C CNN
F 2 "SOD-123" H 9600 3900 60  0001 C CNN
F 3 "" H 9600 3900 60  0000 C CNN
	1    9600 3900
	-1   0    0    1   
$EndComp
Wire Wire Line
	10650 3900 9800 3900
Wire Wire Line
	9400 3900 9250 3900
Wire Wire Line
	6100 4000 6100 4350
Connection ~ 6100 4050
$Comp
L LM358 U1
U 1 1 5222FEA4
P 6950 2350
F 0 "U1" H 6900 2550 60  0000 L CNN
F 1 "LMV358LI" H 6900 2100 60  0000 L CNN
F 2 "SOIC8" H 6950 2350 60  0001 C CNN
F 3 "" H 6950 2350 60  0000 C CNN
	1    6950 2350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7450 2450 7450 2250
NoConn ~ 6450 2350
Wire Wire Line
	6100 4050 3400 4050
Wire Wire Line
	3400 4150 5850 4150
$Comp
L R_PACK4 RP1
U 1 1 5222FF85
P 5300 3600
F 0 "RP1" H 5300 4050 40  0000 C CNN
F 1 "10k" H 5300 3550 40  0000 C CNN
F 2 "0603X4" H 5300 3600 60  0001 C CNN
F 3 "" H 5300 3600 60  0000 C CNN
	1    5300 3600
	0    1    -1   0   
$EndComp
$Comp
L VAA #PWR14
U 1 1 5222FF92
P 5350 3250
F 0 "#PWR14" H 5350 3310 30  0001 C CNN
F 1 "VAA" H 5350 3360 30  0000 C CNN
F 2 "" H 5350 3250 60  0000 C CNN
F 3 "" H 5350 3250 60  0000 C CNN
	1    5350 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 3400 5350 3250
Wire Wire Line
	5850 4150 5850 5000
Wire Wire Line
	5850 5000 8000 5000
Wire Wire Line
	5650 3800 5650 4150
Connection ~ 5650 4150
Wire Wire Line
	5050 5050 3650 5050
Wire Wire Line
	3650 5050 3650 4250
$Comp
L VCC #PWR019
U 1 1 52230188
P 5650 3250
F 0 "#PWR019" H 5650 3350 30  0001 C CNN
F 1 "VCC" H 5650 3350 30  0000 C CNN
F 2 "" H 5650 3250 60  0001 C CNN
F 3 "" H 5650 3250 60  0001 C CNN
	1    5650 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 3400 5650 3250
NoConn ~ 5450 3800
NoConn ~ 5450 3400
Wire Wire Line
	5550 3400 5650 3400
Wire Wire Line
	5550 3800 5550 4550
Wire Wire Line
	5550 4550 4850 4550
Wire Wire Line
	4850 4550 4850 5050
Connection ~ 4850 5050
$EndSCHEMATC
