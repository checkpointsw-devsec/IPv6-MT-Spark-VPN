#!/bin/bash
source 00_general_settings.sh
source 01_define_networks.sh
source 02_cl1.sh
source 02_cl1_part2.sh
source 03_cl2.sh
source 09_CleanupRule.sh
source 98_Install_policy.sh
source 04_spark1.sh
source 05_spark2.sh
source 06_spark3.sh
source 07_spark4.sh
source 08_spark5.sh
source 09_rule_base.sh
source 99_Install_policy.sh
source 10_cl1_cl2_community.sh
source 11_cl1_spark_community.sh
source 99_Install_policy.sh
# the second Policy install is important 
# the first run getting the objects for the spark 1 only
source 99_Install_policy.sh
