<script>
	let searchValue;
	let results;

	const onChange = () => {
		if (!searchValue) results = null;
	};
	const findSuggestions = async () => {
		if (!searchValue) {
			results = undefined;
			return;
		}
		const result = await fetch(`/search/${searchValue}`);
		const json = await result.json();
		results = json;
	};
</script>

<input
	placeholder="Caută cadre didactice sau instituție de învățământ"
	type="search"
	aria-label="Caută"
	bind:value={searchValue}
	on:keyup={findSuggestions}
	on:change={onChange}
/>
{#if results}
	<div class="results">
		{#each results as r}
			<a href="/institutii/{r.id}">
				<div class="r">
					{r.institutie}
					<span class="right">
						&bullet; {r.judet}
					</span>
				</div>
			</a>
		{/each}
	</div>
{/if}

<style>
	span.right {
		float: right;
	}
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
		width: 60vw;
	}
	.results {
		background-color: white;
		text-align: left;
		box-sizing: border-box;
		padding: 5px 10px;
		max-height: 40vh;
		overflow-y: auto;
		width: 60vw;
		font-size: 10pt;
	}
	.r {
		margin: 5px 10px;
	}
	@media (min-width: 800px) {
		input[type='search'] {
			width: 600px;
		}
	}
</style>
