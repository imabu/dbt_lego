with source as (
    select * from {{ ref('raw_themes') }}
),

renamed as (
    select
       id as theme_id,
       name as theme_name,
       parent_id as theme_parent_id
    from source
)

select * from renamed