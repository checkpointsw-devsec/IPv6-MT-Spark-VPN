#!/bin/bash
source parameter.sh
if [[ -z "$LOGIN_SUCCESS" ]]; then
    highlight_message '########  Login was unsuccessful, exiting script. ##########'
    exit 1
fi

highlight_message '######  define network objects and network groups ##########'
mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv6_2a04:6447:900:100::_64" \
         subnet6 "2a04:6447:900:100::" \
		 ignore-warnings true \
         mask-length6 "64"

mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv4_10.1.0.0_24" \
         subnet "10.1.0.0" \
		 ignore-warnings true \
         mask-length "24"

mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv6_2a04:6447:900:101::_64" \
         subnet6 "2a04:6447:900:101::" \
		 ignore-warnings true \
         mask-length6 "64" 

mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv4_10.1.1.0_24" \
         subnet "10.1.1.0" \
		 ignore-warnings true \
         mask-length "24"

mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv6_2a04:6447:900:102::_64" \
         subnet6 "2a04:6447:900:102::" \
		 ignore-warnings true \
         mask-length6 "64"

mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv4_10.1.2.0_24" \
         subnet "10.1.2.0" \
		 ignore-warnings true \
         mask-length "24"


mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv6_2a04:6447:900:200::_64" \
         subnet6 "2a04:6447:900:200::" \
		 ignore-warnings true \
         mask-length6 "64" 

mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv4_10.2.0.0_24" \
         subnet "10.2.0.0" \
		 ignore-warnings true \
         mask-length "24"

mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv6_2a04:6447:900:300::_64" \
         subnet6 "2a04:6447:900:300::" \
		 ignore-warnings true \
         mask-length6 "64" 

mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv4_10.3.0.0_24" \
         subnet "10.3.0.0" \
		 ignore-warnings true \
         mask-length "24"

mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv6_2a04:6447:900:400::_64" \
         subnet6 "2a04:6447:900:400::" \
		 ignore-warnings true \
         mask-length6 "64" 

mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv4_10.4.0.0_24" \
         subnet "10.4.0.0" \
		 ignore-warnings true \
         mask-length "24"

mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv6_2a04:6447:900:1100::_64" \
         subnet6 "2a04:6447:900:1100::" \
		 ignore-warnings true \
         mask-length6 "64" 

mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv4_10.11.0.0_24" \
         subnet "10.11.0.0" \
		 ignore-warnings true \
         mask-length "24"

mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv6_2a04:6447:900:1101::_64" \
         subnet6 "2a04:6447:900:1101::" \
		 ignore-warnings true \
         mask-length6 "64" 

mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv4_10.11.1.0_24" \
         subnet "10.11.1.0" \
		 ignore-warnings true \
         mask-length "24"

mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv6_2a04:6447:900:1102::_64" \
         subnet6 "2a04:6447:900:1102::" \
		 ignore-warnings true \
         mask-length6 "64" 

mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv4_10.11.2.0_24" \
         subnet "10.11.2.0" \
		 ignore-warnings true \
         mask-length "24"

mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv6_2a04:6447:900:2100::_64" \
         subnet6 "2a04:6447:900:2100::" \
		 ignore-warnings true \
         mask-length6 "64" 

mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv4_10.21.0.0_24" \
         subnet "10.21.0.0" \
		 ignore-warnings true \
         mask-length "24"

mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv6_2a04:6447:900:2101::_64" \
         subnet6 "2a04:6447:900:2101::" \
		 ignore-warnings true \
         mask-length6 "64" 

mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv4_10.21.1.0_24" \
         subnet "10.21.1.0" \
		 ignore-warnings true \
         mask-length "24"

mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv6_2a04:6447:900:2102::_64" \
         subnet6 "2a04:6447:900:2102::" \
		 ignore-warnings true \
         mask-length6 "64" 

mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv4_10.21.2.0_24" \
         subnet "10.21.2.0" \
		 ignore-warnings true \
         mask-length "24"

mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv6_2a04:6447:900:3100::_64" \
         subnet6 "2a04:6447:900:3100::" \
		 ignore-warnings true \
         mask-length6 "64" 

mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv4_10.31.0.0_24" \
         subnet "10.31.0.0" \
		 ignore-warnings true \
         mask-length "24"

mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv6_2a04:6447:900:3101::_64" \
         subnet6 "2a04:6447:900:3101::" \
		 ignore-warnings true \
         mask-length6 "64" 

mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv4_10.31.1.0_24" \
         subnet "10.31.1.0" \
		 ignore-warnings true \
         mask-length "24"

mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv6_2a04:6447:900:3102::_64" \
         subnet6 "2a04:6447:900:3102::" \
		 ignore-warnings true \
         mask-length6 "64" 

mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv4_10.31.2.0_24" \
         subnet "10.31.2.0" \
		 ignore-warnings true \
         mask-length "24"

mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv6_2a04:6447:900:4100::_64" \
         subnet6 "2a04:6447:900:4100::" \
		 ignore-warnings true \
         mask-length6 "64" 

mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv4_10.41.0.0_24" \
         subnet "10.41.0.0" \
		 ignore-warnings true \
         mask-length "24"

mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv6_2a04:6447:900:4101::_64" \
         subnet6 "2a04:6447:900:4101::" \
		 ignore-warnings true \
         mask-length6 "64" 

mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv4_10.41.1.0_24" \
         subnet "10.41.1.0" \
		 ignore-warnings true \
         mask-length "24"
		 
mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv6_2a04:6447:900:4102::_64" \
         subnet6 "2a04:6447:900:4102::" \
		 ignore-warnings true \
         mask-length6 "64" 

mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv4_10.41.2.0_24" \
         subnet "10.41.2.0" \
		 ignore-warnings true \
         mask-length "24"

mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv6_2a04:6447:900:5100::_64" \
         subnet6 "2a04:6447:900:5100::" \
		 ignore-warnings true \
         mask-length6 "64" 

mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv4_10.51.0.0_24" \
         subnet "10.51.0.0" \
		 ignore-warnings true \
         mask-length "24"

mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv6_2a04:6447:900:5101::_64" \
         subnet6 "2a04:6447:900:5101::" \
		 ignore-warnings true \
         mask-length6 "64" 

mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv4_10.51.1.0_24" \
         subnet "10.51.1.0" \
		 ignore-warnings true \
         mask-length "24"

mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv6_2a04:6447:900:5102::_64" \
         subnet6 "2a04:6447:900:5102::" \
		 ignore-warnings true \
         mask-length6 "64" 


mgmt_cli add network -s /home/admin/sid.txt\
         name "IPv4_10.51.2.0_24" \
         subnet "10.51.2.0" \
		 ignore-warnings true \
         mask-length "24"

mgmt_cli add group -s /home/admin/sid.txt\
         name "Spark1_EncDom46" \
         members.1 "IPv6_2a04:6447:900:1100::_64" \
         members.2 "IPv6_2a04:6447:900:1101::_64" \
         members.3 "IPv6_2a04:6447:900:1102::_64" \
         members.4 "IPv4_10.11.0.0_24" \
         members.5 "IPv4_10.11.1.0_24" \
         members.6 "IPv4_10.11.2.0_24" \
		 ignore-warnings true

mgmt_cli add group -s /home/admin/sid.txt\
         name "Spark1_EncDom" \
         members.1 "IPv6_2a04:6447:900:1100::_64" \
         members.2 "IPv6_2a04:6447:900:1101::_64" \
         members.3 "IPv6_2a04:6447:900:1102::_64" \
		 ignore-warnings true


mgmt_cli add group -s /home/admin/sid.txt\
         name "Spark2_EncDom46" \
         members.1 "IPv6_2a04:6447:900:2100::_64" \
         members.2 "IPv6_2a04:6447:900:2101::_64" \
         members.3 "IPv6_2a04:6447:900:2102::_64" \
         members.4 "IPv4_10.21.0.0_24" \
         members.5 "IPv4_10.21.1.0_24" \
         members.6 "IPv4_10.21.2.0_24" \
		 ignore-warnings true

mgmt_cli add group -s /home/admin/sid.txt\
         name "Spark2_EncDom" \
         members.1 "IPv6_2a04:6447:900:2100::_64" \
         members.2 "IPv6_2a04:6447:900:2101::_64" \
         members.3 "IPv6_2a04:6447:900:2102::_64" \
		 ignore-warnings true


mgmt_cli add group -s /home/admin/sid.txt\
         name "Spark3_EncDom46" \
         members.1 "IPv6_2a04:6447:900:3100::_64" \
         members.2 "IPv6_2a04:6447:900:3101::_64" \
         members.3 "IPv6_2a04:6447:900:3102::_64" \
		 members.4 "IPv4_10.31.0.0_24" \
         members.5 "IPv4_10.31.1.0_24" \
         members.6 "IPv4_10.31.2.0_24" \
		 ignore-warnings true

