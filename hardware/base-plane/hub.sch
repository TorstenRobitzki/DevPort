EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 7
Title "DevPort Base-Plane"
Date "2021-02-17"
Rev "0.1"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	7050 2250 7400 2250
Text GLabel 7400 2250 2    50   UnSpc ~ 0
X0
Wire Wire Line
	3850 3150 3450 3150
Text GLabel 3450 3150 0    50   UnSpc ~ 0
X1
$Comp
L Device:Crystal_GND24_Small Y1
U 1 1 60288307
P 10500 5650
F 0 "Y1" H 10300 5750 50  0000 L CNN
F 1 "24MHz" H 10350 5900 50  0000 L CNN
F 2 "Crystal:Crystal_SMD_3225-4Pin_3.2x2.5mm" H 10500 5650 50  0001 C CNN
F 3 "https://www.mouser.de/datasheet/2/3/abm8-1384678.pdf" H 10500 5650 50  0001 C CNN
	1    10500 5650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C36
U 1 1 6028991C
P 10750 5850
F 0 "C36" H 10865 5896 50  0000 L CNN
F 1 "12pF" H 10865 5805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 10788 5700 50  0001 C CNN
F 3 "~" H 10750 5850 50  0001 C CNN
	1    10750 5850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C35
U 1 1 6028A415
P 10200 5850
F 0 "C35" H 10315 5896 50  0000 L CNN
F 1 "12pF" H 10315 5805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 10238 5700 50  0001 C CNN
F 3 "~" H 10200 5850 50  0001 C CNN
	1    10200 5850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR046
U 1 1 6028AF3A
P 10750 6150
F 0 "#PWR046" H 10750 5900 50  0001 C CNN
F 1 "GND" H 10755 5977 50  0000 C CNN
F 2 "" H 10750 6150 50  0001 C CNN
F 3 "" H 10750 6150 50  0001 C CNN
	1    10750 6150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR043
U 1 1 6028B2D8
P 10200 6150
F 0 "#PWR043" H 10200 5900 50  0001 C CNN
F 1 "GND" H 10205 5977 50  0000 C CNN
F 2 "" H 10200 6150 50  0001 C CNN
F 3 "" H 10200 6150 50  0001 C CNN
	1    10200 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	10600 5650 10750 5650
Wire Wire Line
	10750 5650 10750 5700
Wire Wire Line
	10400 5650 10200 5650
Wire Wire Line
	10200 5650 10200 5700
Wire Wire Line
	10200 6000 10200 6050
Wire Wire Line
	10750 6000 10750 6150
Wire Wire Line
	10500 5750 10500 6000
Wire Wire Line
	10500 6000 10750 6000
Connection ~ 10750 6000
Wire Wire Line
	10500 5550 10500 5500
Wire Wire Line
	10500 5500 10050 5500
Wire Wire Line
	10050 5500 10050 6050
Wire Wire Line
	10050 6050 10200 6050
Connection ~ 10200 6050
Wire Wire Line
	10200 6050 10200 6150
$Comp
L Device:R R14
U 1 1 6028C909
P 10500 5200
F 0 "R14" V 10293 5200 50  0000 C CNN
F 1 "1M" V 10384 5200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10430 5200 50  0001 C CNN
F 3 "~" H 10500 5200 50  0001 C CNN
	1    10500 5200
	0    1    1    0   
$EndComp
Wire Wire Line
	10750 5650 10750 5200
Wire Wire Line
	10750 5200 10650 5200
Connection ~ 10750 5650
Wire Wire Line
	10200 5650 10200 5200
Wire Wire Line
	10200 5200 10350 5200
Connection ~ 10200 5650
Wire Wire Line
	10200 5200 9850 5200
Connection ~ 10200 5200
Wire Wire Line
	10750 5200 10750 4900
Wire Wire Line
	10750 4900 9850 4900
Connection ~ 10750 5200
Text GLabel 9850 4900 0    50   UnSpc ~ 0
X0
Text GLabel 9850 5200 0    50   UnSpc ~ 0
X1
Wire Wire Line
	7450 1050 7050 1050
