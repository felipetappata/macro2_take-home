#=
Replication of Figures 1 and 2 from Werning's 'Recalculating Sargent and
Wallace’s “Some Unpleasant Monetarist Arithmetic”' (2024)
Author: Felipe Tappata
Date: 2024-12-20
=#

# using Colors
using Plots
using LaTeXStrings
using Roots

# Parameters from the paper
γ₁ = 3.0
γ₂ = 2.5
r = 0.05

# Money demand function (linear specification from SW)
L(π) = γ₁/2 - γ₂/2 * (1 + π)

# Function to compute traditional Laffer curve
traditional_laffer(π) = π/(1 + π) * L(π)

# Function to compute alternative Laffer curve (interest rate)
alternative_laffer(π) = ((1 + π)*(1 + r) - 1)/((1 + π)*(1 + r)) * L(π)

# Define colors for the curves
main_color = colorant"#084B83"
alt_color = colorant"#FF7F0E"

# Generate points for plotting
π_range = range(0, 0.2, length=1000)  # Changed upper bound to 0.2

# Find peaks of both Laffer curves
traditional_peak = π_range[argmax(traditional_laffer.(π_range))]
alternative_peak = π_range[argmax(alternative_laffer.(π_range))]

# Figure 1: Laffer Curves
p1 = plot(π_range, traditional_laffer.(π_range), 
    label=L"\textrm{Curva\ de\ Laffer\ tradicional}",
    linestyle=:dash,
    linewidth=2,
    ylims=(0, 0.02),
    color=main_color,
    tickfont=font(12, "Computer Modern"),
    guidefont=font(14, "Computer Modern"),
    legendfont=font(12, "Computer Modern"),
    xticks=0:0.02:0.2,
    yticks=0:0.002:0.02,
    xformatter=x->string(Float64(x)),
    yformatter=y->string(Float64(y)))

plot!(p1, π_range, alternative_laffer.(π_range), 
    label=L"\textrm{Curva\ de\ Laffer\ alternativa}",
    linewidth=2,
    color=alt_color)

# Add vertical lines at peaks
vline!(p1, [traditional_peak], 
    linestyle=:dash, 
    label="", 
    color=main_color)
vline!(p1, [alternative_peak], 
    linestyle=:dash, 
    label="", 
    color=alt_color)

# Add labels for both Laffer curves
annotate!(p1, [
    (0.18, 0.010, Plots.text(L"\frac{i}{1+i}L(i)", alt_color, 14)),
    (0.14, 0.006, Plots.text(L"\frac{\pi}{1+\pi}L(\pi)", main_color, 14))
])

xlabel!(p1, L"\pi")
# title!(p1, L"\textrm{Figure\ 1:\ Laffer\ curves\ in\ Sargent-Wallace's\ example}") # Added backslash spaces

# Figure 2: Equilibria
# Parameters for Figure 2
ω₀_ratio = 0.243  # (1 + ω₀)/(1 + Δ₀)
D = 0.336         # Present value of deficits

# Function to compute first period inflation as function of long-run inflation
function compute_π₀₁(π_∞)
    # Using equation (2) from the paper:
    # Σ q_t [i_t/(1+i_t)]L(i_t) - [(1+ω₀)/(1+Δ₀)]L(i₀₁) = D
    
    i_∞ = (1 + π_∞)*(1 + r) - 1
    term_∞ = (i_∞/(1 + i_∞)) * L(π_∞) / r  # Present value of future terms
    
    # Solve for π₀₁ that satisfies the budget constraint
    function budget_equation(π₀₁)
        i₀₁ = (1 + π₀₁)*(1 + r) - 1
        term_0 = (i₀₁/(1 + i₀₁)) * L(π₀₁)
        return term_0 + term_∞ - ω₀_ratio * L(π₀₁) - D
    end
    
    # Find root of budget equation
    π₀₁_sol = find_zero(budget_equation, π_∞)
    return π₀₁_sol
end

# Compute money growth rate θ as in the paper
function compute_θ(π_∞)
    π₀₁ = compute_π₀₁(π_∞)
    i₀₁ = (1 + π₀₁)*(1 + r) - 1
    i_∞ = (1 + π_∞)*(1 + r) - 1
    return (1 + π₀₁) * L(i_∞)/L(i₀₁) - 1
end

# Generate points for Figure 2 - split into two ranges 
π_∞_range_main = range(0.04, 0.10, length=1000)
π_∞_range_theta1 = range(0.06, 0.09, length=700)
π_∞_range_theta2 = range(0.09, 0.10, length=100)

# Create Figure 2
p2 = plot(π_∞_range_main, compute_π₀₁.(π_∞_range_main),
    label="",  # Remove label to hide from legend
    linewidth=2,
    color=alt_color,
    tickfont=font(12, "Computer Modern"),
    guidefont=font(14, "Computer Modern"),
    legendfont=font(12, "Computer Modern"),
    legend=false,  # Remove legend completely
    xlims=(0.04, 0.10),   
    ylims=(0.04, 0.20),   
    xticks=0.04:0.01:0.10,
    yticks=0.04:0.02:0.20,
    xformatter=x->string(Float64(x)),
    yformatter=y->string(Float64(y))
)

# Add 45-degree line
plot!(p2, π_∞_range_main, π_∞_range_main,
    label="",
    linestyle=:dash,
    color=:black,
    linewidth=1)

# Add θ curve in two parts
# Main part (0.06 to 0.09)
plot!(p2, π_∞_range_theta1, compute_θ.(π_∞_range_theta1),
    label="",
    linestyle=:dash,
    color=main_color,
    linewidth=2)

# Extended part (0.09 to 0.10) with lighter style
plot!(p2, π_∞_range_theta2, compute_θ.(π_∞_range_theta2),
    label="",
    linestyle=:dash,
    color=alt_color,
    linewidth=1)

# Add labels for θ curve and π₀₁
annotate!(p2, [
    (0.085, 0.19, Plots.text(L"\theta", main_color, 14)),
    (0.047, 0.14, Plots.text(L"\pi_{0,1}", alt_color, 14))
])

xlabel!(p2, L"\pi_\infty")
# title!(p2, L"\textrm{Figure\ 2:\ Equilibria\ for\ a\ simple\ example}") # Added backslash spaces

# Save figures in both PNG and SVG formats
savefig(p1, "figure1.png")
savefig(p1, "figure1.pdf")
savefig(p2, "figure2.png")
savefig(p2, "figure2.pdf")

# If you still want to see both plots in the REPL:
plot(p1, p2, layout=(2,1), size=(800,1000))

