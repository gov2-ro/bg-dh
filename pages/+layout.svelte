<script>
// import "@evidence-dev/tailwind/fonts.css";
import "../app.css";
import { EvidenceDefaultLayout } from "@evidence-dev/core-components";
export let data;
</script>

<svelte:head>
 	
</svelte:head>

<header class="fixed w-full top-0 z-40 flex h-12 shrink-0 justify-start items-center gap-x-4 border-b border-gray-200 bg-white/90 backdrop-blur print:hidden ">
	<div class="max-w-full mx-auto px-6 sm:px-8 md:px-12 flex flex-1 items-center justify-between" style="max-width: 1800px;"><div class="flex gap-x-4 items-center">
	<button type="button" class="text-gray-900 hover:bg-gray-50 rounded-lg p-1 transition-all duration-500 md:hidden"><span class="sr-only">Open sidebar</span> <svg class="w-5 h-5" width="100%" height="100%" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round" xmlns="http://www.w3.org/2000/svg"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M4 6l16 0"></path><path d="M4 12l16 0"></path><path d="M4 18l16 0"></path></svg></button> 
	<a href="/" class="text-sm font-bold text-gray-800 hidden md:block">BridgeGap Datahub</a></div> 
	<div class="oo"><ThemesNav /></div>
	<div class="flex gap-2 text-sm items-center"> <div class="flex gap-2 items-center"> <a href="https://twitter.com/bridgegap_eu" class="hover:bg-gray-50 rounded-lg p-2 transition-all duration-200" target="_blank" rel="noreferrer"><svg role="img" viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" class="w-4 h-4 text-gray-900 "><path d="M18.901 1.153h3.68l-8.04 9.19L24 22.846h-7.406l-5.8-7.584-6.638 7.584H.474l8.6-9.83L0 1.154h7.594l5.243 6.932ZM17.61 20.644h2.039L6.486 3.24H4.298Z"></path></svg></a>
	  </div> 
	  <div class="relative"><button type="button" tabindex="0" aria-controls="HDPeYTfsue" aria-expanded="false" data-state="closed" id="YX82Y5dwY_" data-melt-dropdown-menu-trigger="" data-menu-trigger="" class="inline-flex items-center justify-center font-medium whitespace-nowrap transition-colors focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-gray-400 disabled:pointer-events-none disabled:opacity-50 hover:bg-gray-100 hover:text-gray-900 h-8 rounded-md text-xs px-1" aria-label="Menu" data-button-root=""><svg class="h-6 w-6" width="100%" height="100%" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round" xmlns="http://www.w3.org/2000/svg"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M5 12m-1 0a1 1 0 1 0 2 0a1 1 0 1 0 -2 0"></path><path d="M12 12m-1 0a1 1 0 1 0 2 0a1 1 0 1 0 -2 0"></path><path d="M19 12m-1 0a1 1 0 1 0 2 0a1 1 0 1 0 -2 0"></path></svg></button> </div>
	</div></div>
</header>

<EvidenceDefaultLayout 
	{data} title="BridgeGap Datahub" 
	 
	maxWidth=1800
	fullWidth=true
	hideSidebar
	hideHeader
	xProfile="https://twitter.com/bridgegap_eu"
>

	<slot slot="content" />
	
</EvidenceDefaultLayout>
