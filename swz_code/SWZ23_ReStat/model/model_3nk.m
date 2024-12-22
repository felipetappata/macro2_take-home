%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

tic0 = tic;
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'model_3nk';
M_.dynare_version = '4.5.6';
oo_.dynare_version = '4.5.6';
options_.dynare_version = '4.5.6';
%
% Some global variables initialization
%
global_initialization;
diary off;
M_.exo_names = 'eA';
M_.exo_names_tex = 'eA';
M_.exo_names_long = 'eA';
M_.exo_names = char(M_.exo_names, 'et');
M_.exo_names_tex = char(M_.exo_names_tex, 'et');
M_.exo_names_long = char(M_.exo_names_long, 'et');
M_.exo_names = char(M_.exo_names, 'eq');
M_.exo_names_tex = char(M_.exo_names_tex, 'eq');
M_.exo_names_long = char(M_.exo_names_long, 'eq');
M_.exo_names = char(M_.exo_names, 'er');
M_.exo_names_tex = char(M_.exo_names_tex, 'er');
M_.exo_names_long = char(M_.exo_names_long, 'er');
M_.endo_names = 'Rs';
M_.endo_names_tex = 'Rs';
M_.endo_names_long = 'Rs';
M_.endo_names = char(M_.endo_names, 'Pi');
M_.endo_names_tex = char(M_.endo_names_tex, 'Pi');
M_.endo_names_long = char(M_.endo_names_long, 'Pi');
M_.endo_names = char(M_.endo_names, 'Y');
M_.endo_names_tex = char(M_.endo_names_tex, 'Y');
M_.endo_names_long = char(M_.endo_names_long, 'Y');
M_.endo_names = char(M_.endo_names, 'Yf');
M_.endo_names_tex = char(M_.endo_names_tex, 'Yf');
M_.endo_names_long = char(M_.endo_names_long, 'Yf');
M_.endo_names = char(M_.endo_names, 'qe');
M_.endo_names_tex = char(M_.endo_names_tex, 'qe');
M_.endo_names_long = char(M_.endo_names_long, 'qe');
M_.endo_names = char(M_.endo_names, 'theta');
M_.endo_names_tex = char(M_.endo_names_tex, 'theta');
M_.endo_names_long = char(M_.endo_names_long, 'theta');
M_.endo_names = char(M_.endo_names, 'X');
M_.endo_names_tex = char(M_.endo_names_tex, 'X');
M_.endo_names_long = char(M_.endo_names_long, 'X');
M_.endo_names = char(M_.endo_names, 'Rf');
M_.endo_names_tex = char(M_.endo_names_tex, 'Rf');
M_.endo_names_long = char(M_.endo_names_long, 'Rf');
M_.endo_partitions = struct();
M_.param_names = 'beta';
M_.param_names_tex = 'beta';
M_.param_names_long = 'beta';
M_.param_names = char(M_.param_names, 'betab');
M_.param_names_tex = char(M_.param_names_tex, 'betab');
M_.param_names_long = char(M_.param_names_long, 'betab');
M_.param_names = char(M_.param_names, 'z');
M_.param_names_tex = char(M_.param_names_tex, 'z');
M_.param_names_long = char(M_.param_names_long, 'z');
M_.param_names = char(M_.param_names, 'psi');
M_.param_names_tex = char(M_.param_names_tex, 'psi');
M_.param_names_long = char(M_.param_names_long, 'psi');
M_.param_names = char(M_.param_names, 'chi');
M_.param_names_tex = char(M_.param_names_tex, 'chi');
M_.param_names_long = char(M_.param_names_long, 'chi');
M_.param_names = char(M_.param_names, 'sigma');
M_.param_names_tex = char(M_.param_names_tex, 'sigma');
M_.param_names_long = char(M_.param_names_long, 'sigma');
M_.param_names = char(M_.param_names, 'kappa');
M_.param_names_tex = char(M_.param_names_tex, 'kappa');
M_.param_names_long = char(M_.param_names_long, 'kappa');
M_.param_names = char(M_.param_names, 'Xfi');
M_.param_names_tex = char(M_.param_names_tex, 'Xfi');
M_.param_names_long = char(M_.param_names_long, 'Xfi');
M_.param_names = char(M_.param_names, 'Xb');
M_.param_names_tex = char(M_.param_names_tex, 'Xb');
M_.param_names_long = char(M_.param_names_long, 'Xb');
M_.param_names = char(M_.param_names, 'thetas');
M_.param_names_tex = char(M_.param_names_tex, 'thetas');
M_.param_names_long = char(M_.param_names_long, 'thetas');
M_.param_names = char(M_.param_names, 'epsi');
M_.param_names_tex = char(M_.param_names_tex, 'epsi');
M_.param_names_long = char(M_.param_names_long, 'epsi');
M_.param_names = char(M_.param_names, 'phi');
M_.param_names_tex = char(M_.param_names_tex, 'phi');
M_.param_names_long = char(M_.param_names_long, 'phi');
M_.param_names = char(M_.param_names, 'bcbs');
M_.param_names_tex = char(M_.param_names_tex, 'bcbs');
M_.param_names_long = char(M_.param_names_long, 'bcbs');
M_.param_names = char(M_.param_names, 'phipi');
M_.param_names_tex = char(M_.param_names_tex, 'phipi');
M_.param_names_long = char(M_.param_names_long, 'phipi');
M_.param_names = char(M_.param_names, 'phix');
M_.param_names_tex = char(M_.param_names_tex, 'phix');
M_.param_names_long = char(M_.param_names_long, 'phix');
M_.param_names = char(M_.param_names, 'Pis');
M_.param_names_tex = char(M_.param_names_tex, 'Pis');
M_.param_names_long = char(M_.param_names_long, 'Pis');
M_.param_names = char(M_.param_names, 'rhoq');
M_.param_names_tex = char(M_.param_names_tex, 'rhoq');
M_.param_names_long = char(M_.param_names_long, 'rhoq');
M_.param_names = char(M_.param_names, 'rhoA');
M_.param_names_tex = char(M_.param_names_tex, 'rhoA');
M_.param_names_long = char(M_.param_names_long, 'rhoA');
M_.param_names = char(M_.param_names, 'rhot');
M_.param_names_tex = char(M_.param_names_tex, 'rhot');
M_.param_names_long = char(M_.param_names_long, 'rhot');
M_.param_names = char(M_.param_names, 'rhor');
M_.param_names_tex = char(M_.param_names_tex, 'rhor');
M_.param_names_long = char(M_.param_names_long, 'rhor');
M_.param_names = char(M_.param_names, 'sq');
M_.param_names_tex = char(M_.param_names_tex, 'sq');
M_.param_names_long = char(M_.param_names_long, 'sq');
M_.param_names = char(M_.param_names, 'sA');
M_.param_names_tex = char(M_.param_names_tex, 'sA');
M_.param_names_long = char(M_.param_names_long, 'sA');
M_.param_names = char(M_.param_names, 'st');
M_.param_names_tex = char(M_.param_names_tex, 'st');
M_.param_names_long = char(M_.param_names_long, 'st');
M_.param_names = char(M_.param_names, 'sr');
M_.param_names_tex = char(M_.param_names_tex, 'sr');
M_.param_names_long = char(M_.param_names_long, 'sr');
M_.param_names = char(M_.param_names, 'Rres');
M_.param_names_tex = char(M_.param_names_tex, 'Rres');
M_.param_names_long = char(M_.param_names_long, 'Rres');
M_.param_names = char(M_.param_names, 'Rbs');
M_.param_names_tex = char(M_.param_names_tex, 'Rbs');
M_.param_names_long = char(M_.param_names_long, 'Rbs');
M_.param_names = char(M_.param_names, 'Qs');
M_.param_names_tex = char(M_.param_names_tex, 'Qs');
M_.param_names_long = char(M_.param_names_long, 'Qs');
M_.param_names = char(M_.param_names, 'bfis');
M_.param_names_tex = char(M_.param_names_tex, 'bfis');
M_.param_names_long = char(M_.param_names_long, 'bfis');
M_.param_names = char(M_.param_names, 'res');
M_.param_names_tex = char(M_.param_names_tex, 'res');
M_.param_names_long = char(M_.param_names_long, 'res');
M_.param_names = char(M_.param_names, 'ss');
M_.param_names_tex = char(M_.param_names_tex, 'ss');
M_.param_names_long = char(M_.param_names_long, 'ss');
M_.param_names = char(M_.param_names, 'Rss');
M_.param_names_tex = char(M_.param_names_tex, 'Rss');
M_.param_names_long = char(M_.param_names_long, 'Rss');
M_.param_names = char(M_.param_names, 'sp');
M_.param_names_tex = char(M_.param_names_tex, 'sp');
M_.param_names_long = char(M_.param_names_long, 'sp');
M_.param_names = char(M_.param_names, 'bs');
M_.param_names_tex = char(M_.param_names_tex, 'bs');
M_.param_names_long = char(M_.param_names_long, 'bs');
M_.param_names = char(M_.param_names, 'Cbs');
M_.param_names_tex = char(M_.param_names_tex, 'Cbs');
M_.param_names_long = char(M_.param_names_long, 'Cbs');
M_.param_names = char(M_.param_names, 'qes');
M_.param_names_tex = char(M_.param_names_tex, 'qes');
M_.param_names_long = char(M_.param_names_long, 'qes');
M_.param_names = char(M_.param_names, 'gamma');
M_.param_names_tex = char(M_.param_names_tex, 'gamma');
M_.param_names_long = char(M_.param_names_long, 'gamma');
M_.param_names = char(M_.param_names, 'zeta');
M_.param_names_tex = char(M_.param_names_tex, 'zeta');
M_.param_names_long = char(M_.param_names_long, 'zeta');
M_.param_names = char(M_.param_names, 'b1');
M_.param_names_tex = char(M_.param_names_tex, 'b1');
M_.param_names_long = char(M_.param_names_long, 'b1');
M_.param_names = char(M_.param_names, 'b2');
M_.param_names_tex = char(M_.param_names_tex, 'b2');
M_.param_names_long = char(M_.param_names_long, 'b2');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 4;
M_.endo_nbr = 8;
M_.param_nbr = 39;
M_.orig_endo_nbr = 8;
M_.aux_vars = [];
M_.Sigma_e = zeros(4, 4);
M_.Correlation_matrix = eye(4, 4);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.linear = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('model_3nk_static');
erase_compiled_function('model_3nk_dynamic');
M_.orig_eq_nbr = 8;
M_.eq_nbr = 8;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 1 5 0;
 0 6 13;
 0 7 0;
 2 8 0;
 3 9 0;
 4 10 0;
 0 11 14;
 0 12 0;]';
M_.nstatic = 2;
M_.nfwrd   = 2;
M_.npred   = 4;
M_.nboth   = 0;
M_.nsfwrd   = 2;
M_.nspred   = 4;
M_.ndynamic   = 6;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:4];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(8, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(4, 1);
M_.params = NaN(39, 1);
M_.NNZDerivatives = [27; -1; -1];
load param_3nk;
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
options_.nograph = 1;
options_.order = 1;
var_list_ = char();
info = stoch_simul(var_list_);
save('model_3nk_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('model_3nk_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('model_3nk_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('model_3nk_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('model_3nk_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('model_3nk_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('model_3nk_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
disp('Note: 2 warning(s) encountered in the preprocessor')
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
