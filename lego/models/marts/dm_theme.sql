with theme as (
	select * from {{ ref('theme2general_theme') }}
),
sets as (
	select * from {{ ref('stg_set') }}
)
select t.theme_parent_id as theme_id,
	t.parent_theme_name as theme_name,
	min(year) as start_release_year,
	max(year) as end_release_year,
	min(num_parts) as min_size,
	max(num_parts) as max_size,
	avg(num_parts) as avg_size
from theme t
inner join sets s
	on t.theme_id = s.theme_id
group by t.theme_parent_id, t.parent_theme_name