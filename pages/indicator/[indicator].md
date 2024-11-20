---
title: Indicator
hide_title: true 
---

  
# **{indicatorMeta[0].Name}**   {inputs.ziYears.value}

{indicatorMeta[0].Description}


<a class="markdown" href="/theme/{IndicatorPath[0].Theme_ID}">{IndicatorPath[0].Theme_Name}</a> / <a class="markdown"  href="/component/{IndicatorPath[0].Component_ID}">{IndicatorPath[0].Component_Name}</a>

Dataset: <a class="markdown"  href="/dataset/{IndicatorPath[0].Dataset_ID}">{IndicatorPath[0].Dataset_Name}</a>


<!-- 
Component: **{indicatorMeta[0].Component}**
Dataset: **{indicatorMeta[0].Dataset}**
Attribution: {indicatorMeta[0].Attribution} 
-->


<Dropdown 
    data={years} 
    name=ziYears 
    value=Year 
    title="Select Year" 
/>



<Tabs>
    <Tab label="Bar">
        <BarChart 
            data={ziIndicators}
            x="ISO3 Country"
            y=Value
            swapXY=true
            yFmt= num2
            title="{indicatorMeta[0].Name} for {inputs.ziYears.value}"
            echartsOptions={{ yAxis: { type: "category",   } }}
        />
    </Tab>
        
    <Tab label="Map">
       
        <AreaMap 
            data={ziIndicators} 
            areaCol="ISO3 Country"
            geoJsonUrl="/ne_110m_admin_0_countries.geojson"
            geoId=sov_a3
            height=450
            value=Value
            legendType=scalar
        />
   
    </Tab>
   <Tab label="Table">
   <DataTable data={ziIndicators} 
   rows=all
    />
   </Tab>
    <Tab label="Heatmap">
        <div id="ttt" style="width: {13 * years.length}em;  ">
            <Heatmap 
                data={ziIndicatorsAll} 
                x=Year 
                y="ISO3 Country" 
                value=Value   
                legend=true
                filter=true
                title="{indicatorMeta[0].Name}"            
            />
        </div>
    </Tab>
</Tabs>

---


## Other Indicators of the _{IndicatorPath[0].Component_Name}_ component

<div class="xlist">
 {#each siblingIndicators as indicator}
 
    <h3><a class="type-indicator markdown" href="/indicator/{indicator.id}"><b>{indicator.Name}</b></a></h3>
    <p>{indicator.Description}</p> 

    
 {/each}
 </div>

 <style>
 .xlist h3 {font-weight: bold;}
 .xlist p {line-height: 1.2;margin-bottom: 1ex; font-size: .9em;}

#ttt   { margin: 0 auto; max-width: 60em;}

 </style>

<!-- {@partial "indicator-list.md"} -->



```sql indicatorMeta
select "id","Name","Description","Component","Dataset","Description - rules","Var Type","which is better","label MIN","label MAX","Attribution" FROM datahub.Indicators  WHERE id = '${params.indicator}' 
```

```sql years
SELECT  DISTINCT TRY_CAST(Year AS FLOAT) AS Year  from datahub.Data WHERE Indicator_ID = '${params.indicator}' order by Year ASC
```

```sql ziIndicators

-- SELECT "ISO3 Country", Year, TRY_CAST(Value AS FLOAT) AS Value from datahub.Data WHERE Indicator_ID = '${params.indicator}' AND Year = ${inputs.ziYears.value}  AND Value NOT LIKE 0 ORDER BY Value DESC
SELECT "ISO3 Country", Year, TRY_CAST(Value AS FLOAT) AS Value from datahub.Data WHERE Indicator_ID = '${params.indicator}' AND Year = ${inputs.ziYears.value} ORDER BY Value DESC
-- SELECT "ISO3 Country", Year, Value from datahub.Data WHERE Indicator_ID = '${params.indicator}' AND Year = ${inputs.ziYears.value} ORDER BY Value DESC


```

```sql ziIndicatorsAll

--  SELECT "ISO3 Country", Year, ROUND(CAST(Value AS FLOAT),1) AS Value  from datahub.Data WHERE Indicator_ID = '${params.indicator}'    
 SELECT "ISO3 Country", Year, ROUND(TRY_CAST(Value AS FLOAT)) AS Value  from datahub.Data WHERE Indicator_ID = '${params.indicator}' ORDER BY "ISO3 Country" ASC    

```

```sql IndicatorPath

SELECT 
    Indicators.id AS Indicator_ID,
    Indicators.Name AS Indicator_Name,
    Components.id AS Component_ID,
    Components.Name AS Component_Name,
    Themes.id AS Theme_ID,
    Themes.Name AS Theme_Name,
    Datasets.id AS Dataset_ID,
    Datasets.Name AS Dataset_Name
FROM 
    Indicators
JOIN 
    Components ON Indicators.Component = Components.id
JOIN 
    Themes ON Components.Theme = Themes.id
JOIN 
    Datasets ON Indicators.Dataset = Datasets.id
WHERE 
    Indicators.id = '${params.indicator}';  

```

```sql siblingIndicators

SELECT 
    Indicators.id,
    Indicators.Description,
    Indicators.Name
FROM 
    Indicators
JOIN 
    Components ON Indicators.Component = Components.id
WHERE 
    Components.id = (
        SELECT Component 
        FROM Indicators 
        WHERE id = '${params.indicator}'
    )
    AND Indicators.id != '${params.indicator}'
ORDER BY 
    Indicators.Name;

```