$Comp
L power:+3V3 #PWR039
U 1 1 602937DE
P 6350 6400
F 0 "#PWR039" H 6350 6250 50  0001 C CNN
F 1 "+3V3" H 6365 6573 50  0000 C CNN
F 2 "" H 6350 6400 50  0001 C CNN
F 3 "" H 6350 6400 50  0001 C CNN
	1    6350 6400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C34
U 1 1 602945C1
P 6350 7050
F 0 "C34" H 6465 7096 50  0000 L CNN
F 1 "10µF" H 6465 7005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6388 6900 50  0001 C CNN
F 3 "~" H 6350 7050 50  0001 C CNN
	1    6350 7050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C33
U 1 1 602951AD
P 5900 7050
F 0 "C33" H 6015 7096 50  0000 L CNN
F 1 "0.1µF" H 6015 7005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5938 6900 50  0001 C CNN
F 3 "~" H 5900 7050 50  0001 C CNN
	1    5900 7050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C32
U 1 1 602955DB
P 5450 7050
F 0 "C32" H 5565 7096 50  0000 L CNN
F 1 "0.1µF" H 5565 7005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5488 6900 50  0001 C CNN
F 3 "~" H 5450 7050 50  0001 C CNN
	1    5450 7050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C31
U 1 1 60295A8B
P 5000 7050
F 0 "C31" H 5115 7096 50  0000 L CNN
F 1 "0.1µF" H 5115 7005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5038 6900 50  0001 C CNN
F 3 "~" H 5000 7050 50  0001 C CNN
	1    5000 7050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C30
U 1 1 602962BC
P 4550 7050
F 0 "C30" H 4665 7096 50  0000 L CNN
F 1 "0.1µF" H 4665 7005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4588 6900 50  0001 C CNN
F 3 "~" H 4550 7050 50  0001 C CNN
	1    4550 7050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR040
U 1 1 60296911
P 6350 7400
F 0 "#PWR040" H 6350 7150 50  0001 C CNN
F 1 "GND" H 6355 7227 50  0000 C CNN
F 2 "" H 6350 7400 50  0001 C CNN
F 3 "" H 6350 7400 50  0001 C CNN
	1    6350 7400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 7400 6350 7300
Connection ~ 6350 7300
Wire Wire Line
	6350 7300 6350 7200
Connection ~ 6350 6800
Wire Wire Line
	6350 6800 6350 6900
Wire Wire Line
	4550 6800 4550 6900
Wire Wire Line
	4550 6800 5000 6800
Wire Wire Line
	4550 7200 4550 7300
Wire Wire Line
	4550 7300 5000 7300
Wire Wire Line
	5000 7200 5000 7300
Connection ~ 5000 7300
Wire Wire Line
	5000 7300 5450 7300
Wire Wire Line
	5000 6800 5000 6900
Connection ~ 5000 6800
Wire Wire Line
	5000 6800 5450 6800
Wire Wire Line
	5450 6800 5450 6900
Connection ~ 5450 6800
Wire Wire Line
	5450 6800 5700 6800
Wire Wire Line
	5450 7200 5450 7300
Connection ~ 5450 7300
Wire Wire Line
	5450 7300 5900 7300
Wire Wire Line
	5900 7200 5900 7300
Connection ~ 5900 7300
Wire Wire Line
	5900 7300 6350 7300
Wire Wire Line
	5900 6900 5900 6800
Connection ~ 5900 6800
Wire Wire Line
	5900 6800 6350 6800
$Comp
L Device:Ferrite_Bead_Small FB2
U 1 1 602A96E5
P 6350 6550
F 0 "FB2" H 6450 6596 50  0000 L CNN
F 1 "220 at 100MHz" H 6050 6450 50  0000 L CNN
F 2 "Inductor_SMD:L_0603_1608Metric" V 6280 6550 50  0001 C CNN
F 3 "~" H 6350 6550 50  0001 C CNN
	1    6350 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 6450 6350 6400
Wire Wire Line
	6350 6650 6350 6800
Wire Wire Line
	3850 5150 3450 5150
Wire Wire Line
	3850 2450 3450 2450
Wire Wire Line
	7050 1650 7400 1650
Wire Wire Line
	7050 2150 7400 2150
