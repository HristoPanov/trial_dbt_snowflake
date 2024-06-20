with tracks as (
    select * from {{ref('stg_track')}}
),
genre as (
    select * from {{ref('stg_genre')}}
),
final as (
    select
        a.TrackId as id_track
        ,a.Name as song_name
        ,a.AlbumId as album_id
        ,a.MediaTypeId as media_type_id
        ,a.Composer as composer
        ,b.Name as genre_name
    from tracks as a
    left join genre as b on a.GenreId=b.GenreId
    )

select * from final
