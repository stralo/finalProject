
//------------------------------------------------------------------------------
// (c) Copyright 2014 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//------------------------------------------------------------------------------ 
//
// C Model configuration for the "fir_compiler_0" instance.
//
//------------------------------------------------------------------------------
//
// coefficients: -0.002526,-0.002464,-0.002173,-0.001661,-0.000955,-0.000102,0.000839,0.001792,0.002680,0.003421,0.003943,0.004187,0.004113,0.003707,0.002979,0.001974,0.000758,-0.000574,-0.001911,-0.003132,-0.004113,-0.004743,-0.004928,-0.004606,-0.003752,-0.002386,-0.000577,0.001561,0.003867,0.006148,0.008184,0.009746,0.010611,0.010580,0.009497,0.007267,0.003867,-0.000638,-0.006093,-0.012246,-0.018758,-0.025210,-0.031121,-0.035968,-0.039213,-0.040332,-0.038845,-0.034345,-0.026528,-0.015215,-0.000376,0.017863,0.039213,0.063226,0.089305,0.116727,0.144667,0.172237,0.198518,0.222603,0.243639,0.260866,0.273650,0.281517,0.284173,0.281517,0.273650,0.260866,0.243639,0.222603,0.198518,0.172237,0.144667,0.116727,0.089305,0.063226,0.039213,0.017863,-0.000376,-0.015215,-0.026528,-0.034345,-0.038845,-0.040332,-0.039213,-0.035968,-0.031121,-0.025210,-0.018758,-0.012246,-0.006093,-0.000638,0.003867,0.007267,0.009497,0.010580,0.010611,0.009746,0.008184,0.006148,0.003867,0.001561,-0.000577,-0.002386,-0.003752,-0.004606,-0.004928,-0.004743,-0.004113,-0.003132,-0.001911,-0.000574,0.000758,0.001974,0.002979,0.003707,0.004113,0.004187,0.003943,0.003421,0.002680,0.001792,0.000839,-0.000102,-0.000955,-0.001661,-0.002173,-0.002464,-0.002526
// chanpats: 173
// name: fir_compiler_0
// filter_type: 1
// rate_change: 0
// interp_rate: 16
// decim_rate: 1
// zero_pack_factor: 1
// coeff_padding: 15
// num_coeffs: 129
// coeff_sets: 1
// reloadable: 0
// is_halfband: 0
// quantization: 1
// coeff_width: 16
// coeff_fract_width: 15
// chan_seq: 0
// num_channels: 1
// num_paths: 1
// data_width: 16
// data_fract_width: 0
// output_rounding_mode: 0
// output_width: 30
// output_fract_width: 15
// config_method: 0

const double fir_compiler_0_coefficients[129] = {-0.002526,-0.002464,-0.002173,-0.001661,-0.000955,-0.000102,0.000839,0.001792,0.002680,0.003421,0.003943,0.004187,0.004113,0.003707,0.002979,0.001974,0.000758,-0.000574,-0.001911,-0.003132,-0.004113,-0.004743,-0.004928,-0.004606,-0.003752,-0.002386,-0.000577,0.001561,0.003867,0.006148,0.008184,0.009746,0.010611,0.010580,0.009497,0.007267,0.003867,-0.000638,-0.006093,-0.012246,-0.018758,-0.025210,-0.031121,-0.035968,-0.039213,-0.040332,-0.038845,-0.034345,-0.026528,-0.015215,-0.000376,0.017863,0.039213,0.063226,0.089305,0.116727,0.144667,0.172237,0.198518,0.222603,0.243639,0.260866,0.273650,0.281517,0.284173,0.281517,0.273650,0.260866,0.243639,0.222603,0.198518,0.172237,0.144667,0.116727,0.089305,0.063226,0.039213,0.017863,-0.000376,-0.015215,-0.026528,-0.034345,-0.038845,-0.040332,-0.039213,-0.035968,-0.031121,-0.025210,-0.018758,-0.012246,-0.006093,-0.000638,0.003867,0.007267,0.009497,0.010580,0.010611,0.009746,0.008184,0.006148,0.003867,0.001561,-0.000577,-0.002386,-0.003752,-0.004606,-0.004928,-0.004743,-0.004113,-0.003132,-0.001911,-0.000574,0.000758,0.001974,0.002979,0.003707,0.004113,0.004187,0.003943,0.003421,0.002680,0.001792,0.000839,-0.000102,-0.000955,-0.001661,-0.002173,-0.002464,-0.002526};

const xip_fir_v7_2_pattern fir_compiler_0_chanpats[1] = {P_BASIC};

static xip_fir_v7_2_config gen_fir_compiler_0_config() {
  xip_fir_v7_2_config config;
  config.name                = "fir_compiler_0";
  config.filter_type         = 1;
  config.rate_change         = XIP_FIR_INTEGER_RATE;
  config.interp_rate         = 16;
  config.decim_rate          = 1;
  config.zero_pack_factor    = 1;
  config.coeff               = &fir_compiler_0_coefficients[0];
  config.coeff_padding       = 15;
  config.num_coeffs          = 129;
  config.coeff_sets          = 1;
  config.reloadable          = 0;
  config.is_halfband         = 0;
  config.quantization        = XIP_FIR_QUANTIZED_ONLY;
  config.coeff_width         = 16;
  config.coeff_fract_width   = 15;
  config.chan_seq            = XIP_FIR_BASIC_CHAN_SEQ;
  config.num_channels        = 1;
  config.init_pattern        = fir_compiler_0_chanpats[0];
  config.num_paths           = 1;
  config.data_width          = 16;
  config.data_fract_width    = 0;
  config.output_rounding_mode= XIP_FIR_FULL_PRECISION;
  config.output_width        = 30;
  config.output_fract_width  = 15,
  config.config_method       = XIP_FIR_CONFIG_SINGLE;
  return config;
}

const xip_fir_v7_2_config fir_compiler_0_config = gen_fir_compiler_0_config();

