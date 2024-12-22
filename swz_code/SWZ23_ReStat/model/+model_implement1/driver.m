%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info
options_ = [];
M_.fname = 'model_implement1';
M_.dynare_version = '6.2';
oo_.dynare_version = '6.2';
options_.dynare_version = '6.2';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(2,1);
M_.exo_names_tex = cell(2,1);
M_.exo_names_long = cell(2,1);
M_.exo_names(1) = {'er'};
M_.exo_names_tex(1) = {'er'};
M_.exo_names_long(1) = {'er'};
M_.exo_names(2) = {'et'};
M_.exo_names_tex(2) = {'et'};
M_.exo_names_long(2) = {'et'};
M_.endo_names = cell(9,1);
M_.endo_names_tex = cell(9,1);
M_.endo_names_long = cell(9,1);
M_.endo_names(1) = {'x'};
M_.endo_names_tex(1) = {'x'};
M_.endo_names_long(1) = {'x'};
M_.endo_names(2) = {'pi'};
M_.endo_names_tex(2) = {'pi'};
M_.endo_names_long(2) = {'pi'};
M_.endo_names(3) = {'rf'};
M_.endo_names_tex(3) = {'rf'};
M_.endo_names_long(3) = {'rf'};
M_.endo_names(4) = {'qe'};
M_.endo_names_tex(4) = {'qe'};
M_.endo_names_long(4) = {'qe'};
M_.endo_names(5) = {'theta'};
M_.endo_names_tex(5) = {'theta'};
M_.endo_names_long(5) = {'theta'};
M_.endo_names(6) = {'rsnot'};
M_.endo_names_tex(6) = {'rsnot'};
M_.endo_names_long(6) = {'rsnot'};
M_.endo_names(7) = {'rs'};
M_.endo_names_tex(7) = {'rs'};
M_.endo_names_long(7) = {'rs'};
M_.endo_names(8) = {'yf'};
M_.endo_names_tex(8) = {'yf'};
M_.endo_names_long(8) = {'yf'};
M_.endo_names(9) = {'y'};
M_.endo_names_tex(9) = {'y'};
M_.endo_names_long(9) = {'y'};
M_.endo_partitions = struct();
M_.param_names = cell(15,1);
M_.param_names_tex = cell(15,1);
M_.param_names_long = cell(15,1);
M_.param_names(1) = {'beta'};
M_.param_names_tex(1) = {'beta'};
M_.param_names_long(1) = {'beta'};
M_.param_names(2) = {'z'};
M_.param_names_tex(2) = {'z'};
M_.param_names_long(2) = {'z'};
M_.param_names(3) = {'sigma'};
M_.param_names_tex(3) = {'sigma'};
M_.param_names_long(3) = {'sigma'};
M_.param_names(4) = {'bfi'};
M_.param_names_tex(4) = {'bfi'};
M_.param_names_long(4) = {'bfi'};
M_.param_names(5) = {'bcb'};
M_.param_names_tex(5) = {'bcb'};
M_.param_names_long(5) = {'bcb'};
M_.param_names(6) = {'gamma'};
M_.param_names_tex(6) = {'gamma'};
M_.param_names_long(6) = {'gamma'};
M_.param_names(7) = {'zeta'};
M_.param_names_tex(7) = {'zeta'};
M_.param_names_long(7) = {'zeta'};
M_.param_names(8) = {'phipi'};
M_.param_names_tex(8) = {'phipi'};
M_.param_names_long(8) = {'phipi'};
M_.param_names(9) = {'phix'};
M_.param_names_tex(9) = {'phix'};
M_.param_names_long(9) = {'phix'};
M_.param_names(10) = {'rhotr'};
M_.param_names_tex(10) = {'rhotr'};
M_.param_names_long(10) = {'rhotr'};
M_.param_names(11) = {'rhor'};
M_.param_names_tex(11) = {'rhor'};
M_.param_names_long(11) = {'rhor'};
M_.param_names(12) = {'rhot'};
M_.param_names_tex(12) = {'rhot'};
M_.param_names_long(12) = {'rhot'};
M_.param_names(13) = {'rhoq'};
M_.param_names_tex(13) = {'rhoq'};
M_.param_names_long(13) = {'rhoq'};
M_.param_names(14) = {'thetapi'};
M_.param_names_tex(14) = {'thetapi'};
M_.param_names_long(14) = {'thetapi'};
M_.param_names(15) = {'thetax'};
M_.param_names_tex(15) = {'thetax'};
M_.param_names_long(15) = {'thetax'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 9;
M_.param_nbr = 15;
M_.orig_endo_nbr = 9;
M_.aux_vars = [];
M_.Sigma_e = zeros(2, 2);
M_.Correlation_matrix = eye(2, 2);
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
M_.eq_nbr = 9;
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
 0 5 14;
 0 6 15;
 1 7 0;
 2 8 16;
 3 9 17;
 4 10 0;
 0 11 0;
 0 12 0;
 0 13 0;]';
