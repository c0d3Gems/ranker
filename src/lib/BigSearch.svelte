<script>
	let searchValue;
	let results;
	const findSuggestions = async () => {
		const result = await fetch(`/search/`);
		const json = await result.json();
		results = json;
	};
</script>

<input
	placeholder="Caută profesor, școală, instituție"
	type="search"
	aria-label="Caută"
	bind:value={searchValue}
	on:keyup={findSuggestions}
/>
{#if results}
	{#each results as r}
		<div>{r.name}</div>
	{/each}
{/if}

<style>
	input[type='search'] {
		appearance: search;
		-webkit-appearance: search;
		background-color: #eee;
		border-radius: 16px;
		border-width: 0;
		box-sizing: border-box;
		font-size: 14pt;
		padding: 10px 25px;
		min-width: 200px;
		width: 33vw;
	}
</style>
