---
title: Test ToCz
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

```sql ziThemes

SELECT 
    id, Name, Description
    From Themes
  

```

 




<div style="height: 33rem; width: 33rem; " class="float-right">
  <InteractiveSVG1 src="/assets/dh-pie.svg"  /> 
</div>

Welcome to the DataHub of BridgeGap. This resource includes data repositories and analytic tools, as follows:

- All current databases used for research in BridgeGap pooled by partners, at country and multicountry level
- EU Compass analytical database, pooling data at national level following the UNODC Statistical Framework model (to be completed by end 2025, adding Europam.eu and EUCAL.eu data on preventive and criminal regulation against corruption)
- [Follow the Money](https://corruptiondata.eu/followthemoney/)  search engine powered and hosted by YouControl, a BridgeGap partner

## How does EU Compass work?

Control of corruption is the capacity of a society to constrain public authorities to act for general social welfare and not for the particular benefit of private individuals, groups or networks connected to the office holders. Control of corruption results from a balance between opportunities for corruption and constraints, posed by societies and states. We proxy those here as parts of a public integrity framework consisting of Transparency, Regulation, Enforcement, Freedom of Expression and Internet Empowerment. We also include direct indicators of corruption.

This website covers 41 countries, including EU Member States and accession countries. **However, the coverage of indicators may be dissimilar, especially on direct indicators.**

As of November 2024 EU Compass is already ready to use due to pooling of a first set of data from consortium members, although it will grow considerably over the next two years with granular regulation and enforcement data.

For more questions on how to use EU Compass or consult Methodology: deristavi@transparency.org

Variables may have different citation requirements. Please respect them!


## Themes

<ThemesToc />

<div class="xlist">
 {#each ziThemes as theme}
 
    <h3><a class="type-theme markdown" href="/theme/{theme.id}">{theme.Name}</a></h3>
    <p>{theme.Description}</p> 
    
 {/each}
</div>


## Full Indicator List

<DataTable data={ziToc} rows=all groupBy=Theme_Name  groupsOpen=false>
  <Column id=Theme_Name/> 
	<Column id=Component_Name /> 
	<Column id=Indicator_Link contentType=link linkLabel=Indicator_Name  /> 
</DataTable>


<DataTable data={ziToc} rows=all>
  <table id="zitable">
  <thead>
    <tr>
      <th>Theme</th>
      <th>Component</th>
      <th>Indicator</th>
    </tr>
  </thead>
  <tbody>
  {#each ziToc as row}
    <tr class="{row.Theme_ID} {row.Component_ID} ">
      
        {#if row.Theme_Name}<td>
          <a href={`/theme/${row.Theme_ID}`}>{row.Theme_ID}</a>
      </td>        {/if}

      
        {#if row.Component_Name}<td>
          <a href={`/component/${row.Component_ID}`}>{row.Component_ID}</a>
      </td>        {/if}

      
        {#if row.Indicator_Name}<td>
          <a href={`/indicator/${row.Indicator_ID}`}>{row.Indicator_Name}</a>
      </td>        {/if}

    </tr>
  {/each}
  </tbody>
  </table>
</DataTable>







 <style>
 .xlist h3 {font-weight: bold;}
 .xlist p {line-height: 1.2;margin-bottom: 1ex; font-size: .9em;}
 
 *[onclick] {
  cursor: pointer;
 }
 *[onclick]:hover {
  cursor: pointer;
  opacity: 0.7;
 }
 tr td:first-child {
  font-family: 'Arial Narrow'; 
  text-overflow: ellipsis;   
    overflow:hidden;              
    white-space:nowrap;           
    width: 8em; padding-right: 1.5ex; 
    /*opacity: 0;  */
 }
 tr td:nth-child(2) {
  font-family: 'Arial Narrow'; text-align: center; 
 }
 
 </style>