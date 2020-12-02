with recursive general_theme_cte as (
	select t.theme_id, 
		t.theme_name, 
		t.theme_parent_id, 
		g.theme_name as parent_theme_name
	from {{ ref('stg_theme') }} t
	join {{ ref('general_theme') }} g 
		on g.theme_id = t.theme_parent_id

	union all 

	select t.theme_id, 
		t.theme_name, 
		cte.theme_parent_id, 
		cte.parent_theme_name
	from {{ ref('stg_theme') }} t
	join general_theme_cte cte 
		on cte.theme_id = t.theme_parent_id
)
select * from general_theme_cte
