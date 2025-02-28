# Bioinformatics_group_assignment
*Dynamic Modelling Assignment from Bioinformatics Skills Course (SKI2102).*

## Overview

This project models the interactions between three species: plants, hares, and lynx, using a system of differential equations. The model explores different ecological scenarios, including stable oscillations, predator extinction, and chaotic behavior. By solving these equations numerically, the code provides insights into how species populations evolve over time under varying conditions.

## Model Description

The three-species model is defined by a system of ordinary differential equations (ODEs), which describe the interactions among plants (prey), hares (herbivores), and lynx (predators). The equations account for:

- Plant growth: Limited by a logistic growth term.

- Hare consumption: Hares consume plants at a rate dependent on plant density.

- Predation by lynx: Lynx prey on hares with an efficiency factor.

- Natural death rates: Both hares and lynx have mortality terms.

The differential equations used in the model are:
<img width="502" alt="Screenshot 2025-02-28 at 13 21 43" src="https://github.com/user-attachments/assets/d5bee10c-68f3-41bc-a209-1ff372506303" />

## Parameters
- **\(P\)**: Population of plants
- **\(H\)**: Population of hares
- **\(L\)**: Population of lynx
- **\(a_1\)**: Growth rate of plants
- **\(b_1\)**: Consumption rate of hares on plants
- **\(a_2\)**: Predation rate of lynx on hares
- **\(b_2\)**: Efficiency of predation
- **\(d_1\)**: Natural death rate of hares
- **\(d_2\)**: Natural death rate of lynx

## Requirements

To run the code, you need:

MATLAB installed on your system

The ode45 function (part of MATLAB’s built-in ODE solvers)


