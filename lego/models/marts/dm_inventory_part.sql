with inventory as (
	select * from {{ ref('stg_inventory') }}
),
sets as (
	select * from {{ ref('stg_set') }}
),
inventory_part as (
	select * from {{ ref('stg_inventory_part') }}
),
color as (
	select * from {{ ref('stg_color') }}
),
theme as (
	select * from {{ ref('stg_theme') }}
)
select ip.part_num,
	ip.quantity,
	ip.	inventory_id,
	c.color_name,
	c.rgb,
	s.name as set_name,
	s.year as release_year,
	t.theme_name
from inventory_part ip
left join inventory i
	on i.inventory_id = ip.inventory_id
left join sets s
	on i.set_num = s.set_num
left join theme t
	on s.theme_id = t.theme_id
left join color c
	on c.color_id = ip.color_id
