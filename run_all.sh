#!/bin/bash

# Define MATLAB path
MATLAB="/Applications/MATLAB_R2024b.app/bin/matlab"

# Create output directory if it doesn't exist
mkdir -p output

# 1. Run Werning code
echo "Running Werning replication..."
cd code/werning
julia 1.b.jl
mv figure1.* ../../output/
mv figure2.* ../../output/
cd ../..

# 2. Run SWZ code (e)
echo "Running SWZ (e)..."
cd code/swz
"$MATLAB" -nodisplay -nosplash -nodesktop -r "try, swz_e, catch, exit(1), end, exit(0);"
mv figures/swz_e_irf-*.png ../../output/
cd ../..

# 3. Run SWZ code (f)
echo "Running SWZ (f)..."
cd code/swz
"$MATLAB" -nodisplay -nosplash -nodesktop -r "try, swz_f, catch, exit(1), end, exit(0);"
mv model/swz_f/graphs/swz_f_IRF_*.eps ../../output/
cd ../..

# 4. Run SWZ Figure 1 (g)
echo "Running SWZ Figure 1..."
cd code/swz
"$MATLAB" -nodisplay -nosplash -nodesktop -r "try, swz_figure1, catch, exit(1), end, exit(0);"
julia swz_figure1.jl
mv figures/four_*.pdf ../../output/
cd ../..

# 5. Run SWZ Figure 2 (h)
echo "Running SWZ Figure 2..."
cd code/swz
"$MATLAB" -nodisplay -nosplash -nodesktop -r "try, swz_figure2, catch, exit(1), end, exit(0);"
julia swz_figure2.jl
mv figures/four_spreads.pdf ../../output/
cd ../..

echo "All scripts run. Check the output directory for results."

