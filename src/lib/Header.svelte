<script>
	let showcontextual = false;
	import { onMount } from 'svelte';
	onMount(async () => {
		// if (!window.googleSignIn) {
		// 	window.googleSignIn = async (googleUser) => {
		// 		console.log(googleUser);
		// 		// do stuff here
		// 		// const responsePayload = decodeJwtResponse(response.credential);
		// 		// console.log('ID: ' + responsePayload.sub);
		// 		// console.log('Full Name: ' + responsePayload.name);
		// 		// console.log('Given Name: ' + responsePayload.given_name);
		// 		// console.log('Family Name: ' + responsePayload.family_name);
		// 		// console.log('Image URL: ' + responsePayload.picture);
		// 		// console.log('Email: ' + responsePayload.email);
		// 		// console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
		// 	};
		// }
		// if (!window.googleSignOut) {
		// 	window.googleSignOut = () => {
		// 		var auth2 = gapi.auth2.getAuthInstance();
		// 		auth2.signOut().then(function () {
		// 			console.log('User signed out.');
		// 		});
		// 	};
		// }
	});
</script>

<header>
	<a href="/"><h2>Analistul</h2></a>
	<nav>
		<a href="/institutii">Instituții de învățământ</a>
		<a href="/cadre-didactice">Cadre didactice</a>
		<a href="/blog">Blog</a>
		<a href="/login">Autentificare</a>
	</nav>
</header>

<style>
	header {
		padding: 15px;
		box-sizing: border-box;
		width: 100vw;
		background: black;
		color: white;
		z-index: 1;
		margin: 0;
		position: fixed;
		height: 60px;
		top: 0;
	}
	h2 {
		display: inline-block;
		width: fit-content;
		margin: 0 1.2vw;
		padding: 0;
		position: relative;
		bottom: 1px;
	}
	nav {
		float: right;
		position: relative;
		top: 5px;
	}
	h2,
	nav {
		vertical-align: middle;
	}
	nav a {
		margin: 0 1.2vw;
		cursor: pointer;
	}
</style>
