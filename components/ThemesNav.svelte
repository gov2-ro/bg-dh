<script>
    import { buildQuery } from "@evidence-dev/component-utilities/buildQuery";
    // import ChevronCircleUp from 'svelte-icons/fa/FaChevronCircleUp.svelte';
    const qThemes = buildQuery("select * from Themes", "nonssr1");   
	const qComponents = buildQuery("select * from Components", "nonssr2");   
	const qIndicators = buildQuery("select * from Indicators", "nonssr3");   
</script>
  
  <!-- <div class="icon">    <ChevronCircleUp />  </div> -->
 
<nav>
   
<div class=" ">
    <button id="mobileToggle" class="md:hidden">Browse Themes</button>
    <div class="themesWrapper hidden md:block ">
        {#each qThemes as theme}
        <div class="Theme group inline-block"> 
            <button aria-haspopup="true" aria-controls="menu" class="outline-none focus:outline-none  text-sm p-1 bg-slate-900 rounded-sm flex items-center min-w-32"> <span class="xpr-1  flex-1">{theme.Name}</span> <!--<span> &#9013; </span>--> </button>
            <ul id="menu" aria-hidden="true" class="bg-slate-800 border rounded-sm transform scale-0 group-hover:scale-100 absolute origin-top min-w-32 z-10">
                {#each qComponents as component}
                 {#if component.Theme == theme.id}
                <li class="Component rounded-sm relative  hover:bg-slate-700 w-64"> 
                    <button aria-haspopup="true" aria-controls="menu-lang" class="w-full px-3 py-1 text-left flex items-center outline-none focus:outline-none">
                        <span class="pr-1 flex-1">{component.Name}</span>
                    </button>
                    <ul class="absolute top-0 left-full -ml-1 bg-slate-700 border rounded-sm min-w-32 w-64 z-20 delay-200">
                        {#each qIndicators as indicator}
                        {#if indicator.Component == component.id}
                        <li class="Indicator  hover:bg-purple-900 w-64">
                            <a class="px-3 py-1 inline-block" href="/indicator/{indicator.id}">{indicator.Name}</a>
                        </li>
                        {/if}            
                        {/each}
                    </ul>
                </li> 
                {/if}
                {/each}
            </ul>      
        </div>
        {/each}
    </div>
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
    li:hover > ul {transform: translatex(-198%) scale(1); /* Flip to the left */}
    
    
    li.Indicator {min-width: 11em;}

    .group-hover:scale-100 {transform: scale(1);}
    ul:empty,
    li.Component button:has(+ :empty) {display: none;}
</style>