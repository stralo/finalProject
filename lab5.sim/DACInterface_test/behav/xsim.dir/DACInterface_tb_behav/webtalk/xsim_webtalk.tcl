webtalk_init -webtalk_dir O:/engs128/lab5/lab5.sim/DACInterface_test/behav/xsim.dir/DACInterface_tb_behav/webtalk/
webtalk_register_client -client project
webtalk_add_data -client project -key date_generated -value "Mon May 11 20:15:43 2015" -context "software_version_and_target_device"
webtalk_add_data -client project -key product_version -value "XSIM v2014.4 (64-bit)" -context "software_version_and_target_device"
webtalk_add_data -client project -key build_version -value "1071353" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_platform -value "WIN64" -context "software_version_and_target_device"
webtalk_add_data -client project -key registration_id -value "210643936_1777485687_210562918_123" -context "software_version_and_target_device"
webtalk_add_data -client project -key tool_flow -value "xsim_vivado" -context "software_version_and_target_device"
webtalk_add_data -client project -key beta -value "FALSE" -context "software_version_and_target_device"
webtalk_add_data -client project -key route_design -value "FALSE" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_family -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_device -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_package -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_speed -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key random_id -value "b6181c1f-d4c9-42ff-b523-c4f2539b53fa" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_id -value "3fc4a5d3650a498bba6b448194a25c23" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_iteration -value "2" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_name -value "Microsoft Windows 7 , 64-bit" -context "user_environment"
webtalk_add_data -client project -key os_release -value "Service Pack 1  (build 7601)" -context "user_environment"
webtalk_add_data -client project -key cpu_name -value "Intel(R) Xeon(R) CPU E5-1620 0 @ 3.60GHz" -context "user_environment"
webtalk_add_data -client project -key cpu_speed -value "3591 MHz" -context "user_environment"
webtalk_add_data -client project -key total_processors -value "1" -context "user_environment"
webtalk_add_data -client project -key system_ram -value "17.000 GB" -context "user_environment"
webtalk_register_client -client xsim
webtalk_add_data -client xsim -key Command -value "xsim" -context "xsim\\command_line_options"
webtalk_add_data -client xsim -key runall -value "false" -context "xsim\\command_line_options"
webtalk_add_data -client xsim -key trace_waveform -value "true" -context "xsim\\usage"
webtalk_add_data -client xsim -key runtime -value "1001 us" -context "xsim\\usage"
webtalk_add_data -client xsim -key iteration -value "3" -context "xsim\\usage"
webtalk_add_data -client xsim -key Simulation_Time -value "0.33_sec" -context "xsim\\usage"
webtalk_add_data -client xsim -key Simulation_Memory -value "27068_KB" -context "xsim\\usage"
webtalk_transmit -clientid 3515314541 -regid "210643936_1777485687_210562918_123" -xml O:/engs128/lab5/lab5.sim/DACInterface_test/behav/xsim.dir/DACInterface_tb_behav/webtalk/usage_statistics_ext_xsim.xml -html O:/engs128/lab5/lab5.sim/DACInterface_test/behav/xsim.dir/DACInterface_tb_behav/webtalk/usage_statistics_ext_xsim.html -wdm O:/engs128/lab5/lab5.sim/DACInterface_test/behav/xsim.dir/DACInterface_tb_behav/webtalk/usage_statistics_ext_xsim.wdm -intro "<H3>XSIM Usage Report</H3><BR>"
webtalk_terminate
