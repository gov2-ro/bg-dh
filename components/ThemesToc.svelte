<script>
    import { buildQuery } from "@evidence-dev/component-utilities/buildQuery";
    // export let ziTheme; // if to show a single theme?
    const qThemes = buildQuery("select * from Themes", "nonssr");   
	const qComponents = buildQuery("select * from Components", "nonssr");   
	const qIndicators = buildQuery("select * from Indicators", "nonssr");   
</script>

{#each qThemes as theme}
<div class="level-0-wrapper">
    <h2>Theme: <b>{theme.Name}</b></h2>
    <div class="level-0">
    {#each qComponents as component}
        {#if component.ThemeID == theme.ID}
        <div class="level-1-wrapper">
            <h3> <b>{component.Name}</b></h3>
            <div class="level-1">
            {#each qIndicators as indicator}        
                {#if indicator.Component == component.id}
                <div class="level-2">
                <h4> <b><a href="/indicator/{indicator.id}" class="markdown">{indicator.Name}</a></b></h4>                    
                <!-- {indicator.Description} -->
                </div>
                {/if}
            {/each}
        </div>
        </div>
        {/if}   
    {/each}
    </div>
    </div>
    <hr>
{/each}
 
<style>
    div:not(.level-2) {margin-bottom: 1ex;}
    h2 {margin:.75ex 0; font-size: 1.4em;}
    div.level-0 {column-count: 3;}
    div.level-2 {font-size: .9em;}
    .level-0-wrapper {margin-bottom: 2em;}
    .level-1-wrapper {break-inside: avoid; border-left: 1px solid #ccc; padding-left: .75em; margin-left: .75em;}
</style>