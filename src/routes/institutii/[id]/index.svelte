<script context="module">
	export async function load({ page, fetch, params }) {
		const institutionId = page?.params?.id;
		const request = await fetch(`/api/institutii/${institutionId}`);
		const reviewRequest = await fetch(`/api/institutii/${institutionId}/reviews`);
		const institutionInfo = await request.json();
		const reviews = await reviewRequest.json();

		// const ldJson = `<script type="application/ld+json">{
		// 	"@context": "https://schema.org/",
		// 	"@type": "Product",
		// 	"name": "` + institutionInfo[0]?.institutie +`",
		// 	"aggregateRating": {
		// 		"@type": "AggregateRating",
		// 		"ratingValue": "3",
		// 		"bestRating": "5",
		// 		"worstRating": "1",
		// 		"ratingCount": "2552"
		// 	}
		// 	}`

		return {
			props: { institutionInfo, reviews }
		};
	}
</script>

<script>
	import '../../../app.css';
	import Header from '$lib/Header.svelte';
	import Footer from '$lib/Footer.svelte';
	import { onMount } from 'svelte';
	export let institutionInfo;
	export let reviews;
	// export let ldJson;

	let userAuthenticated;
	let userSession;
	let done = false;
	let ownRatingConditions;
	let ownRatingFeatures;
	let ownRatingEquipment;
	let ownRatingUtilities;
	let ownRatingText;

	onMount(async () => {
		const session = localStorage.getItem('ses');
		if (session) {
			userAuthenticated = true;
			userSession = session;
		} else {
			userAuthenticated = false;
		}
	});
	const onClickStars = (e) => {
		done = false;
		const parentElement = e.target.parentElement;
		const stars = [...parentElement.querySelectorAll('.fa.fa-star')];
		stars.forEach((s) => {
			s.classList.remove('checked');
		});
		stars.forEach((s, i) => {
			if (done) return;
			if (s !== e.target) s.classList.add('checked');
			else {
				s.classList.add('checked');
				done = true;
				// ownRating = i + 1;
				// console.log(ownRating);
				const dataContext = parentElement.getAttribute('data-context');
				if (dataContext === 'conditii') {
					ownRatingConditions = i + 1;
				} else if (dataContext === 'facilitati') {
					ownRatingFeatures = i + 1;
				} else if (dataContext === 'dotari') {
					ownRatingEquipment = i + 1;
				} else if (dataContext === 'utilitati') {
					ownRatingUtilities = i + 1;
				}
			}
		});
	};
	const submitForm = async () => {
		if (userAuthenticated) {
			const institutionId = institutionInfo[0].id;
			if (
				!ownRatingConditions ||
				ownRatingConditions === 0 ||
				!ownRatingFeatures ||
				ownRatingFeatures === 0 ||
				!ownRatingEquipment ||
				ownRatingEquipment === 0 ||
				!ownRatingUtilities ||
				ownRatingUtilities === 0
			) {
				window.alert(
					'Nu ai dat cel puțin o steluță. Minimul este o steluță pentru fiecare categorie.'
				);
			}
			const options = {
				method: 'post',
				headers: {
					'Content-Type': 'application/json',
					Authorization: userSession
				},
				body: JSON.stringify({
					userId: Number(userSession.split('-')[1]),
					institutionId,
					ownRatingConditions,
					ownRatingFeatures,
					ownRatingEquipment,
					ownRatingUtilities,
					ownRatingText
				})
			};
			const submitReview = await fetch('/api/institutii/review', options);
			const result = await submitReview.json();
		}
	};
	const deleteReview = async (e) => {
		const element = e.target;
		const reviewId = e.getAttribute('data-id');
		const institutionId = institutionInfo[0].id;
		if (userAuthenticated) {
			const options = {
				method: 'delete',
				headers: {
					'Content-Type': 'application/json',
					Authorization: userSession
				},
				body: JSON.stringify({
					reviewId,
					institutionId
				})
			};
			const deleteReview = await fetch('/api/institutii/review', options);
			const result = await submitReview.json();
		}
	};
</script>

<svelte:head>
	<title>{institutionInfo[0]?.institutie} - Analistul.com</title>
	<meta
		name="description"
		content="Recenzii, păreri, și alte informații despre {institutionInfo[0]?.institutie}."
	/>
	<!-- {ldJson} -->
</svelte:head>

