<script>
	const performSearch = async () => {};
</script>

<input
	type="search"
	placeholder="Caută profesor, școală, universitate..."
	on:keyup={performSearch}
/>

<style>
	input[type='search'] {
		appearance: search;
		-webkit-appearance: search;
		background-color: #eee;
		border-radius: 16px;
		padding: 5px 10px;
		box-sizing: border-box;
		vertical-align: middle;
	}
</style>
