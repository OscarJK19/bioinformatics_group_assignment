# Bioinformatics_group_assignment
*Dynamic Modelling Assignment from Bioinformatics Skills Course (SKI2102).*

# Bioinformatics_Group_Assignment

*Dynamic Modelling Assignment from Bioinformatics Skills Course (SKI2102).*

## Model Equations

\[
\frac{dP}{dt} = P(1 - P) - \frac{a_1 P}{1 + b_1 P} H
\]

\[
\frac{dH}{dt} = \frac{a_1 P}{1 + b_1 P} H - d_1 H - \frac{a_2 H}{1 + b_2 H} L
\]

\[
\frac{dL}{dt} = \frac{a_2 H}{1 + b_2 H} L - d_2 L
\]

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

## Notes
To properly view these equations, render this Markdown file in a system that supports **LaTeX** (such as Jupyter Notebook or a documentation site that allows MathJax).


