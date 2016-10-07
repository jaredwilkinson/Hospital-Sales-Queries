SELECT 
	a.id as user_id, 
	a.firstname,
	a.lastname,
	a.description,
	f.name,
	group_concat(distinct d.category) as activities, 
	CASE WHEN g.num_login_mobile >0  THEN 1 ELSE 0 END as mobile_user,
	count(d.id) as number_of_events
FROM
	3md.users a
	join 3md.employment_histories b on b.user_id = a.id
	join 3md.employment_history_locations c on c.id = b.`employment_history_location_id`
	join analytics.dashboard_aggregate d on d.user_id = a.id
	join 3md.user_professional_details e on e.id = a.`user_professional_details_id`
	join 3md.specialties f on f.`code` = e.`specialty_id`
	join analytics.feature_library g on g.user_id = a.id
WHERE
	c.workable_id = 782-- facility_id
	and c.workable_type = 'facility'
	and d.`day_date` > '2016-09-06'
	and b.current = 1
	and platform != 'amion'
GROUP BY
	a.id
ORDER BY
	count(d.id) DESC
LIMIT 100
;
