<script>
    import { buildQuery } from "@evidence-dev/component-utilities/buildQuery";
    // import ChevronCircleUp from 'svelte-icons/fa/FaChevronCircleUp.svelte';

    // export let ziTheme; // if to show a single theme?
    const qThemes = buildQuery("select * from Themes", "nonssr");   
	const qComponents = buildQuery("select * from Components", "nonssr");   
	const qIndicators = buildQuery("select * from Indicators", "nonssr");   
</script>

  
  <!-- <div class="icon">
    <ChevronCircleUp />
  </div> -->
 


{#each qThemes as theme}
<div class="level-0-wrapper mb-8 pb-8">
    <h2 class="bg-sky-200 px-3 pt-1 pb-0 text-xl rounded-t inline-block font-bold">{theme.Name}</h2>
    <div class="xdescription text-lg bg-sky-200 p-3  pb-4 rounded-bl rounded-br rounded-tr leading-tight text-base" style="max-width: 45em;">  {theme.Description}</div>
    <div class="level-0   xl:columns-2 2xl:columns-3 pt-2">
    {#each qComponents as component}
        {#if component.ThemeID == theme.ID}
        <div class="level-1-wrapper p-0 rounded shadow mb-4 border border-sky-300 leading-tight">
            <h3 class="border-b border-sky-400 bg-sky-200 px-2 py-2 font-bold"> {component.Name}</h3>     
            <div class="description bg-sky-50 p-3 ">{component.Description}</div>
            <div class="level-1 px-3 py-2 bg-yellow-50 border-t border-sky-300 ">
            {#each qIndicators as indicator}        
                {#if indicator.Component == component.id}
                <div class="level-2 mt-1 mb-2">
                    <h4> <b><a href="/indicator/{indicator.id}" class="markdown">{indicator.Name}</a></b></h4>                    
                    <div class="description text-sm">{indicator.Description}</div>
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
    <hr>
{/each}
 
<style>
    div:empty {display: none;}  
    .level-1-wrapper {break-inside: avoid;  }
    .description {  max-width: 60em;}
</style>