Text HLabel 3450 5150 0    50   BiDi ~ 0
USB_DM_UP
Text HLabel 3450 5650 0    50   BiDi ~ 0
USB_DP_UP
Text HLabel 1850 3050 0    50   Input ~ 0
USB_VBUS
Text HLabel 7400 1650 2    50   Input ~ 0
USB_SSTXM_UP
Text HLabel 7400 2150 2    50   Input ~ 0
USB_SSTXP_UP
Text HLabel 3450 2450 0    50   Output ~ 0
USB_SSRXM_UP
Text HLabel 3450 2950 0    50   Output ~ 0
USB_SSRXP_UP
Text HLabel 2100 4500 0    50   BiDi ~ 0
USB_DP_DN[1..4]
Text HLabel 2100 4400 0    50   BiDi ~ 0
USB_DM_DN[1..4]
Text HLabel 2100 1950 0    50   Input ~ 0
USB_SSRXP_DN[1..3]
Text HLabel 2100 1850 0    50   Input ~ 0
USB_SSRXM_DN[1..3]
Text HLabel 8950 850  2    50   Output ~ 0
USB_SSTXM_DN[1..3]
Text HLabel 8950 950  2    50   Output ~ 0
USB_SSTXP_DN[1..3]
NoConn ~ 3850 2850
NoConn ~ 3850 2350
Entry Wire Line
	2600 1950 2700 2050
Entry Wire Line
	2600 2050 2700 2150
Entry Wire Line
	2600 2150 2700 2250
Wire Wire Line
	3850 2050 2700 2050
Wire Wire Line
	3850 2150 2700 2150
Wire Wire Line
	3850 2250 2700 2250
Wire Bus Line
	2100 1850 2600 1850
Text Label 3000 2050 0    50   ~ 0
USB_SSRXM_DN1
Text Label 3000 2150 0    50   ~ 0
USB_SSRXM_DN2
Text Label 3000 2250 0    50   ~ 0
USB_SSRXM_DN3
Entry Wire Line
	2500 2650 2600 2750
Entry Wire Line
	2500 2550 2600 2650
Entry Wire Line
	2500 2450 2600 2550
Wire Bus Line
	2100 1950 2500 1950
Wire Wire Line
	3850 2550 2600 2550
Wire Wire Line
	2600 2650 3850 2650
Wire Wire Line
	3850 2750 2600 2750
Text Label 3000 2550 0    50   ~ 0
USB_SSRXP_DN1
Text Label 3000 2650 0    50   ~ 0
USB_SSRXP_DN2
Text Label 3000 2750 0    50   ~ 0
USB_SSRXP_DN3
Entry Wire Line
	2600 4850 2700 4950
Entry Wire Line
	2600 4750 2700 4850
Wire Wire Line
	3850 4850 2700 4850
Wire Wire Line
	2700 4950 3850 4950
Wire Bus Line
	2600 4400 2100 4400
Entry Wire Line
	2500 5350 2600 5450
Entry Wire Line
	2500 5250 2600 5350
Wire Wire Line
	3850 5450 2600 5450
Wire Wire Line
	3850 5350 2600 5350
Wire Bus Line
	2100 4500 2500 4500
Text Label 3000 4850 0    50   ~ 0
USB_DM_DN1
Text Label 3000 4950 0    50   ~ 0
USB_DM_DN2
Text Label 3000 5350 0    50   ~ 0
USB_DP_DN1
Text Label 3000 5450 0    50   ~ 0
USB_DP_DN2
Text HLabel 8800 4500 2    50   BiDi ~ 0
USB_DP_DN[1..4]
Text HLabel 8800 4400 2    50   BiDi ~ 0
USB_DM_DN[1..4]
Entry Wire Line
	8300 4850 8200 4950
Entry Wire Line
	8300 4750 8200 4850
Wire Wire Line
	7050 4850 8200 4850
Wire Wire Line
	8200 4950 7050 4950
Wire Bus Line
	8300 4400 8800 4400
Entry Wire Line
	8400 5350 8300 5450
Entry Wire Line
	8400 5250 8300 5350
Wire Wire Line
	7050 5450 8300 5450
Wire Wire Line
	7050 5350 8300 5350
Wire Bus Line
	8800 4500 8400 4500
Text Label 7900 4850 2    50   ~ 0
USB_DM_DN3
Text Label 7900 4950 2    50   ~ 0
USB_DM_DN4
Text Label 7900 5350 2    50   ~ 0
USB_DP_DN3
Text Label 7900 5450 2    50   ~ 0
USB_DP_DN4
Entry Wire Line
	8000 1250 8100 1150
