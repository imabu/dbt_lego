with source as (
    select * from {{ ref('raw_inventory_parts') }}
),

renamed as (
    select *
    from source
)

select * from renamed