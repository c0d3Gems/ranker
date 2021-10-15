<script context="module">
	export async function load({ page, fetch }) {
		const { idx } = page.params;
		const options = {
			method: 'get',
			headers: {
				'Content-Type': 'application/json'
			}
		};
		const result = await fetch(`/api/scoli/${idx}`, options);
		const countRequest = await fetch('/api/scoli/count');
		const items = await result.json();
		const { count } = await countRequest.json();
		return {
			props: {
				items,
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

	export let items;
	export let count;

	onMount(() => {
		console.log('idx', idx);
	});
</script>

<svelte:head>
	<title>Școli</title>
	<meta name="description" content="Descoperă care sunt cele mai bune școli din orașul tău!" />
</svelte:head>
<Header />
<main>
	<h1>Școli</h1>
	<div class="contextual">
		<nav>
			<a href="/scoli">Școli</a>
			<a href="/scoli/top-100-national">Top 100 național</a>
		</nav>
	</div>
	<div class="content">
		<table>
			<tbody>
				<tr><th>Denumire</th><th>Judet</th><th>Rating</th></tr>
				{#each items as g}
					<tr
						><td><a href="/institutii/{g.id}">{g.institutie}</a></td><td>{g.judet}</td><td>
							<a name="votează această școală" href="/institutii/{g.id}"
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
		<Pagination {count} ipp={30} baseUrl={'/scoli/p/'} />
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
