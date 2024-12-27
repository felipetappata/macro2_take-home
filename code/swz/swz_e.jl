using MAT
using Plots
using StatsPlots
using LaTeXStrings
using LinearAlgebra

# Path for figures
figure_path = "/Users/felipe/Library/CloudStorage/OneDrive-UniversidadTorcuatoDiTella/Maeco/1. Primer Año/Tercer Trimestre/macro2 - Macroeconomía II/take-home/code/swz/figures"
mkpath(figure_path)

# Define colors for different shocks
colors = Dict(
    "QE" => colorant"#084B83",
    "Technology" => colorant"#FF7F0E", 
    "Leverage" => colorant"#2CA02C",
    "MP" => colorant"#D62728"
)

# Plot defaults
default(
    tickfont=font(12, "Computer Modern"),
    guidefont=font(14, "Computer Modern"),
    legendfont=font(12, "Computer Modern"),
    grid=true,
    gridstyle=:dot,
    gridwidth=0.5,
    gridcolor=:gray,
    framestyle=:box
)

# Load matrices P and Q from MATLAB output
results = matread("/Users/felipe/Library/CloudStorage/OneDrive-UniversidadTorcuatoDiTella/Maeco/1. Primer Año/Tercer Trimestre/macro2 - Macroeconomía II/take-home/code/swz/model_solution.mat")
P = results["PP"]
Q = results["QQ"]

# Variable names for plotting
var_names = ["x", "π", "rˢ", "r*", "y*", "y"]
shock_names = ["QE", "Technology", "Leverage", "MP"]

# Calculate impulse responses
horizon = 20
n_vars = size(P, 1)
n_shocks = size(Q, 2)

function compute_irf(P, Q, horizon, shock_idx)
    n_vars = size(P, 1)
    irf = zeros(horizon, n_vars)
    state = Q[:, shock_idx]  # Initial impact
    irf[1, :] = state
    
    for t in 2:horizon
        state = P * state
        irf[t, :] = state
    end
    return irf
end

# Compute IRFs for all shocks
irfs = Dict(shock_name => compute_irf(P, Q, horizon, i) 
            for (i, shock_name) in enumerate(shock_names))

# Create plots for each variable
plots = []
for (var_idx, var_name) in enumerate(var_names)
    p = plot(
        title=var_name,
        xlabel=L"\textrm{Horizonte}",
        ylabel=L"\textrm{Desviación\ \%}",
        legend=:topright,
        xlims=(1, horizon),
        xticks=(1:5:horizon, ["0", "5", "10", "15", "20"])
    )
    
    for shock_name in shock_names
        plot!(p, 
            irfs[shock_name][:, var_idx],
            label=shock_name,
            color=colors[shock_name],
            linewidth=2,
            linestyle=shock_name == "MP" ? :dash : :solid
        )
    end
    push!(plots, p)
end

# Combine all plots
combined_plot = plot(plots..., 
    layout=(2, 3), 
    size=(900, 600), 
    margin=5Plots.mm
)

# Save the figure
savefig(combined_plot, joinpath(figure_path, "impulse_responses.pdf"))

# Print matrices P and Q with labels
println("Matrix P:")
display(round.(P, digits=4))
println("\nMatrix Q:")
display(round.(Q, digits=4))
