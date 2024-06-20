with cte1 as (
    select * from {{ref('int_album_summary')}}
),
cte2 as (
    select * from {{ref('int_artists_albums')}}
),

final as (
    select
        a.album_title
        ,a.ttl_tracks
        ,a.ttl_length_m
        ,a.avg_track_length_m
        ,a.ttl_unit_price
        ,a.avg_unit_price
        ,b.artist_name
    from cte1 as a
    left join cte2 as b on a.album_id=b.album_id)

select * from final
