<script>
	import Header from '$lib/Header.svelte';
	import Footer from '$lib/Footer.svelte';
	import '../app.css';
	import { onMount } from 'svelte';

	let showcontextual = false;
	onMount(async () => {
		const session = localStorage.getItem('ses');
		// delete ses
		const options = {
			method: 'delete',
			headers: {
				'Content-Type': 'application/json',
				authorization: session
			}
		};
		const req = await fetch(`/api/logout`, options);
		const result = await req.json();
		localStorage.removeItem('ses');
	});
</script>

<Header />
<main>
	<div class="content">
		<div class="box">
			<center> <h1>Te-ai deconectat cu succes!</h1></center>
			<nav>
				<a href="/">Pagina Principală</a>
				<a href="/institutii">Instituții</a>
				<a href="/cadre-didactice">Cadre Didactice</a>
				<a href="/blog">Blog</a>
			</nav>
		</div>
	</div>
</main>
<Footer />

<style>
	.box {
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		height: 30vh;
		width: 90vw;
		max-width: 35em;
		box-sizing: border-box;
		padding: 35px;
	}
	.content {
		min-height: 90vh;
	}
	nav a {
		margin: 0 5px;
	}
	nav {
		text-align: center;
	}
</style>
