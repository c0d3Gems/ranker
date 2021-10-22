<script>
	export let count;
	export let ipp;
	export let baseUrl;
	export let currentPage;

	const numberOfPages = Math.ceil(count / ipp);
	let urls = [];
	for (let i = 0; i < numberOfPages; ++i) {
		const url = baseUrl + i;
		urls.push(url);
	}
</script>

{#if numberOfPages > 1}
	<div>
		<nav>
			{#if currentPage > 0}
				<a href="{baseUrl}{Number(currentPage) - 1}"> &lt; </a>
			{/if}
			{#each urls as url, i}
				<a href={url}>{i + 1}</a>
			{/each}
			{#if !currentPage}
				<a href="{baseUrl}1"> &gt; </a>
			{:else}
				<a href="{baseUrl}{(Number(currentPage) < numberOfPages - 1) * currentPage + 1}"> &gt; </a>
			{/if}
		</nav>
	</div>
{/if}

<style>
	div {
		text-align: center;
		max-width: 75em;
		margin: 40px 0 20px 0;
	}
	a {
		margin: 5px 2px;
	}
	nav {
		width: inherit;
		text-overflow: clip;
		white-space: normal;
		word-break: break-all;
	}
</style>
