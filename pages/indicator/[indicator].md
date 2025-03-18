---
title: Indicator
hide_title: true 
---


```sql indicatorMeta
    select 
        "id",
        "Name",
        "Description",
        "Component",
        "Dataset",
        "Description - rules",
        "Var Type",
        "which is better",
        "label MIN",
        "label MAX",
        "Attribution",
        "Methodology Snapshot",
        "Source",
        "Methodology" 
    FROM datahubGsheets.dh_Indicators  WHERE id = '${params.indicator}' 
```

```sql years
SELECT  DISTINCT TRY_CAST(Year AS FLOAT) AS Year  from datahubGsheets.dh_Data WHERE Indicator_ID = '${params.indicator}' order by Year ASC
```

```sql ziIndicators
WITH CountryData AS (
  SELECT 
    d."ISO3 Country", 
    COALESCE(c.Name, d."ISO3 Country") AS "Country Name",
    d.Year, 
    TRY_CAST(d.Value AS FLOAT) AS Value,
    c."EUM Status" AS group_type
  FROM 
    datahubGsheets.dh_Data d
  LEFT JOIN
    datahubGsheets.dh_countries c ON d."ISO3 Country" = c.ISO3
  WHERE 
    d.Indicator_ID = '${params.indicator}' 
    AND d.Year = ${inputs.ziYears.value}
),
GroupAverages AS (
  SELECT
    'AVG: ' || group_type AS "ISO3 Country",
    'AVG: ' || group_type AS "Country Name",
    Year,
    AVG(Value) AS Value,
    'average' AS row_type
  FROM
    CountryData
  WHERE
    group_type IS NOT NULL
  GROUP BY
    group_type, Year
),
CombinedData AS (
  SELECT
    "ISO3 Country",
    "Country Name",
    Year,
    Value,
    'country' AS row_type
  FROM
    CountryData
  UNION ALL
  SELECT
    "ISO3 Country",
    "Country Name",
    Year,
    Value,
    row_type
  FROM
    GroupAverages
)
SELECT * FROM CombinedData
ORDER BY
  CASE WHEN row_type = 'average' THEN 0 ELSE 1 END,
  Value DESC
```

```sql ziIndicatorsAll
SELECT 
  d."ISO3 Country", 
  COALESCE(c.Name, d."ISO3 Country") AS "Country Name",
  d.Year, 
  ROUND(TRY_CAST(d.Value AS FLOAT)) AS Value
FROM 
  datahubGsheets.dh_Data d
LEFT JOIN
  datahubGsheets.dh_countries c ON d."ISO3 Country" = c.ISO3
WHERE 
  d.Indicator_ID = '${params.indicator}'
ORDER BY 
  COALESCE(c.Name, d."ISO3 Country") ASC
```

```sql IndicatorPath
SELECT 
    dh_Indicators.id AS Indicator_ID,
    dh_Indicators.Name AS Indicator_Name,
    dh_Components.id AS Component_ID,
    dh_Components.Name AS Component_Name,
    dh_Themes.id AS Theme_ID,
    dh_Themes.Name AS Theme_Name,
    dh_Datasets.id AS Dataset_ID,
    dh_Datasets.Name AS Dataset_Name
FROM 
    datahubGsheets.dh_Indicators
JOIN 
    datahubGsheets.dh_Components ON dh_Indicators.Component = dh_Components.id
JOIN 
    datahubGsheets.dh_Themes ON dh_Components.Theme = dh_Themes.id
JOIN 
    datahubGsheets.dh_Datasets ON dh_Indicators.Dataset = dh_Datasets.id
WHERE 
    dh_Indicators.id = '${params.indicator}';  
```

```sql siblingIndicators
SELECT 
    dh_Indicators.id,
    dh_Indicators.Description,
    dh_Indicators.Name
FROM 
    datahubGsheets.dh_Indicators
JOIN 
    datahubGsheets.dh_Components ON dh_Indicators.Component = dh_Components.id
WHERE 
    dh_Components.id = (
        SELECT Component 
        FROM datahubGsheets.dh_Indicators 
        WHERE id = '${params.indicator}'
    )
    AND dh_Indicators.id != '${params.indicator}'
ORDER BY 
    dh_Indicators.Name;
```
  
