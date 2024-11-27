---
title: Welcome to Datahub
hide_title: true 
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

 
 
 
<div class="grid md:grid-cols-2 gap-6 ">
<div class="">
 
<img src="assets/bridgegap-logo.svg" class="mb-4" style="height: 3.3em;" />



<div class="text-lg mb-2"><b>Welcome to the DataHub</b> of <b>BridgeGap</b>. This resource includes data repositories and analytic tools, as follows:</div>

- All current databases used for research in [BridgeGap](https://corruptiondata.eu)  pooled by partners, at country and multicountry level
- EU Compass analytical database, pooling data at national level following the UNODC Statistical Framework model (to be completed by end 2025, adding Europam.eu and EUCAL.eu data on preventive and criminal regulation against corruption)
- [Follow the Money](https://corruptiondata.eu/followthemoney/)  search engine powered and hosted by YouControl, a BridgeGap partner
 
</div>

<div class="bg-sky-100 px-6 rounded-md pt-2">

## How does EU Compass work?

Control of corruption is the capacity of a society to constrain public authorities to act for general social welfare and not for the particular benefit of private individuals, groups or networks connected to the office holders. **Control of corruption results from a balance between opportunities for corruption and constraints, posed by societies and states.** 

We proxy those here as parts of a public integrity framework consisting of  [Transparency](/theme/transparency/), [Regulation](/theme/regulation/) , [Enforcement](/theme/regulation/), [Freedom of Expression](/theme/freedom-of-expression/)  and [Internet Empowerment](/theme/internet-empowerement/) . We also include direct indicators of corruption.

</div>


<div class="xcol-span-2 p-4 pt-0">



This website covers 41 countries, including EU Member States and accession countries. **However, the coverage of indicators may be dissimilar, especially on direct indicators.**

As of November 2024 EU Compass is already ready to use due to pooling of a first set of data from consortium members, although it will grow considerably over the next two years with granular regulation and enforcement data.
</div>

<div class="">
<div class="text-xl  text-center  mb-4 bg-yellow-50	 border p-2 rounded" >
See the full <a class="markdown font-bold" href="/indicator/">list of indicators </a></div>

For more questions on how to use EU Compass or consult Methodology: deristavi@transparency.org 

Variables may have different citation requirements. <br />Please respect them!
 

 </div>

 </div>

<div class="bg-slate-50 text-center p-5 border text-lg">&rarr;  <a href="/downloads/" class="font-bold  markdown">Download data</a></div>

<div class="mt-10 pt-10">

---

 <div style="height: 33rem; width: 33rem; margin: auto;" >
  <InteractiveSVG1 src="/assets/dh-pie.svg"  /> 
</div> 
</div>



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