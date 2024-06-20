with final as 
(select * from {{ source("music_db", "ALBUM") }}) 
select * from final
