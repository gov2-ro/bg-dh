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
    <h2><b>{theme.Name}</b></h2>
    <div class="description"><span class="bg-lime-50 p-1">{theme.Description}</span></div>
    <div class="level-0">
    {#each qComponents as component}
        {#if component.ThemeID == theme.ID}
        <div class="level-1-wrapper">
            <h3> <b>{component.Name}</b></h3>
            <div class="description">{component.Description}</div>
            <Details title="Indicators" class="mt-0 xx">
            <div class="level-1">
            {#each qIndicators as indicator}        
                {#if indicator.Component == component.id}
                <div class="level-2">
                <h4> <b><a href="/indicator/{indicator.id}" class="markdown">{indicator.Name}</a></b></h4>                    
                <div class="description">{indicator.Description}</div>
                </div>
                
                {/if}
            {/each}
        </div>
    </Details>
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
    div:not(.level-2) {margin-bottom: 1ex;}
    h2 {margin:.75ex 0; font-size: 1.4em;}
    
    .level-2 {font-size: .9em;}
    
    .level-1-wrapper {break-inside: avoid;  }
    .description {font-size: .9em; color: #666; margin-bottom: 1ex; line-height: 1.2; max-width: 60em;}
    .level-0-wrapper .description {line-height: 1.4;}
    .level-0-wrapper >  .description {color: black; font-size: 1.1em;}
    .level-1-wrapper >  .description {color: black; }
    .level-2 .description {line-height: 1.2;}
    @media (max-width: 1480px) {
        .level-0 {column-count: 2;}
    }
    @media (max-width: 800px) {
        .level-0 {column-count: 1;}
    }
    @media (min-width: 1480px) {
        .level-0 {column-count: 3;}
    }
    .icon {
      color: red;
      width: 32px;
      height: 32px;
    }
     .mb-4.mt-3 {margin-top: 0 !important; background-color: #f9f900; }
</style>