# Research Project: characteristic time (CTM) method 

Welcome to the repository for characteristic time method (CTM). This repository contains the code and data used in our research, along with documentation and instructions for usage.

## Overview

This repository blongs of a research paper titled "Soil hydraulic properties estimation fromone-dimensional
infiltration experiments using characteristic time concept" authored by Rahmati et al. (2020). 

The Abstract of the paper reads:

The topic of infiltration of water into variably saturated soils has received much attention in the soil physics literature in the past decades. Many different equations have been proposed to describe the infiltration process quantitatively. These equations range from simple empirical equations to more advanced semianalytical solutions of the Richards equation. The sorptivity, S, and the saturated hydraulic conductivity, Ks, in these equations are typically unknown and have to be estimated from, for example, measured cumulative infiltration data. Here, we use the so-called characteristic time (tchar) to design a new method, referred to as the characteristic time method (CTM) that estimates S, and Ks, from one-dimensional (1D) cumulative infiltration data. We demonstrate the usefulness and power of our proposed approach by comparing it with a suite of existing methods using synthetic cumulative infiltration data simulated by HYDRUS-1D for 12 synthetic soils reflecting different USDA textural classes, as well as experimental data selected from the Soil Water Infiltration Global (SWIG) database. Results demonstrate that the inferred values of S and Ks are in excellent agreement with their theoretical values used in the synthetically simulated infiltration experiments with Nash–Sutcliffe criterion values close to unity and RMSE values of 0.04 cm h^(-1/2) and 0.05 cm h^(-1), respectively. The proposed method also showed very high accuracy when applied on synthetic infiltration curves with added measurement noise, as well as robustness when applied to experimental data. Unlike previously published methods, the presented approach does not require knowledge of the time validity of the applied semianalytical solution for infiltration and, therefore, is applicable to infiltrations with durations from 5 min to several days. A script written in Python of the CTM method is provided in the supplemental material.

## Repository Structure

- **README.md**: You are here! This file provides an overview of the repository.
- **Codes**: Contains all the code related to the research project.
- **Data**: Contains datasets used in the research project.
- **Documentation**: Contains additional documentation related to the research project.
- **License**: Specifies the terms of use for the code and data.
- **environment.yml**: Specifies the required dependencies for running the code.
- **Output**: Provides main outputs of the code.

## Usage

To install the required packages, import the environment provided through the file 'environment.yml' using the following command: conda env create -f environment.yml.

## License

MIT License

## References

Rahmati, Mehdi, Jan Vanderborght, Jirka Šimůnek, Jasper A. Vrugt, David Moret‐Fernández, Borja Latorre, Laurent Lassabatere, and Harry Vereecken. "Soil hydraulic properties estimation from one‐dimensional infiltration experiments using characteristic time concept." Vadose Zone Journal 19, no. 1 (2020): e20068.

## Contact

Mehdi Rahmati
Email: mehdirmti@gmail.com
Alternative email: m.rahmati@fz-juelich.de

