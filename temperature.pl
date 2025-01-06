% Facts
current_temperature(Temp) :- Temp = 30.  
desired_temperature(Temp) :- Temp = 22.   

% Define time of day - these facts could change based on the current time
time_of_day(morning).
% time_of_day(afternoon).
% time_of_day(evening).
% time_of_day(night).

% Home occupancy
home_occupied(yes).  

% Comfort range for temperature
comfort_min(18).
comfort_max(24).

% Rules
% Rule: Activate cooling if the current temperature is above the desired temperature and the house is occupied.
activate_cooling :-
    current_temperature(CurTemp),
    desired_temperature(DesTemp),
    home_occupied(yes),
    CurTemp > DesTemp,
    write('Activating cooling system to reach desired temperature.').

% Rule: Activate heating if the current temperature is below the desired temperature and the house is occupied.
activate_heating :-
    current_temperature(CurTemp),
    desired_temperature(DesTemp),
    home_occupied(yes),
    CurTemp < DesTemp,
    write('Activating heating system to reach desired temperature.').

% Rule: If home is unoccupied and it�s night, reduce heating or cooling to save energy
energy_saving_mode :-
    home_occupied(no),
    time_of_day(night),
    write('Activating energy saving mode. Reducing heating/cooling as home is unoccupied at night.').

% Rule: Adjust temperature to maintain comfort range if home is occupied and temperature is outside comfort range
adjust_temperature :-
    current_temperature(CurTemp),
    comfort_min(Min),
    comfort_max(Max),
    home_occupied(yes),
    (CurTemp < Min -> activate_heating;
     CurTemp > Max -> activate_cooling),
    write('Adjusting temperature to maintain comfort range.').

% Query predicates
% If temperature control needs to be activated, it can be checked with ?- activate_heating. or ?- activate_cooling.