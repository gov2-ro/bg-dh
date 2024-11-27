---
title: Component
hide_title: true 
---


# Component: **{params.component}**

```sql Indicators

SELECT * FROM Indicators WHERE Component = '${params.component}'

```

## Indicators

<div class="xlist">
 {#each Indicators as indicator}
 
    <h3><a class="type-indicator markdown" href="/indicator/{indicator.id}">{indicator.Name}</a></h3>
    <p>{indicator.Description}</p> 
 

 {/each}
 </div>

 <style>
 .xlist h3 {font-weight: bold;}
 .xlist p {line-height: 1.2;margin-bottom: 1ex; font-size: .9em;}
 </style>