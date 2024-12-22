Readme 
Please cite as follows:
Eric Sims, Jing Cynthia Wu, and Ji Zhang “The Four Equation New Keynesian Model”, The Review of Economics and Statistics, forthcoming.
Related papers
Eric Sims and Jing Cynthia Wu “Evaluating Central Banks’ Tool Kit: Past, Present, and Future”, Journal of Monetary Economics, 2021, 118, 135-160.
Eric Sims and Jing Cynthia Wu “Are QE and Conventional Monetary Policy Substitutable?” International Journal of Central Banking, 2020, 16 (1), 195-230.
Main files
	•	execute_base_model.m 
	•	replicates results in Figure 1. 
	•	calls
	•	model_4nk.mod: the baseline 4 equation model in Section 2 with a Taylor rule for the policy rate and AR(1) process for QE
	•	model_3nk.mod: the baseline 3 equation model with Taylor rule for the policy rate
	•	execute_base_model_yield.m 
	•	replicates results in Figure 2.
	•	calls 
	•	model_4nk_yield.mod: the 4 equation model written in terms of the excess return.
	•	execute_zlb.m 
	•	replicates results in Figure 3.
	•	execute_noqe.m 
	•	replicates results in Figure 4. 
	•	execute_determinacy_lampi.m 
	•	replicates results Figure 5, panel (a).
	•	execute_determinacy_lamx.m 
	•	replicates results Figure 5, panel (b).
	•	execute_implementable.m 
	•	replicates results Figures 6, panels (a)-(b).
	•	calls
	•	model_implement.mod: the implementable rule with Taylor rules for both the policy rate and QE.
	•	model_optimal.mod: the optimal policy as described in Proposition 1.
	•	execute_implementable_zlb.m 
	•	replicates results Figures 6, panels (c)-(d). 
	•	In line 8, nr = 1 gives panel (c), and nr = 0 gives panel (d).
	•	calls
	•	model_implement1.mod: the implementable rule written slightly differently for occbin to solve the ZLB.
	•	model_implement_zlb.mod: the implementable rule at the ZLB. 

Folders
	•	models
	•	Dynare .mod files 
	•	occbin_20140630
	•	occbin toolkit of Guerrieri and Iacoviello (2015).

Dynare versions
	•	Dynare 4.5.6: The code is developed and tested with Dynare 4.5.6.
	•	Dynare 6.2: Syntax has changed in Dynare 6.2. For an example of how to modify codes from Dynare 4.5.6 to 6.2, see “execute_base_model_Dynare62”.
	•	Occbin: The version of occbin toolbox is not compatible with later versions of Dynare.
	•	If the code doesn’t work with your current version of Dynare, and you prefer not to make modifications to the code, please download Dynare 4.5.6. After downloading, you need to restart Matlab for it to work properly.
