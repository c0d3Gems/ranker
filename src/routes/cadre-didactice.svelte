<script context="module">
	export async function load({ fetch }) {
		const result = await fetch(`/api/materii`);
		const materii = await result.json();

		return {
			props: {
				materii
			}
		};
	}
</script>

<script>
	import Header from '$lib/Header.svelte';
	import Footer from '$lib/Footer.svelte';
	import AddProfessors from '$lib/AddProfessors.svelte';
	import '../app.css';

	export let materii;
</script>

<svelte:head>
	<title>Cadre Didactice - Analistul.com</title>
	<meta
		name="description"
		content="Accesează toate categoriile de cadre didactice disponibile pe analistul.com"
	/>
	<link rel="canonical" href="https://analistul.com/cadre-didactice" />
</svelte:head>

<Header />
<main>
	<h1>Cadre Didactice</h1>
	<div class="contextual">
		<nav>
			<a href="/cadre-didactice">Cadre Didactice</a>
			<a href="/cd/top-100-national">Top 100 național</a>
		</nav>
	</div>
	<div class="content">
		<a href="/invatatori">Învățători</a>
		<a href="/educatori">Educatori</a>
		<a href="/profesori">Profesori</a>
		<AddProfessors {materii} />
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
	}
	.content a {
		background-color: black;
		color: white;
		padding: 5px 10px;
		box-sizing: border-box;
		display: block;
		margin: 15px 0;
		font-size: 25px;
	}
</style>
