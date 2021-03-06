EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 8 12
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 2400 1150 0    50   BiDi ~ 0
USB_DP_DN[1..4]
Text HLabel 2400 1050 0    50   BiDi ~ 0
USB_DM_DN[1..4]
Text HLabel 2400 1350 0    50   Input ~ 0
USB_SSRXP_DN[1..4]
Text HLabel 2400 1250 0    50   Input ~ 0
USB_SSRXM_DN[1..4]
Text HLabel 2400 1450 0    50   Output ~ 0
USB_SSTXM_DN[1..4]
Text HLabel 2400 1550 0    50   Output ~ 0
USB_SSTXP_DN[1..4]
Entry Wire Line
	2650 3450 2550 3350
Entry Wire Line
	3400 2850 3300 2750
Entry Wire Line
	2800 3350 2700 3250
Entry Wire Line
	2950 3200 2850 3100
Entry Wire Line
	3100 3100 3000 3000
Entry Wire Line
	3250 2950 3150 2850
Entry Wire Line
	3300 4300 3400 4400
Entry Wire Line
	3150 4400 3250 4500
Entry Wire Line
	3000 4550 3100 4650
Entry Wire Line
	2850 4650 2950 4750
Entry Wire Line
	2700 4800 2800 4900
Entry Wire Line
	2550 4900 2650 5000
Wire Bus Line
	3300 1050 2400 1050
Wire Bus Line
	2400 1150 3150 1150
Wire Bus Line
	3000 1250 2400 1250
Wire Bus Line
	2400 1350 2850 1350
Wire Bus Line
	2400 1550 2550 1550
Wire Bus Line
	2400 1450 2700 1450
Entry Wire Line
	3400 6050 3300 5950
Entry Wire Line
	2550 1750 2650 1850
Entry Wire Line
	2850 1500 2950 1600
Entry Wire Line
	3150 1250 3250 1350
Entry Wire Line
	3300 1150 3400 1250
Entry Wire Line
	3000 1400 3100 1500
Entry Wire Line
	2700 1650 2800 1750
Text Label 3400 1500 0    50   ~ 0
USB_SSRXM_DN1
Text Label 3400 1350 0    50   ~ 0
USB_DP_DN1
Text Label 3400 1250 0    50   ~ 0
USB_DM_DN1
Wire Wire Line
	6100 1250 6600 1250
Text HLabel 6600 1250 2    50   Input ~ 0
DN1_VBUS
$Sheet
S 4300 1150 1800 1200
U 605C1D1C
F0 "output1" 50
F1 "output1.sch" 50
F2 "DN1_VBUS" I R 6100 1250 50 
F3 "USB_SSTXP_DN1" I L 4300 1850 50 
F4 "USB_SSTXM_DN1" I L 4300 1750 50 
F5 "USB_SSRXP_DN1" I L 4300 1600 50 
F6 "USB_SSRXM_DN1" I L 4300 1500 50 
F7 "USB_DP_DN1" I L 4300 1350 50 
F8 "USB_DM_DN1" I L 4300 1250 50 
$EndSheet
Wire Wire Line
	2650 1850 4300 1850
Wire Wire Line
	2800 1750 4300 1750
Wire Wire Line
	2950 1600 4300 1600
Wire Wire Line
	3100 1500 4300 1500
Wire Wire Line
	3250 1350 4300 1350
Wire Wire Line
	3400 1250 4300 1250
Text Label 3400 1600 0    50   ~ 0
USB_SSRXP_DN1
Text Label 3400 1850 0    50   ~ 0
USB_SSTXP_DN1
Text Label 3400 1750 0    50   ~ 0
USB_SSTXM_DN1
Wire Wire Line
	6100 2850 6600 2850
Text HLabel 6600 2850 2    50   Input ~ 0
DN2_VBUS
Wire Wire Line
	2650 3450 4300 3450
Wire Wire Line
	2800 3350 4300 3350
Wire Wire Line
	3100 3100 4300 3100
Wire Wire Line
	3250 2950 4300 2950
Wire Wire Line
	3400 2850 4300 2850
Wire Wire Line
	6100 4400 6600 4400
Text HLabel 6600 4400 2    50   Input ~ 0
DN3_VBUS
Wire Wire Line
	2650 5000 4300 5000
Wire Wire Line
	2800 4900 4300 4900
Wire Wire Line
	2950 4750 4300 4750
Wire Wire Line
	3100 4650 4300 4650
Wire Wire Line
	3250 4500 4300 4500
Wire Wire Line
	3400 4400 4300 4400
