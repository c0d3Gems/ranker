<script context="module">
	export async function load({ page, fetch, params }) {
		const request = await fetch('/institutii/getInfo');
		const institutionInfo = await request.json();
		return {
			props: { institutionInfo }
		};
	}
</script>

<script>
	import Header from '$lib/Header.svelte';
	import Footer from '$lib/Footer.svelte';
	export let institutionInfo;
</script>

<Header />
<main>{JSON.stringify(institutionInfo)}</main>

<Footer />
