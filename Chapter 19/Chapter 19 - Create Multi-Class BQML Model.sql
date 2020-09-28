CREATE OR REPLACE MODEL `bqml_nhtsa_2015`
TRANSFORM (
  county,
  type_of_intersection,
  light_condition,
  atmospheric_conditions_1,
  ML.QUANTILE_BUCKETIZE(hour_of_crash, 6) OVER() bucketized_hour,
  ML.BUCKETIZE(functional_system, [1,4,7]) functional_system,
  related_factors,
  ML.STANDARD_SCALER(delay_to_hospital) OVER() delay_to_hospital,
  ML.STANDARD_SCALER(delay_to_scene) OVER() delay_to_scene,
  ML.QUANTILE_BUCKETIZE(age, 5) OVER() bucketized_age,
  ML.BUCKETIZE(person_type, [1,6,9]) person_type,
  ML.BUCKETIZE(seating_position, [0,10,11,21,31,40]) seating_position,
  restraint,
  rollover,
  airbag,
  alcohol,
  drugs,
  related_factors_person_level1,
  ML.QUANTILE_BUCKETIZE(travel_speed, 10) OVER() travel_speed,
  speeding_related,
  ML.BUCKETIZE(body_type, [0,10,20,30,40,50,60,80,90,91,92,93,94,95,96,97]) body_type,
  vehicle_removal,
  manner_of_collision,
  roadway_surface_condition,
  first_harmful_event,
  most_harmful_event,
  survived
)
OPTIONS (model_type='logistic_reg', input_label_cols=['survived'])
AS
SELECT * EXCEPT (consecutive_number) from `bqml_nhtsa_2015_view`
