with cte1 as (
    select * from {{ref('int_tracks_genre_jazz')}}
),
cte2 as (
    select * from {{ref('int_artists_albums')}}
),
cte3 as (
    select * from {{ref('stg_media_type')}}
),
final as (
    select
        a.id_track
        ,a.song_name
        ,b.album_title
        ,c.Name as media_type
        ,a.composer
        ,b.artist_name
        ,a.genre_name
    from cte1 as a
    left join cte2 as b on a.album_id=b.album_id
    left join cte3 as c on c.MediaTypeId = a.media_type_id)

select * from final
