with final as (select * from {{ source("music_db", "MEDIATYPE") }}) select * from final
