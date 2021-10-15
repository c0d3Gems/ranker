<script>
	import Header from '$lib/Header.svelte';
	import Footer from '$lib/Footer.svelte';
	import '../../app.css';
</script>

<Header />
<main>
	<h1>Instituții de învățământ</h1>
	<div class="contextual">
		<nav>
			<a href="/institutii">Instituții</a>
			<a href="/institutii/top-100-national">Top 100 național</a>
		</nav>
	</div>
	<div class="content">
		<a href="/gradinite">Grădinițe</a>
		<a href="/scoli">Școli Gimnaziale</a>
		<a href="/colegii">Colegii</a>
		<a href="/licee">Licee</a>
		<a href="/postliceale">Postliceale</a>
		<a href="/universitati">Universități</a>
		<a href="/academii">Academii</a>
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
