webtalk_init -webtalk_dir O:/engs128/lab5/lab5.hw/webtalk/
webtalk_register_client -client project
webtalk_add_data -client project -key date_generated -value "Wed May 27 13:54:12 2015" -context "software_version_and_target_device"
webtalk_add_data -client project -key product_version -value "Vivado v2014.4 (64-bit)" -context "software_version_and_target_device"
webtalk_add_data -client project -key build_version -value "1071353" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_platform -value "WIN64" -context "software_version_and_target_device"
webtalk_add_data -client project -key registration_id -value "210643936_1777485687_210562918_123" -context "software_version_and_target_device"
webtalk_add_data -client project -key tool_flow -value "labtool" -context "software_version_and_target_device"
webtalk_add_data -client project -key beta -value "FALSE" -context "software_version_and_target_device"
webtalk_add_data -client project -key route_design -value "FALSE" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_family -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_device -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_package -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_speed -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key random_id -value "b6181c1f-d4c9-42ff-b523-c4f2539b53fa" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_id -value "3ec42256-d334-45a8-a78b-d92ce930bf2a" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_iteration -value "9" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_name -value "Microsoft Windows 7 , 64-bit" -context "user_environment"
webtalk_add_data -client project -key os_release -value "Service Pack 1  (build 7601)" -context "user_environment"
webtalk_add_data -client project -key cpu_name -value "Intel(R) Xeon(R) CPU E5-2670 0 @ 2.60GHz" -context "user_environment"
webtalk_add_data -client project -key cpu_speed -value "2600 MHz" -context "user_environment"
webtalk_add_data -client project -key total_processors -value "2" -context "user_environment"
webtalk_add_data -client project -key system_ram -value "4.000 GB" -context "user_environment"
webtalk_register_client -client labtool
webtalk_add_data -client labtool -key cable -value "Digilent/Basys3/15000000" -context "labtool\\usage"
webtalk_add_data -client labtool -key chain -value "0362D093" -context "labtool\\usage"
webtalk_add_data -client labtool -key pgmcnt -value "06:00:00" -context "labtool\\usage"
webtalk_transmit -clientid 1719782346 -regid "210643936_1777485687_210562918_123" -xml O:/engs128/lab5/lab5.hw/webtalk/usage_statistics_ext_labtool.xml -html O:/engs128/lab5/lab5.hw/webtalk/usage_statistics_ext_labtool.html -wdm O:/engs128/lab5/lab5.hw/webtalk/usage_statistics_ext_labtool.wdm -intro "<H3>LABTOOL Usage Report</H3><BR>"
webtalk_terminate
