<script>
	export let materii;

	let teachingLevel;

	const manageRadioClick = (e) => {
		const el = e.target;
		const parentElement = el.parentElement;
		teachingLevel = el.value;
		parentElement.querySelectorAll('input[type=radio]').forEach((r) => {
			r.checked = false;
		});
		el.checked = true;
	};

	// let selectedId;
	// const createProfessor = async () => {};
</script>

<div class="addProfessors">
	<h1>Adaugă Profesor / Educator / Invatator</h1>
	<form>
		<div class="separator">
			Nivel:
			<form action="">
				<input on:click={manageRadioClick} type="radio" id="gradinita" value="gradinita" />
				<label for="gradinita"> Gradinita </label>
				<input on:click={manageRadioClick} type="radio" id="gimnaziu" value="gimnaziu" />
				<label for="gimnaziu"> Gimnaziu </label>
				<input on:click={manageRadioClick} type="radio" id="liceu" value="liceu" />
				<label for="liceu"> Liceu </label>
				<input on:click={manageRadioClick} type="radio" id="universitate" value="universitate" />
				<label for="universitate"> Universitate </label>
			</form>
		</div>
		<div class="separator">
			<div>
				<label> Nume profesor: <input type="text" required /> </label>
			</div>
			<div>
				<label>
					Materie predată: <input list="materie" />
					<datalist id="materie">
						{#if materii?.length > -1}
							{#each materii as m}
								<option data-id={m?.id} value={m?.nume} />
							{/each}
						{/if}
					</datalist>
				</label>
			</div>
		</div>
	</form>
</div>

<style>
	.separator {
		margin-top: 15px;
	}
	.addProfessors {
		box-sizing: border-box;
		padding: 35px;
		border-radius: 20px;
		display: inline-block;
		border-radius: 20px;
		background-color: #eee;
	}
	label {
		/* display: block; */
		margin: 15px 0;
	}
</style>
