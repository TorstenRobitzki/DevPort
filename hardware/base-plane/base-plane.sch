EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 7
Title "DevPort Base-Plane"
Date "2021-02-17"
Rev "0.2"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 850  900  1950 1200
U 602835DB
F0 "inputs" 50
F1 "inputs.sch" 50
F2 "USB_DM_UP" B R 2800 1050 50 
F3 "USB_DP_UP" B R 2800 1150 50 
F4 "USB_SSRXP_UP" I R 2800 1350 50 
F5 "USB_SSRXM_UP" I R 2800 1450 50 
F6 "USB_SSTXM_UP" O R 2800 1650 50 
F7 "USB_SSTXP_UP" O R 2800 1750 50 
F8 "USB_VBUS" O R 2800 1900 50 
$EndSheet
Wire Wire Line
	2800 2800 2950 2800
Wire Wire Line
	2950 2800 2950 1050
Wire Wire Line
	2950 1050 2800 1050
Wire Wire Line
	2800 1150 3000 1150
Wire Wire Line
	3000 1150 3000 2900
Wire Wire Line
	3000 2900 2800 2900
Wire Wire Line
	2800 1350 3050 1350
Wire Wire Line
	3050 1350 3050 3400
Wire Wire Line
	3050 3400 2800 3400
Wire Wire Line
	2800 1450 3100 1450
Wire Wire Line
	3100 1450 3100 3300
Wire Wire Line
	3100 3300 2800 3300
Wire Wire Line
	2800 1650 3150 1650
Wire Wire Line
	3150 1650 3150 3100
Wire Wire Line
	3150 3100 2800 3100
Wire Wire Line
	2800 1750 3200 1750
Wire Wire Line
	3200 1750 3200 3200
Wire Wire Line
	3200 3200 2800 3200
Wire Wire Line
	2800 1900 2900 1900
Wire Wire Line
	2900 1900 2900 3000
Wire Wire Line
	2900 3000 2800 3000
$Sheet
S 5200 5150 1900 900 
U 6081C978
F0 "outputs" 50
F1 "outputs.sch" 50
F2 "USB_SSRXP_DN[1..3]" I L 5200 5450 50 
F3 "USB_SSRXM_DN[1..3]" I L 5200 5550 50 
F4 "USB_SSTXM_DN[1..3]" O L 5200 5650 50 
F5 "USB_SSTXP_DN[1..3]" O L 5200 5750 50 
F6 "HUB_SDA[0..2]" B R 7100 5250 50 
F7 "HUB_SCL[0..2]" I R 7100 5350 50 
F8 "HUB_Reset[0..2]" B R 7100 5500 50 
F9 "USB_DP_DN[1..3]" B L 5200 5250 50 
F10 "USB_DM_DN[1..3]" B L 5200 5350 50 
$EndSheet
Wire Bus Line
	5200 5750 2800 5750
Wire Bus Line
	2800 5650 5200 5650
Wire Bus Line
	5200 5550 2800 5550
Wire Bus Line
	2800 5450 5200 5450
Wire Wire Line
	8500 2150 7950 2150
Wire Wire Line
	8500 2250 7950 2250
Text GLabel 7950 2150 0    50   BiDi ~ 0
USB_DM_DN4
Text GLabel 7950 2250 0    50   BiDi ~ 0
USB_DP_DN4
Wire Wire Line
	8500 2400 7950 2400
Wire Wire Line
	8500 2500 7950 2500
Text GLabel 7950 2400 0    50   BiDi ~ 0
SDA
Text GLabel 7950 2500 0    50   Output ~ 0
SCL
Text Label 3550 5250 0    50   ~ 0
USB_DP_DN[1..4]
Text Label 3550 5350 0    50   ~ 0
USB_DM_DN[1..4]
$Sheet
S 8500 1050 1950 650 
U 60283519
F0 "power" 50
F1 "power.sch" 50
F2 "Power_Good_1_1" O R 10450 1600 50 
$EndSheet
Wire Wire Line
	10600 2150 10450 2150
