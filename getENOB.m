function [val] = getENOB(SINAD_val)
    val = (SINAD_val - 1.76)/6.02;
end