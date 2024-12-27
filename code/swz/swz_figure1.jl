using MAT
using Plots
using StatsPlots
using LaTeXStrings

# Path for figures
figure_path = "/Users/felipe/Library/CloudStorage/OneDrive-UniversidadTorcuatoDiTella/Maeco/1. Primer Año/Tercer Trimestre/macro2 - Macroeconomía II/take-home/code/swz/figures"

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
data = matread("/Users/felipe/Library/CloudStorage/OneDrive-UniversidadTorcuatoDiTella/Maeco/1. Primer Año/Tercer Trimestre/macro2 - Macroeconomía II/take-home/code/swz/model/irf_data.mat")
t = vec(data["t"])
T = data["T"]

# Extract IRF data
Yirf0, Yirf1 = data["Yirf0"], data["Yirf1"]
Xirf0, Xirf1 = data["Xirf0"], data["Xirf1"]
Piirf0, Piirf1 = data["Piirf0"], data["Piirf1"]
Rsirf0, Rsirf1 = data["Rsirf0"], data["Rsirf1"]

# Function to create a subplot with common styling
function make_subplot(data1, data2, ylabel, legend_position=:bottomright)
    p = plot(t, data1, 
        label=L"\textrm{Modelo\ NK\ 4\ ec.}", 
        color=main_color, 
        linestyle=:solid, 
        linewidth=2,
        grid=true,
        xlabel=L"\textrm{Horizonte}",
        ylabel=ylabel,
        xlims=(1, 21),
        xticks=(1:5:21, ["0", "5", "10", "15", "20"])
    )
    plot!(p, t, data2, 
        label=L"\textrm{Modelo\ NK\ 3\ ec.}", 
        color=alt_color, 
        linestyle=:dash, 
        linewidth=2
    )
    if legend_position != :none
        plot!(p, legend_position=legend_position)
    end
    return p
end

# Productivity / Natural Rate Shock
plt1 = plot(layout=(2,2), size=(800,600))
plot!(plt1[1], t, 100 .* Yirf0[:,1], label=L"\textrm{Modelo\ NK\ 4\ ec.}", color=main_color, linestyle=:solid, linewidth=2)
plot!(plt1[1], t, 100 .* Yirf1[:,1], label=L"\textrm{Modelo\ NK\ 3\ ec.}", color=alt_color, linestyle=:dash, linewidth=2)
plot!(plt1[1], xlabel=L"\textrm{Horizonte}", ylabel=L"\textrm{Producto}", grid=true, legend=:none)

plot!(plt1[2], t, 100 .* Xirf0[:,1], label=L"\textrm{Modelo\ NK\ 4\ ec.}", color=main_color, linestyle=:solid, linewidth=2)
plot!(plt1[2], t, 100 .* Xirf1[:,1], label=L"\textrm{Modelo\ NK\ 3\ ec.}", color=alt_color, linestyle=:dash, linewidth=2)
plot!(plt1[2], xlabel=L"\textrm{Horizonte}", ylabel=L"\textrm{Brecha\ de\ Producto}", grid=true, legend=:none)

plot!(plt1[3], t, 400 .* Piirf0[:,1], label=L"\textrm{Modelo\ NK\ 4\ ec.}", color=main_color, linestyle=:solid, linewidth=2)
plot!(plt1[3], t, 400 .* Piirf1[:,1], label=L"\textrm{Modelo\ NK\ 3\ ec.}", color=alt_color, linestyle=:dash, linewidth=2)
plot!(plt1[3], xlabel=L"\textrm{Horizonte}", ylabel=L"\textrm{Inflación}", grid=true, legend=:none)

plot!(plt1[4], t, 400 .* Rsirf0[:,1], label=L"\textrm{Modelo\ NK\ 4\ ec.}", color=main_color, linestyle=:solid, linewidth=2)
plot!(plt1[4], t, 400 .* Rsirf1[:,1], label=L"\textrm{Modelo\ NK\ 3\ ec.}", color=alt_color, linestyle=:dash, linewidth=2)
plot!(plt1[4], xlabel=L"\textrm{Horizonte}", ylabel=L"\textrm{Tasa\ de\ Interés}", grid=true, legend=:bottomright)

for i in 1:4
    plot!(plt1[i], xlims=(1,21), xticks=(1:5:21, ["0", "5", "10", "15", "20"]))
end

savefig(plt1, joinpath(figure_path, "four_nat.pdf"))

# Monetary Shock
plt2 = plot(layout=(2,2), size=(800,600))
plot!(plt2[1], t, 100 .* Yirf0[:,2], label=L"\textrm{Modelo\ NK\ 4\ ec.}", color=main_color, linestyle=:solid, linewidth=2)
plot!(plt2[1], t, 100 .* Yirf1[:,2], label=L"\textrm{Modelo\ NK\ 3\ ec.}", color=alt_color, linestyle=:dash, linewidth=2)
plot!(plt2[1], xlabel=L"\textrm{Horizonte}", ylabel=L"\textrm{Producto}", grid=true, legend=:none)

