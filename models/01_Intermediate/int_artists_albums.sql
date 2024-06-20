with Artists as (
    select 
        ArtistId as artist_id
        ,Name as artist_name
    from {{ref('stg_artist')}}
),
Albums as (
    select 
        AlbumId as album_id
        ,Title as album_title
        ,ArtistId as artist_id
    from {{ref('stg_album')}}
),
final as (
    select
        a.*
        ,b.artist_name
    from Albums as a
    left join Artists as b on a.artist_id=b.artist_id)

select * from final