#!/bin/bash
source 00_general_settings.sh
read -p "press any key to resume...."
source 01_define_networks.sh
read -p "press any key to resume...."
source 02_cl1.sh
read -p "press any key to resume...."
source 02_cl1_part2.sh
read -p "press any key to resume...."
source 03_cl2.sh
read -p "press any key to resume...."
source 09_CleanupRule.sh
read -p "press any key to resume...."
source 98_Install_policy.sh
read -p "press any key to resume...."
source 04_spark1.sh
read -p "press any key to resume...."
source 05_spark2.sh
read -p "press any key to resume...."
source 06_spark3.sh
read -p "press any key to resume...."
source 07_spark4.sh
read -p "press any key to resume...."
source 08_spark5.sh
read -p "press any key to resume...."
source 09_rule_base.sh
read -p "press any key to resume...."
source 99_Install_policy.sh
read -p "press any key to resume...."
source 10_cl1_cl2_community.sh
read -p "press any key to resume...."
source 11_cl1_spark_community.sh
read -p "press any key to resume...."
source 99_Install_policy.sh
