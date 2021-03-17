EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 12
Title ""
Date ""
Rev "0.2"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 1050 2900 1500 1600
U 604BA765
F0 "port2_3" 50
F1 "port2_3.sch" 50
F2 "SCL" I R 2550 3000 50 
F3 "SDA" B R 2550 3100 50 
F4 "OVERCUR3Z" O R 2550 3250 50 
F5 "OVERCUR4Z" O R 2550 3350 50 
F6 "PWRCTRL3_BATEN3" I R 2550 3500 50 
F7 "PWRCTRL4_BATEN4" I R 2550 3600 50 
F8 "DN3_VBUS" O R 2550 3800 50 
F9 "DN4_VBUS" O R 2550 3900 50 
$EndSheet
$Sheet
S 1050 1000 1500 1600
U 602A1B95
F0 "port0_1" 50
F1 "port0_1.sch" 50
F2 "SCL" I R 2550 1100 50 
F3 "SDA" B R 2550 1200 50 
F4 "OVERCUR1Z" O R 2550 1350 50 
F5 "OVERCUR2Z" O R 2550 1450 50 
F6 "PWRCTRL1_BATEN1" I R 2550 1600 50 
F7 "PWRCTRL2_BATEN2" I R 2550 1700 50 
F8 "DN1_VBUS" O R 2550 1900 50 
F9 "DN2_VBUS" O R 2550 2000 50 
$EndSheet
$Sheet
S 1050 4800 1500 700 
U 604EDA82
F0 "user_interface" 50
F1 "user_interface.sch" 50
F2 "SDA" B R 2550 5000 50 
F3 "SCL" I R 2550 4900 50 
$EndSheet
Wire Wire Line
	2550 1100 2950 1100
Text GLabel 2950 1100 2    50   Input ~ 0
SCL
Wire Wire Line
	2550 1200 2950 1200
Text GLabel 2950 1200 2    50   BiDi ~ 0
SDA
Wire Wire Line
	2550 3000 2950 3000
Wire Wire Line
	2550 3100 2950 3100
Wire Wire Line
	2550 4900 2950 4900
Wire Wire Line
	2550 5000 2950 5000
Text GLabel 2950 3000 2    50   Input ~ 0
SCL
Text GLabel 2950 4900 2    50   Input ~ 0
SCL
Text GLabel 2950 3100 2    50   BiDi ~ 0
SDA
Text GLabel 2950 5000 2    50   BiDi ~ 0
SDA
$Sheet
S 1050 5900 1500 900 
U 6036D14F
F0 "power" 50
F1 "power.sch" 50
$EndSheet
$Sheet
S 8700 1000 1850 2100
U 603729A3
F0 "input" 50
F1 "input.sch" 50
F2 "USB_DM_UP" B L 8700 1100 50 
F3 "USB_DP_UP" B L 8700 1200 50 
F4 "USB_SSRXP_UP" I L 8700 1300 50 
F5 "USB_SSRXM_UP" I L 8700 1400 50 
F6 "USB_SSTXM_UP" O L 8700 1500 50 
F7 "USB_SSTXP_UP" O L 8700 1600 50 
F8 "USB_VBUS" O L 8700 1750 50 
F9 "SCL" O L 8700 2000 50 
F10 "HUB_Reset" O L 8700 2200 50 
F11 "SDA" B L 8700 2100 50 
$EndSheet
Text GLabel 8300 2000 0    50   Output ~ 0
SCL
Text GLabel 8300 2100 0    50   BiDi ~ 0
SDA
Wire Wire Line
	8700 2000 8300 2000
Wire Wire Line
	8300 2100 8700 2100
Text GLabel 8300 5050 0    50   Input ~ 0
SCL
Text GLabel 8300 5150 0    50   BiDi ~ 0
SDA
Wire Wire Line
	8700 5050 8300 5050
Wire Wire Line
	8300 5150 8700 5150
