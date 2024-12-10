<script>
    import { buildQuery } from "@evidence-dev/component-utilities/buildQuery";
    import {QueryLoad} from '@evidence-dev/core-components';
    // import ChevronCircleUp from 'svelte-icons/fa/FaChevronCircleUp.svelte';
    const qThemes = buildQuery("select * from Themes", "nonssr");   
	const qComponents = buildQuery("select * from Components", "nonssr2");   
	const qIndicators = buildQuery("select * from Indicators", "nonssr3");   
</script>
  
  <!-- <div class="icon">    <ChevronCircleUp />  </div> -->
 
<nav>
   
<div class=" ">
    This category has {qThemes.length} entries
    {#each qThemes as theme}
    <QueryLoad qThemes>
        <svelte:fragment slot="skeleton">
         sssxxx
        </svelte:fragment> 
        <svelte:fragment slot="empty" let:loaded={categoryQuery}>
        If you want to have something special appear when the query has no results, uncomment this fragment and fill it in.
        Query is empty!
    </svelte:fragment>
    1 
    </QueryLoad>
    {/each}
</div>
</nav>
 
 