# **{indicatorMeta[0].Name}**   {inputs.ziYears.value}



{indicatorMeta[0].Description}


<a class="markdown" href="/theme/{IndicatorPath[0].Theme_ID}">{IndicatorPath[0].Theme_Name}</a> / <a class="markdown"  href="/component/{IndicatorPath[0].Component_ID}">{IndicatorPath[0].Component_Name}</a>

Dataset: <a class="markdown"  href="/dataset/{IndicatorPath[0].Dataset_ID}">{IndicatorPath[0].Dataset_Name}</a>



 

<Dropdown 
    data={years} 
    name=ziYears 
    value=Year 
    title="Select Year" 
/>

<Tabs>
  <Tab label="Map">
       
        <AreaMap 
            data={ziIndicators} 
            areaCol="ISO3 Country"
            nameCol="Country Name"
            geoJsonUrl="/ne_110m_admin_0_countries.geojson"
            geoId=iso_a3
            height=1280
            value=Value
            legendType=scalar
            title="{indicatorMeta[0].Name} ({inputs.ziYears.value})"
            tooltipFmt="num2"
            echartsOptions={{
              tooltip: {
                formatter: function(params) {
                  return `${params.name}: <strong>${parseFloat(params.value).toFixed(2)}</strong>`;
                }
              }
            }}
        />
   
    </Tab>
    <Tab label="Bar">
        <div class="mb-3">
          <div class="flex gap-4 justify-end mb-2">
            <div class="flex items-center gap-1">
              <span class="inline-block w-3 h-3 bg-[#2ecc71]"></span>
              <span class="text-sm">EUMS Average</span>
            </div>
            <div class="flex items-center gap-1">
              <span class="inline-block w-3 h-3 bg-[#e74c3c]"></span>
              <span class="text-sm">EUCC Average</span>
            </div>
            <div class="flex items-center gap-1">
              <span class="inline-block w-3 h-3 bg-[#f39c12]"></span>
              <span class="text-sm">Non-EUMS Average</span>
            </div>
          </div>
          <BarChart 
              data={ziIndicators}
              x="Country Name"
              y=Value
              swapXY=true
              yFmt= num2
              title="{indicatorMeta[0].Name} for {inputs.ziYears.value}"
              seriesField="row_type"
              echartsOptions={{ 
                autoColor: false,
                colorBy: "data",
                yAxis: { 
                  type: "category",
                  axisLabel: {
                    formatter: function(value) {
                      // Truncate long country names
                      return value.length > 20 ? value.substring(0, 17) + '...' : value;
                    }
                  }
                },
                series: [
                  {
                    name: "Values",
                    encode: {
                      x: "Value",
                      y: "Country Name" 
                    },
                    itemStyle: {
                      color: function(params) {
                        // Get country name from params.data[1]
                        const countryName = params.data[1] ? params.data[1].toString() : "";
                        
                        // Different colors for different average groups
                        if (countryName.includes("AVG: EUMS")) {
                          return '#2ecc71'; // Green for EU Member States
                        } else if (countryName.includes("AVG: EUCC")) {
                          return '#e74c3c'; // Red for EU Candidate Countries
                        } else if (countryName.includes("AVG: Non-EUMS")) {
                          return '#f39c12'; // Orange for Non-EU Member States
                        } else {
                          // Regular country color
                          return '#5470c6'; 
                        }
                      }
                    },
                    barWidth: function(params) {
                      const countryName = params.data[1] ? params.data[1].toString() : "";
                      return countryName.startsWith("AVG:") ? '80%' : '60%';
                    }
                  }
                ],
                tooltip: {
                  formatter: function(params) {
                    let value = params.data.Value.toFixed(2);
                    let label = params.data["Country Name"];
                    
                    if (label.startsWith("AVG:")) {
                      return `<strong>${label}</strong><br>Value: <strong>${value}</strong>`;
                    } else {
                      return `${label}: <strong>${value}</strong>`;
                    }
                  }
                },
                grid: {
                  right: '5%',
                  containLabel: true
                }
              }}
          />
        </div>
     
    </Tab>
        
    <Tab label="Heatmap">
        <div class="w-64" style="width: {13 * years.length}em;">
            <Heatmap 
                data={ziIndicatorsAll} 
                x=Year 
                y="Country Name" 
                value=Value   
                legend=true
                filter=true
                title="{indicatorMeta[0].Name} Over Time"
                height="600px"
                valueFmt="num2"
                echartsOptions={{
                  tooltip: {
                    formatter: function(params) {
                      return `${params.name} (${params.data[0]}): <strong>${parseFloat(params.value).toFixed(2)}</strong>`;
                    }
                  }
                }}
            />
        </div>
    </Tab>

    <Tab label="Data">
        <DataTable 
            data={ziIndicatorsAll} 
            rows=10
            download=true
            downloadFilename="{IndicatorPath[0].Theme_Name.replace(/[^a-zA-Z0-9]/g, '_')}_{indicatorMeta[0].Name.replace(/[^a-zA-Z0-9]/g, '_')}_data.csv"
            title="Complete Dataset for {indicatorMeta[0].Name}"
            height="400px"
        />
    </Tab>