Wire Wire Line
	2800 5050 3500 5050
Wire Wire Line
	2800 4950 3500 4950
Text GLabel 3500 4950 2    50   BiDi ~ 0
SDA
Text GLabel 3500 5050 2    50   Input ~ 0
SCL
Wire Bus Line
	7100 5250 8500 5250
Wire Bus Line
	7100 5350 8500 5350
Entry Wire Line
	4450 5350 4550 5250
Entry Wire Line
	4350 5250 4450 5150
Wire Wire Line
	4550 5250 4550 5000
Wire Wire Line
	4550 5000 4800 5000
Wire Wire Line
	4450 5150 4450 4900
Wire Wire Line
	4450 4900 4800 4900
Text GLabel 4800 5000 2    50   BiDi ~ 0
USB_DM_DN4
Text GLabel 4800 4900 2    50   BiDi ~ 0
USB_DP_DN4
Wire Bus Line
	7100 5500 8500 5500
Wire Wire Line
	8500 2650 7950 2650
Text GLabel 7950 2650 0    50   Output ~ 0
HUB_Reset_Local
Wire Wire Line
	2800 3600 3500 3600
Text GLabel 3500 3600 2    50   Input ~ 0
HUB_Reset_Local
$Sheet
S 850  2650 1950 3600
U 60283623
F0 "hub" 50
F1 "hub.sch" 50
F2 "USB_DM_UP" B R 2800 2800 50 
F3 "USB_DP_UP" B R 2800 2900 50 
F4 "USB_VBUS" I R 2800 3000 50 
F5 "USB_SSTXM_UP" I R 2800 3100 50 
F6 "USB_SSTXP_UP" I R 2800 3200 50 
F7 "USB_SSRXM_UP" O R 2800 3300 50 
F8 "USB_SSRXP_UP" O R 2800 3400 50 
F9 "USB_DP_DN[1..4]" B R 2800 5250 50 
F10 "USB_DM_DN[1..4]" B R 2800 5350 50 
F11 "USB_SSRXP_DN[1..3]" I R 2800 5450 50 
F12 "USB_SSRXM_DN[1..3]" I R 2800 5550 50 
F13 "USB_SSTXM_DN[1..3]" O R 2800 5650 50 
F14 "USB_SSTXP_DN[1..3]" O R 2800 5750 50 
F15 "SCL" I R 2800 5050 50 
F16 "SDA" B R 2800 4950 50 
F17 "HUB_Reset_Local" I R 2800 3600 50 
F18 "SS_SUSPEND" O R 2800 3900 50 
F19 "SS_UP" O R 2800 4000 50 
F20 "HS_UP" O R 2800 4100 50 
F21 "HS_SUSPEND" O R 2800 4200 50 
$EndSheet
Wire Wire Line
	2800 3900 3500 3900
Wire Wire Line
	2800 4000 3500 4000
Wire Wire Line
	2800 4100 3500 4100
Wire Wire Line
	2800 4200 3500 4200
Text GLabel 3500 3900 2    50   Output ~ 0
SS_SUSPEND
Text GLabel 3500 4000 2    50   Output ~ 0
SS_UP
Text GLabel 3500 4100 2    50   Output ~ 0
HS_UP
Text GLabel 3500 4200 2    50   Output ~ 0
HS_SUSPEND
Wire Wire Line
	8500 2900 7950 2900
Wire Wire Line
	8500 3000 7950 3000
Wire Wire Line
	8500 3100 7950 3100
