with final as (select * from {{ source("music_db", "TRACK") }}) select * from final