</Tabs>
<table class="align-top ">
<thead>
<tr class="border-b">
 <th colspan="2">Indicator Factsheet</th>
</tr>
</thead>
<tbody>
<tr class="border-b">
<td>Name</td>
<td>{indicatorMeta[0].Name}</td>
</tr>
<tr class="border-b">
<td>Description</td>
<td>{indicatorMeta[0].Description}</td>
</tr>

 
 {#if indicatorMeta[0]["Methodology Snapshot"]}
  
  <tr class="border-b">
  <td>Methodology <br/>snapshot</td>
  <td class="whitespace-pre-line">{indicatorMeta[0]["Methodology Snapshot"]}</td>
  
  </tr>
    
  {/if}

          {#if indicatorMeta[0]["label MIN"] && indicatorMeta[0]["label MAX"]}
            
            <tr class="border-b">
              <td>Scale</td>
              <td class="whitespace-pre-line">{indicatorMeta[0]["label MIN"]} to {indicatorMeta[0]["label MAX"]} 
              
              {#if indicatorMeta[0]["which is better"]}
<br/>            Note: For this indicator, {indicatorMeta[0]["which is better"].toLowerCase()} values are better.
          {/if}
              </td>
            </tr>

          {/if}

 {#if indicatorMeta[0]["Source"] && indicatorMeta[0]["Source"].trim() && indicatorMeta[0]["Source"].trim().startsWith('http')}

<tr>
<td>Source</td>
<td><a href="{indicatorMeta[0]['Source'].trim()}" target="_blank" rel="noopener noreferrer" class="text-blue-600 hover:underline">{indicatorMeta[0]['Source'].trim()}</a></td>
</tr>
      
{/if}


 {#if indicatorMeta[0]["Methodology"] && indicatorMeta[0]["Methodology"].trim() && indicatorMeta[0]["Methodology"].trim().startsWith('http')}

<tr>
<td>Methodology</td>
<td><a href="{indicatorMeta[0]['Methodology'].trim()}" target="_blank" rel="noopener noreferrer" class="text-blue-600 hover:underline">{indicatorMeta[0]['Methodology'].trim()}</a></td>
</tr>
      
{/if}


{#if indicatorMeta[0].Attribution}
<tr class="border-b">
  <td>Attribution </td>
  <td>{indicatorMeta[0].Attribution}</td>
</tr>
{/if}
</tbody>
</table>

 
  {#if indicatorMeta[0]["which is better"] || (indicatorMeta[0]["label MIN"] && indicatorMeta[0]["label MAX"])}
        <div class="text-sm text-gray-600 mt-2 italic">
          {#if indicatorMeta[0]["which is better"]}
            Note: For this indicator, {indicatorMeta[0]["which is better"].toLowerCase()} values are better.
          {/if}

        </div>
        {/if}
 
 

---

{#if siblingIndicators.length !== 0}

### Other Indicators of the **{IndicatorPath[0].Component_Name}** component



<div class="grid xl:grid-cols-2 2xl:grid-cols-3 gap-5">
 {#each siblingIndicators as indicator}
 
    <div class=" my-1">
        <h3><a class="type-indicator markdown" href="/indicator/{indicator.id}"><b>{indicator.Name}</b></a></h3>
        <p>{indicator.Description}</p>
    </div>

    
 {/each}
 </div>
{/if}
 

<!-- {@partial "indicator-list.md"} -->