M_.nstatic = 3;
M_.nfwrd   = 2;
M_.npred   = 2;
M_.nboth   = 2;
M_.nsfwrd   = 4;
M_.nspred   = 4;
M_.ndynamic   = 6;
M_.dynamic_tmp_nbr = [3; 0; 0; 0; ];
M_.equations_tags = {
  1 , 'name' , 'x' ;
  2 , 'name' , 'pi' ;
  3 , 'name' , 'rsnot' ;
  4 , 'name' , 'rs' ;
  5 , 'name' , 'qe' ;
  6 , 'name' , 'rf' ;
  7 , 'name' , 'theta' ;
  8 , 'name' , 'yf' ;
  9 , 'name' , '9' ;
};
M_.mapping.x.eqidx = [1 2 3 5 9 ];
M_.mapping.pi.eqidx = [1 2 3 5 ];
M_.mapping.rf.eqidx = [1 6 8 ];
M_.mapping.qe.eqidx = [1 2 5 ];
M_.mapping.theta.eqidx = [1 2 7 ];
M_.mapping.rsnot.eqidx = [3 4 ];
M_.mapping.rs.eqidx = [1 4 ];
M_.mapping.yf.eqidx = [8 9 ];
M_.mapping.y.eqidx = [9 ];
M_.mapping.er.eqidx = [6 ];
M_.mapping.et.eqidx = [7 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.block_structure.time_recursive = false;
M_.block_structure.block(1).Simulation_Type = 1;
M_.block_structure.block(1).endo_nbr = 3;
M_.block_structure.block(1).mfs = 3;
M_.block_structure.block(1).equation = [ 6 7 8];
M_.block_structure.block(1).variable = [ 3 5 8];
M_.block_structure.block(1).is_linear = true;
M_.block_structure.block(1).NNZDerivatives = 6;
M_.block_structure.block(1).bytecode_jacob_cols_to_sparse = [1 2 4 5 6 ];
M_.block_structure.block(2).Simulation_Type = 8;
M_.block_structure.block(2).endo_nbr = 5;
M_.block_structure.block(2).mfs = 5;
M_.block_structure.block(2).equation = [ 1 4 2 5 3];
M_.block_structure.block(2).variable = [ 7 6 4 2 1];
M_.block_structure.block(2).is_linear = true;
M_.block_structure.block(2).NNZDerivatives = 20;
M_.block_structure.block(2).bytecode_jacob_cols_to_sparse = [2 3 6 7 8 9 10 13 14 15 ];
M_.block_structure.block(3).Simulation_Type = 3;
M_.block_structure.block(3).endo_nbr = 1;
M_.block_structure.block(3).mfs = 1;
M_.block_structure.block(3).equation = [ 9];
M_.block_structure.block(3).variable = [ 9];
M_.block_structure.block(3).is_linear = true;
M_.block_structure.block(3).NNZDerivatives = 1;
M_.block_structure.block(3).bytecode_jacob_cols_to_sparse = [1 ];
M_.block_structure.block(1).g1_sparse_rowval = int32([]);
M_.block_structure.block(1).g1_sparse_colval = int32([]);
M_.block_structure.block(1).g1_sparse_colptr = int32([]);
M_.block_structure.block(2).g1_sparse_rowval = int32([5 4 1 2 2 5 1 3 4 3 4 5 1 3 4 5 1 1 3 1 ]);
M_.block_structure.block(2).g1_sparse_colval = int32([2 3 6 6 7 7 8 8 8 9 9 9 10 10 10 10 13 14 14 15 ]);
M_.block_structure.block(2).g1_sparse_colptr = int32([1 1 2 3 3 3 5 7 10 13 17 17 17 18 20 21 ]);
M_.block_structure.block(3).g1_sparse_rowval = int32([1 ]);
M_.block_structure.block(3).g1_sparse_colval = int32([1 ]);
M_.block_structure.block(3).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure.variable_reordered = [ 3 5 8 7 6 4 2 1 9];
M_.block_structure.equation_reordered = [ 6 7 8 1 4 2 5 3 9];
M_.block_structure.incidence(1).lead_lag = -1;
M_.block_structure.incidence(1).sparse_IM = [
 3 6;
 5 4;
 6 3;
 7 5;
];
M_.block_structure.incidence(2).lead_lag = 0;
M_.block_structure.incidence(2).sparse_IM = [
 1 1;
 1 3;
 1 4;
 1 5;
 1 7;
 2 1;
 2 2;
 2 4;
 2 5;
 3 1;
 3 2;
 3 6;
 4 6;
 4 7;
 5 1;
 5 2;
 5 4;
 6 3;
 7 5;
 8 3;
 8 8;
 9 1;
 9 8;
 9 9;
];
M_.block_structure.incidence(3).lead_lag = 1;
M_.block_structure.incidence(3).sparse_IM = [
 1 1;
 1 2;
 1 4;
 1 5;
 2 2;
];
M_.block_structure.dyn_tmp_nbr = 1;
M_.state_var = [3 5 6 4 ];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(9, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(15, 1);
M_.endo_trends = struct('deflator', cell(9, 1), 'log_deflator', cell(9, 1), 'growth_factor', cell(9, 1), 'log_growth_factor', cell(9, 1));
M_.NNZDerivatives = [35; 0; -1; ];
M_.dynamic_g1_sparse_rowval = int32([6 5 7 3 1 2 3 5 9 2 3 5 1 6 8 1 2 5 1 2 7 3 4 1 4 8 9 9 1 1 2 1 1 6 7 ]);
M_.dynamic_g1_sparse_colval = int32([3 4 5 6 10 10 10 10 10 11 11 11 12 12 12 13 13 13 14 14 14 15 15 16 16 17 17 18 19 20 20 22 23 28 29 ]);
M_.dynamic_g1_sparse_colptr = int32([1 1 1 2 3 4 5 5 5 5 10 13 16 19 22 24 26 28 29 30 32 32 33 34 34 34 34 34 35 36 ]);
M_.dynamic_g2_sparse_indices = int32([]);
M_.lhs = {
'x'; 
'pi'; 
'rsnot'; 
'rs'; 
'qe'; 
'rf'; 
'theta'; 
'yf'; 
'x'; 
};
M_.static_tmp_nbr = [3; 0; 0; 0; ];
M_.block_structure_stat.block(1).Simulation_Type = 3;
M_.block_structure_stat.block(1).endo_nbr = 1;
M_.block_structure_stat.block(1).mfs = 1;
M_.block_structure_stat.block(1).equation = [ 6];
M_.block_structure_stat.block(1).variable = [ 3];
M_.block_structure_stat.block(2).Simulation_Type = 3;
M_.block_structure_stat.block(2).endo_nbr = 1;
M_.block_structure_stat.block(2).mfs = 1;
M_.block_structure_stat.block(2).equation = [ 7];
M_.block_structure_stat.block(2).variable = [ 5];
M_.block_structure_stat.block(3).Simulation_Type = 1;
M_.block_structure_stat.block(3).endo_nbr = 1;
M_.block_structure_stat.block(3).mfs = 1;
M_.block_structure_stat.block(3).equation = [ 8];
M_.block_structure_stat.block(3).variable = [ 8];
M_.block_structure_stat.block(4).Simulation_Type = 6;
M_.block_structure_stat.block(4).endo_nbr = 5;
M_.block_structure_stat.block(4).mfs = 5;
M_.block_structure_stat.block(4).equation = [ 4 5 1 2 3];
M_.block_structure_stat.block(4).variable = [ 7 4 2 1 6];
M_.block_structure_stat.block(5).Simulation_Type = 3;
M_.block_structure_stat.block(5).endo_nbr = 1;
M_.block_structure_stat.block(5).mfs = 1;
M_.block_structure_stat.block(5).equation = [ 9];
M_.block_structure_stat.block(5).variable = [ 9];
M_.block_structure_stat.variable_reordered = [ 3 5 8 7 4 2 1 6 9];
M_.block_structure_stat.equation_reordered = [ 6 7 8 4 5 1 2 3 9];
M_.block_structure_stat.incidence.sparse_IM = [
 1 2;
 1 3;
 1 7;
 2 1;
 2 2;
 2 4;
 2 5;
 3 1;
 3 2;
 3 6;
 4 6;
 4 7;
 5 1;
 5 2;
 5 4;
 6 3;
 7 5;
 8 3;
 8 8;
 9 1;
 9 8;
 9 9;
];
M_.block_structure_stat.tmp_nbr = 0;
M_.block_structure_stat.block(1).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(2).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(2).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(2).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(3).g1_sparse_rowval = int32([]);
M_.block_structure_stat.block(3).g1_sparse_colval = int32([]);
M_.block_structure_stat.block(3).g1_sparse_colptr = int32([]);
M_.block_structure_stat.block(4).g1_sparse_rowval = int32([1 3 2 4 2 3 4 5 2 4 5 1 5 ]);
M_.block_structure_stat.block(4).g1_sparse_colval = int32([1 1 2 2 3 3 3 3 4 4 4 5 5 ]);
M_.block_structure_stat.block(4).g1_sparse_colptr = int32([1 3 5 9 12 14 ]);
M_.block_structure_stat.block(5).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(5).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(5).g1_sparse_colptr = int32([1 2 ]);
M_.static_g1_sparse_rowval = int32([2 3 5 9 1 2 3 5 1 6 8 2 5 2 7 3 4 1 4 8 9 9 ]);
M_.static_g1_sparse_colval = int32([1 1 1 1 2 2 2 2 3 3 3 4 4 5 5 6 6 7 7 8 8 9 ]);
M_.static_g1_sparse_colptr = int32([1 5 9 12 14 16 18 20 22 23 ]);
load param_implement;
set_param_value('beta',beta);
set_param_value('z',z);
set_param_value('sigma',sigma);
set_param_value('bfi',bfi);
set_param_value('bcb',bcb);
set_param_value('gamma',gamma);
set_param_value('zeta',zeta);
set_param_value('phipi',phipi);
set_param_value('phix',phix);
set_param_value('rhotr',rhotr);
set_param_value('rhor',rhor);
set_param_value('rhot',rhot);
set_param_value('rhoq',rhoq);
set_param_value('thetapi',thetapi);
set_param_value('thetax',thetax);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = 0.0625;
M_.Sigma_e(2, 2) = 1;
options_.ar = 1;
options_.irf = 20;
options_.nograph = true;
options_.order = 1;
var_list_ = {};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'model_implement1_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'model_implement1_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'model_implement1_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'model_implement1_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'model_implement1_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'model_implement1_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'model_implement1_results.mat'], 'oo_recursive_', '-append');
end
if exist('options_mom_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'model_implement1_results.mat'], 'options_mom_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