Text GLabel 7950 2800 0    50   Input ~ 0
SS_SUSPEND
Text GLabel 7950 2900 0    50   Input ~ 0
SS_UP
Text GLabel 7950 3000 0    50   Input ~ 0
HS_UP
Text GLabel 7950 3100 0    50   Input ~ 0
HS_SUSPEND
$Sheet
S 8500 2000 1950 4050
U 60335350
F0 "controller" 50
F1 "controller.sch" 50
F2 "CONTR_USB_D-" B L 8500 2150 50 
F3 "CONTR_USB_D+" B L 8500 2250 50 
F4 "SDA" B L 8500 2400 50 
F5 "SCL" O L 8500 2500 50 
F6 "HUB_SDA[0..2]" O L 8500 5250 50 
F7 "HUB_SCL[0..2]" O L 8500 5350 50 
F8 "Power_Good_1_1" I R 10450 2150 50 
F9 "HUB_Reset[0..2]" B L 8500 5500 50 
F10 "HUB_Reset_Local" O L 8500 2650 50 
F11 "SS_SUSPEND" I L 8500 2800 50 
F12 "SS_UP" I L 8500 2900 50 
F13 "HS_UP" I L 8500 3000 50 
F14 "HS_SUSPEND" I L 8500 3100 50 
F15 "DISPLAY_OK" I L 8500 3550 50 
F16 "DISPLAY_POWER" I L 8500 3650 50 
F17 "DISPLAY_BS" I L 8500 3750 50 
F18 "DISPLAY_BUSY" I L 8500 3850 50 
F19 "DISPLAY_RESET" I L 8500 3950 50 
F20 "DISPLAY_DC" I L 8500 4050 50 
F21 "DISPLAY_SCL" I L 8500 4250 50 
F22 "DISPLAY_SDA" I L 8500 4350 50 
F23 "DISPLAY_CS" I L 8500 4150 50 
F24 "XY[0..11]" I L 8500 4550 50 
F25 "Touch_GPIO" B L 8500 4450 50 
F26 "Motor_PWM" O L 8500 3450 50 
F27 "Test0" B L 8500 3350 50 
F28 "Test1" B L 8500 3250 50 
$EndSheet
Wire Wire Line
	10600 2150 10600 1600
Wire Wire Line
	10600 1600 10450 1600
$Sheet
S 4500 2950 1950 1750
U 60A63C4C
F0 "user_interface" 50
F1 "user_interface.sch" 50
F2 "DISPLAY_OK" O R 6450 3550 50 
F3 "DISPLAY_POWER" I R 6450 3650 50 
F4 "DISPLAY_BS" I R 6450 3750 50 
F5 "DISPLAY_BUSY" O R 6450 3850 50 
F6 "DISPLAY_RESET" I R 6450 3950 50 
F7 "DISPLAY_DC" I R 6450 4050 50 
F8 "DISPLAY_CS" I R 6450 4150 50 
F9 "DISPLAY_SCL" I R 6450 4250 50 
F10 "DISPLAY_SDA" I R 6450 4350 50 
F11 "XY[0..11]" I R 6450 4550 50 
F12 "Touch_GPIO" B R 6450 4450 50 
F13 "SDA" B R 6450 3050 50 
F14 "SCL" I R 6450 3150 50 
F15 "Motor_PWM" I R 6450 3450 50 
F16 "Test0" I R 6450 3350 50 
$EndSheet
Wire Wire Line
	8500 3550 6450 3550
Wire Wire Line
	6450 3650 8500 3650
Wire Wire Line
	8500 3750 6450 3750
Wire Wire Line
	6450 3850 8500 3850
Wire Wire Line
	8500 3950 6450 3950
Wire Wire Line
	6450 4050 8500 4050
Wire Wire Line
	8500 4150 6450 4150
Wire Wire Line
	6450 4250 8500 4250
Wire Wire Line
	8500 4350 6450 4350
Wire Bus Line
	8500 4550 6450 4550
Wire Wire Line
	6450 3050 6750 3050
Wire Wire Line
	6450 3150 6750 3150
Text GLabel 6750 3050 2    50   BiDi ~ 0
SDA
Text GLabel 6750 3150 2    50   Output ~ 0
SCL
Text Label 7200 4550 0    50   ~ 0
XY[0..11]
Wire Wire Line
	8500 4450 6450 4450
Wire Wire Line
	8500 3450 6450 3450
Wire Wire Line
	8500 2800 7950 2800
Wire Wire Line
	8500 3350 6450 3350
Wire Bus Line
	2800 5350 5200 5350
Wire Bus Line
	2800 5250 5200 5250
$EndSCHEMATC