Entry Wire Line
	8000 1350 8100 1250
Entry Wire Line
	8000 1450 8100 1350
NoConn ~ 7050 1550
NoConn ~ 7050 2050
Wire Wire Line
	7050 1250 8000 1250
Wire Wire Line
	8000 1350 7050 1350
Wire Wire Line
	7050 1450 8000 1450
Wire Bus Line
	8100 850  8950 850 
Entry Wire Line
	8100 1750 8200 1650
Entry Wire Line
	8100 1850 8200 1750
Entry Wire Line
	8100 1950 8200 1850
Wire Bus Line
	8950 950  8200 950 
Wire Wire Line
	7050 1950 8100 1950
Wire Wire Line
	7050 1850 8100 1850
Wire Wire Line
	7050 1750 8100 1750
Text Label 7200 1250 0    50   ~ 0
USB_SSTXM_DN1
Text Label 7200 1350 0    50   ~ 0
USB_SSTXM_DN2
Text Label 7200 1450 0    50   ~ 0
USB_SSTXM_DN3
Text Label 7200 1750 0    50   ~ 0
USB_SSTXP_DN1
Text Label 7200 1850 0    50   ~ 0
USB_SSTXP_DN2
Text Label 7200 1950 0    50   ~ 0
USB_SSTXP_DN3
NoConn ~ 3850 1350
NoConn ~ 3850 1450
NoConn ~ 3850 1550
NoConn ~ 3850 1650
Text HLabel 2900 1750 0    50   Input ~ 0
SCL
Wire Wire Line
	3850 1750 2900 1750
Wire Wire Line
	2900 4450 3850 4450
Text HLabel 2900 4450 0    50   BiDi ~ 0
SDA
Wire Wire Line
	3850 1950 3000 1950
Text GLabel 3000 1950 0    50   BiDi ~ 0
USB_R1
Text GLabel 9250 2400 0    50   BiDi ~ 0
USB_R1
$Comp
L Device:R R11
U 1 1 60A68AFA
P 9350 2650
F 0 "R11" H 9420 2696 50  0000 L CNN
F 1 "9.53K 1%" H 9420 2605 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 9280 2650 50  0001 C CNN
F 3 "~" H 9350 2650 50  0001 C CNN
F 4 "+-1% placed as close as possible the 8041A" H 9350 2650 50  0001 C CNN "Field4"
	1    9350 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 2400 9350 2400
Wire Wire Line
	9350 2400 9350 2500
$Comp
L power:GND #PWR041
U 1 1 60BB4F12
P 7050 6150
F 0 "#PWR041" H 7050 5900 50  0001 C CNN
F 1 "GND" H 7055 5977 50  0000 C CNN
F 2 "" H 7050 6150 50  0001 C CNN
F 3 "" H 7050 6150 50  0001 C CNN
	1    7050 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 6150 7050 5750
$Comp
L power:GND #PWR035
U 1 1 60BBA340
P 3200 1850
F 0 "#PWR035" H 3200 1600 50  0001 C CNN
F 1 "GND" H 3205 1677 50  0000 C CNN
F 2 "" H 3200 1850 50  0001 C CNN
F 3 "" H 3200 1850 50  0001 C CNN
	1    3200 1850
	0    1    1    0   
$EndComp
Wire Wire Line
	3850 1850 3200 1850
Wire Wire Line
	3850 1250 3350 1250
Text HLabel 2900 1250 0    50   Input ~ 0
HUB_Reset_Local
$Comp
L Device:R R10
U 1 1 60BC966D
P 3350 1000
F 0 "R10" H 3420 1046 50  0000 L CNN
F 1 "40k" H 3420 955 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3280 1000 50  0001 C CNN
F 3 "~" H 3350 1000 50  0001 C CNN
	1    3350 1000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR036
U 1 1 60BC999D
P 3650 800
F 0 "#PWR036" H 3650 550 50  0001 C CNN
F 1 "GND" H 3655 627 50  0000 C CNN
F 2 "" H 3650 800 50  0001 C CNN
F 3 "" H 3650 800 50  0001 C CNN
	1    3650 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 1150 3350 1250
