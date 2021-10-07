<script>
	import BigSearch from '$lib/BigSearch.svelte';
</script>

<svelte:head>
	<title>Analistul - statistici despre România</title>
	<meta
		name="description"
		content="Ia o decizia corectă, bazată pe informațiile și recenziile românilor."
	/>
	<link rel="canonical" href="https://analistul.com/" />
</svelte:head>

<main>
	<div class="centered">
		<h1>Informații analitice, despre România</h1>
		<center><BigSearch /></center>
	</div>
</main>

<style>
	.centered {
		position: fixed;
		top: 50%;
		transform: translateY(-50%);
		text-align: center;
	}
	h1 {
		font-size: 72px;
		background: -webkit-linear-gradient(45deg, #ec4895, #f59b0d);
		-webkit-background-clip: text;
		background-clip: text;
		-webkit-text-fill-color: transparent;
		margin: 20px;
		display: inline-block;
		width: 100vw;
	}
	main {
		background-image: url('/charts.jpg');
		background-size: cover;
		background-position: center;
		background-attachment: fixed;
		background-repeat: no-repeat;
		width: 100vw;
		height: calc(100vh - 60px);
		text-align: center;
	}
</style>
