with final as (select * from {{ source("music_db", "GENRE") }}) select * from final
