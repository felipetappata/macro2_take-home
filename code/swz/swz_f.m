% filepath: /Users/felipe/Library/CloudStorage/OneDrive-UniversidadTorcuatoDiTella/Maeco/1. Primer Año/Tercer Trimestre/macro2 - Macroeconomía II/take-home/code/swz/swz_f.m
%%% Ejercicio 2.f %%% 
%%% Author: Felipe Tappata (felipetappata@gmail.com)
%%% Date: 2024-12-21
%%% --------------------------   DESCRIPTION   --------------------------------
%%% Solution of the 4 equation NK model from Sims et. al (2023)
%%% using Uhlig's Toolkit for Nonlinear Stochastic models (brute-force method)
%%% ---------------------------------------------------------------------------
%%% Code provided as-is.

%% Clear workspace
clear all;
clc;

%% Run Dynare 
cd('/Users/felipe/Library/CloudStorage/OneDrive-UniversidadTorcuatoDiTella/Maeco/1. Primer Año/Tercer Trimestre/macro2 - Macroeconomía II/take-home/code/swz/model')
dynare swz_f noclearall
