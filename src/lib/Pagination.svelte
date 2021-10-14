<script>
	export let count;
	export let ipp;
	export let nextLink;
	export let previousLink;
	export let baseUrl;
	export let currentPage;

	const numberOfPages = Math.ceil(count / ipp);
	let urls = [];
	for (let i = 0; i < numberOfPages; ++i) {
		const url = baseUrl + i;
		urls.push(url);
	}
</script>

<div>
	<nav>
		<a href={baseUrl}> &lt; </a>
		{#each urls as url, i}
			<a href={url}>{i + 1}</a>
		{/each}
		<a href={baseUrl}> &gt; </a>
	</nav>
</div>

<style>
	div {
		text-align: center;
		width: 100vw;
		max-width: 75em;
		margin: 40px 0 20px 0;
	}
	a {
		margin: 5px 10px;
	}
</style>
