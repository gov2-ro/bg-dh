---
title: Theme
hide_title: true 
---

# Theme: **{params.theme}**

```sql Components

SELECT * FROM Components WHERE Theme = '${params.theme}'

```

```sql Indicators

SELECT * FROM Indicators 

```

## Components

<div class="xlist">
 {#each Components as component}
 
    <h3><a class="type-component markdown" href="/component/{component.id}">{component.Name}</a></h3>
    <p>
    {component.Description}
    <br> Indicators:   <ChildIndicators ziIndicators = {Indicators} ziComponent = {component.id} /> 
    </p>     

    
 {/each}
 </div>

 <style>
 .xlist h3 {font-weight: bold;}
 .xlist p {line-height: 1.2;margin-bottom: 1ex; font-size: .9em;}
 </style>