$Sheet
S 8700 3450 1850 2550
U 603CA882
F0 "hub" 50
F1 "hub.sch" 50
F2 "USB_DM_UP" B L 8700 3600 50 
F3 "USB_DP_UP" B L 8700 3700 50 
F4 "USB_VBUS" I L 8700 4200 50 
F5 "USB_SSTXM_UP" I L 8700 3800 50 
F6 "USB_SSTXP_UP" I L 8700 3900 50 
F7 "USB_SSRXM_UP" O L 8700 4000 50 
F8 "USB_SSRXP_UP" O L 8700 4100 50 
F9 "USB_DP_DN[1..4]" B L 8700 4400 50 
F10 "USB_DM_DN[1..4]" B L 8700 4500 50 
F11 "USB_SSRXP_DN[1..4]" I L 8700 4600 50 
F12 "USB_SSRXM_DN[1..4]" I L 8700 4700 50 
F13 "USB_SSTXM_DN[1..4]" O L 8700 4800 50 
F14 "USB_SSTXP_DN[1..4]" O L 8700 4900 50 
F15 "SCL" I L 8700 5050 50 
F16 "SDA" B L 8700 5150 50 
F17 "HUB_Reset" I L 8700 5250 50 
F18 "OVERCURZ[1..4]" I L 8700 5400 50 
F19 "PWRCTL1_BATEN1" O L 8700 5500 50 
F20 "PWRCTL2_BATEN2" O L 8700 5600 50 
F21 "PWRCTL3_BATEN3" O L 8700 5700 50 
F22 "PWRCTL4_BATEN4" O L 8700 5800 50 
$EndSheet
Wire Wire Line
	8700 1750 8300 1750
Wire Wire Line
	8300 1600 8700 1600
Wire Wire Line
	8300 1500 8700 1500
Wire Wire Line
	8300 1400 8700 1400
Wire Wire Line
	8300 1300 8700 1300
Wire Wire Line
	8300 1200 8700 1200
Wire Wire Line
	8300 1100 8700 1100
Text GLabel 8300 1100 0    50   BiDi ~ 0
USB_DM_UP
Text GLabel 8300 1200 0    50   BiDi ~ 0
USB_DP_UP
Text GLabel 8300 1300 0    50   Input ~ 0
USB_SSRXP_UP
Text GLabel 8300 1400 0    50   Input ~ 0
USB_SSRXM_UP
Text GLabel 8300 1500 0    50   Output ~ 0
USB_SSTXM_UP
Text GLabel 8300 1600 0    50   Output ~ 0
USB_SSTXP_UP
Text GLabel 8300 1750 0    50   Output ~ 0
USB_VBUS
Wire Wire Line
	8300 3600 8700 3600
Wire Wire Line
	8300 3700 8700 3700
Wire Wire Line
	8300 3800 8700 3800
Wire Wire Line
	8300 3900 8700 3900
Wire Wire Line
	8300 4000 8700 4000
Wire Wire Line
	8300 4100 8700 4100
Wire Wire Line
	8300 4200 8700 4200
Text GLabel 8300 4200 0    50   Input ~ 0
USB_VBUS
Text GLabel 8300 3900 0    50   Input ~ 0
USB_SSTXP_UP
Text GLabel 8300 3800 0    50   Input ~ 0
USB_SSTXM_UP
Text GLabel 8300 4000 0    50   Output ~ 0
USB_SSRXM_UP
Text GLabel 8300 4100 0    50   Output ~ 0
USB_SSRXP_UP
Text GLabel 8300 3600 0    50   BiDi ~ 0
USB_DM_UP
Text GLabel 8300 3700 0    50   BiDi ~ 0
USB_DP_UP
Wire Wire Line
	2550 1600 2950 1600
Wire Wire Line
	2950 1700 2550 1700
Wire Wire Line
	2950 3500 2550 3500
Wire Wire Line
	2950 3600 2550 3600
