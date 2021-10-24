import Session from './session';
import jwt_decode from 'jwt-decode';
import pg from 'pg';
import { session } from '$app/stores';
const { Pool } = pg;
const pool = new Pool({
	connectionString: import.meta.env.VITE_DATABASE_URL
});

const googleAuth = async (params) => {
	const { credential } = params;
	if (credential) {
		// console.log(credential);
		const responsePayload = await jwt_decode(credential);
		// console.log(responsePayload);
		// console.log('ID: ' + responsePayload.sub);
		// console.log('Full Name: ' + responsePayload.name);
		// console.log('Given Name: ' + responsePayload.given_name);
		// console.log('Family Name: ' + responsePayload.family_name);
		// console.log('Image URL: ' + responsePayload.picture);
		// console.log('Email: ' + responsePayload.email);
		// check if exists
		const existsSql = `select id from utilizatori where google_id = '${responsePayload.sub}';`;
		const userQuery = await pool.query(existsSql);
		if (userQuery?.rowCount > 0) {
			console.log('[user exists]');
			// exists
			const userId = userQuery?.rows[0]?.id;
			const session = await Session.create({ userId });
			return {
				status: 'ok',
				message: 'google_auth_successful',
				payload: session.payload
			};
		} else {
			console.log('[user does not exist]');
			const sql = `insert into utilizatori(google_id, prenume, nume, profile_pic_url, email) values('${responsePayload.sub}', '${responsePayload.given_name}', '${responsePayload.family_name}', '${responsePayload.picture}', '${responsePayload.email}') RETURNING ID;`;
			const query = await pool.query(sql);
			const userId = query?.rows[0]?.id;
			// create session
			const session = await Session.create({
				userId
			});
			return {
				status: 'ok',
				message: 'google_auth_successful',
				payload: session.payload
			};
		}
	} else {
		return {
			status: 'error',
			message: 'google_auth_failed'
		};
	}
};

export default {
	googleAuth
};
