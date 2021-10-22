<script>
	import Header from '$lib/Header.svelte';
	import Footer from '$lib/Footer.svelte';
	import '../../app.css';
</script>

<svelte:head>
	<title>Învățători - Analistul.com</title>
	<meta
		name="description"
		content="Descoperă care sunt cei mai buni învățători din România, dar și la nivel regional. Ia o decizie informată pentru viitorul copilului tău."
	/>
	<link rel="canonical" href="https://analistul.com/invatatori" />
</svelte:head>

<Header />
<main>
	<h1>Învățători</h1>
	<div class="contextual">
		<nav>
			<a href="/invatatori">Învățători</a>
			<a href="/invatatori/top-national">Clasament național</a>
		</nav>
	</div>
</main>
<Footer />
