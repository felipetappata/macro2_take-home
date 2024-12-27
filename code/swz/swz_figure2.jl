using MAT
using Plots
using StatsPlots
using LaTeXStrings

# Path for figures
figure_path = "/Users/felipe/Library/CloudStorage/OneDrive-UniversidadTorcuatoDiTella/Maeco/1. Primer Año/Tercer Trimestre/macro2 - Macroeconomía II/take-home/code/swz/figures"

# Create figures directory if it doesn't exist
mkpath(figure_path)

# Define colors for the curves
main_color = colorant"#084B83"
alt_color = colorant"#FF7F0E"

# Add plot defaults for fonts
default(
    tickfont=font(12, "Computer Modern"),
    guidefont=font(14, "Computer Modern"),
    legendfont=font(12, "Computer Modern")
)

# Read the MATLAB data
data = matread("/Users/felipe/Library/CloudStorage/OneDrive-UniversidadTorcuatoDiTella/Maeco/1. Primer Año/Tercer Trimestre/macro2 - Macroeconomía II/take-home/code/swz/model/yield_irf_data.mat")
spread0 = data["spread0"]
t = 1:size(spread0, 1)

# Create the plot
plt = plot(t, 400 .* spread0[:,2], 
    label=L"\textrm{Shock\ PM}", 
    color=main_color, 
    linestyle=:solid, 
    linewidth=2,
    grid=true
)

plot!(plt, t, 400 .* spread0[:,3], 
    label=L"\textrm{Shock\ QE}", 
    color=alt_color, 
    linestyle=:dash, 
    linewidth=2
)

plot!(plt,
    xlabel=L"\textrm{Horizonte}",
    ylabel=L"\textrm{Retorno\ en\ Exceso}",
    xlims=(1,21),
    ylims=(-1.5, 1.5),
    xticks=(1:5:21, ["0", "5", "10", "15", "20"])
)

# Save the figure
savefig(plt, joinpath(figure_path, "four_spreads.pdf"))
