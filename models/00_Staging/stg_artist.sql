with final as 
(select * from {{ source("music_db", "ARTIST") }}) 
select * from final
