with source as (
    select * from {{ ref('raw_colors') }}
),

renamed as (

    select
        id as color_id,
        name as color_name,
        rgb,
        is_trans
    from source
)

select * from renamed