plot!(plt2[2], t, 100 .* Xirf0[:,2], label=L"\textrm{Modelo\ NK\ 4\ ec.}", color=main_color, linestyle=:solid, linewidth=2)
plot!(plt2[2], t, 100 .* Xirf1[:,2], label=L"\textrm{Modelo\ NK\ 3\ ec.}", color=alt_color, linestyle=:dash, linewidth=2)
plot!(plt2[2], xlabel=L"\textrm{Horizonte}", ylabel=L"\textrm{Brecha\ de\ Producto}", grid=true, legend=:none)

plot!(plt2[3], t, 400 .* Piirf0[:,2], label=L"\textrm{Modelo\ NK\ 4\ ec.}", color=main_color, linestyle=:solid, linewidth=2)
plot!(plt2[3], t, 400 .* Piirf1[:,2], label=L"\textrm{Modelo\ NK\ 3\ ec.}", color=alt_color, linestyle=:dash, linewidth=2)
plot!(plt2[3], xlabel=L"\textrm{Horizonte}", ylabel=L"\textrm{Inflación}", grid=true, legend=:none)

plot!(plt2[4], t, 400 .* Rsirf0[:,2], label=L"\textrm{Modelo\ NK\ 4\ ec.}", color=main_color, linestyle=:solid, linewidth=2)
plot!(plt2[4], t, 400 .* Rsirf1[:,2], label=L"\textrm{Modelo\ NK\ 3\ ec.}", color=alt_color, linestyle=:dash, linewidth=2)
plot!(plt2[4], xlabel=L"\textrm{Horizonte}", ylabel=L"\textrm{Tasa\ de\ Interés}", grid=true, legend=:bottomright)

for i in 1:4
    plot!(plt2[i], xlims=(1,21), xticks=(1:5:21, ["0", "5", "10", "15", "20"]))
end

savefig(plt2, joinpath(figure_path, "four_pol.pdf"))

# Leverage Shock
plt3 = plot(layout=(2,2), size=(800,600))
plot!(plt3[1], t, 100 .* Yirf0[:,4], label=L"\textrm{Modelo\ NK\ 4\ ec.}", color=main_color, linestyle=:solid, linewidth=2)
plot!(plt3[1], t, 100 .* Yirf1[:,4], label=L"\textrm{Modelo\ NK\ 3\ ec.}", color=alt_color, linestyle=:dash, linewidth=2)
plot!(plt3[1], xlabel=L"\textrm{Horizonte}", ylabel=L"\textrm{Producto}", grid=true, legend=:none)

plot!(plt3[2], t, 100 .* Xirf0[:,4], label=L"\textrm{Modelo\ NK\ 4\ ec.}", color=main_color, linestyle=:solid, linewidth=2)
plot!(plt3[2], t, 100 .* Xirf1[:,4], label=L"\textrm{Modelo\ NK\ 3\ ec.}", color=alt_color, linestyle=:dash, linewidth=2)
plot!(plt3[2], xlabel=L"\textrm{Horizonte}", ylabel=L"\textrm{Brecha\ de\ Producto}", grid=true, legend=:none)

plot!(plt3[3], t, 400 .* Piirf0[:,4], label=L"\textrm{Modelo\ NK\ 4\ ec.}", color=main_color, linestyle=:solid, linewidth=2)
plot!(plt3[3], t, 400 .* Piirf1[:,4], label=L"\textrm{Modelo\ NK\ 3\ ec.}", color=alt_color, linestyle=:dash, linewidth=2)
plot!(plt3[3], xlabel=L"\textrm{Horizonte}", ylabel=L"\textrm{Inflación}", grid=true, legend=:none)

plot!(plt3[4], t, 400 .* Rsirf0[:,4], label=L"\textrm{Modelo\ NK\ 4\ ec.}", color=main_color, linestyle=:solid, linewidth=2)
plot!(plt3[4], t, 400 .* Rsirf1[:,4], label=L"\textrm{Modelo\ NK\ 3\ ec.}", color=alt_color, linestyle=:dash, linewidth=2)
plot!(plt3[4], xlabel=L"\textrm{Horizonte}", ylabel=L"\textrm{Tasa\ de\ Interés}", grid=true, legend=:topright)

for i in 1:4
    plot!(plt3[i], xlims=(1,21), xticks=(1:5:21, ["0", "5", "10", "15", "20"]))
end
savefig(plt3, joinpath(figure_path, "four_lev_qe.pdf"))
