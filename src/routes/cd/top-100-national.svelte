<script>
	import Header from '$lib/Header.svelte';
	import Footer from '$lib/Footer.svelte';
	import '../../app.css';
</script>

<Header />
<main>
	<h1>Cadre Didactice - clasament</h1>
	<div class="contextual">
		<nav>
			<a href="/cadre-didactice">Cadre Didactice</a>
			<a href="/cd/top-100-national">Top 100 național</a>
		</nav>
	</div>
	<div class="content">
		<a href="/cd/top/invatatori">Învățători</a>
		<a href="/cd/top/educatori">Educatori</a>
		<a href="/cd/top/profesori">Profesori</a>
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
