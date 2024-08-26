"""
Created on Tuesday October 6 2020
Updated on Tuesday August 26 2024

@author: Mehdi Rahmati Email: mehdirmti@gmail.com, m.rahmati@fz-juelich.de

Description:
    The function finds the S and Ks from infiltration curve supplied in [T, I] using the characteristic time method (CTM).
    
More detailed information can be found in the article published at the following link: https://doi.org/10.1002/vzj2.20068.

To be cited as: Rahmati, M., J. Vanderborght, J. Šimůnek, J. A. Vrugt, D. Moret‐Fernández, B. Latorre, L. Lassabatere, and H. Vereecken. "Soil hydraulic properties estimation from one‐dimensional infiltration experiments using characteristic time concept." Vadose Zone Journal 19, no. 1 (2020): e20068.

"""

#  Libraries
import pandas as pandas # Check if pandas is installed on your system. If not, install it by: pip install pandas --user
import numpy as numpy # Check if numpy is installed on your system. If not, install it by: pip install pandas --user

# CTM Code
def CTM(T, I, beta = 0.6, epsilon = 0.001, d = 0.001):

    # T and I are vectors with same size 
    # Initial values
    # beta parameters provide the beta value of Haverkamp model. Change this if you want to use soil-specific value
    # epsilon (defoult = 0.001) is an arbitrary value between zero and 0.5 used to adjust omega. Change it to speed up the procedure
    # d (defoult = 0.001) is an arbitrary value between 0 & 1. Change it to increase the flexibility of the procedure 

    # CTM Core Code
    def CTM_Core(T, I, omega, beta):
        # Default values
        t_char = numpy.nan
        I_char = numpy.nan
        Sp = numpy.nan
        Kp = numpy.nan

        # Calculation
        data_lenght = len(T)
        for k in range(1, data_lenght):
            tc = T[k]
            Ic = I[k]

            SS = (1-omega)*(Ic/numpy.sqrt(tc)) # Computes a preliminary stimate for S

            aa = (1/(9*(1-omega)))*(beta**2 - beta + 1) * (tc**2)/(Ic)
            bb = ((2 - beta) / 3) * tc
            cc = -1 * omega * Ic
            KK = (numpy.sqrt(bb**2 - 4 * aa * cc) - bb) / (2 * aa) # Computes the preliminary stimates for Ks
        
            W = []
            W = (SS*numpy.sqrt(T))/I # Computes contribution of the sorptivity component 
            if numpy.max(W) >= 1 - d and numpy.max(W) <= 1 + d: # Checks the selection index of the procedure
                t_char = tc
                I_char = Ic
                Sp = SS
                Kp = KK
                break
        return t_char, I_char, Sp, Kp

    omega = 0.5 + epsilon
    t_char = numpy.nan
    while numpy.isnan(t_char):
        omega -= epsilon
        t_char, I_char, Sp, Kp = CTM_Core(T, I, omega, beta)
        if omega <= epsilon:
            break
    return t_char, I_char, Sp, Kp, omega