diff -Naur a/arch/arm/boot/dts/armada-38x.dtsi b/arch/arm/boot/dts/armada-38x.dtsi
--- a/arch/arm/boot/dts/armada-38x.dtsi	2017-05-29 03:20:53.000000000 +0300
+++ b/arch/arm/boot/dts/armada-38x.dtsi	2017-06-02 18:39:52.753128537 +0300
@@ -312,13 +312,16 @@
 			};
 
 			gpio0: gpio@18100 {
-				compatible = "marvell,orion-gpio";
-				reg = <0x18100 0x40>;
+				compatible = "marvell,armada-370-gpio", "marvell,orion-gpio";
+				reg = <0x18100 0x40>, <0x181c0 0x08>;
+				reg-names = "gpio", "pwm";
 				ngpios = <32>;
 				gpio-controller;
 				#gpio-cells = <2>;
+				#pwm-cells = <2>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
+				clocks = <&coreclk 0>;
 				interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
@@ -326,13 +329,16 @@
 			};
 
 			gpio1: gpio@18140 {
-				compatible = "marvell,orion-gpio";
-				reg = <0x18140 0x40>;
+				compatible =  "marvell,armada-370-gpio", "marvell,orion-gpio";
+				reg = <0x18140 0x40>, <0x181c8 0x08>;
+				reg-names = "gpio", "pwm";
 				ngpios = <28>;
 				gpio-controller;
 				#gpio-cells = <2>;
+				#pwm-cells = <2>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
+				clocks = <&coreclk 0>;
 				interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,


From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
From: Andrew Lunn <andrew@lunn.ch>
Date: Sat, 10 Jan 2015 00:34:52 +0100
Subject: ARM: mvebu: Enable SENSORS_PWM_FAN in defconfig

Now that the GPIO driver also supports PWM operation, enable the PWM
framework and fan driver in mvebu_v7_defconfig.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
URL: https://patchwork.ozlabs.org/patch/427297/
[Ralph Sennhauser: add fan driver to defconfig]
Signed-off-by: Ralph Sennhauser <ralph.sennhauser@gmail.com>
Tested-by: Andrew Lunn <andrew@lunn.ch>
---
 arch/arm/configs/mvebu_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/mvebu_v7_defconfig b/arch/arm/configs/mvebu_v7_defconfig
index f1a0e25..6955370 100644
--- a/arch/arm/configs/mvebu_v7_defconfig
+++ b/arch/arm/configs/mvebu_v7_defconfig
@@ -135,6 +135,8 @@ CONFIG_DMADEVICES=y
 CONFIG_MV_XOR=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_MEMORY=y
+CONFIG_PWM=y
+CONFIG_SENSORS_PWM_FAN=y
 CONFIG_EXT4_FS=y
 CONFIG_ISO9660_FS=y
 CONFIG_JOLIET=y
-- 
2.10.2

