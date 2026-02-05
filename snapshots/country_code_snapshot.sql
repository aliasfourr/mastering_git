--the strategy chech is to take a snapshot when a col change 
--the other strategy is by timestamp to take snapshot 

{% snapshot country_code_snapshot%}

{{

config(
        target_schema='snapshots',
        unique_key='country_name',
        strategy='check',
        check_cols=['country_name','code']
)

}}

select * from DBT_snowflake_DB.raw_transform.countries

{% endsnapshot %}