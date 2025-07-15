the folders contain <br>
- configuration script for Check Quantum Gateways as Cluster (folder clusters) <br>
- 5 single Quantum Spark Gateways (folder Spark1-5) <br>
- Management Server (folder Management-Server) <br>
- bash scripts (folder Management-Server/api-Scripts) <br>
--- to: <br>
  parameter.sh (general parameter that are used in other shell scripts) <br>
  publish_and_wait.sh (publish any change and wait for task to finish) <br>
  00_general_settings.sh (set general settings to log also implied rules) <br>
  source 01_define_networks.sh (define network objects and groups) <br>
  source 02_cl1.sh (creates Cluster1 and establishes sic) <br>
  source 03_cl2.sh (creates Cluster1 and establishes sic) <br>
  source 09_CleanupRule.sh  (caution: cleanup rule is accept) <br>
  source 98_Install_policy.sh (caution: install policy on cl1 [cluster1] and cl2 [cluster2]) <br>
  source 04_spark1.sh (creates Spark1 and establishes sic) <br>
  source 05_spark2.sh (creates Spark2 and establishes sic) <br>
  source 06_spark3.sh (creates Spark3 and establishes sic) <br>
  source 07_spark4.sh (creates Spark4 and establishes sic) <br>
  source 08_spark5.sh (creates Spark5 and establishes sic) <br>
  source 09_rule_base.sh (adds some generic rules to policy) <br>
  source 99_Install_policy.sh (install policy on cl1+2, spark1-5) <br>
  source 10_cl1_cl2_community.sh (create vpn community for cl1 and cl2, sets enhanced link selection and routing) <br>
  source 11_cl1_spark_community.sh (create vpn community for cl1 and spark gateways, sets enhanced link selection and routing) <br>
  source 99_Install_policy.sh (install policy on cl1+2, spark1-5) <br>
    
  
