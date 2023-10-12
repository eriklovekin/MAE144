%% ESL_C2D_matched
function [Gz] = ESL_C2D_matched(Ds,h,omegac,proper)
    % function [Gz] = ESL_C2D_matched(Ds,h)
    % Convert Ds(s) to Dz(z) using matched method with timestep h.
    % Match gain at default omega = 0 or at critical gain omegac.

    if nargin < 4 % Assume proper
        proper = true;
    elseif nargin < 3 % Assume desired omegac = 0
        omegac = 0;
        proper = true;
    end

    Gz = RR_tf(exp(Ds.z*h),exp(Ds.p*h),1);% Initialize Gz
    Gz.h = h;

    nz_inf = length(Gz.p)-length(Gz.z);% # Zeros at infinity = # poles - # zeros
    
    Gz.z = [Gz.z -1*ones(1,nz_inf-1)];% Add poles at z=-1
    
    if proper
        Gz.z = [Gz.z Inf(1)];% Final pole at inf
    else
        Gz.z = [Gz.z -1];% Final pole at -1
    end

    Ks = abs(RR_evaluate(Ds,omegac*1i));% Continuous gain at omegac
    Kz = abs(RR_evaluate(Gz,exp(omegac*1i*h)));% Discrete gain at omegac

    Gz = Gz*Ks/Kz;% Scale discrete gain
end
