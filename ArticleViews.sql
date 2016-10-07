SELECT 
	a.id as user_id, 
	a.firstname,
	a.lastname,
	a.description,
	f.name,
	b.title, 
	b.url
FROM
	3md.doc_news_entries b
	join 3md.doc_news_events d on d.entry_id = b.id 
	join 3md.users a on d.account_id = a.account_id
	join 3md.user_professional_details e on e.id = a.`user_professional_details_id`
	join 3md.specialties f on f.`code` = e.`specialty_id`
WHERE
	d.entry_id =  4833162 -- entry_id
LIMIT 100
;
