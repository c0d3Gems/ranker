<script>
	import BigSearch from '$lib/BigSearch.svelte';
	import Header from '$lib/Header.svelte';
	import Footer from '$lib/Footer.svelte';
	import '../app.css';
	import { onMount } from 'svelte';

	let showcontextual = false;
	onMount(async () => {
		if (!window.googleSignIn) {
			window.googleSignIn = async (googleUser) => {
				console.log(googleUser);
				// do stuff here

				// const responsePayload = decodeJwtResponse(response.credential);
				// console.log('ID: ' + responsePayload.sub);
				// console.log('Full Name: ' + responsePayload.name);
				// console.log('Given Name: ' + responsePayload.given_name);
				// console.log('Family Name: ' + responsePayload.family_name);
				// console.log('Image URL: ' + responsePayload.picture);
				// console.log('Email: ' + responsePayload.email);
				// console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
			};
		}
		if (!window.googleSignOut) {
			window.googleSignOut = () => {
				var auth2 = gapi.auth2.getAuthInstance();
				auth2.signOut().then(function () {
					console.log('User signed out.');
				});
			};
		}
	});
</script>

<svelte:head>
	<title>Autentificare - Analistul.com</title>
	<meta name="description" content="Pagina de autentificare in contul tau Analistul.com." />
	<link rel="canonical" href="https://analistul.com/" />
</svelte:head>

<Header />
<main>
	<div class="content">
		<div class="box">
			<h1>Autentificare</h1>
			<script src="https://accounts.google.com/gsi/client" async defer></script>
			<center>
				<div
					id="g_id_onload"
					data-client_id="544606774946-pjhe7mqeembpn2hbk43g7lfi28ni12qi"
					data-callback="googleSignIn"
					data-auto_select="true"
					data-auto_prompt="false"
				/>
				<div
					class="g_id_signin"
					data-type="standard"
					data-size="large"
					data-theme="outline"
					data-text="sign_in_with"
					data-shape="rectangular"
					data-logo_alignment="left"
				/>
			</center>
			<div class="disclaimer">
				<p>
					Pentru a preveni spam-ul pe forumurile si platformele noastre, folosim ca singura metodă
					de autentificare, cea de la Google.
				</p>
				<p>
					Folosirea, înregistrarea, autentificarea pe această platformă / forum denotă acceptarea
					utilizatorului a <a href="/confidentialitate">Politicilor Cookie & Confidențialitate</a>
					împreună cu acordul respectării
					<a href="/termeni-si-conditii">Termenilor și Condițiilor</a> acestui site.
				</p>
			</div>
		</div>
	</div>
</main>
<Footer />

<style>
	.disclaimer {
		margin-top: 10px;
	}
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
		min-height: 90vw;
	}
</style>
