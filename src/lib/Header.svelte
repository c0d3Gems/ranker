<script>
	import { onMount } from 'svelte';
	let showMobileMenu = false;
	let authenticated = false;
	const toggleMenu = () => {
		showMobileMenu = !showMobileMenu;
	};

	onMount(async () => {
		const session = localStorage.getItem('ses');
		if (session) {
			authenticated = true;
		}
	});
</script>

<header>
	<a href="/"><h2>Analistul</h2></a>
	{#if !showMobileMenu}
		<img class="menuToggle" src="/menu.svg" alt="mobile-menu" on:click={toggleMenu} />
	{/if}
	<nav class="bignav">
		<a href="/institutii">Instituții de învățământ</a>
		<a href="/cadre-didactice">Cadre didactice</a>
		<a href="/blog">Blog</a>
		{#if authenticated}
			<a href="/logout">Deconectare</a>
		{:else}
			<a href="/login">Autentificare</a>
		{/if}
	</nav>
	{#if showMobileMenu}
		<div class="backdrop" on:click={toggleMenu} />
		<div class="mobileMenu">
			<div class="nodabackdrop" on:click={toggleMenu} />
			<nav class="smallnav">
				<a href="/institutii">Instituții de învățământ</a>
				<a href="/cadre-didactice">Cadre didactice</a>
				<a href="/blog">Blog</a>
				{#if authenticated}
					<a href="/logout">Deconectare</a>
				{:else}
					<a href="/login">Autentificare</a>
				{/if}
			</nav>
		</div>
	{/if}
</header>

<style>
	.nodabackdrop {
		width: 100%;
		height: 100%;
	}
	.backdrop {
		position: fixed;
		top: 0;
		left: 0;
		height: 100vh;
		width: 100vw;
	}
	.menuToggle {
		display: none;
		cursor: pointer;
		float: right;
		width: 42px;
		margin-right: 32px;
		position: relative;
		bottom: 5px;
	}
	.mobileMenu {
		position: fixed;
		top: 0;
		right: 0;
		background-color: black;
		height: 100vh;
		width: 300px;
		display: none;
	}
	.mobileMenu a {
		display: block;
		margin: 25px 0 0 0;
		width: 80%;
	}
	.mobileMenu nav.smallnav {
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		width: 70%;
		display: block;
	}
	@media (max-width: 640px) {
		.bignav {
			display: none;
		}
		.menuToggle {
			display: inline-block;
		}
		.mobileMenu {
			display: block;
		}
	}
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
