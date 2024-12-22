%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info
options_ = [];
M_.fname = 'model_4nk_yield';
M_.dynare_version = '6.1';
oo_.dynare_version = '6.1';
options_.dynare_version = '6.1';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(4,1);
M_.exo_names_tex = cell(4,1);
M_.exo_names_long = cell(4,1);
M_.exo_names(1) = {'eA'};
M_.exo_names_tex(1) = {'eA'};
M_.exo_names_long(1) = {'eA'};
M_.exo_names(2) = {'et'};
M_.exo_names_tex(2) = {'et'};
M_.exo_names_long(2) = {'et'};
M_.exo_names(3) = {'eq'};
M_.exo_names_tex(3) = {'eq'};
M_.exo_names_long(3) = {'eq'};
M_.exo_names(4) = {'er'};
M_.exo_names_tex(4) = {'er'};
M_.exo_names_long(4) = {'er'};
M_.endo_names = cell(10,1);
M_.endo_names_tex = cell(10,1);
M_.endo_names_long = cell(10,1);
M_.endo_names(1) = {'Rs'};
M_.endo_names_tex(1) = {'Rs'};
M_.endo_names_long(1) = {'Rs'};
M_.endo_names(2) = {'Pi'};
M_.endo_names_tex(2) = {'Pi'};
M_.endo_names_long(2) = {'Pi'};
M_.endo_names(3) = {'Y'};
M_.endo_names_tex(3) = {'Y'};
M_.endo_names_long(3) = {'Y'};
M_.endo_names(4) = {'Yf'};
M_.endo_names_tex(4) = {'Yf'};
M_.endo_names_long(4) = {'Yf'};
M_.endo_names(5) = {'qe'};
M_.endo_names_tex(5) = {'qe'};
M_.endo_names_long(5) = {'qe'};
M_.endo_names(6) = {'theta'};
M_.endo_names_tex(6) = {'theta'};
M_.endo_names_long(6) = {'theta'};
M_.endo_names(7) = {'X'};
M_.endo_names_tex(7) = {'X'};
M_.endo_names_long(7) = {'X'};
M_.endo_names(8) = {'Rf'};
M_.endo_names_tex(8) = {'Rf'};
M_.endo_names_long(8) = {'Rf'};
M_.endo_names(9) = {'Rb'};
M_.endo_names_tex(9) = {'Rb'};
M_.endo_names_long(9) = {'Rb'};
M_.endo_names(10) = {'spread'};
M_.endo_names_tex(10) = {'spread'};
M_.endo_names_long(10) = {'spread'};
M_.endo_partitions = struct();
M_.param_names = cell(39,1);
M_.param_names_tex = cell(39,1);
M_.param_names_long = cell(39,1);
M_.param_names(1) = {'beta'};
M_.param_names_tex(1) = {'beta'};
M_.param_names_long(1) = {'beta'};
M_.param_names(2) = {'betab'};
M_.param_names_tex(2) = {'betab'};
M_.param_names_long(2) = {'betab'};
M_.param_names(3) = {'z'};
M_.param_names_tex(3) = {'z'};
M_.param_names_long(3) = {'z'};
M_.param_names(4) = {'psi'};
M_.param_names_tex(4) = {'psi'};
M_.param_names_long(4) = {'psi'};
M_.param_names(5) = {'chi'};
M_.param_names_tex(5) = {'chi'};
M_.param_names_long(5) = {'chi'};
M_.param_names(6) = {'sigma'};
M_.param_names_tex(6) = {'sigma'};
M_.param_names_long(6) = {'sigma'};
M_.param_names(7) = {'kappa'};
M_.param_names_tex(7) = {'kappa'};
M_.param_names_long(7) = {'kappa'};
M_.param_names(8) = {'Xfi'};
M_.param_names_tex(8) = {'Xfi'};
M_.param_names_long(8) = {'Xfi'};
M_.param_names(9) = {'Xb'};
M_.param_names_tex(9) = {'Xb'};
M_.param_names_long(9) = {'Xb'};
M_.param_names(10) = {'thetas'};
M_.param_names_tex(10) = {'thetas'};
M_.param_names_long(10) = {'thetas'};
M_.param_names(11) = {'epsi'};
M_.param_names_tex(11) = {'epsi'};
M_.param_names_long(11) = {'epsi'};
M_.param_names(12) = {'phi'};
M_.param_names_tex(12) = {'phi'};
M_.param_names_long(12) = {'phi'};
M_.param_names(13) = {'bcbs'};
M_.param_names_tex(13) = {'bcbs'};
M_.param_names_long(13) = {'bcbs'};
M_.param_names(14) = {'phipi'};
M_.param_names_tex(14) = {'phipi'};
M_.param_names_long(14) = {'phipi'};
M_.param_names(15) = {'phix'};
M_.param_names_tex(15) = {'phix'};
M_.param_names_long(15) = {'phix'};
M_.param_names(16) = {'Pis'};
M_.param_names_tex(16) = {'Pis'};
M_.param_names_long(16) = {'Pis'};
M_.param_names(17) = {'rhoq'};
M_.param_names_tex(17) = {'rhoq'};
M_.param_names_long(17) = {'rhoq'};
M_.param_names(18) = {'rhoA'};
M_.param_names_tex(18) = {'rhoA'};
M_.param_names_long(18) = {'rhoA'};
M_.param_names(19) = {'rhot'};
M_.param_names_tex(19) = {'rhot'};
M_.param_names_long(19) = {'rhot'};
M_.param_names(20) = {'rhor'};
M_.param_names_tex(20) = {'rhor'};
M_.param_names_long(20) = {'rhor'};
M_.param_names(21) = {'sq'};
M_.param_names_tex(21) = {'sq'};
M_.param_names_long(21) = {'sq'};
M_.param_names(22) = {'sA'};
M_.param_names_tex(22) = {'sA'};
M_.param_names_long(22) = {'sA'};
M_.param_names(23) = {'st'};
M_.param_names_tex(23) = {'st'};
M_.param_names_long(23) = {'st'};
M_.param_names(24) = {'sr'};
M_.param_names_tex(24) = {'sr'};
M_.param_names_long(24) = {'sr'};
M_.param_names(25) = {'Rres'};
M_.param_names_tex(25) = {'Rres'};
M_.param_names_long(25) = {'Rres'};
M_.param_names(26) = {'Rbs'};
M_.param_names_tex(26) = {'Rbs'};
M_.param_names_long(26) = {'Rbs'};
M_.param_names(27) = {'Qs'};
M_.param_names_tex(27) = {'Qs'};
M_.param_names_long(27) = {'Qs'};
M_.param_names(28) = {'bfis'};
M_.param_names_tex(28) = {'bfis'};
M_.param_names_long(28) = {'bfis'};
M_.param_names(29) = {'res'};
M_.param_names_tex(29) = {'res'};
M_.param_names_long(29) = {'res'};
M_.param_names(30) = {'ss'};
M_.param_names_tex(30) = {'ss'};
M_.param_names_long(30) = {'ss'};
M_.param_names(31) = {'Rss'};
M_.param_names_tex(31) = {'Rss'};
M_.param_names_long(31) = {'Rss'};
M_.param_names(32) = {'sp'};
M_.param_names_tex(32) = {'sp'};
M_.param_names_long(32) = {'sp'};
M_.param_names(33) = {'bs'};
M_.param_names_tex(33) = {'bs'};
M_.param_names_long(33) = {'bs'};
M_.param_names(34) = {'Cbs'};
M_.param_names_tex(34) = {'Cbs'};
M_.param_names_long(34) = {'Cbs'};
M_.param_names(35) = {'qes'};
M_.param_names_tex(35) = {'qes'};
M_.param_names_long(35) = {'qes'};
M_.param_names(36) = {'gamma'};
M_.param_names_tex(36) = {'gamma'};
M_.param_names_long(36) = {'gamma'};
M_.param_names(37) = {'zeta'};
M_.param_names_tex(37) = {'zeta'};
M_.param_names_long(37) = {'zeta'};
M_.param_names(38) = {'b1'};
M_.param_names_tex(38) = {'b1'};
M_.param_names_long(38) = {'b1'};
M_.param_names(39) = {'b2'};
M_.param_names_tex(39) = {'b2'};
M_.param_names_long(39) = {'b2'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 4;
M_.endo_nbr = 10;
M_.param_nbr = 39;
M_.orig_endo_nbr = 10;
M_.aux_vars = [];
M_.Sigma_e = zeros(4, 4);
M_.Correlation_matrix = eye(4, 4);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
M_.surprise_shocks = [];
M_.learnt_shocks = [];
M_.learnt_endval = [];
M_.heteroskedastic_shocks.Qvalue_orig = [];
M_.heteroskedastic_shocks.Qscale_orig = [];
M_.matched_irfs = {};
M_.matched_irfs_weights = {};
options_.linear = true;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.ramsey_policy = false;
options_.discretionary_policy = false;
M_.nonzero_hessian_eqs = [];
M_.hessian_eq_zero = isempty(M_.nonzero_hessian_eqs);
M_.eq_nbr = 10;
M_.ramsey_orig_eq_nbr = 0;
M_.ramsey_orig_endo_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 1 5 0;
 0 6 15;
 0 7 16;
 2 8 0;
 3 9 17;
 4 10 18;
 0 11 19;
 0 12 0;
 0 13 0;
 0 14 0;]';
