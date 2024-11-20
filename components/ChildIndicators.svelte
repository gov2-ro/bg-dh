<script>
	export let ziComponent;
    export let ziIndicators;   
</script>


{#each ziIndicators as indicator}
{#if indicator.Component === ziComponent}
<a class="markdown" href="/indicator/{indicator.id}">{indicator.Name}</a> &nbsp;
{/if}
{/each}


