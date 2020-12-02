with source as (
    select * from {{ ref('raw_sets') }}
),

renamed as (
    select *
    from source
)

select * from renamed