CREATE OR REPLACE VIEW `bqml_nhtsa_2015_view`
AS
SELECT 
a.consecutive_number,
a.county,
a.type_of_intersection,
a.light_condition,
a.atmospheric_conditions_1,
a.hour_of_crash,
a.functional_system,
a.related_factors_crash_level_1 related_factors,
CASE WHEN a.hour_of_ems_arrival_at_hospital BETWEEN 0 AND 23 AND a.hour_of_ems_arrival_at_hospital - a.hour_of_crash > 0 THEN a.hour_of_ems_arrival_at_hospital - a.hour_of_crash ELSE NULL END delay_to_hospital,
CASE WHEN a.hour_of_arrival_at_scene BETWEEN 0 AND 23 AND a.hour_of_arrival_at_scene - a.hour_of_crash > 0 THEN a.hour_of_arrival_at_scene - a.hour_of_crash ELSE NULL END delay_to_scene,
p.age,
p.person_type,
p.seating_position,
CASE p.restraint_system_helmet_use WHEN 0 THEN 0 WHEN 1 THEN 0.33 WHEN 2 THEN 0.67 WHEN 3 THEN 1.0 ELSE 0.5 END restraint,
CASE WHEN p.injury_severity IN (4) THEN 1 ELSE 0 END survived,
CASE WHEN p.rollover IN ('', 'No Rollover') THEN 0 ELSE 1 END rollover,
CASE WHEN p.air_bag_deployed BETWEEN 1 AND 9 THEN 1 ELSE 0 END airbag,
CASE WHEN p.police_reported_alcohol_involvement LIKE ('%Yes%') THEN 1 ELSE 0 END alcohol,
CASE WHEN p.police_reported_drug_involvement LIKE ('%Yes%') THEN 1 ELSE 0 END drugs,
p.related_factors_person_level1,
v.travel_speed,
CASE WHEN v.speeding_related LIKE ('%Yes%') THEN 1 ELSE 0 END speeding_related,
v.extent_of_damage,
v.body_type body_type,
v.vehicle_removal,
CASE WHEN v.manner_of_collision > 11 THEN 11 ELSE v.manner_of_collision END manner_of_collision,
CASE WHEN v.roadway_surface_condition > 11 THEN 8 ELSE v.roadway_surface_condition END roadway_surface_condition,
CASE WHEN v.first_harmful_event < 90 THEN v.first_harmful_event ELSE 0 END first_harmful_event,
CASE WHEN v.most_harmful_event < 90 THEN v.most_harmful_event ELSE 0 END most_harmful_event,
FROM `bigquery-public-data.nhtsa_traffic_fatalities.accident_2015` a
LEFT OUTER JOIN `bigquery-public-data.nhtsa_traffic_fatalities.vehicle_2015` v
USING (consecutive_number)
LEFT OUTER JOIN `bigquery-public-data.nhtsa_traffic_fatalities.person_2015` p
USING (consecutive_number)
