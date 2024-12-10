<script>
// import "@evidence-dev/tailwind/fonts.css";
import "../app.css";
import { EvidenceDefaultLayout } from "@evidence-dev/core-components";
    import ThemesNav from "../components/ThemesNav.svelte";
export let data;
</script>

<svelte:head>
 	
</svelte:head>
 
<header class="fixed w-full top-0 z-40 flex h-12 shrink-0 justify-start items-center gap-x-4 border-b border-gray-200  backdrop-blur print:hidden bg-slate-900 text-white  ">
	<div class=" max-w-full mx-auto px-6 sm:px-8 md:px-12 flex flex-1 items-center justify-between" style="max-width: 1800px;">
		<div class="flex gap-x-4 items-center">
	<!--	<button type="button" class="text-gray-900 hover:bg-gray-50 rounded-lg p-1 transition-all duration-500 md:hidden"><span class="sr-only">Open sidebar</span> <svg class="w-5 h-5" width="100%" height="100%" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round" xmlns="http://www.w3.org/2000/svg"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M4 6l16 0"></path><path d="M4 12l16 0"></path><path d="M4 18l16 0"></path></svg></button> -->
	 	
		<a href="/" class="text-sm leading-none  block" style="width: 8em;"><img src="/assets/icon strong negative mono.svg" style="height: 2.75em;" alt="BridgeGap" class="float-start mr-2" /><div class="" style="font-size: 1.15em;"><small class="text-gray-300">BridgeGap</small> <br/> <b>Datahub</b></div></a>
	</div>    
 
  <ThemesNav />   

	<div class="flex gap-2 text-sm items-center ">  
		&rarr; <a href="https://corruptiondata.eu/" title="back to BridgeGap">
			<img src="/assets/icon strong negative.png" style="height: 2.5em;" alt="BridgeGap" /></a>
		<!-- <div class="leading-none">
		<a href="https://corruptiondata.eu/"><small>back to &rarr;</small><br/>BridgeGap</a> </div> -->
	</div></div>
</header>

<div class="my-5">&nbsp;</div>

<EvidenceDefaultLayout 
	{data} title="BridgeGap Datahub" 
	 
	maxWidth=1800
	fullWidth=true
	hideSidebar
	hideHeader
	hideTOC
	hideBreadcrumbs=false
	xProfile="https://twitter.com/bridgegap_eu"
>

	<slot slot="content" />
	
</EvidenceDefaultLayout>

 