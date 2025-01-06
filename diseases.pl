%diseases
disease(cold).
disease(flu).
disease(covid_19).

%symptoms
symptom(fever).
symptom(cough).
symptom(sore_throat).
symptom(fatigue).
symptom(shortness_of_breath).
symptom(body_aches).

%disease_specific_symptom_rules
has_disease(cold) :-
    symptom(cough),
    symptom(sore_throat),
    \+ symptom(fever). 

has_disease(flu) :-
    symptom(fever),
    symptom(cough),
    symptom(body_aches),
    symptom(fatigue).

has_disease(covid_19) :-
    symptom(fever),
    symptom(cough),
    symptom(fatigue),
    symptom(shortness_of_breath).

diagnose(disease) :- has_disease(disease),write('You may have: '),write(disease).

