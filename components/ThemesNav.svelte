<script>
    import { buildQuery } from "@evidence-dev/component-utilities/buildQuery";
    import { QueryLoad, Skeleton } from '@evidence-dev/core-components';

    // import ChevronCircleUp from 'svelte-icons/fa/FaChevronCircleUp.svelte';
    const qThemes = buildQuery("select * from datahubGsheets.dh_Themes", "nonssr");   
	const qComponents = buildQuery("select * from datahubGsheets.dh_Components", "nonssr2");   
	const qIndicators = buildQuery("select * from datahubGsheets.dh_Indicators", "nonssr3");   
</script>
  
  <!-- <div class="icon">    <ChevronCircleUp />  </div> -->
 
<nav>
   
<div class=" ">
    <QueryLoad data={qThemes} let:loaded>
        <!-- 
            QueryLoad will render a "skeleton" while the query is loading, this disables that,
            otherwise you'll see a flashing box the size of a chart while your query is loading
        -->
        <svelte:fragment slot="skeleton" />
        <ul>
            <!-- We can use the query normally within QueryLoad -->
            {#each loaded as theme}
            <div class="Theme group inline-block"> 
                <button aria-haspopup="true" aria-controls="menu" class="outline-none focus:outline-none  text-sm p-1 bg-slate-900 rounded-sm flex items-center min-w-32"> <span class="xpr-1  flex-1">{theme.Name}</span> <!--<span> &#9013; </span>--> </button>
                <ul id="menu" aria-hidden="true" class="bg-slate-800 border rounded-sm transform scale-0 group-hover:scale-100 absolute origin-top min-w-32 z-10">
                    <QueryLoad data={qComponents} let:loaded>
                        {#each loaded as component}
                        {#if component.Theme == theme.id}
                        <li class="Component rounded-sm relative  hover:bg-slate-700 w-64"> 
                            <button aria-haspopup="true" aria-controls="menu-lang" class="w-full px-3 py-1 text-left flex items-center outline-none focus:outline-none">
                                <span class="pr-1 flex-1">{component.Name}</span>
                            </button>
                            <ul class="absolute top-0 left-full -ml-1 bg-purple-700 border rounded-sm min-w-32 w-64 z-20 delay-200">
                                <QueryLoad data={qIndicators} let:loaded>
                                {#each loaded as indicator}
                                {#if indicator.Component == component.id}
                                <li class="Indicator  hover:bg-sky-900 w-64">
                                    <a class="px-3 py-1 inline-block" href="/indicator/{indicator.id}">{indicator.Name}</a>
                                </li>
                                {/if}            
                          
                                {/each}
                                </QueryLoad>
                            
                            </ul>
                        </li> 
                        {/if}
                        {/each}
                    </QueryLoad>
                    
                </ul>      
            </div>
            {/each}
        </ul>
    </QueryLoad>
</div>
</nav>
 
<style>
    nav:hover .themesWrapper.hidden{display: block !important;}
    @media screen and  (max-width: 768px) {
        
    nav .Theme.inline-block {
        display: block !important;
        }
    }
    @media screen and  (max-width: 960px) {
        nav .themesWrapper.hidden {display: none !important;}
        nav button#mobileToggle {display: inline-block !important;}
        nav:hover .themesWrapper.hidden{display: block !important;}
     
    }
    
    li>ul {transform: translatex(100%) scale(0);}
    li>button svg {transform: rotate(-90deg);}
    li:hover>button svg {transform: rotate(-270deg);}
    li:hover > ul {transform: translatex(-196%) translatey(4px) scale(1); /* Flip to the left */}
    
    
    li.Indicator {min-width: 11em;}

    .group-hover:scale-100 {transform: scale(1);}
    ul:empty,
    li.Component button:has(+ :empty) {display: none;}
</style>