Text GLabel 2950 1600 2    50   Input ~ 0
PWRCTL1_BATEN1
Text GLabel 2950 1700 2    50   Input ~ 0
PWRCTL2_BATEN2
Text GLabel 2950 3500 2    50   Input ~ 0
PWRCTL3_BATEN3
Text GLabel 2950 3600 2    50   Input ~ 0
PWRCTL4_BATEN4
Text GLabel 8300 5500 0    50   Input ~ 0
PWRCTL1_BATEN1
Text GLabel 8300 5600 0    50   Input ~ 0
PWRCTL2_BATEN2
Text GLabel 8300 5700 0    50   Input ~ 0
PWRCTL3_BATEN3
Text GLabel 8300 5800 0    50   Input ~ 0
PWRCTL4_BATEN4
Wire Wire Line
	8300 5500 8700 5500
Wire Wire Line
	8300 5600 8700 5600
Wire Wire Line
	8300 5700 8700 5700
Wire Wire Line
	8300 5800 8700 5800
Wire Bus Line
	8700 5400 3900 5400
Entry Wire Line
	3900 1450 3800 1350
Entry Wire Line
	3900 1550 3800 1450
Entry Wire Line
	3900 3350 3800 3250
Entry Wire Line
	3900 3450 3800 3350
Wire Wire Line
	2550 1450 3800 1450
Wire Wire Line
	2550 1350 3800 1350
Wire Wire Line
	2550 3250 3800 3250
Wire Wire Line
	2550 3350 3800 3350
Text Label 5200 5400 0    50   ~ 0
OVERCURZ[1..4]
Wire Wire Line
	8300 2200 8700 2200
Wire Wire Line
	8300 5250 8700 5250
Text GLabel 8300 5250 0    50   Input ~ 0
HUB_Reset
Text GLabel 8300 2200 0    50   Output ~ 0
HUB_Reset
$Sheet
S 4400 1750 1900 3300
U 60548847
F0 "outputs" 50
F1 "outputs.sch" 50
F2 "USB_DP_DN[1..4]" B R 6300 4400 50 
F3 "USB_DM_DN[1..4]" B R 6300 4500 50 
F4 "USB_SSRXP_DN[1..4]" I R 6300 4600 50 
F5 "USB_SSRXM_DN[1..4]" I R 6300 4700 50 
F6 "USB_SSTXM_DN[1..4]" O R 6300 4800 50 
F7 "USB_SSTXP_DN[1..4]" O R 6300 4900 50 
F8 "DN2_VBUS" I L 4400 2000 50 
F9 "DN4_VBUS" I L 4400 3900 50 
F10 "DN3_VBUS" I L 4400 3800 50 
F11 "DN1_VBUS" I L 4400 1900 50 
$EndSheet
Wire Bus Line
	8700 4400 6300 4400
Wire Bus Line
	6300 4500 8700 4500
Wire Bus Line
	8700 4600 6300 4600
Wire Bus Line
	6300 4700 8700 4700
Wire Bus Line
	6300 4800 8700 4800
Wire Bus Line
	6300 4900 8700 4900
Wire Wire Line
	2550 1900 4400 1900
Wire Wire Line
	2550 2000 4400 2000
Wire Wire Line
	2550 3800 4400 3800
Wire Wire Line
	2550 3900 4400 3900
$Comp
L Graphic:SYM_Radio_Waves_Small SYM1
U 1 1 605D2B48
P 1150 7550
F 0 "SYM1" H 1150 7690 50  0001 C CNN
F 1 "SYM_Radio_Waves_Small" H 1150 7425 50  0001 C CNN
F 2 "Torrox:Torrox_Black" H 1150 7375 50  0001 C CNN
F 3 "~" H 1180 7350 50  0001 C CNN
	1    1150 7550
	1    0    0    -1  
$EndComp
Text Label 2700 1350 0    50   ~ 0
OVERCURZ1
Text Label 2700 1450 0    50   ~ 0
OVERCURZ2
Text Label 2700 3250 0    50   ~ 0
OVERCURZ3
Text Label 2700 3350 0    50   ~ 0
OVERCURZ4
Wire Bus Line
	3900 1450 3900 5400
$EndSCHEMATC
