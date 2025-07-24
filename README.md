# 💻 Rectangular Coaxial Cable Analysis in MATLAB
![MATLAB](https://img.shields.io/badge/MATLAB-0076A8?style=for-the-badge&logo=mathworks&logoColor=white)

A MATLAB project to calculate the potential distribution and capacitance of a rectangular coaxial cable using the **Finite Difference Method (FDM)**.

This project was submitted as a computer exercise for the Engineering Electromagnetics course.

## 💡 Key Features
* Calculates the 2D potential distribution $V(x, y)$ in the region between the two conductors.
* Computes the capacitance per unit length (C/L).
* Visualizes the results using 3D mesh and 2D contour plots.
* Allows user-defined grid resolution (`steps`) to trade off between accuracy and computation time.

## ⚙️ Methodology
The script discretizes the 2D problem space into a grid of nodes. It then iteratively solves Laplace's equation ($\nabla^2V = 0$). In each iteration, the potential at any given node is approximated as the average of the potential of its four neighbors:
$$V_{i,j} \approx \frac{1}{4} [V_{i+1,j} + V_{i-1,j} + V_{i,j+1} + V_{i,j-1}]$$
Finally, capacitance is derived from the potential field using an approximation of Gauss's Law.

## 🚀 How to Run
1.  Open the `code.m` file in MATLAB.
2.  Run the script.
3.  When prompted in the command window, enter the desired number of `steps` (e.g., `25`).
4.  The plots will be displayed, and the final capacitance will be printed in the output.

## 📈 Results
The script generates potential distribution plots and compares the calculated capacitance to the actual value.

| Metric | Actual Value | Calculated Value (`steps=25`) |
| :--- | :---: | :---: |
| **Capacitance (C/L)** | $71.5 \ pF/m$ | $73.21 \ pF/m$ |

## ✍️ Author
* **Ali Naghiloo**

## ⚠️ A Note on This Implementation
This project is a functional demonstration of the Finite Difference Method for the specified electrostatic problem. While the results show good agreement with reference values, the code is intended for educational purposes and may not be fully optimized. There may be further areas for improvement or validation beyond what is currently implemented.
---
*This project is licensed under the MIT License.*
