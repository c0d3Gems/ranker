<script context="module">
	export async function load({ page, fetch }) {
		const classListFetch = await fetch('https://analistul.com/classes.json');
		const classList = await classListFetch.json();
		return {
			props: {
				classList
			}
		};
	}
</script>

<script>
	import Header from '$lib/Header.svelte';
	import Footer from '$lib/Footer.svelte';
	import '../../app.css';
	export let classList;
</script>

<Header />
<main>
	<h1>Profesori (top 50 la nivel național)</h1>
	<div class="contextual">
		<nav>
			<a href="/profesori">Profesori</a>
			<a href="/profesori/top-national">Clasament național</a>
			<a href="/profesori/top-50-national">Top 50 național</a>
			<a href="/profesori/top-100-national">Top 100 național</a>
			<a href="/profesori/top-500-national">Top 500 național</a>
			<br />
			<span>Clasamentul profesorilor:</span>
			{#if classList}
				{#each Object.keys(classList) as c}
					<a href="/profesori/top/{c}">{classList[c]}</a>
				{/each}
			{/if}
		</nav>
	</div>
</main>
<Footer />