Wire Wire Line
	2950 3200 4300 3200
$Sheet
S 4300 2750 1800 1200
U 604B79C4
F0 "output2" 50
F1 "output2.sch" 50
F2 "DN2_VBUS" I R 6100 2850 50 
F3 "USB_SSTXP_DN2" I L 4300 3450 50 
F4 "USB_SSTXM_DN2" I L 4300 3350 50 
F5 "USB_SSRXP_DN2" I L 4300 3200 50 
F6 "USB_SSRXM_DN2" I L 4300 3100 50 
F7 "USB_DP_DN2" I L 4300 2950 50 
F8 "USB_DM_DN2" I L 4300 2850 50 
$EndSheet
$Sheet
S 4300 4300 1800 1200
U 604BBB05
F0 "output3" 50
F1 "output3.sch" 50
F2 "DN3_VBUS" I R 6100 4400 50 
F3 "USB_SSTXP_DN3" I L 4300 5000 50 
F4 "USB_SSTXM_DN3" I L 4300 4900 50 
F5 "USB_SSRXP_DN3" I L 4300 4750 50 
F6 "USB_SSRXM_DN3" I L 4300 4650 50 
F7 "USB_DP_DN3" I L 4300 4500 50 
F8 "USB_DM_DN3" I L 4300 4400 50 
$EndSheet
$Sheet
S 4300 5950 1800 1200
U 604BC6F8
F0 "output4" 50
F1 "output4.sch" 50
F2 "DN4_VBUS" I R 6100 6050 50 
F3 "USB_SSTXP_DN4" I L 4300 6650 50 
F4 "USB_SSTXM_DN4" I L 4300 6550 50 
F5 "USB_SSRXP_DN4" I L 4300 6400 50 
F6 "USB_SSRXM_DN4" I L 4300 6300 50 
F7 "USB_DP_DN4" I L 4300 6150 50 
F8 "USB_DM_DN4" I L 4300 6050 50 
$EndSheet
Wire Wire Line
	3400 6050 4300 6050
Wire Wire Line
	3250 6150 4300 6150
Wire Wire Line
	3100 6300 4300 6300
Wire Wire Line
	2950 6400 4300 6400
Wire Wire Line
	2800 6550 4300 6550
Wire Wire Line
	2650 6650 4300 6650
Text HLabel 6600 6050 2    50   Input ~ 0
DN4_VBUS
Wire Wire Line
	6100 6050 6600 6050
Entry Wire Line
	2800 6550 2700 6450
Entry Wire Line
	2950 6400 2850 6300
Entry Wire Line
	3100 6300 3000 6200
Entry Wire Line
	3250 6150 3150 6050
Entry Wire Line
	2650 6650 2550 6550
Text Label 3400 2850 0    50   ~ 0
USB_DM_DN2
Text Label 3400 2950 0    50   ~ 0
USB_DP_DN2
Text Label 3400 3100 0    50   ~ 0
USB_SSRXM_DN2
Text Label 3400 3200 0    50   ~ 0
USB_SSRXP_DN2
Text Label 3400 3350 0    50   ~ 0
USB_SSTXM_DN2
Text Label 3400 3450 0    50   ~ 0
USB_SSTXP_DN2
Text Label 3400 4400 0    50   ~ 0
USB_DM_DN3
Text Label 3400 4500 0    50   ~ 0
USB_DP_DN3
Text Label 3400 4650 0    50   ~ 0
USB_SSRXM_DN3
Text Label 3400 4750 0    50   ~ 0
USB_SSRXP_DN3
Text Label 3400 4900 0    50   ~ 0
USB_SSTXM_DN3
Text Label 3400 5000 0    50   ~ 0
USB_SSTXP_DN3
Text Label 3400 6050 0    50   ~ 0
USB_DM_DN4
Text Label 3400 6150 0    50   ~ 0
USB_DP_DN4
Text Label 3400 6300 0    50   ~ 0
USB_SSRXM_DN4
Text Label 3400 6400 0    50   ~ 0
USB_SSRXP_DN4
Text Label 3400 6550 0    50   ~ 0
USB_SSTXM_DN4
Text Label 3400 6650 0    50   ~ 0
USB_SSTXP_DN4
Wire Bus Line
	2550 1550 2550 6550
Wire Bus Line
	2700 1450 2700 6450
Wire Bus Line
	2850 1350 2850 6300
Wire Bus Line
	3000 1250 3000 6200
Wire Bus Line
	3150 1150 3150 6050
Wire Bus Line
	3300 1050 3300 5950
$EndSCHEMATC