Connection ~ 3350 1250
Wire Wire Line
	3350 1250 2900 1250
Wire Wire Line
	3350 850  3350 700 
Wire Wire Line
	3350 700  3650 700 
Wire Wire Line
	3650 700  3650 800 
NoConn ~ 14450 2900
$Comp
L power:GND #PWR042
U 1 1 60BD8B17
P 9350 2950
F 0 "#PWR042" H 9350 2700 50  0001 C CNN
F 1 "GND" H 9355 2777 50  0000 C CNN
F 2 "" H 9350 2950 50  0001 C CNN
F 3 "" H 9350 2950 50  0001 C CNN
	1    9350 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 2800 9350 2950
NoConn ~ 3850 3950
NoConn ~ 3850 4050
NoConn ~ 7050 3950
NoConn ~ 7050 4050
Wire Wire Line
	3850 4650 3750 4650
Text GLabel 3450 4650 0    50   Input ~ 0
SMBUSZ
$Comp
L Device:R R12
U 1 1 60BF82CA
P 10500 2650
F 0 "R12" H 10570 2696 50  0000 L CNN
F 1 "40k" H 10570 2605 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10430 2650 50  0001 C CNN
F 3 "~" H 10500 2650 50  0001 C CNN
	1    10500 2650
	1    0    0    -1  
$EndComp
Text GLabel 10200 2400 0    50   Input ~ 0
SMBUSZ
Wire Wire Line
	3850 3550 3700 3550
Text GLabel 3450 3550 0    50   Input ~ 0
FULLPWRMGMTZ
Text GLabel 10300 4000 0    50   Input ~ 0
FULLPWRMGMTZ
$Comp
L Device:R R9
U 1 1 60C47D8A
P 2400 3300
F 0 "R9" H 2470 3346 50  0000 L CNN
F 1 "10k 1%" H 2470 3255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2330 3300 50  0001 C CNN
F 3 "~" H 2400 3300 50  0001 C CNN
	1    2400 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 60C48806
P 2200 3050
F 0 "R8" V 1993 3050 50  0000 C CNN
F 1 "90.9k 1%" V 2084 3050 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2130 3050 50  0001 C CNN
F 3 "~" H 2200 3050 50  0001 C CNN
	1    2200 3050
	0    1    1    0   
$EndComp
Wire Wire Line
	2350 3050 2400 3050
Wire Wire Line
	2400 3150 2400 3050
Connection ~ 2400 3050
Wire Wire Line
	2400 3050 3850 3050
Wire Wire Line
	2050 3050 1850 3050
$Comp
L power:GND #PWR034
U 1 1 60C58F2D
P 2400 3500
F 0 "#PWR034" H 2400 3250 50  0001 C CNN
F 1 "GND" H 2405 3327 50  0000 C CNN
F 2 "" H 2400 3500 50  0001 C CNN
F 3 "" H 2400 3500 50  0001 C CNN
	1    2400 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 3500 2400 3450
Text Notes 9950 2200 0    50   ~ 0
SMBus Mode Selected???
$Comp
L power:GND #PWR044
U 1 1 60C7FD55
P 10500 2950
F 0 "#PWR044" H 10500 2700 50  0001 C CNN
F 1 "GND" H 10505 2777 50  0000 C CNN
F 2 "" H 10500 2950 50  0001 C CNN
F 3 "" H 10500 2950 50  0001 C CNN
	1    10500 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	10500 2800 10500 2950
Wire Wire Line
	10500 2500 10500 2400
Wire Wire Line
	10500 2400 10200 2400
Text HLabel 3450 4550 0    50   Output ~ 0
SS_SUSPEND
Wire Wire Line
	3450 4550 3600 4550
Wire Wire Line
	3600 4550 3600 4650
Connection ~ 3600 4650
Wire Wire Line
	3600 4650 3450 4650
$Comp
L power:+3V3 #PWR045
U 1 1 60C916D6
P 10500 3550
F 0 "#PWR045" H 10500 3400 50  0001 C CNN
F 1 "+3V3" H 10515 3723 50  0000 C CNN
F 2 "" H 10500 3550 50  0001 C CNN
F 3 "" H 10500 3550 50  0001 C CNN
	1    10500 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R13
