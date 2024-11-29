---
title: Full Indicators List
---

```sql ziToc

SELECT 
    
    Themes.Name AS Theme_Name,
    Components.Name AS Component_Name,
    Datasets.Name AS Dataset_Name,
    Indicators.Name AS Indicator_Name,
    Components.id AS Component_ID,
    Indicators.id AS Indicator_ID,
    Themes.id AS Theme_ID,    
    Datasets.id AS Dataset_ID,
    CONCAT('/indicator/', Indicator_ID) AS Indicator_Link
    
FROM 
    Indicators
JOIN 
    Components ON Indicators.Component = Components.id
JOIN 
    Themes ON Components.Theme = Themes.id
JOIN 
    Datasets ON Indicators.Dataset = Datasets.id

```


---

<ThemesTocStatic />

 <!--

<div class="lightToc">
<DataTable data={ziToc} rows=all groupBy=Theme_Name groupsOpen=false >
  <Column id=Theme_Name/> 
	<Column id=Component_Name /> 
	<Column id=Indicator_Link contentType=link linkLabel=Indicator_Name  /> 
</DataTable>
</div>

  
# Detalied view

Use the list below to browse Themes, Components and Indicators descriptions. <br/><small>Note: Click on <span class="bg-slate-200 px-2 py-1 text-sm rounded">Details</span> to see the indicators for each theme's components.</small>

---

-->