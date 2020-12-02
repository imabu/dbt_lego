with source as (
    select * from {{ ref('raw_inventories') }}
),

renamed as (
    select
        id as inventory_id,
       version,
       set_num
    from source
)

select * from renamed