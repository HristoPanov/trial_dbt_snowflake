with base_albums as (
    select *
    from {{ ref('stg_album') }}
),

base_tracks as (
    select *
    from {{ ref('stg_track') }}
)

select
    a.AlbumId as album_id
    ,a.Title as album_title
    ,count(b.TrackId) as ttl_tracks
    ,sum(b.Milliseconds*0.001)/60 as ttl_length_m
    ,avg(b.Milliseconds*0.001)/60 as avg_track_length_m
    ,sum(b.UnitPrice) as ttl_unit_price
    ,avg(b.UnitPrice) as avg_unit_price
from base_albums a
left join base_tracks b on a.AlbumId = b.AlbumId
group by a.AlbumId, a.Title