mgmt_cli add group -s /home/admin/sid.txt\
         name "Spark3_EncDom" \
         members.1 "IPv6_2a04:6447:900:3100::_64" \
         members.2 "IPv6_2a04:6447:900:3101::_64" \
         members.3 "IPv6_2a04:6447:900:3102::_64" \
		 ignore-warnings true


mgmt_cli add group -s /home/admin/sid.txt\
         name "Spark4_EncDom46" \
         members.1 "IPv6_2a04:6447:900:4100::_64" \
         members.2 "IPv6_2a04:6447:900:4101::_64" \
         members.3 "IPv6_2a04:6447:900:4102::_64" \
		 members.4 "IPv4_10.41.0.0_24" \
         members.5 "IPv4_10.41.1.0_24" \
         members.6 "IPv4_10.41.2.0_24" \
		 ignore-warnings true

mgmt_cli add group -s /home/admin/sid.txt\
         name "Spark4_EncDom" \
         members.1 "IPv6_2a04:6447:900:4100::_64" \
         members.2 "IPv6_2a04:6447:900:4101::_64" \
         members.3 "IPv6_2a04:6447:900:4102::_64" \
		 ignore-warnings true


mgmt_cli add group -s /home/admin/sid.txt\
         name "Spark5_EncDom46" \
         members.1 "IPv6_2a04:6447:900:5100::_64" \
         members.2 "IPv6_2a04:6447:900:5101::_64" \
         members.3 "IPv6_2a04:6447:900:5102::_64" \
         members.4 "IPv4_10.51.0.0_24" \
         members.5 "IPv4_10.51.1.0_24" \
         members.6 "IPv4_10.51.2.0_24" \
		 ignore-warnings true

mgmt_cli add group -s /home/admin/sid.txt\
         name "Spark5_EncDom" \
         members.1 "IPv6_2a04:6447:900:5100::_64" \
         members.2 "IPv6_2a04:6447:900:5101::_64" \
         members.3 "IPv6_2a04:6447:900:5102::_64" \
		 ignore-warnings true
		 

mgmt_cli add group -s /home/admin/sid.txt\
         name "Spark_All_EncDom46" \
         members.1 "Spark1_EncDom46" \
         members.2 "Spark2_EncDom46" \
         members.3 "Spark3_EncDom46" \
         members.4 "Spark4_EncDom46" \
		 members.5 "Spark5_EncDom46" \
		 ignore-warnings true
         

mgmt_cli add group -s /home/admin/sid.txt\
         name "Spark_All_EncDom" \
         members.1 "Spark1_EncDom" \
         members.2 "Spark2_EncDom" \
         members.3 "Spark3_EncDom" \
         members.4 "Spark4_EncDom" \
		 members.5 "Spark5_EncDom" \
		 members.6 "IPv6_2a04:6447:900:200::_64" \
		 members.7 "IPv4_10.2.0.0_24" \
		 ignore-warnings true 
         


mgmt_cli add group -s /home/admin/sid.txt\
         name "Cl1_EncDom46" \
         members.1 "IPv6_2a04:6447:900:200::_64" \
         members.2 "IPv6_2a04:6447:900:400::_64" \
         members.3 "IPv4_10.2.0.0_24" \
         members.4 "IPv4_10.4.0.0_24" \
		 ignore-warnings true 

mgmt_cli add group -s /home/admin/sid.txt\
         name "Cl1_to_cl2_EncDom46" \
         members.1 "IPv6_2a04:6447:900:200::_64" \
         members.2 "IPv4_10.2.0.0_24" \
         members.3 "Spark_All_EncDom46" \
		 ignore-warnings true 

mgmt_cli add group -s /home/admin/sid.txt\
         name "Cl1_EncDom" \
         members.1 "IPv6_2a04:6447:900:200::_64" \
         members.2 "IPv6_2a04:6447:900:400::_64" \
		 ignore-warnings true 

mgmt_cli add group -s /home/admin/sid.txt\
         name "Cl2_EncDom46" \
         members.1 "IPv6_2a04:6447:900:400::_64" \
         members.2 "IPv4_10.4.0.0_24" \
		 ignore-warnings true 

mgmt_cli add group -s /home/admin/sid.txt\
         name "Cl2_EncDom" \
         members.1 "IPv6_2a04:6447:900:400::_64" \
		 ignore-warnings true 

mgmt_cli add group -s /home/admin/sid.txt\
         name "emptyEncDom" \
		 ignore-warnings true 

./publish_and_wait.sh 