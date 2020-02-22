# Modulation-QPSK-and-OQPSK-in-MatLAB
This code implements QPSK and its improved OQPSK modulation

QPSK.m : It shows how I, Q signals multiply with high frequency carriers (cos(2*pi*fc*t) and sin(2*pi*fc*t))
         After IQ mapping, binary sequences also need to go through the raised cosine roll off filter for pulse shaping.
         
OQPSK.m : Q signal is 0.5 seconds later than I signal. 
          Therefore, the envelope of OQPSK signal changes smoothly, and the nonlinear power amplifier amplifies without much distortion