U 1 1 60C9252B
P 10500 3750
F 0 "R13" H 10570 3796 50  0000 L CNN
F 1 "40k" H 10570 3705 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10430 3750 50  0001 C CNN
F 3 "~" H 10500 3750 50  0001 C CNN
	1    10500 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	10500 3550 10500 3600
Wire Wire Line
	10500 3900 10500 4000
Wire Wire Line
	10500 4000 10300 4000
Text HLabel 3450 3450 0    50   Output ~ 0
SS_UP
Wire Wire Line
	3450 3450 3600 3450
Wire Wire Line
	3600 3450 3600 3550
Connection ~ 3600 3550
Wire Wire Line
	3600 3550 3450 3550
Text Notes 9500 3850 0    50   ~ 0
Power Switch and over \ncurrent inputs not \nsupported.
NoConn ~ 3850 4250
Text HLabel 3450 3750 0    50   Output ~ 0
HS_UP
Text HLabel 3450 3350 0    50   Output ~ 0
HS_SUSPEND
Wire Wire Line
	3450 3750 3650 3750
Wire Wire Line
	3450 3350 3650 3350
Wire Wire Line
	4550 6800 4550 6550
Connection ~ 4550 6800
Text GLabel 4550 6550 1    50   BiDi ~ 0
3V3_Rail
Text GLabel 7450 1050 2    50   BiDi ~ 0
3V3_Rail
Text GLabel 7450 950  2    50   BiDi ~ 0
1V1_Rail
Wire Wire Line
	7050 950  7450 950 
$Comp
L power:PWR_FLAG #FLG09
U 1 1 604BB32A
P 5700 6800
F 0 "#FLG09" H 5700 6875 50  0001 C CNN
F 1 "PWR_FLAG" H 5700 6973 50  0000 C CNN
F 2 "" H 5700 6800 50  0001 C CNN
F 3 "~" H 5700 6800 50  0001 C CNN
	1    5700 6800
	1    0    0    -1  
$EndComp
Connection ~ 5700 6800
Wire Wire Line
	5700 6800 5900 6800
Wire Wire Line
	3550 6750 3750 6750
Connection ~ 3550 6750
$Comp
L power:PWR_FLAG #FLG08
U 1 1 604BACFD
P 3550 6750
F 0 "#FLG08" H 3550 6825 50  0001 C CNN
F 1 "PWR_FLAG" H 3550 6923 50  0000 C CNN
F 2 "" H 3550 6750 50  0001 C CNN
F 3 "~" H 3550 6750 50  0001 C CNN
	1    3550 6750
	1    0    0    -1  
$EndComp
Text GLabel 1050 6500 1    50   BiDi ~ 0
1V1_Rail
Connection ~ 1050 6750
Wire Wire Line
	1050 6500 1050 6750
Connection ~ 2400 6750
Connection ~ 2400 7250
Wire Wire Line
	1950 7250 2400 7250
Connection ~ 1950 7250
Wire Wire Line
	1950 7150 1950 7250
Wire Wire Line
	1950 6750 2400 6750
Connection ~ 1950 6750
Wire Wire Line
	1950 6750 1950 6850
Wire Wire Line
	1500 6750 1950 6750
Connection ~ 1500 6750
Wire Wire Line
	1500 6750 1500 6850
Wire Wire Line
	1500 7250 1950 7250
Connection ~ 1500 7250
Wire Wire Line
	1500 7150 1500 7250
Wire Wire Line
	1050 7250 1500 7250
Wire Wire Line
	1050 7150 1050 7250
Wire Wire Line
	1050 6750 1500 6750
Wire Wire Line
	1050 6750 1050 6850
$Comp
L Device:C C22
U 1 1 602BB88E
P 1050 7000
F 0 "C22" H 1165 7046 50  0000 L CNN
F 1 "0.1µF" H 1165 6955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1088 6850 50  0001 C CNN
F 3 "~" H 1050 7000 50  0001 C CNN
	1    1050 7000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C23
U 1 1 602BB888
P 1500 7000
F 0 "C23" H 1615 7046 50  0000 L CNN
F 1 "0.1µF" H 1615 6955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1538 6850 50  0001 C CNN
F 3 "~" H 1500 7000 50  0001 C CNN
	1    1500 7000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C24
