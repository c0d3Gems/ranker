<script context="module">
	export async function load({ page, fetch }) {
		const { id } = page.params;
		const options = {
			method: 'get',
			headers: {
				'Content-Type': 'application/json'
			}
		};
		const request = await fetch(`/api/institutii/${id}`, options);
		const institutionInfo = await request.json();
		return {
			props: { institutionInfo }
		};
	}
</script>

<script>
	import '../../app.css';
	import Header from '$lib/Header.svelte';
	import Footer from '$lib/Footer.svelte';
	export let institutionInfo;
</script>

<Header />
<main>
	<div class="content">
		<div class="head">
			<div class="hl1">
				<div class="pimg" />
			</div>
			<div class="hl2">
				<h1>{institutionInfo[0]?.institutie}</h1>
			</div>
		</div>
		<!-- {JSON.stringify(institutionInfo)} -->
	</div>
</main>

<Footer />

<style>
	.head {
		line-height: 100px;
	}
	.pimg {
		width: 100px;
		height: 100px;
		background-color: black;
		border-radius: 20px;
	}
	.hl1,
	.hl2 {
		display: inline-block;
		vertical-align: middle;
	}
	.hl1 {
		width: 120px;
	}
	.hl2 {
		width: calc(99% - 120px);
	}
	.hl1 > *,
	.hl2 > * {
		vertical-align: middle;
	}
	h1 {
		display: inline-block;
		width: fit-content;
		font-size: 16pt;
	}
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