<Header />
<main>
	<div class="content">
		<div class="head">
			<div class="hl1">
				<div class="profileImg">
					<img src="/school.svg" alt="instituție" />
				</div>
			</div>
			<div class="hl2">
				<h1>{institutionInfo[0]?.institutie}</h1>
			</div>
		</div>
		<div class="ctx">
			<!-- {JSON.stringify(institutionInfo)} -->
			<a href="#informatii">Informații</a>
			<a href="#recenzii">Recenzii</a>
		</div>
		<section id="informatii">
			<h2>Informații</h2>
			<div>Județ: <span>{institutionInfo[0]?.judet}</span></div>
			<div>Instituție privată: <span>{institutionInfo[0]?.private || 'N / A'}</span></div>
		</section>
		<section id="recenzii">
			<h2>Recenzii</h2>
			<div class="rc" style={!userAuthenticated ? 'width: 100%;' : ''}>
				{#each reviews?.payload as r}
					<div class="r" data-userId={r?.id_utilizator}>
						<!-- <div class="stars"> -->
						<tr
							><td> Condiții:</td><td>
								<span class="fa fa-star {r?.nota_conditii >= 1 ? 'checked' : null}" />
								<span class="fa fa-star {r?.nota_conditii >= 2 ? 'checked' : null}" />
								<span class="fa fa-star {r?.nota_conditii >= 3 ? 'checked' : null}" />
								<span class="fa fa-star {r?.nota_conditii >= 4 ? 'checked' : null}" />
								<span class="fa fa-star {r?.nota_conditii >= 5 ? 'checked' : null}" /></td
							></tr
						>
						<tr>
							<td>Facilități:</td>
							<td>
								<span class="fa fa-star {r?.nota_facilitati >= 1 ? 'checked' : null}" />
								<span class="fa fa-star {r?.nota_facilitati >= 2 ? 'checked' : null}" />
								<span class="fa fa-star {r?.nota_facilitati >= 3 ? 'checked' : null}" />
								<span class="fa fa-star {r?.nota_facilitati >= 4 ? 'checked' : null}" />
								<span class="fa fa-star {r?.nota_facilitati >= 5 ? 'checked' : null}" />
							</td>
						</tr>
						<tr>
							<td>Dotări:</td>
							<td>
								<span class="fa fa-star {r?.nota_dotari >= 1 ? 'checked' : null}" />
								<span class="fa fa-star {r?.nota_dotari >= 2 ? 'checked' : null}" />
								<span class="fa fa-star {r?.nota_dotari >= 3 ? 'checked' : null}" />
								<span class="fa fa-star {r?.nota_dotari >= 4 ? 'checked' : null}" />
								<span class="fa fa-star {r?.nota_dotari >= 5 ? 'checked' : null}" /></td
							></tr
						>
						<tr
							><td> Utilități:</td><td>
								<span class="fa fa-star {r?.nota_utilitati >= 1 ? 'checked' : null}" />
								<span class="fa fa-star {r?.nota_utilitati >= 2 ? 'checked' : null}" />
								<span class="fa fa-star {r?.nota_utilitati >= 3 ? 'checked' : null}" />
								<span class="fa fa-star {r?.nota_utilitati >= 4 ? 'checked' : null}" />
								<span class="fa fa-star {r?.nota_utilitati >= 5 ? 'checked' : null}" /></td
							></tr
						>
						<div class="msg">{r?.text}</div>
					</div>
				{/each}
			</div>
			{#if userAuthenticated}
				<div class="cr">
					<h3>Părerea mea:</h3>
					<div class="r">
						<div class="stars" data-context="conditii">
							Condiții:
							<span on:click={onClickStars} class="fa fa-star" />
							<span on:click={onClickStars} class="fa fa-star" />
							<span on:click={onClickStars} class="fa fa-star" />
							<span on:click={onClickStars} class="fa fa-star" />
							<span on:click={onClickStars} class="fa fa-star" />
							<div class="explaination">
								1 steluta daca e cladire veche, neintretinuta. 5 stele daca este o cladire noua, sau
								reconditionata dupa ultimele standarde
							</div>
						</div>
						<div class="stars" data-context="facilitati">
							Facilități:
							<span on:click={onClickStars} class="fa fa-star" />
							<span on:click={onClickStars} class="fa fa-star" />
							<span on:click={onClickStars} class="fa fa-star" />
							<span on:click={onClickStars} class="fa fa-star" />
							<span on:click={onClickStars} class="fa fa-star" />
							<div class="explaination">
								1 steluta daca NU se pot accesa toaletele si alte facilitati de baza ale cladirii. 5
								stele daca se pot accesa de catre personal si studenti / elevi / copii.
							</div>
						</div>
						<div class="stars" data-context="dotari">
							Dotări:
							<span on:click={onClickStars} class="fa fa-star" />
							<span on:click={onClickStars} class="fa fa-star" />
							<span on:click={onClickStars} class="fa fa-star" />
							<span on:click={onClickStars} class="fa fa-star" />
							<span on:click={onClickStars} class="fa fa-star" />
							<div class="explaination">
								1 steluta daca institutia NU este conforma normelor de protectie a muncii.<br />
								5 stelute daca institutia este conforma normelor de protectie a muncii.
							</div>
						</div>
						<div class="stars" data-context="utilitati">
							Utilități:
							<span on:click={onClickStars} class="fa fa-star" />
							<span on:click={onClickStars} class="fa fa-star" />
							<span on:click={onClickStars} class="fa fa-star" />
							<span on:click={onClickStars} class="fa fa-star" />
							<span on:click={onClickStars} class="fa fa-star" />
							<div class="explaination">
								1 steluta daca echipamentele tehnologice, si alte utilitati din aceasta institutie
								sunt inexistente sau foarte vechi. 5 stelute daca sunt foarte noi, si nu exista
								lipsuri.
							</div>
						</div>
						<div>Alte mențiuni</div>
						<textarea
							bind:value={ownRatingText}
							maxlength="3800"
							name="comentariu"
							id="comment"
							rows="10"
							aria-label="comentariu"
						/>
						<input type="submit" value="Trimite" on:click={submitForm} />
					</div>
				</div>
			{/if}
		</section>
	</div>
</main>

<Footer />

<style>
	.msg {
		margin-top: 10px;
	}
	.explaination {
		font-size: 10pt;
		font-weight: bold;
	}
	.cr .fa.fa-star {
		cursor: pointer;
	}
	.rc,
	.cr {
		box-sizing: border-box;
		padding: 15px;
	}
	.r {
		margin-bottom: 30px;
		width: 100%;
	}
	textarea {
		width: 100%;
		min-width: 100%;
		max-width: 100%;
		resize: vertical;
	}
	input[type='submit'] {
		margin-top: 10px;
		display: block;
		background-color: black;
		color: white;
		-o-appearance: none;
		-moz-appearance: none;
		-webkit-appearance: none;
		appearance: none;
		border-radius: 6px;
		padding: 5px 15px;
		font-size: 12pt;
		float: right;
		border: 0;
		cursor: pointer;
	}
	section {
		margin-top: 80px;
		display: block;
	}
	#recenzii {
		height: 900px;
	}
	#recenzii > div {
		width: 50%;
		float: left;
		overflow-y: auto;
		max-height: 800px;
	}
	#recenzii .r {
		box-sizing: border-box;
		padding: 35px;
		border-radius: 20px;
		display: inline-block;
		border-radius: 20px;
		background-color: #eee;
	}
	.ctx a {
		display: inline-block;
		background-color: #222;
		box-sizing: border-box;
		padding: 5px 15px;
		border-radius: 6px;
		margin-right: 10px;
		color: white;
	}
	#recenzii .stars {
		margin-bottom: 10px;
	}
	#informatii > div {
		width: 50%;
		float: left;
		margin-bottom: 30px;
	}
	.profileImg img {
		position: relative;
		left: 50%;
		top: 50%;
		transform: translate(-50%, -50%);
		width: 40%;
	}
	.head {
		margin-bottom: 20px;
	}
	.profileImg {
		width: 100px;
		height: 100px;
		background-color: #eee;
		border-radius: 20px;
		overflow: hidden;
	}
	.hl1,
	.hl2 {
		display: inline-block;
		vertical-align: middle;
	}
	.hl2 {
		line-height: 100px;
		max-width: calc(100% - 130px);
		margin-left: 20px;
	}
	.hl2 > * {
		vertical-align: middle;
	}
	h1 {
		display: inline-block;
		line-height: normal;
	}
	.content {
		max-width: 75em;
		padding: 15px;
		box-sizing: border-box;
		min-height: calc(100vh - 180px);
		position: relative;
		left: 50%;
		transform: translateX(-50%);
		margin-bottom: 35px;
	}
	/* .content a {
		background-color: black;
		color: white;
		padding: 5px 10px;
		box-sizing: border-box;
		display: block;
		margin: 15px 0;
		font-size: 25px;
	} */
	@media (max-width: 600px) {
		#recenzii > div {
			width: 100%;
			float: unset;
			overflow-y: auto;
			max-height: 500px;
		}
	}
</style>