U 1 1 602BB882
P 1950 7000
F 0 "C24" H 2065 7046 50  0000 L CNN
F 1 "0.1µF" H 2065 6955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1988 6850 50  0001 C CNN
F 3 "~" H 1950 7000 50  0001 C CNN
	1    1950 7000
	1    0    0    -1  
$EndComp
$Comp
L power:+1V1 #PWR037
U 1 1 602B5B0F
P 4200 6350
F 0 "#PWR037" H 4200 6200 50  0001 C CNN
F 1 "+1V1" H 4215 6523 50  0000 C CNN
F 2 "" H 4200 6350 50  0001 C CNN
F 3 "" H 4200 6350 50  0001 C CNN
	1    4200 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 6600 4200 6750
Wire Wire Line
	4200 6400 4200 6350
$Comp
L Device:Ferrite_Bead_Small FB1
U 1 1 602B3209
P 4200 6500
F 0 "FB1" H 4300 6546 50  0000 L CNN
F 1 "220 at 100MHz" H 3900 6400 50  0000 L CNN
F 2 "Inductor_SMD:L_0603_1608Metric" V 4130 6500 50  0001 C CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/beads_commercial_power_mpz1608_en.pdf?ref_disty=mouser" H 4200 6500 50  0001 C CNN
F 4 "low DC resistance (less than 0.05 Ω)" H 4200 6500 50  0001 C CNN "Field4"
	1    4200 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 6750 4200 6750
Connection ~ 3750 6750
Wire Wire Line
	3750 6850 3750 6750
Wire Wire Line
	3750 7250 4200 7250
Connection ~ 3750 7250
Wire Wire Line
	3750 7150 3750 7250
Wire Wire Line
	3300 7250 3750 7250
Connection ~ 3300 7250
Wire Wire Line
	3300 7150 3300 7250
Wire Wire Line
	3300 6750 3550 6750
Connection ~ 3300 6750
Wire Wire Line
	3300 6750 3300 6850
Wire Wire Line
	2850 6750 3300 6750
Connection ~ 2850 6750
Wire Wire Line
	2850 6750 2850 6850
Wire Wire Line
	2850 7250 3300 7250
Connection ~ 2850 7250
Wire Wire Line
	2850 7150 2850 7250
Wire Wire Line
	2400 7250 2850 7250
Wire Wire Line
	2400 7150 2400 7250
Wire Wire Line
	2400 6750 2850 6750
Wire Wire Line
	2400 6750 2400 6850
Wire Wire Line
	4200 6750 4200 6850
Connection ~ 4200 6750
Wire Wire Line
	4200 7250 4200 7150
Connection ~ 4200 7250
Wire Wire Line
	4200 7350 4200 7250
$Comp
L power:GND #PWR038
U 1 1 602B31E8
P 4200 7350
F 0 "#PWR038" H 4200 7100 50  0001 C CNN
F 1 "GND" H 4205 7177 50  0000 C CNN
F 2 "" H 4200 7350 50  0001 C CNN
F 3 "" H 4200 7350 50  0001 C CNN
	1    4200 7350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C25
U 1 1 602B31E2
P 2400 7000
F 0 "C25" H 2515 7046 50  0000 L CNN
F 1 "0.1µF" H 2515 6955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2438 6850 50  0001 C CNN
F 3 "~" H 2400 7000 50  0001 C CNN
	1    2400 7000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C26
U 1 1 602B31DC
P 2850 7000
F 0 "C26" H 2965 7046 50  0000 L CNN
F 1 "0.1µF" H 2965 6955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2888 6850 50  0001 C CNN
F 3 "~" H 2850 7000 50  0001 C CNN
	1    2850 7000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C27
U 1 1 602B31D6
P 3300 7000
F 0 "C27" H 3415 7046 50  0000 L CNN
F 1 "0.1µF" H 3415 6955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3338 6850 50  0001 C CNN
F 3 "~" H 3300 7000 50  0001 C CNN
	1    3300 7000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C28
U 1 1 602B31D0
P 3750 7000
F 0 "C28" H 3865 7046 50  0000 L CNN
F 1 "0.1µF" H 3865 6955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3788 6850 50  0001 C CNN
F 3 "~" H 3750 7000 50  0001 C CNN
	1    3750 7000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C29
