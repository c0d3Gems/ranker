<script context="module">
	export async function load({ page, fetch }) {
		const { idx } = page.params;
		const options = {
			method: 'get',
			headers: {
				'Content-Type': 'application/json'
			}
		};
		const result = await fetch(`/api/gradinite/${idx}`, options);
		const countRequest = await fetch('/api/gradinite/count');
		const gradinite = await result.json();
		const { count } = await countRequest.json();
		return {
			props: {
				gradinite,
				count,
				idx
			}
		};
	}
</script>

<script>
	import Header from '$lib/Header.svelte';
	import Footer from '$lib/Footer.svelte';
	import Pagination from '$lib/Pagination.svelte';
	import '../../../app.css';
	import { onMount } from 'svelte';

	export let gradinite;
	export let count;

	onMount(() => {
		console.log('idx', idx);
	});
</script>

<svelte:head>
	<title>Grădinițe</title>
	<meta name="description" content="Descoperă care sunt cele mai bune grădinițe din orașul tău!" />
</svelte:head>
<Header />
<main>
	<h1>Grădinițe</h1>
	<div class="contextual">
		<nav>
			<a href="/gradinite">Grădinițe</a>
			<a href="/gradinite/top-100-national">Top 100 național</a>
		</nav>
	</div>
	<div class="content">
		<table>
			<tbody>
				<tr><th>Denumire</th><th>Judet</th><th>Rating</th></tr>
				{#each gradinite as g}
					<tr
						><td><a href="/institutii/{g.id}">{g.institutie}</a></td><td>{g.judet}</td><td>
							<a name="votează această grădiniță" href="/institutii/{g.id}"
								><div class="rating">
									<span class="fa fa-star checked" />
									<span class="fa fa-star checked" />
									<span class="fa fa-star checked" />
									<span class="fa fa-star" />
									<span class="fa fa-star" />
								</div></a
							>
						</td></tr
					>
				{/each}
			</tbody>
		</table>
		<Pagination {count} ipp={30} baseUrl={'/gradinite/p/'} />
	</div>
</main>
<Footer />

<style>
	.content {
		max-width: 75em;
		padding: 15px;
		box-sizing: border-box;
		min-height: calc(100vh - 180px);
		position: relative;
		left: 50%;
		transform: translateX(-50%);
		text-align: center;
	}
	td,
	th {
		text-align: left;
		padding: 5px 10px;
		box-sizing: border-box;
	}
	td:last-child {
		text-align: right;
		min-width: 113px;
	}
	td:last-child a:hover {
		text-decoration: none;
	}
</style>