M_.nstatic = 3;
M_.nfwrd   = 3;
M_.npred   = 2;
M_.nboth   = 2;
M_.nsfwrd   = 5;
M_.nspred   = 4;
M_.ndynamic   = 7;
M_.dynamic_tmp_nbr = [1; 0; 0; 0; ];
M_.equations_tags = {
  1 , 'name' , 'X' ;
  2 , 'name' , 'Pi' ;
  3 , 'name' , 'qe' ;
  4 , 'name' , 'Yf' ;
  5 , 'name' , 'theta' ;
  6 , 'name' , 'Rs' ;
  7 , 'name' , '7' ;
  8 , 'name' , 'Rf' ;
  9 , 'name' , 'Y' ;
  10 , 'name' , 'spread' ;
};
M_.mapping.Rs.eqidx = [1 6 9 10 ];
M_.mapping.Pi.eqidx = [1 2 6 9 ];
M_.mapping.Y.eqidx = [7 9 ];
M_.mapping.Yf.eqidx = [4 7 8 ];
M_.mapping.qe.eqidx = [1 2 3 ];
M_.mapping.theta.eqidx = [1 2 5 ];
M_.mapping.X.eqidx = [1 2 6 7 ];
M_.mapping.Rf.eqidx = [1 8 ];
M_.mapping.Rb.eqidx = [9 10 ];
M_.mapping.spread.eqidx = [10 ];
M_.mapping.eA.eqidx = [4 ];
M_.mapping.et.eqidx = [5 ];
M_.mapping.eq.eqidx = [3 ];
M_.mapping.er.eqidx = [6 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.block_structure.time_recursive = false;
M_.block_structure.block(1).Simulation_Type = 1;
M_.block_structure.block(1).endo_nbr = 4;
M_.block_structure.block(1).mfs = 4;
M_.block_structure.block(1).equation = [ 3 4 5 8];
M_.block_structure.block(1).variable = [ 5 4 6 8];
M_.block_structure.block(1).is_linear = true;
M_.block_structure.block(1).NNZDerivatives = 8;
M_.block_structure.block(1).bytecode_jacob_cols_to_sparse = [1 2 3 5 6 7 8 ];
M_.block_structure.block(2).Simulation_Type = 8;
M_.block_structure.block(2).endo_nbr = 3;
M_.block_structure.block(2).mfs = 3;
M_.block_structure.block(2).equation = [ 1 6 2];
M_.block_structure.block(2).variable = [ 1 2 7];
M_.block_structure.block(2).is_linear = true;
M_.block_structure.block(2).NNZDerivatives = 11;
M_.block_structure.block(2).bytecode_jacob_cols_to_sparse = [1 4 5 6 8 9 ];
M_.block_structure.block(3).Simulation_Type = 3;
M_.block_structure.block(3).endo_nbr = 1;
M_.block_structure.block(3).mfs = 1;
M_.block_structure.block(3).equation = [ 7];
M_.block_structure.block(3).variable = [ 3];
M_.block_structure.block(3).is_linear = true;
M_.block_structure.block(3).NNZDerivatives = 1;
M_.block_structure.block(3).bytecode_jacob_cols_to_sparse = [1 ];
M_.block_structure.block(4).Simulation_Type = 3;
M_.block_structure.block(4).endo_nbr = 1;
M_.block_structure.block(4).mfs = 1;
M_.block_structure.block(4).equation = [ 9];
M_.block_structure.block(4).variable = [ 9];
M_.block_structure.block(4).is_linear = true;
M_.block_structure.block(4).NNZDerivatives = 1;
M_.block_structure.block(4).bytecode_jacob_cols_to_sparse = [1 ];
M_.block_structure.block(5).Simulation_Type = 1;
M_.block_structure.block(5).endo_nbr = 1;
M_.block_structure.block(5).mfs = 1;
M_.block_structure.block(5).equation = [ 10];
M_.block_structure.block(5).variable = [ 10];
M_.block_structure.block(5).is_linear = true;
M_.block_structure.block(5).NNZDerivatives = 1;
M_.block_structure.block(5).bytecode_jacob_cols_to_sparse = [2 ];
M_.block_structure.block(1).g1_sparse_rowval = int32([]);
M_.block_structure.block(1).g1_sparse_colval = int32([]);
M_.block_structure.block(1).g1_sparse_colptr = int32([]);
M_.block_structure.block(2).g1_sparse_rowval = int32([2 1 2 2 3 1 2 3 1 3 1 ]);
M_.block_structure.block(2).g1_sparse_colval = int32([1 4 4 5 5 6 6 6 8 8 9 ]);
M_.block_structure.block(2).g1_sparse_colptr = int32([1 2 2 2 4 6 9 9 11 12 ]);
M_.block_structure.block(3).g1_sparse_rowval = int32([1 ]);
M_.block_structure.block(3).g1_sparse_colval = int32([1 ]);
M_.block_structure.block(3).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure.block(4).g1_sparse_rowval = int32([1 ]);
M_.block_structure.block(4).g1_sparse_colval = int32([1 ]);
M_.block_structure.block(4).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure.block(5).g1_sparse_rowval = int32([]);
M_.block_structure.block(5).g1_sparse_colval = int32([]);
M_.block_structure.block(5).g1_sparse_colptr = int32([]);
M_.block_structure.variable_reordered = [ 5 4 6 8 1 2 7 3 9 10];
M_.block_structure.equation_reordered = [ 3 4 5 8 1 6 2 7 9 10];
M_.block_structure.incidence(1).lead_lag = -1;
M_.block_structure.incidence(1).sparse_IM = [
 3 5;
 4 4;
 5 6;
 6 1;
];
M_.block_structure.incidence(2).lead_lag = 0;
M_.block_structure.incidence(2).sparse_IM = [
 1 1;
 1 5;
 1 6;
 1 7;
 1 8;
 2 2;
 2 5;
 2 6;
 2 7;
 3 5;
 4 4;
 5 6;
 6 1;
 6 2;
 6 7;
 7 3;
 7 4;
 7 7;
 8 4;
 8 8;
 9 1;
 9 3;
 9 9;
 10 1;
 10 9;
 10 10;
];
M_.block_structure.incidence(3).lead_lag = 1;
M_.block_structure.incidence(3).sparse_IM = [
 1 2;
 1 5;
 1 6;
 1 7;
 2 2;
 9 2;
 9 3;
];
M_.block_structure.dyn_tmp_nbr = 0;
M_.state_var = [5 4 6 1 ];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(10, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(4, 1);
M_.params = NaN(39, 1);
M_.endo_trends = struct('deflator', cell(10, 1), 'log_deflator', cell(10, 1), 'growth_factor', cell(10, 1), 'log_growth_factor', cell(10, 1));
M_.NNZDerivatives = [41; 0; -1; ];
M_.dynamic_g1_sparse_rowval = int32([6 4 3 5 1 6 9 10 2 6 7 9 4 7 8 1 2 3 1 2 5 1 2 6 7 1 8 9 10 10 1 2 9 9 1 1 1 4 5 3 6 ]);
M_.dynamic_g1_sparse_colval = int32([1 4 5 6 11 11 11 11 12 12 13 13 14 14 14 15 15 15 16 16 16 17 17 17 17 18 18 19 19 20 22 22 22 23 25 26 27 31 32 33 34 ]);
M_.dynamic_g1_sparse_colptr = int32([1 2 2 2 3 4 5 5 5 5 5 9 11 13 16 19 22 26 28 30 31 31 34 35 35 36 37 38 38 38 38 39 40 41 42 ]);
M_.dynamic_g2_sparse_indices = int32([]);
M_.lhs = {
'X'; 
'Pi'; 
'qe'; 
'Yf'; 
'theta'; 
'Rs'; 
'X'; 
'Rf'; 
'Y'; 
'spread'; 
};
M_.static_tmp_nbr = [1; 0; 0; 0; ];
M_.block_structure_stat.block(1).Simulation_Type = 3;
M_.block_structure_stat.block(1).endo_nbr = 1;
M_.block_structure_stat.block(1).mfs = 1;
M_.block_structure_stat.block(1).equation = [ 3];
M_.block_structure_stat.block(1).variable = [ 5];
M_.block_structure_stat.block(2).Simulation_Type = 3;
M_.block_structure_stat.block(2).endo_nbr = 1;
M_.block_structure_stat.block(2).mfs = 1;
M_.block_structure_stat.block(2).equation = [ 4];
M_.block_structure_stat.block(2).variable = [ 4];
M_.block_structure_stat.block(3).Simulation_Type = 3;
M_.block_structure_stat.block(3).endo_nbr = 1;
M_.block_structure_stat.block(3).mfs = 1;
M_.block_structure_stat.block(3).equation = [ 5];
M_.block_structure_stat.block(3).variable = [ 6];
M_.block_structure_stat.block(4).Simulation_Type = 1;
M_.block_structure_stat.block(4).endo_nbr = 1;
M_.block_structure_stat.block(4).mfs = 1;
M_.block_structure_stat.block(4).equation = [ 8];
M_.block_structure_stat.block(4).variable = [ 8];
M_.block_structure_stat.block(5).Simulation_Type = 6;
M_.block_structure_stat.block(5).endo_nbr = 3;
M_.block_structure_stat.block(5).mfs = 3;
M_.block_structure_stat.block(5).equation = [ 1 6 2];
M_.block_structure_stat.block(5).variable = [ 1 7 2];
M_.block_structure_stat.block(6).Simulation_Type = 3;
M_.block_structure_stat.block(6).endo_nbr = 1;
M_.block_structure_stat.block(6).mfs = 1;
M_.block_structure_stat.block(6).equation = [ 7];
M_.block_structure_stat.block(6).variable = [ 3];
M_.block_structure_stat.block(7).Simulation_Type = 3;
M_.block_structure_stat.block(7).endo_nbr = 1;
M_.block_structure_stat.block(7).mfs = 1;
M_.block_structure_stat.block(7).equation = [ 9];
M_.block_structure_stat.block(7).variable = [ 9];
M_.block_structure_stat.block(8).Simulation_Type = 1;
M_.block_structure_stat.block(8).endo_nbr = 1;
M_.block_structure_stat.block(8).mfs = 1;
M_.block_structure_stat.block(8).equation = [ 10];
M_.block_structure_stat.block(8).variable = [ 10];
M_.block_structure_stat.variable_reordered = [ 5 4 6 8 1 7 2 3 9 10];
M_.block_structure_stat.equation_reordered = [ 3 4 5 8 1 6 2 7 9 10];
M_.block_structure_stat.incidence.sparse_IM = [
 1 1;
 1 2;
 1 8;
 2 2;
 2 5;
 2 6;
 2 7;
 3 5;
 4 4;
 5 6;
 6 1;
 6 2;
 6 7;
 7 3;
 7 4;
 7 7;
 8 4;
 8 8;
 9 1;
 9 2;
 9 9;
 10 1;
 10 9;
 10 10;
];
M_.block_structure_stat.tmp_nbr = 0;
M_.block_structure_stat.block(1).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(2).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(2).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(2).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(3).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(3).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(3).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(4).g1_sparse_rowval = int32([]);
M_.block_structure_stat.block(4).g1_sparse_colval = int32([]);
M_.block_structure_stat.block(4).g1_sparse_colptr = int32([]);
M_.block_structure_stat.block(5).g1_sparse_rowval = int32([1 2 2 3 1 2 3 ]);
M_.block_structure_stat.block(5).g1_sparse_colval = int32([1 1 2 2 3 3 3 ]);
M_.block_structure_stat.block(5).g1_sparse_colptr = int32([1 3 5 8 ]);
M_.block_structure_stat.block(6).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(6).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(6).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(7).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(7).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(7).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(8).g1_sparse_rowval = int32([]);
M_.block_structure_stat.block(8).g1_sparse_colval = int32([]);
M_.block_structure_stat.block(8).g1_sparse_colptr = int32([]);
M_.static_g1_sparse_rowval = int32([1 6 9 10 1 2 6 9 7 4 7 8 2 3 2 5 2 6 7 1 8 9 10 10 ]);
M_.static_g1_sparse_colval = int32([1 1 1 1 2 2 2 2 3 4 4 4 5 5 6 6 7 7 7 8 8 9 9 10 ]);
M_.static_g1_sparse_colptr = int32([1 5 9 10 13 15 17 20 22 24 25 ]);
load param_4nk_yield;
set_param_value('beta',beta);
set_param_value('betab',betab);
set_param_value('z',z);
set_param_value('psi',psi);
set_param_value('chi',chi);
set_param_value('sigma',sigma);
set_param_value('kappa',kappa);
set_param_value('Xfi',Xfi);
set_param_value('Xb',Xb);
set_param_value('thetas',thetas);
set_param_value('rhor',rhor);
set_param_value('sq',sq);
set_param_value('epsi',epsi);
set_param_value('phi',phi);
set_param_value('bcbs',bcbs);
set_param_value('phipi',phipi);
set_param_value('phix',phix);
set_param_value('Pis',Pis);
set_param_value('rhoq',rhoq);
set_param_value('rhoA',rhoA);
set_param_value('rhot',rhot);
set_param_value('sA',sA);
set_param_value('st',st);
set_param_value('sr',sr);
set_param_value('Rres',Rres);
set_param_value('Rbs',Rbs);
set_param_value('Qs',Qs);
set_param_value('bfis',bfis);
set_param_value('res',res);
set_param_value('ss',ss);
set_param_value('Rss',Rss);
set_param_value('sp',sp);
set_param_value('bcbs',bcbs);
set_param_value('bs',bs);
set_param_value('Cbs',Cbs);
set_param_value('qes',qes);
set_param_value('gamma',gamma);
set_param_value('zeta',zeta);
set_param_value('b1',b1);
set_param_value('b2',b2);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = 1;
M_.Sigma_e(2, 2) = 1;
M_.Sigma_e(3, 3) = 1;
M_.Sigma_e(4, 4) = 1;
options_.ar = 0;
options_.irf = 21;
options_.nograph = true;
options_.order = 1;
var_list_ = {};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'model_4nk_yield_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'model_4nk_yield_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'model_4nk_yield_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'model_4nk_yield_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'model_4nk_yield_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'model_4nk_yield_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'model_4nk_yield_results.mat'], 'oo_recursive_', '-append');
end
if exist('options_mom_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'model_4nk_yield_results.mat'], 'options_mom_', '-append');
end
disp('Note: 2 warning(s) encountered in the preprocessor')
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
