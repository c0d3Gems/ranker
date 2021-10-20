<script>
	import BigSearch from '$lib/BigSearch.svelte';
	import Header from '$lib/Header.svelte';
	import Footer from '$lib/Footer.svelte';
	import '../app.css';
	import { onMount } from 'svelte';
	onMount(() => {
		window.document.body.style = 'overflow-x: hidden;';
	});
</script>

<svelte:head>
	<title>Analistul - Statistici despre România</title>
	<meta
		name="description"
		content="Ia o decizia corectă, bazată pe informațiile și recenziile românilor."
	/>
	<link rel="canonical" href="https://analistul.com/" />
</svelte:head>

<Header />
<main>
	<div class="centered">
		<h1>Informații analitice, despre România</h1>
		<center><BigSearch /></center>
	</div>
</main>
<Footer />

<style>
	.centered {
		position: absolute;
		top: 50%;
		transform: translateY(-50%);
		text-align: center;
		width: 100vw;
	}
	h1 {
		font-size: 5vw;
		background: -webkit-linear-gradient(45deg, #ec4895, #f59b0d);
		-webkit-background-clip: text;
		background-clip: text;
		-webkit-text-fill-color: transparent;
		margin: 20px;
		display: inline-block;
		width: fit-content;
	}
	main {
		background-image: url('/charts.jpg');
		background-size: cover;
		background-position: center;
		background-attachment: fixed;
		background-repeat: no-repeat;
		max-width: 100vw;
		text-align: center;
		overflow-x: hidden;
		width: 100vw;
		position: relative;
		min-height: 100vh;
		background-color: black;
		margin-top: 0;
		padding-top: 0;
	}
</style>
