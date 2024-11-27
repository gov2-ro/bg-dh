<!-- TODO: make it interactive -->

<script>
    import { onMount } from "svelte";
    export let src;
    let svgContent = "";

    async function loadSVG() {
        try {
            const response = await fetch(src);
            if (!response.ok) {
                throw new Error(`Failed to load SVG: ${response.statusText}`);
            }
            svgContent = await response.text();
        } catch (error) {
            console.error("Error fetching the SVG:", error);
            svgContent = "<!-- Failed to load SVG -->";
        }
    }

    onMount(() => {
        loadSVG();
    });
</script>

{@html svgContent}

 