U 1 1 602B31CA
P 4200 7000
F 0 "C29" H 4315 7046 50  0000 L CNN
F 1 "10µF" H 4315 6955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4238 6850 50  0001 C CNN
F 3 "~" H 4200 7000 50  0001 C CNN
	1    4200 7000
	1    0    0    -1  
$EndComp
$Comp
L TUSB8041RGCR:TUSB8041RGCR U3
U 1 1 60283C4B
P 5450 3450
F 0 "U3" H 5450 6220 50  0000 C CNN
F 1 "TUSB8041ARGCR" H 5450 6129 50  0000 C CNN
F 2 "TUSB8041RGCR:QFN50P900X900X100-65N" H 5450 3450 50  0001 L BNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=26&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fds%2Fsymlink%2Ftusb8041a.pdf" H 5450 3450 50  0001 L BNN
	1    5450 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C63
U 1 1 6076A54B
P 650 7000
F 0 "C63" H 765 7046 50  0000 L CNN
F 1 "0.1µF" H 765 6955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 688 6850 50  0001 C CNN
F 3 "~" H 650 7000 50  0001 C CNN
	1    650  7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 6750 650  6750
Wire Wire Line
	650  6750 650  6850
Wire Wire Line
	650  7150 650  7250
Wire Wire Line
	650  7250 1050 7250
Connection ~ 1050 7250
$Comp
L Connector:TestPoint TP15
U 1 1 60C68EAD
P 3650 3350
F 0 "TP15" H 3708 3422 50  0000 L CNN
F 1 "TestPoint" H 3708 3377 50  0001 L CNN
F 2 "TestPoint:TestPoint_THTPad_1.0x1.0mm_Drill0.5mm" H 3850 3350 50  0001 C CNN
F 3 "~" H 3850 3350 50  0001 C CNN
	1    3650 3350
	1    0    0    -1  
$EndComp
Connection ~ 3650 3350
Wire Wire Line
	3650 3350 3850 3350
$Comp
L Connector:TestPoint TP18
U 1 1 60C692A4
P 3700 3550
F 0 "TP18" H 3758 3622 50  0000 L CNN
F 1 "TestPoint" H 3758 3577 50  0001 L CNN
F 2 "TestPoint:TestPoint_THTPad_1.0x1.0mm_Drill0.5mm" H 3900 3550 50  0001 C CNN
F 3 "~" H 3900 3550 50  0001 C CNN
	1    3700 3550
	1    0    0    -1  
$EndComp
Connection ~ 3700 3550
Wire Wire Line
	3700 3550 3600 3550
$Comp
L Connector:TestPoint TP16
U 1 1 60C69610
P 3650 3750
F 0 "TP16" H 3708 3822 50  0000 L CNN
F 1 "TestPoint" H 3708 3777 50  0001 L CNN
F 2 "TestPoint:TestPoint_THTPad_1.0x1.0mm_Drill0.5mm" H 3850 3750 50  0001 C CNN
F 3 "~" H 3850 3750 50  0001 C CNN
	1    3650 3750
	1    0    0    -1  
$EndComp
Connection ~ 3650 3750
Wire Wire Line
	3650 3750 3850 3750
$Comp
L Connector:TestPoint TP19
U 1 1 60C69BFD
P 3750 4650
F 0 "TP19" H 3808 4722 50  0000 L CNN
F 1 "TestPoint" H 3808 4677 50  0001 L CNN
F 2 "TestPoint:TestPoint_THTPad_1.0x1.0mm_Drill0.5mm" H 3950 4650 50  0001 C CNN
F 3 "~" H 3950 4650 50  0001 C CNN
	1    3750 4650
	1    0    0    -1  
$EndComp
Connection ~ 3750 4650
Wire Wire Line
	3750 4650 3600 4650
Wire Wire Line
	3450 2950 3850 2950
Wire Wire Line
	3450 5650 3850 5650
Wire Bus Line
	8400 4500 8400 5350
Wire Bus Line
	8300 4400 8300 4850
Wire Bus Line
	2500 4500 2500 5350
Wire Bus Line
	2600 4400 2600 4850
Wire Bus Line
	2600 1850 2600 2150
Wire Bus Line
	2500 1950 2500 2650
Wire Bus Line
	8100 850  8100 1350
Wire Bus Line
	8200 950  8200 1850
$EndSCHEMATC
