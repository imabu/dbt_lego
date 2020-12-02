{{
  config(
    materialized='view'
  )
}}

with source as (
    select * from {{ ref('stg_theme') }}
),

general_theme as (
	select * from source
	where theme_parent_id is null
)

select * from general_theme